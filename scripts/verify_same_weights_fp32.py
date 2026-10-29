"""P3-M03-08D: same-weights FP32 versus INT8 QAT fidelity.

Original FP32 predictions are read from the existing P3 evaluation artifacts
rather than reloading P2 checkpoints. This preserves the previously verified
FP32 baseline and prevents an unverified preprocessing reconstruction.

Run: python -m scripts.verify_same_weights_fp32 --model both
"""
from __future__ import annotations

import argparse
import copy
import hashlib
import json
from pathlib import Path

import numpy as np
import pandas as pd
import torch
from torch import nn

from src.qat_int8 import QATLinear, QATConv1d, FakeQuantActivation
from scripts.verify_trained_qat import load_checkpoint, create_models
from scripts.run_integer_ptq import CAL, ROOT, FEATURES, scales, infer

DEFAULT_OUT = Path('results/p3_qat/verification/m03_08d')
DEFAULT_BASELINE = Path('results/p3_qat/evaluation/int8/max')


def digest(path):
    h = hashlib.sha256()
    with open(path, 'rb') as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b''):
            h.update(chunk)
    return h.hexdigest()


def convert_qat_to_fp32(qat_model):
    """Clone the QAT model; replace *both* weight and activation fake quantization."""
    model = copy.deepcopy(qat_model)

    def recurse(parent):
        for name, child in list(parent.named_children()):
            if isinstance(child, QATLinear):
                new = nn.Linear(child.in_features, child.out_features,
                                bias=child.bias is not None)
                new = new.to(device=child.weight.device, dtype=child.weight.dtype)
                with torch.no_grad():
                    new.weight.copy_(child.weight)
                    if child.bias is not None:
                        new.bias.copy_(child.bias)
                setattr(parent, name, new)
            elif isinstance(child, QATConv1d):
                new = nn.Conv1d(child.in_channels, child.out_channels,
                                child.kernel_size, stride=child.stride,
                                padding=child.padding, dilation=child.dilation,
                                groups=child.groups, bias=child.bias is not None,
                                padding_mode=child.padding_mode)
                new = new.to(device=child.weight.device, dtype=child.weight.dtype)
                with torch.no_grad():
                    new.weight.copy_(child.weight)
                    if child.bias is not None:
                        new.bias.copy_(child.bias)
                setattr(parent, name, new)
            elif isinstance(child, FakeQuantActivation):
                setattr(parent, name, nn.Identity())
            else:
                recurse(child)

    recurse(model)
    model.eval()
    forbidden = (QATLinear, QATConv1d, FakeQuantActivation)
    if any(isinstance(m, forbidden) for m in model.modules()):
        raise RuntimeError('QAT module remains after conversion')
    a, b = dict(qat_model.named_parameters()), dict(model.named_parameters())
    if a.keys() != b.keys():
        raise RuntimeError('Parameter names changed during FP32 conversion')
    for key in a:
        if not torch.equal(a[key].detach(), b[key].detach()):
            raise RuntimeError(f'Changed learned parameter: {key}')
    return model


def metrics(y, pred):
    y = np.asarray(y, dtype=np.float64)
    pred = np.asarray(pred, dtype=np.float64)
    d = pred - y
    sst = float(np.sum((y - y.mean()) ** 2))
    return dict(n=len(y), mae=float(np.mean(np.abs(d))),
                rmse=float(np.sqrt(np.mean(d * d))),
                bias=float(np.mean(d)),
                r2=float(1 - np.sum(d * d) / sst) if sst > 0 else float('nan'))


def predictions(model, x, batch_size):
    out = []
    model.eval()
    with torch.no_grad():
        for i in range(0, len(x), batch_size):
            result = model(torch.from_numpy(x[i:i + batch_size]))
            out.append(result.detach().cpu().numpy().reshape(-1))
    return np.clip(np.concatenate(out).astype(np.float64), 0, 1)


def validate_identity(ref, prior, fold):
    if len(ref) != len(prior):
        raise RuntimeError(f'Fold {fold}: reference/evaluation row count differs')
    for key in ('scenario', 'source_row'):
        if key not in ref or key not in prior:
            raise RuntimeError(f'Fold {fold}: missing alignment key {key}')
        if not np.array_equal(ref[key].to_numpy(), prior[key].to_numpy()):
            raise RuntimeError(f'Fold {fold}: {key} order differs from prior evaluation')
    if 'fold' in prior and not (prior['fold'] == fold).all():
        raise RuntimeError(f'Fold {fold}: prior evaluation fold mismatch')
    if prior.duplicated(['scenario', 'source_row']).any():
        raise RuntimeError(f'Fold {fold}: duplicate reference identities')


