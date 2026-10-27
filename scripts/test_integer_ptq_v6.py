"""P3-M02.5-V6: independent quantizer and arithmetic boundary audit.

Run: python -m scripts.test_integer_ptq_v6
Does not modify production source or saved predictions.
"""
from pathlib import Path
import hashlib
import json
import math
from fractions import Fraction

import numpy as np
import pandas as pd
import torch

from src.integer_ptq import qmax, quantize, weight_quantize, fixedpoint_params, round_shift_even, requantize

ROOT = Path('artifacts/p3_m01')
CAL = Path('results/p3_quantization/calibration/activation_statistics/activation_percentiles_exact_by_fold.csv')
RESULT = Path('results/p3_quantization/integer_ptq')
OUT = RESULT / 'validation'
I64MAX = (1 << 63) - 1
I64MIN = -(1 << 63)
Q31MAX = (1 << 31) - 1
LAYERS = {'mlp': ['layers.0', 'layers.2', 'layers.4'], 'cnn': ['conv.0', 'conv.2', 'head.1', 'head.3']}


def require(condition, message):
    if not condition:
        raise AssertionError(message)


def exact_round_div(n, d):
    require(d > 0, 'denominator must be positive')
    a = abs(int(n))
    q, r = divmod(a, int(d))
    if 2*r > d or (2*r == d and q % 2):
        q += 1
    return -q if n < 0 else q


def independent_quantize(x, scale, bits):
    q = qmax(bits)
    out = []
    for value, s in zip(np.asarray(x, dtype=np.float64).flat, np.broadcast_to(scale, np.shape(x)).flat):
        ratio = Fraction.from_float(float(value)) / Fraction.from_float(float(s))
        rounded = exact_round_div(ratio.numerator, ratio.denominator)
        out.append(min(q, max(-q, rounded)))
    return np.array(out, dtype=np.int64).reshape(np.shape(x))


def check_weight_quantization():
    rng = np.random.default_rng(27062026)
    count = 0
    for bits in (8, 16):
        for shape in ((64, 40), (32, 64), (16, 4, 3), (16, 16, 3)):
            w = rng.normal(size=shape).astype(np.float64)
            w[0, ...] = 0.0
            w[1, ...] = 1.0
            w[2, ...] = -1.0
            qw, scales = weight_quantize(w, bits)
            expected_scales = np.array([max(max(abs(float(v)) for v in w[j].flat) / qmax(bits), 1e-12) for j in range(shape[0])])
            require(np.array_equal(scales, expected_scales), f'weight scale mismatch {bits} {shape}')
            expected_q = independent_quantize(w, expected_scales.reshape((-1,) + (1,)*(w.ndim-1)), bits)
            require(np.array_equal(qw, expected_q), f'weight quantization mismatch {bits} {shape}')
            count += qw.size
    return count


def check_multiplier():
    # Check near Q31 rounding boundary, powers of two, and representative ratios.
    ratios = [1e-12, 1e-9, 1e-6, 0.001, 0.01, 0.1, 0.5, 0.75, 0.999, 1.0, 1.5, 2.0, 10.0]
    ratios += [np.nextafter(1.0, 0.0), np.nextafter(1.0, math.inf),
               np.nextafter(2.0, 0.0), np.nextafter(2.0, math.inf),
               (Q31MAX + 0.49) / (2**31), (Q31MAX + 0.51) / (2**31)]
    failures = []
    for ratio in ratios:
        try:
            m, shift = fixedpoint_params(ratio)
            require(0 < m <= Q31MAX, f'Q31 multiplier overflow: {ratio} -> {m}, {shift}')
            require(shift >= 0, f'negative shift: {ratio}')
            require(abs(m / (2**shift) - ratio) <= max(1e-9, ratio * 1e-6), f'large multiplier error: {ratio}')
        except Exception as exc:
            failures.append(f'{ratio:.18g}: {type(exc).__name__}: {exc}')
    return len(ratios), failures


def check_int64_boundaries():
    # The known minimum signed int64 issue should be explicitly detected, not silently ignored.
    inputs = np.array([I64MIN, I64MIN+1, -7, -1, 0, 1, 7, I64MAX], dtype=np.int64)
    failures = []
    for shift in (0, 1, 2, 31):
        try:
            actual = np.asarray(round_shift_even(inputs, shift))
            expected = np.array([exact_round_div(int(x), 1 << shift) for x in inputs], dtype=np.int64)
            if not np.array_equal(actual, expected):
                failures.append({'operation': 'round_shift_even', 'shift': shift, 'inputs': inputs.tolist(),
                                 'actual': actual.tolist(), 'expected': expected.tolist()})
        except Exception as exc:
            failures.append({'operation': 'round_shift_even', 'shift': shift, 'error': repr(exc)})
    return failures


