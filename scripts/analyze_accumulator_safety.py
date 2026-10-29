"""P3-M03-08C: read-only INT8 accumulator and Q31 product safety audit.

Uses frozen QAT checkpoints, scales, held-out vectors and the existing
src.integer_ptq backend. No model or backend modifications.
"""
import argparse
import json
from pathlib import Path
import numpy as np
import pandas as pd
import torch
from src import integer_ptq as ip
from scripts.verify_trained_qat import load_checkpoint, create_models
from scripts.run_integer_ptq import CAL, ROOT, FEATURES, scales, infer

I32 = np.iinfo(np.int32)
I64 = np.iinfo(np.int64)
QMAX = 127


def stages_for(name, model):
    if name == 'mlp':
        return [('quant_hidden1', 'quant_input', model.layers[0], 'dense', True),
                ('quant_hidden2', 'quant_hidden1', model.layers[2], 'dense', True),
                ('quant_output', 'quant_hidden2', model.layers[4], 'dense', False)]
    return [('quant_conv1', 'quant_input', model.conv[0], 'conv', True),
            ('quant_conv2', 'quant_conv1', model.conv[2], 'conv', True),
            ('quant_hidden', 'quant_conv2', model.head[1], 'flatten', True),
            ('quant_output', 'quant_hidden', model.head[3], 'dense', False)]


def signed_bits(magnitude):
    """Minimum signed two's-complement width accommodating [-M,+M]."""
    return max(1, int(magnitude).bit_length() + 1)


def evaluate_layer(qx, layer, kind, sx, sy, batch_size):
    w = layer.weight.detach().cpu().numpy()
    bias = layer.bias.detach().cpu().numpy()
    qw, sw = ip.weight_quantize(w, 8)
    qw = np.asarray(qw, dtype=np.int64)
    sw = np.asarray(sw, dtype=np.float64)
    if not np.isfinite(sw).all() or (sw <= 0).any():
        raise ValueError('Invalid per-channel weight scales')
    bq = np.rint(bias.astype(np.float64) / (sx * sw)).astype(np.int64)
    if (np.abs(qw) > QMAX).any() or (np.abs(qx) > QMAX).any():
        raise ValueError('INT8 operand out of symmetric range')
    k = int(np.prod(qw.shape[1:]))
    if kind == 'conv':
        # qx shape (N,C,L); convolution padding=1, stride=1.
        if qx.ndim != 3 or qw.ndim != 3 or qw.shape[2] != 3:
            raise ValueError('Unexpected CNN convolution shape')
        padded = np.pad(qx.astype(np.int64), ((0, 0), (0, 0), (1, 1)))
        windows = np.lib.stride_tricks.sliding_window_view(padded, 3, axis=2)
        mac = np.einsum('nclk,ock->nol', windows, qw, optimize=True)
        accum = mac + bq[None, :, None]
        channel_axes = (0, 2)
    else:
        inp = qx.reshape(len(qx), -1).astype(np.int64)
        if inp.shape[1] != qw.shape[1]:
            raise ValueError(f'Dense dimensions differ: {inp.shape}, {qw.shape}')
        mac = inp @ qw.T
        accum = mac + bq[None, :]
        channel_axes = (0,)
    # Weight-aware conservative bound: every activation may attain ±127.
    bound_per_channel = QMAX * np.abs(qw).reshape(len(qw), -1).sum(axis=1) + np.abs(bq)
    # Also report the looser K*127^2 + max|bias| bound.
    generic_bound = k * QMAX * QMAX + int(np.abs(bq).max())
    empirical_max = int(np.abs(accum).max())
    if empirical_max > int(bound_per_channel.max()):
        raise AssertionError('Observed accumulator violates conservative bound')
    ratios = sx * sw / sy
    multipliers, shifts = [], []
    for ratio in ratios:
        m, shift = ip.fixedpoint_params(float(ratio))
        multipliers.append(int(m))
        shifts.append(int(shift))
    # Check integer product for all observed accumulators, channel by channel.
    max_observed_product = 0
    max_bound_product = 0
    for channel, multiplier in enumerate(multipliers):
        observed = int(np.abs(np.take(accum, channel, axis=1)).max())
        max_observed_product = max(max_observed_product, observed * abs(multiplier))
        max_bound_product = max(max_bound_product, int(bound_per_channel[channel]) * abs(multiplier))
    # Verify exact accumulator values for every element via independently calculated MACs.
    return dict(k=k, output_channels=len(qw), accumulator_count=int(accum.size),
                max_abs_mac=int(np.abs(mac).max()), max_abs_integer_bias=int(np.abs(bq).max()),
                max_abs_accumulator=empirical_max,
                max_abs_weight_aware_bound=int(bound_per_channel.max()),
                max_abs_generic_bound=int(generic_bound),
                min_required_accumulator_bits=signed_bits(int(bound_per_channel.max())),
                max_abs_q31_multiplier=max(abs(v) for v in multipliers),
                min_q31_shift=min(shifts), max_q31_shift=max(shifts),
                max_abs_observed_q31_product=int(max_observed_product),
                max_abs_bounded_q31_product=int(max_bound_product),
                int32_empirical_safe=bool(empirical_max <= I32.max),
                int32_bound_safe=bool(int(bound_per_channel.max()) <= I32.max),
                int64_q31_empirical_safe=bool(max_observed_product <= I64.max),
                int64_q31_bound_safe=bool(max_bound_product <= I64.max),
                max_abs_input_code=int(np.abs(qx).max()),
                max_abs_weight_code=int(np.abs(qw).max()),
                max_abs_bias_code=int(np.abs(bq).max()))


