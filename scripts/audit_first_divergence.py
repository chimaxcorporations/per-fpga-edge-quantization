"""P3-M03-08A.2: read-only first-divergence arithmetic audit.

Run: python -m scripts.audit_first_divergence --model cnn --fold 2
Uses existing frozen checkpoints, calibration, reference vectors, and integer backend.
"""
import argparse
from pathlib import Path
import numpy as np
import pandas as pd
import torch
from src import integer_ptq as ip
from scripts.verify_trained_qat import load_checkpoint, create_models
from scripts.run_integer_ptq import scales, CAL, ROOT, FEATURES, infer

CASES = {('mlp', 9): [4948, 7693], ('cnn', 2): [369078, 641227], ('cnn', 6): [1443133]}


def capture_fake(qat, x, labels):
    saved = {}
    handles = []
    for label in labels:
        def hook(_mod, args, output, label=label):
            saved[label] = (args[0].detach().cpu().numpy().copy(),
                            output.detach().cpu().numpy().copy())
        handles.append(getattr(qat, label).register_forward_hook(hook))
    try:
        with torch.no_grad():
            prediction = qat(torch.from_numpy(x)).detach().cpu().numpy().reshape(-1)
    finally:
        for h in handles:
            h.remove()
    return saved, prediction


def replay(integer_model, name, standardized, ss):
    labels = (['quant_input', 'quant_hidden1', 'quant_hidden2', 'quant_output']
              if name == 'mlp' else
              ['quant_input', 'quant_conv1', 'quant_conv2', 'quant_hidden', 'quant_output'])
    x = standardized.astype(np.float64)
    if name == 'cnn':
        x = x.reshape(-1, 10, 4).transpose(0, 2, 1)
    codes = {'quant_input': ip.quantize(x, ss['quant_input'], 8)}
    spec = {}
    if name == 'mlp':
        stages = [('quant_hidden1', 'quant_input', integer_model.layers[0], 'dense', True),
                  ('quant_hidden2', 'quant_hidden1', integer_model.layers[2], 'dense', True),
                  ('quant_output', 'quant_hidden2', integer_model.layers[4], 'dense', False)]
    else:
        stages = [('quant_conv1', 'quant_input', integer_model.conv[0], 'conv', True),
                  ('quant_conv2', 'quant_conv1', integer_model.conv[2], 'conv', True),
                  ('quant_hidden', 'quant_conv2', integer_model.head[1], 'flatten', True),
                  ('quant_output', 'quant_hidden', integer_model.head[3], 'dense', False)]
    for label, prev, layer, kind, relu in stages:
        w = layer.weight.detach().cpu().numpy()
        b = layer.bias.detach().cpu().numpy()
        qx = codes[prev]
        if kind == 'conv':
            result = ip.conv1d(qx, w, b, ss[prev], ss[label], 8, relu=relu)
        else:
            inp = qx.reshape(len(qx), -1) if kind == 'flatten' else qx
            result = ip.dense(inp, w, b, ss[prev], ss[label], 8, relu=relu)
        codes[label] = result
        spec[label] = (prev, w, b, kind, relu)
    return labels, codes, spec