def run_fold(name, fold, calibration, args):
    ckpt, checkpoint_path = load_checkpoint(name, fold)
    if ckpt['model'] != name or int(ckpt['fold']) != fold:
        raise RuntimeError('QAT checkpoint identity mismatch')
    if list(ckpt['features']) != list(FEATURES):
        raise RuntimeError('QAT feature order mismatch')
    quant = ckpt.get('quantization', {})
    if quant.get('bits') != 8 or quant.get('calibration') != 'max':
        raise RuntimeError('Expected INT8/max QAT checkpoint')
    s = scales(calibration, fold, name, 8, 'max')
    qat, integer_model = create_models(name, ckpt, s)
    qat.eval()
    fp32 = convert_qat_to_fp32(qat)

    reference_path = ROOT / 'reference_vectors' / f'fold{fold}.parquet'
    baseline_path = args.baseline_dir / name / f'fold{fold}_predictions.parquet'
    if not baseline_path.is_file():
        raise FileNotFoundError(f'Missing previously verified FP32 baseline: {baseline_path}')
    ref = pd.read_parquet(reference_path)
    prior = pd.read_parquet(baseline_path)
    validate_identity(ref, prior, fold)
    if args.expected_samples and len(ref) != args.expected_samples:
        raise RuntimeError(f'Fold {fold}: expected {args.expected_samples} rows; got {len(ref)}')
    needed = ('target_per', 'pred_fp32', 'pred_integer_qat')
    missing = [c for c in needed if c not in prior]
    if missing:
        raise RuntimeError(f'Prior evaluation missing columns: {missing}')
    raw = ref[FEATURES].to_numpy(dtype=np.float64)
    mean = np.asarray(ckpt['scaler_mean'], dtype=np.float64)
    std = np.asarray(ckpt['scaler_scale'], dtype=np.float64)
    if (len(mean) != len(FEATURES) or len(std) != len(FEATURES)
            or not np.isfinite(raw).all() or not np.isfinite(mean).all()
            or not np.isfinite(std).all() or not (std > 0).all()):
        raise RuntimeError('Invalid input features or QAT preprocessing')
    x = ((raw - mean) / std).astype(np.float32)
    original = prior['pred_fp32'].to_numpy(dtype=np.float64)
    y = prior['target_per'].to_numpy(dtype=np.float64)
    recorded_int = prior['pred_integer_qat'].to_numpy(dtype=np.float64)
    if not all(np.isfinite(v).all() for v in (original, y, recorded_int)):
        raise RuntimeError('Nonfinite prior predictions/targets')
    if not np.all((y >= 0) & (y <= 1)):
        raise RuntimeError('Target PER outside [0,1]')

    qat_float = predictions(fp32, x, args.batch_size)
    integer = np.asarray(infer(integer_model, name, raw, mean, std, s, 8,
                               batch_size=args.batch_size), dtype=np.float64).reshape(-1)
    if not np.isfinite(qat_float).all() or not np.isfinite(integer).all():
        raise RuntimeError('Nonfinite new predictions')
    max_integer_error = float(np.max(np.abs(integer - recorded_int)))
    if max_integer_error > args.integer_tolerance:
        raise RuntimeError(f'Integer reproduction FAILED: max difference {max_integer_error:.9g}; '
                           f'tolerance {args.integer_tolerance:.9g}')

    pred_frame = pd.DataFrame(dict(model=name, fold=fold,
        scenario=ref['scenario'].astype(str).to_numpy(),
        source_row=ref['source_row'].to_numpy(), target_per=y,
        pred_original_fp32=original, pred_qat_fp32=qat_float,
        pred_qat_int8=integer, pred_recorded_qat_int8=recorded_int,
        delta_int8_minus_qat_fp32=integer - qat_float,
        delta_qat_fp32_minus_original=qat_float - original))
    target = args.output_dir / 'predictions' / name
    target.mkdir(parents=True, exist_ok=True)
    pred_frame.to_parquet(target / f'fold{fold}_predictions.parquet', index=False)

    result = dict(model=name, fold=fold,
                  original_fp32_rmse=metrics(y, original)['rmse'],
                  qat_fp32_rmse=metrics(y, qat_float)['rmse'],
                  qat_int8_rmse=metrics(y, integer)['rmse'],
                  original_fp32_mae=metrics(y, original)['mae'],
                  qat_fp32_mae=metrics(y, qat_float)['mae'],
                  qat_int8_mae=metrics(y, integer)['mae'],
                  delta_finetuning_rmse=metrics(y, qat_float)['rmse'] - metrics(y, original)['rmse'],
                  delta_quantization_rmse=metrics(y, integer)['rmse'] - metrics(y, qat_float)['rmse'],
                  prediction_mae_int8_vs_qat_fp32=float(np.mean(np.abs(integer - qat_float))),
                  prediction_max_abs_int8_vs_qat_fp32=float(np.max(np.abs(integer - qat_float))),
                  prediction_rmse_int8_vs_qat_fp32=float(np.sqrt(np.mean((integer - qat_float) ** 2))),
                  prediction_correlation_int8_vs_qat_fp32=float(np.corrcoef(integer, qat_float)[0, 1])
                      if np.std(integer) > 0 and np.std(qat_float) > 0 else float('nan'),
                  max_abs_integer_reproduction_error=max_integer_error,
                  n=len(y))
    print(f'{name.upper()} fold {fold}: '
          f'RMSE original={result["original_fp32_rmse"]:.6f} '
          f'QAT-FP32={result["qat_fp32_rmse"]:.6f} '
          f'QAT-INT8={result["qat_int8_rmse"]:.6f} '
          f'integer replay maxΔ={max_integer_error:.3g}', flush=True)
    provenance = dict(model=name, fold=fold, checkpoint=str(checkpoint_path),
                      checkpoint_sha256=digest(checkpoint_path),
                      reference_vectors=str(reference_path),
                      reference_vectors_sha256=digest(reference_path),
                      baseline_predictions=str(baseline_path),
                      baseline_predictions_sha256=digest(baseline_path))
    return result, provenance


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--model', choices=('mlp', 'cnn', 'both'), default='both')
    p.add_argument('--fold', type=int, choices=range(1, 10))
    p.add_argument('--batch-size', type=int, default=128)
    p.add_argument('--expected-samples', type=int, default=1000)
    p.add_argument('--integer-tolerance', type=float, default=2e-6)
    p.add_argument('--baseline-dir', type=Path, default=DEFAULT_BASELINE)
    p.add_argument('--output-dir', type=Path, default=DEFAULT_OUT)
    args = p.parse_args()
    if args.batch_size <= 0 or args.expected_samples < 0 or args.integer_tolerance < 0:
        p.error('Invalid batch-size, expected-samples or integer-tolerance')
    torch.set_num_threads(1)
    calibration = pd.read_csv(CAL)
    models = ('mlp', 'cnn') if args.model == 'both' else (args.model,)
    folds = (args.fold,) if args.fold is not None else range(1, 10)
    rows, provenance = [], []
    for name in models:
        for fold in folds:
            result, info = run_fold(name, fold, calibration, args)
            rows.append(result)
            provenance.append(info)
    args.output_dir.mkdir(parents=True, exist_ok=True)
    frame = pd.DataFrame(rows)
    frame.to_csv(args.output_dir / 'same_weights_metrics_by_fold.csv', index=False)
    aggregate = frame.groupby('model', sort=False).agg(
        folds=('fold', 'count'), observations=('n', 'sum'),
        original_fp32_rmse_mean=('original_fp32_rmse', 'mean'),
        qat_fp32_rmse_mean=('qat_fp32_rmse', 'mean'),
        qat_int8_rmse_mean=('qat_int8_rmse', 'mean'),
        finetuning_delta_rmse_mean=('delta_finetuning_rmse', 'mean'),
        quantization_delta_rmse_mean=('delta_quantization_rmse', 'mean'),
        quantization_delta_rmse_sd=('delta_quantization_rmse', 'std'),
        int8_vs_qat_fp32_mae_mean=('prediction_mae_int8_vs_qat_fp32', 'mean'),
        int8_vs_qat_fp32_max_abs=('prediction_max_abs_int8_vs_qat_fp32', 'max'),
        max_integer_reproduction_error=('max_abs_integer_reproduction_error', 'max')
    ).reset_index()
    aggregate.to_csv(args.output_dir / 'same_weights_metrics_summary.csv', index=False)
    metadata = dict(milestone='P3-M03-08D', models=list(models), folds=list(folds),
                    bits=8, calibration='max',
                    original_fp32_source='Previously evaluated P3-M03-07 FP32 predictions',
                    original_fp32_preprocessing='Inherited from prior evaluation; not independently reloaded here',
                    qat_fp32_definition='Exact QAT-trained weights, no activation or weight fake quantization',
                    output_rule='Clip all new predictions to [0,1]',
                    integer_reproduction_tolerance=args.integer_tolerance,
                    checkpoints_modified=False, integer_backend_modified=False,
                    provenance=provenance)
    (args.output_dir / 'same_weights_verification.json').write_text(json.dumps(metadata, indent=2))
    print('\nSAME-WEIGHTS FP32 FIDELITY SUMMARY')
    print(aggregate.to_string(index=False, float_format=lambda x: f'{x:.8g}'))
    print('\nInteger backend reproduction: PASS')
    print('Saved results to:', args.output_dir)


if __name__ == '__main__':
    main()

