"""P3-M03-08A.1: read-only layer-level fake-QAT vs integer-QAT diagnostics.

Run: python -m scripts.diagnose_qat_layers --model mlp --fold 9
Uses existing frozen checkpoints, calibration, reference vectors, and backend.
"""
import argparse
import json
from pathlib import Path
import numpy as np
import pandas as pd
import torch

from src import integer_ptq as ip
from scripts.verify_trained_qat import load_checkpoint, create_models
from scripts.run_integer_ptq import infer, scales, CAL, ROOT, FEATURES

CASES = {('mlp', 9): [7693, 4948], ('cnn', 2): [369078, 641227], ('cnn', 6): [1443133]}


def numpy_weights(layer):
    return (layer.weight.detach().cpu().numpy(), layer.bias.detach().cpu().numpy())


def run_trace(qat, integer_model, name, standardized, bits=8):
    """Trace corresponding quantizer boundaries, with independent integer replay."""
    captured = {}
    handles = []
    labels = (['quant_input', 'quant_hidden1', 'quant_hidden2', 'quant_output']
              if name == 'mlp' else
              ['quant_input', 'quant_conv1', 'quant_conv2', 'quant_hidden', 'quant_output'])
    for label in labels:
        def hook(_module, _args, output, key=label):
            captured[key] = output.detach().cpu().numpy().astype(np.float64)
        handles.append(getattr(qat, label).register_forward_hook(hook))
    try:
        with torch.no_grad():
            fake = qat(torch.from_numpy(standardized)).cpu().numpy().astype(np.float64)
    finally:
        for handle in handles:
            handle.remove()

    qscale = {label: float(getattr(qat, label).scale.item()) for label in labels}
    x = standardized.astype(np.float64)
    if name == 'cnn':
        x = x.reshape(-1, 10, 4).transpose(0, 2, 1)
    qx = ip.quantize(x, qscale['quant_input'], bits)
    integer_codes = {'quant_input': qx}
    if name == 'mlp':
        for label, layer in [('quant_hidden1', integer_model.layers[0]),
                             ('quant_hidden2', integer_model.layers[2]),
                             ('quant_output', integer_model.layers[4])]:
            w, b = numpy_weights(layer)
            previous = {'quant_hidden1': 'quant_input',
                        'quant_hidden2': 'quant_hidden1',
                        'quant_output': 'quant_hidden2'}[label]
            qx = ip.dense(qx, w, b, qscale[previous], qscale[label], bits,
                          relu=(label != 'quant_output'))
            integer_codes[label] = qx
    else:
        for label, layer, previous in [
            ('quant_conv1', integer_model.conv[0], 'quant_input'),
            ('quant_conv2', integer_model.conv[2], 'quant_conv1'),
        ]:
            w, b = numpy_weights(layer)
            qx = ip.conv1d(qx, w, b, qscale[previous], qscale[label], bits, relu=True)
            integer_codes[label] = qx
        qx = qx.reshape(len(qx), -1)
        w, b = numpy_weights(integer_model.head[1])
        qx = ip.dense(qx, w, b, qscale['quant_conv2'], qscale['quant_hidden'], bits, relu=True)
        integer_codes['quant_hidden'] = qx
        w, b = numpy_weights(integer_model.head[3])
        qx = ip.dense(qx, w, b, qscale['quant_hidden'], qscale['quant_output'], bits, relu=False)
        integer_codes['quant_output'] = qx

    diagnostics = []
    for label in labels:
        scale = qscale[label]
        fake_codes = ip.quantize(captured[label], scale, bits)
        actual_codes = integer_codes[label]
        if fake_codes.shape != actual_codes.shape:
            raise RuntimeError(f'{label}: shape mismatch {fake_codes.shape} != {actual_codes.shape}')
        delta = fake_codes - actual_codes
        flat = delta.reshape(len(delta), -1)
        for row in range(len(delta)):
            nonzero = np.flatnonzero(flat[row])
            diagnostics.append({
                'sample_index': row, 'layer': label, 'scale': scale,
                'elements': int(flat.shape[1]),
                'different_codes': int(len(nonzero)),
                'max_abs_code_difference': int(np.max(np.abs(flat[row]))),
                'first_differing_element': int(nonzero[0]) if len(nonzero) else -1,
                'fake_code_at_first_difference': int(fake_codes.reshape(len(delta), -1)[row, nonzero[0]]) if len(nonzero) else None,
                'integer_code_at_first_difference': int(actual_codes.reshape(len(delta), -1)[row, nonzero[0]]) if len(nonzero) else None,
                'fake_at_zero_or_one_output': bool(label == 'quant_output' and (np.clip(fake[row], 0, 1) in (0, 1))),
            })
    return fake, integer_codes['quant_output'].reshape(-1) * qscale['quant_output'], diagnostics


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--model', required=True, choices=['mlp', 'cnn'])
    parser.add_argument('--fold', required=True, type=int, choices=range(1, 10))
    parser.add_argument('--calibration', default='max', choices=['max', 'p999'])
    parser.add_argument('--output-dir', default='results/p3_qat/verification/layer_diagnostics')
    args = parser.parse_args()
    checkpoint, _ = load_checkpoint(args.model, args.fold)
    if checkpoint['model'] != args.model or int(checkpoint['fold']) != args.fold:
        raise ValueError('Checkpoint identity mismatch')
    if list(checkpoint['features']) != FEATURES:
        raise ValueError('Feature order mismatch')
    calibration = pd.read_csv(CAL)
    act_scales = scales(calibration, args.fold, args.model, 8, args.calibration)
    qat, integer_model = create_models(args.model, checkpoint, act_scales)
    ref = pd.read_parquet(ROOT / 'reference_vectors' / f'fold{args.fold}.parquet')
    prior_path = Path('results/p3_qat/verification/post_training') / args.model / f'fold{args.fold}_int8_{args.calibration}_predictions.parquet'
    prior = pd.read_parquet(prior_path)
    if len(prior) != len(ref):
        raise ValueError('Reference and previous verification sample count mismatch')
    for key in ('scenario', 'source_row'):
        if key in ref and key in prior and not np.array_equal(ref[key].to_numpy(), prior[key].to_numpy()):
            raise ValueError(f'Reference alignment mismatch: {key}')
    source_rows = CASES.get((args.model, args.fold))
    if not source_rows:
        raise ValueError('No curated outliers for this model/fold')
    selected = ref.index[ref['source_row'].isin(source_rows)].to_numpy()
    if len(selected) != len(source_rows):
        raise ValueError(f'Expected {len(source_rows)} outlier rows, found {len(selected)}')
    raw = ref.iloc[selected][FEATURES].to_numpy(dtype=np.float64)
    mean = np.asarray(checkpoint['scaler_mean'], dtype=np.float64)
    std = np.asarray(checkpoint['scaler_scale'], dtype=np.float64)
    standardized = ((raw - mean) / std).astype(np.float32)
    fake, replay_unclipped, details = run_trace(qat, integer_model, args.model, standardized)
    reference_integer = infer(integer_model, args.model, raw, mean, std, act_scales, 8, batch_size=128)
    replay = np.clip(replay_unclipped, 0, 1)
    if not np.allclose(replay, reference_integer, atol=2e-6, rtol=0):
        raise RuntimeError('Independent integer replay disagrees with production infer(): inspect layer layout/scales before interpreting trace')
    if not np.allclose(np.clip(fake, 0, 1), prior.iloc[selected]['pred_fake_qat'].to_numpy(), atol=2e-6, rtol=0):
        raise RuntimeError('Fake-QAT replay disagrees with saved verification predictions')
    if not np.allclose(reference_integer, prior.iloc[selected]['pred_integer_qat'].to_numpy(), atol=2e-6, rtol=0):
        raise RuntimeError('Integer inference disagrees with saved verification predictions')
    for entry in details:
        i = entry['sample_index']
        entry.update(model=args.model, fold=args.fold, scenario=str(ref.iloc[selected[i]]['scenario']),
                     source_row=int(ref.iloc[selected[i]]['source_row']),
                     fake_prediction=float(np.clip(fake[i], 0, 1)),
                     integer_prediction=float(reference_integer[i]),
                     abs_output_difference=float(abs(np.clip(fake[i], 0, 1) - reference_integer[i])))
    out = Path(args.output_dir) / args.model
    out.mkdir(parents=True, exist_ok=True)
    csv = out / f'fold{args.fold}_layer_diagnostics.csv'
    pd.DataFrame(details).to_csv(csv, index=False)
    print(pd.DataFrame(details)[['source_row', 'layer', 'different_codes', 'elements', 'max_abs_code_difference', 'first_differing_element']].to_string(index=False))
    print(f'\nIndependent integer replay: PASS\nSaved predictions reproduced: PASS\nSaved: {csv}')

if __name__ == '__main__':
    main()