def audit_element(row, flat_index, label, saved, codes, spec, ss):
    prev, w, bias, kind, relu = spec[label]
    out_shape = codes[label][row].shape
    index = np.unravel_index(flat_index, out_shape)
    channel = index[0]
    previous_codes = codes[prev][row]
    if kind == 'conv':
        pos = index[1]
        padded = np.pad(previous_codes, ((0, 0), (1, 1)))
        inputs = padded[:, pos:pos+3].reshape(-1).astype(np.int64)
        weights = w[channel].reshape(-1)
    else:
        inputs = previous_codes.reshape(-1).astype(np.int64)
        weights = w[channel].reshape(-1)
    sx, sy = float(ss[prev]), float(ss[label])
    qw, sw = ip.weight_quantize(w, 8)
    w_codes = qw[channel].reshape(-1)
    weight_scale = float(sw[channel])
    bias_real = float(bias[channel])
    bq = int(np.rint(bias_real / (sx * weight_scale)))
    mac = int(sum(int(a) * int(b) for a, b in zip(inputs, w_codes)))
    accumulator = mac + bq
    ratio = sx * weight_scale / sy
    multiplier, shift = ip.fixedpoint_params(ratio)
    product = accumulator * multiplier
    if not np.iinfo(np.int64).min <= product <= np.iinfo(np.int64).max:
        raise OverflowError('Q31 intermediate multiplication overflow')
    fixed_code_preclip = int(ip.round_shift_even(np.array([product], dtype=np.int64), shift)[0])
    fixed_code = int(np.clip(fixed_code_preclip, -127, 127))
    if relu:
        fixed_code = max(0, fixed_code)
    # Double-precision mathematical reference using the same quantized input/weights.
    mac_real = mac * sx * weight_scale
    ideal_bias_real = mac_real + bias_real
    quantized_bias_real = accumulator * sx * weight_scale
    ideal_code = int(np.clip(np.rint(max(0, ideal_bias_real) / sy if relu else ideal_bias_real / sy), -127, 127))
    quant_bias_code = int(np.clip(np.rint(max(0, quantized_bias_real) / sy if relu else quantized_bias_real / sy), -127, 127))
    fake_pre = float(saved[label][0][row][index])
    fake_post = float(saved[label][1][row][index])
    fake_code = int(ip.quantize(np.array([fake_post]), sy, 8)[0])
    actual_code = int(codes[label][row][index])
    if fixed_code != actual_code:
        raise RuntimeError(f'Internal arithmetic replay disagrees at {label}: {fixed_code} != {actual_code}')
    # Float32 forward simulation of same quantized input/weight values, using PyTorch
    # kernel for the selected layer to distinguish arithmetic ordering effects.
    return dict(layer=label, element_index=str(index), output_channel=int(channel),
                fake_code=fake_code, integer_code=actual_code,
                fake_prequant_value=fake_pre, fake_postquant_value=fake_post,
                fake_prequant_in_lsb=fake_pre/sy,
                mac_integer=mac, bias_float=bias_real, bias_integer=bq,
                bias_quant_error_real=bq*sx*weight_scale-bias_real,
                accumulator_integer=accumulator,
                input_scale=sx, weight_scale=weight_scale, output_scale=sy,
                real_ratio=ratio, q31_multiplier=multiplier, q31_shift=shift,
                q31_ratio=multiplier/(2**shift),
                multiplier_relative_error=(multiplier/(2**shift)-ratio)/ratio,
                q31_pre_round=product/(2**shift),
                fixedpoint_code_before_clip=fixed_code_preclip,
                float_ideal_pre_round=ideal_bias_real/sy,
                float_quantized_bias_pre_round=quantized_bias_real/sy,
                float_ideal_code=ideal_code,
                float_quantized_bias_code=quant_bias_code,
                dot_product_elements=len(inputs),
                weight_saturated_count=int(np.sum(np.abs(w_codes)==127)),
                input_saturated_count=int(np.sum(np.abs(inputs)==127)))


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--model', required=True, choices=['mlp', 'cnn'])
    p.add_argument('--fold', required=True, type=int, choices=range(1, 10))
    p.add_argument('--calibration', default='max', choices=['max', 'p999'])
    p.add_argument('--output-dir', default='results/p3_qat/verification/arithmetic_audit')
    args = p.parse_args()
    if (args.model, args.fold) not in CASES:
        p.error('Curated outliers are available for mlp/9, cnn/2, cnn/6')
    ckpt, _ = load_checkpoint(args.model, args.fold)
    if ckpt['model'] != args.model or int(ckpt['fold']) != args.fold or list(ckpt['features']) != FEATURES:
        raise ValueError('Checkpoint identity/features mismatch')
    ss = scales(pd.read_csv(CAL), args.fold, args.model, 8, args.calibration)
    qat, model = create_models(args.model, ckpt, ss)
    ref = pd.read_parquet(ROOT / 'reference_vectors' / f'fold{args.fold}.parquet')
    prior = pd.read_parquet(Path('results/p3_qat/verification/post_training') / args.model /
                            f'fold{args.fold}_int8_{args.calibration}_predictions.parquet')
    if len(ref) != len(prior):
        raise ValueError('Reference and predictions length mismatch')
    for col in ('scenario', 'source_row'):
        if col in ref and col in prior and not np.array_equal(ref[col].to_numpy(), prior[col].to_numpy()):
            raise ValueError(f'Row alignment mismatch: {col}')
    requested = CASES[(args.model, args.fold)]
    selected = ref.index[ref['source_row'].isin(requested)].to_numpy()
    if len(selected) != len(requested):
        raise ValueError(f'Expected {len(requested)} rows, got {len(selected)}')
    raw = ref.iloc[selected][FEATURES].to_numpy(dtype=np.float64)
    mean = np.asarray(ckpt['scaler_mean'], dtype=np.float64)
    std = np.asarray(ckpt['scaler_scale'], dtype=np.float64)
    standardized = ((raw-mean)/std).astype(np.float32)
    labels = (['quant_input', 'quant_hidden1', 'quant_hidden2', 'quant_output']
              if args.model == 'mlp' else
              ['quant_input', 'quant_conv1', 'quant_conv2', 'quant_hidden', 'quant_output'])
    saved, fake = capture_fake(qat, standardized, labels)

    # Read activation scales from the configured QAT modules.
    # Calibration dictionary keys and module names are different.
    qscale = {
        label: float(getattr(qat, label).scale.item())
        for label in labels
    }

    _, codes, spec = replay(
        model,
        args.model,
        standardized,
        qscale,
    )
    integer = infer(model, args.model, raw, mean, std, ss, 8, batch_size=128)
    if not np.allclose(np.clip(fake, 0, 1), prior.iloc[selected]['pred_fake_qat'].to_numpy(), atol=2e-6, rtol=0):
        raise RuntimeError('Fake predictions do not reproduce prior evaluation')
    if not np.allclose(integer, prior.iloc[selected]['pred_integer_qat'].to_numpy(), atol=2e-6, rtol=0):
        raise RuntimeError('Integer predictions do not reproduce prior evaluation')
    if not np.allclose(np.clip(codes['quant_output'].reshape(-1)*qscale['quant_output'], 0, 1), integer, atol=2e-6, rtol=0):
        raise RuntimeError('Integer layer replay does not reproduce production backend')
    results = []
    for i in range(len(selected)):
        first = None
        for label in labels:
            fake_codes = ip.quantize(saved[label][1][i], qscale[label], 8)
            mismatch = np.flatnonzero((fake_codes != codes[label][i]).reshape(-1))
            if len(mismatch):
                first = (label, int(mismatch[0]))
                break
        if first is None:
            raise RuntimeError('No code divergence found for selected outlier')
        label, element = first
        if label == 'quant_input':
            raise RuntimeError('First divergence in input quantizer: no arithmetic layer to audit')
        entry = audit_element(i, element, label, saved, codes, spec, qscale)
        entry.update(model=args.model, fold=args.fold,
                     source_row=int(ref.iloc[selected[i]]['source_row']),
                     scenario=str(ref.iloc[selected[i]]['scenario']),
                     fake_prediction=float(np.clip(fake[i], 0, 1)),
                     integer_prediction=float(integer[i]))
        results.append(entry)
    out = Path(args.output_dir) / args.model
    out.mkdir(parents=True, exist_ok=True)
    dest = out / f'fold{args.fold}_first_divergence.csv'
    pd.DataFrame(results).to_csv(dest, index=False)
    show = ['source_row', 'layer', 'element_index', 'fake_code', 'integer_code',
            'fake_prequant_in_lsb', 'float_ideal_pre_round',
            'float_quantized_bias_pre_round', 'q31_pre_round',
            'float_ideal_code', 'float_quantized_bias_code']
    print(pd.DataFrame(results)[show].to_string(index=False, float_format=lambda x: f'{x:.10g}'))
    print('\nReproduced saved predictions: PASS')
    print('Reproduced production integer backend: PASS')
    print(f'Saved arithmetic audit: {dest}')
    print('Interpretation: compare fake_prequant_in_lsb vs float_ideal_pre_round to detect floating-point')
    print('evaluation differences; float_ideal_code vs float_quantized_bias_code isolates bias rounding;')
    print('float_quantized_bias_code vs integer_code isolates fixed-point requantization.')

if __name__ == '__main__':
    main()