def check_actual_model_multipliers():
    cal = pd.read_csv(CAL)
    layer_io = {
        'mlp': [('layers.0', 'standardized_input', 'fc1_relu'), ('layers.2', 'fc1_relu', 'fc2_relu'), ('layers.4', 'fc2_relu', 'output_linear')],
        'cnn': [('conv.0', 'standardized_input', 'conv1_relu'), ('conv.2', 'conv1_relu', 'conv2_relu'), ('head.1', 'conv2_relu', 'dense_relu'), ('head.3', 'dense_relu', 'output_linear')]
    }
    records = []
    for model in ('mlp', 'cnn'):
        for fold in range(1, 10):
            ckpt = torch.load(ROOT/'reference_models'/model/f'{model}_fold{fold}.pt', map_location='cpu', weights_only=False)
            state = ckpt['state_dict']
            subset = cal[(cal.model == model) & (cal.fold == fold)]
            require(not subset.duplicated(['layer']).any(), 'duplicate calibration layers')
            for bits in (8, 16):
                for method in ('max', 'p999'):
                    col = 'absmax' if method == 'max' else 'abs_p999'
                    s = {r.layer: max(float(getattr(r, col)) / qmax(bits), 1e-12) for r in subset.itertuples()}
                    for layer, src, dst in layer_io[model]:
                        w = state[layer+'.weight'].detach().cpu().numpy()
                        _, sw = weight_quantize(w, bits)
                        for channel, swj in enumerate(sw):
                            ratio = float(s[src] * float(swj) / s[dst])
                            m, shift = fixedpoint_params(ratio)
                            records.append({'model': model, 'fold': fold, 'bits': bits, 'method': method,
                                            'layer': layer, 'channel': channel, 'ratio': ratio,
                                            'multiplier': m, 'shift': shift,
                                            'absolute_error': abs(ratio - m/(2**shift)),
                                            'relative_error': abs(ratio - m/(2**shift))/ratio,
                                            'q31_valid': 0 < m <= Q31MAX})
    df = pd.DataFrame(records)
    require(df.q31_valid.all(), 'production multipliers violate Q31')
    require(np.isfinite(df[['ratio', 'absolute_error', 'relative_error']].to_numpy()).all(), 'nonfinite multiplier values')
    return df


def sha256(path):
    h = hashlib.sha256()
    with open(path, 'rb') as f:
        for block in iter(lambda: f.read(1024*1024), b''):
            h.update(block)
    return h.hexdigest()


def main():
    OUT.mkdir(parents=True, exist_ok=True)
    nweights = check_weight_quantization()
    nratios, multiplier_failures = check_multiplier()
    boundary_failures = check_int64_boundaries()
    multipliers = check_actual_model_multipliers()
    multipliers.to_csv(OUT/'v6_fixedpoint_multipliers_by_channel.csv', index=False)
    paths = [Path('src/integer_ptq.py'), Path('scripts/run_integer_ptq.py'), Path('scripts/test_integer_ptq_v6.py'), CAL]
    paths += sorted((ROOT/'reference_models').rglob('*.pt'))
    paths += sorted((ROOT/'reference_vectors').glob('fold*.parquet'))
    paths += sorted(RESULT.rglob('fold*_predictions.parquet'))
    manifest = [{'path': str(p), 'sha256': sha256(p), 'size_bytes': p.stat().st_size} for p in paths]
    (OUT/'v6_input_hash_manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
    report = {'independent_weight_elements_checked': nweights, 'representative_multiplier_ratios_checked': nratios,
              'representative_multiplier_failures': multiplier_failures,
              'int64_boundary_failures': boundary_failures,
              'actual_multiplier_channels_checked': len(multipliers),
              'max_relative_multiplier_error': float(multipliers.relative_error.max()),
              'hashed_files': len(manifest)}
    (OUT/'v6_arithmetic_audit.json').write_text(json.dumps(report, indent=2)+'\n')
    print('P3-M02.5-V6 ARITHMETIC AUDIT')
    print('Independent weight elements:', nweights)
    print('Representative multiplier ratios:', nratios)
    print('Actual model multiplier channels:', len(multipliers))
    print('Max relative multiplier error:', report['max_relative_multiplier_error'])
    print('Q31 boundary failures:', len(multiplier_failures))
    for failure in multiplier_failures:
        print('  ', failure)
    print('INT64 rounding boundary failures:', len(boundary_failures))
    for failure in boundary_failures:
        print('  ', failure)
    print('Hashed source/data files:', len(manifest))
    if multiplier_failures or boundary_failures:
        print('V6 NOT READY TO FREEZE: arithmetic edge cases need correction')
        raise SystemExit(1)
    print('V6 ARITHMETIC AUDIT PASSED; review reports and freeze separately')

if __name__ == '__main__':
    main()