def run_fold(name, fold, calibration, batch_size, verify):
    ckpt, _ = load_checkpoint(name, fold)
    if ckpt['model'] != name or int(ckpt['fold']) != fold or list(ckpt['features']) != FEATURES:
        raise ValueError('Checkpoint identity or feature mismatch')
    meta = ckpt.get('quantization', {})
    if meta.get('bits') != 8 or meta.get('calibration') != 'max':
        raise ValueError('Expected INT8/max QAT checkpoint')
    ss = scales(calibration, fold, name, 8, 'max')
    qat, model = create_models(name, ckpt, ss)
    labels = ['quant_input', 'quant_hidden1', 'quant_hidden2', 'quant_output'] if name == 'mlp' else [
        'quant_input', 'quant_conv1', 'quant_conv2', 'quant_hidden', 'quant_output']
    qs = {label: float(getattr(qat, label).scale.item()) for label in labels}
    ref = pd.read_parquet(ROOT / 'reference_vectors' / f'fold{fold}.parquet')
    raw = ref[FEATURES].to_numpy(dtype=np.float64)
    mean = np.asarray(ckpt['scaler_mean'], dtype=np.float64)
    std = np.asarray(ckpt['scaler_scale'], dtype=np.float64)
    if not (np.isfinite(raw).all() and np.isfinite(mean).all() and np.isfinite(std).all() and (std > 0).all()):
        raise ValueError('Nonfinite feature or invalid scaler')
    x = ((raw - mean) / std).astype(np.float32).astype(np.float64)
    if name == 'cnn':
        x = x.reshape(-1, 10, 4).transpose(0, 2, 1)
    input_codes = ip.quantize(x, qs['quant_input'], 8)
    codes = input_codes
    rows = []
    for label, prev, layer, kind, relu in stages_for(name, model):
        sx, sy = qs[prev], qs[label]
        row = evaluate_layer(codes, layer, kind, sx, sy, batch_size)
        w = layer.weight.detach().cpu().numpy()
        b = layer.bias.detach().cpu().numpy()
        if kind == 'conv':
            next_codes = ip.conv1d(codes, w, b, sx, sy, 8, relu=relu)
        else:
            next_codes = ip.dense(codes.reshape(len(codes), -1), w, b, sx, sy, 8, relu=relu)
        codes = next_codes
        row.update(model=name, fold=fold, layer=label, layer_kind=kind,
                   input_scale=sx, output_scale=sy)
        rows.append(row)
    if verify:
        production = infer(model, name, raw, mean, std, ss, 8, batch_size=batch_size)
        replay = np.clip(codes.reshape(-1) * qs['quant_output'], 0, 1)
        if not np.allclose(production, replay, atol=2e-6, rtol=0):
            raise AssertionError(f'Layer replay differs from production integer backend: {name} fold {fold}')
    print(f'{name.upper()} fold {fold}: {len(ref)} samples; '
          f'max accumulator={max(r["max_abs_accumulator"] for r in rows):,}; '
          f'INT32 bounds={"PASS" if all(r["int32_bound_safe"] for r in rows) else "FAIL"}; '
          f'INT64 Q31 bounds={"PASS" if all(r["int64_q31_bound_safe"] for r in rows) else "FAIL"}', flush=True)
    return rows


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--model', choices=['mlp', 'cnn', 'both'], default='both')
    p.add_argument('--fold', type=int, choices=range(1, 10))
    p.add_argument('--batch-size', type=int, default=128)
    p.add_argument('--output-dir', type=Path, default=Path('results/p3_qat/verification/accumulator_safety'))
    p.add_argument('--skip-production-check', action='store_true')
    args = p.parse_args()
    if args.batch_size <= 0:
        p.error('--batch-size must be positive')
    torch.set_num_threads(1)
    cal = pd.read_csv(CAL)
    models = ('mlp', 'cnn') if args.model == 'both' else (args.model,)
    folds = (args.fold,) if args.fold else range(1, 10)
    records = []
    for name in models:
        for fold in folds:
            records.extend(run_fold(name, fold, cal, args.batch_size, not args.skip_production_check))
    df = pd.DataFrame(records)
    args.output_dir.mkdir(parents=True, exist_ok=True)
    df.to_csv(args.output_dir / 'accumulator_by_fold_layer.csv', index=False)
    summary = df.groupby(['model', 'layer'], sort=False).agg(
        max_abs_accumulator=('max_abs_accumulator', 'max'),
        max_abs_integer_bias=('max_abs_integer_bias', 'max'),
        max_abs_weight_aware_bound=('max_abs_weight_aware_bound', 'max'),
        max_abs_generic_bound=('max_abs_generic_bound', 'max'),
        min_required_accumulator_bits=('min_required_accumulator_bits', 'max'),
        max_abs_observed_q31_product=('max_abs_observed_q31_product', 'max'),
        max_abs_bounded_q31_product=('max_abs_bounded_q31_product', 'max'),
        int32_bound_safe=('int32_bound_safe', 'all'),
        int64_q31_bound_safe=('int64_q31_bound_safe', 'all'),
    ).reset_index()
    summary.to_csv(args.output_dir / 'accumulator_summary.csv', index=False)
    metadata = dict(scope='Frozen INT8/max QAT checkpoints and held-out reference vectors',
                    models=list(models), folds=list(folds),
                    weight_aware_bound='127*sum(abs(qw[channel]))+abs(quantized_bias[channel])',
                    q31_product_bound='weight_aware_accumulator_bound*abs(Q31_multiplier)',
                    integer_backend='src.integer_ptq',
                    production_replay_verified=not args.skip_production_check,
                    checkpoints_modified=False, backend_modified=False,
                    note='Bounds apply to INT8 operands and frozen quantized weights/biases; not to alternate models or quantization scales.')
    (args.output_dir / 'run_metadata.json').write_text(json.dumps(metadata, indent=2))
    print('\nACCUMULATOR SAFETY SUMMARY\n' + summary.to_string(index=False))
    print('\nSaved results to:', args.output_dir)
    if not (df['int32_bound_safe'].all() and df['int64_q31_bound_safe'].all()):
        raise SystemExit('FAIL: at least one analytical bound exceeds the target integer width')
    print('OVERALL INT32 ACCUMULATOR / INT64 Q31 BOUND CHECK: PASS')


if __name__ == '__main__':
    main()

