#!/usr/bin/env python3
"""P3-M06-02B: fold-1 CNN QAT INT8 ROM and layer-golden export.
Run from repository root with the project's Python environment.
"""
import argparse
import hashlib
import json
from pathlib import Path

import numpy as np
import pandas as pd
import torch

from src.integer_ptq import (weight_quantize, fixedpoint_params, quantize,
                             dense, conv1d, round_shift_even, qmax)
from scripts.run_integer_ptq import FEATURES, CNN, infer, scales

LAYERS = [
    ('conv1', 'conv.0', (16, 4, 3), 'standardized_input', 'conv1_relu', True),
    ('conv2', 'conv.2', (16, 16, 3), 'conv1_relu', 'conv2_relu', True),
    ('fc1', 'head.1', (32, 160), 'conv2_relu', 'dense_relu', True),
    ('output', 'head.3', (1, 32), 'dense_relu', 'output_linear', False),
]

def sha(path):
    h = hashlib.sha256()
    with open(path, 'rb') as f:
        for block in iter(lambda: f.read(1 << 20), b''):
            h.update(block)
    return h.hexdigest()

def write_mem(path, values, bits):
    flat = np.asarray(values).reshape(-1)
    with path.open('w') as f:
        for value in flat:
            x = int(value)
            if not -(1 << (bits - 1)) <= x < (1 << (bits - 1)):
                raise OverflowError(f'{path}: {x} does not fit signed {bits}')
            f.write(f'{x & ((1 << bits) - 1):0{bits // 4}x}\n')
    return {'file': path.name, 'words': len(flat), 'width_bits': bits, 'sha256': sha(path)}

def read_mem(path, bits):
    a = np.asarray([int(v, 16) for v in path.read_text().splitlines()], dtype=np.int64)
    return np.where(a >= (1 << (bits - 1)), a - (1 << bits), a)

def assert_equal(actual, expected, description):
    if not np.array_equal(actual, expected):
        idx = tuple(np.argwhere(actual != expected)[0])
        raise AssertionError(f'{description}: mismatch at {idx}: {actual[idx]} != {expected[idx]}')

def main():
    p = argparse.ArgumentParser()
    p.add_argument('--count', type=int, default=32)
    p.add_argument('--out', type=Path, default=Path('results/p3_m06/qat_hardware/parameter_rom'))
    args = p.parse_args()
    if args.count < 1:
        p.error('--count must be positive')

    ckpt = Path('results/p3_qat/training/cnn/fold1/cnn_fold1_qat_int8.pt')
    original = Path('artifacts/p3_m01/reference_models/cnn/cnn_fold1.pt')
    ref = Path('artifacts/p3_m01/reference_vectors/fold1.parquet')
    cal = Path('results/p3_quantization/calibration/activation_statistics/activation_percentiles_exact_by_fold.csv')
    for path in (ckpt, original, ref, cal):
        if not path.is_file():
            p.error(f'Missing prerequisite: {path}')

    state = torch.load(ckpt, map_location='cpu', weights_only=False)
    orig = torch.load(original, map_location='cpu', weights_only=False)
    assert list(state['features']) == FEATURES
    assert list(orig['features']) == FEATURES
    assert_equal(np.asarray(state['scaler_mean']), np.asarray(orig['scaler_mean']), 'scaler_mean')
    assert_equal(np.asarray(state['scaler_scale']), np.asarray(orig['scaler_scale']), 'scaler_scale')
    assert state['quantization']['bits'] == 8
    assert state['quantization']['calibration'] == 'max'

    model = CNN()
    model.load_state_dict(state['state_dict'], strict=True)
    model.eval()
    weights = state['state_dict']
    activation_scales = scales(pd.read_csv(cal), 1, 'cnn', 8, 'max')
    assert set(activation_scales) == {'standardized_input', 'conv1_relu', 'conv2_relu', 'dense_relu', 'output_linear'}
    out = args.out
    out.mkdir(parents=True, exist_ok=True)
    layer_metadata = []

    for name, key, shape, source, target, relu in LAYERS:
        w = weights[f'{key}.weight'].detach().cpu().numpy()
        b = weights[f'{key}.bias'].detach().cpu().numpy()
        assert w.shape == shape and b.shape == (shape[0],), (name, w.shape, b.shape)
        sx, sy = activation_scales[source], activation_scales[target]
        qw, sw = weight_quantize(w, 8)
        bq = np.rint(b.astype(np.float64) / (sx * sw)).astype(np.int64)
        m, sh = zip(*(fixedpoint_params(float(sx * s / sy)) for s in sw))
        if any(not 0 <= int(s) <= 63 for s in sh):
            raise ValueError(f'{name}: unsupported RTL shift')
        specs = [('weights', qw, 8), ('bias', bq, 32),
                 ('multiplier', m, 32), ('shift', sh, 8)]
        files = {}
        for suffix, data, bits in specs:
            path = out / f'{name}_{suffix}.memh'
            files[suffix] = write_mem(path, data, bits)
            assert_equal(read_mem(path, bits), np.asarray(data).reshape(-1), f'{name}/{suffix} ROM readback')
        layer_metadata.append({'name': name, 'state_key': key, 'weight_shape': list(shape),
                               'weight_order': 'output-channel,input-channel,kernel' if len(shape) == 3 else 'output-neuron,input-feature',
                               'relu': relu, 'input_scale': sx, 'output_scale': sy, 'files': files})

    frame = pd.read_parquet(ref)
    n = min(args.count, len(frame))
    if n == 0:
        raise ValueError('Empty reference vectors')
    raw = frame[FEATURES].to_numpy(dtype=np.float64)[:n]
    mean = np.asarray(state['scaler_mean'], dtype=np.float64)
    std = np.asarray(state['scaler_scale'], dtype=np.float64)
    assert mean.shape == std.shape == (40,) and np.all(std > 0)
    x = ((raw - mean) / std).astype(np.float32)
    q0 = quantize(x, activation_scales['standardized_input'], 8)
    vectors = {'inputs': write_mem(out / 'inputs_int8.memh', q0, 8)}

    # Independent production-backend golden layer results.
    q = q0.reshape(n, 10, 4).transpose(0, 2, 1)
    golden = {}
    for name, key, shape, source, target, relu in LAYERS:
        w = weights[f'{key}.weight'].detach().cpu().numpy()
        b = weights[f'{key}.bias'].detach().cpu().numpy()
        if name == 'fc1':
            q = q.reshape(n, -1)
        if len(shape) == 3:
            q = conv1d(q, w, b, activation_scales[source], activation_scales[target], 8, relu=relu)
        else:
            q = dense(q, w, b, activation_scales[source], activation_scales[target], 8, relu=relu)
        golden[name] = q.copy()
        vectors[f'{name}_golden'] = write_mem(out / f'{name}_golden_int8.memh', q, 8)

    # Independently replay from decoded ROM files and compare every layer.
    q = q0.reshape(n, 10, 4).transpose(0, 2, 1).astype(np.int64)
    for name, key, shape, source, target, relu in LAYERS:
        qw = read_mem(out / f'{name}_weights.memh', 8).reshape(shape)
        bq = read_mem(out / f'{name}_bias.memh', 32)
        m = read_mem(out / f'{name}_multiplier.memh', 32)
        sh = read_mem(out / f'{name}_shift.memh', 8)
        if len(shape) == 3:
            length = q.shape[2]
            padded = np.pad(q, ((0, 0), (0, 0), (1, 1)))
            patches = np.stack([padded[:, :, i:i+length] for i in range(3)], axis=-1)
            operands = patches.transpose(0, 2, 1, 3).reshape(n * length, -1)
            acc = operands @ qw.reshape(shape[0], -1).T + bq
        else:
            if name == 'fc1':
                q = q.reshape(n, -1)
            acc = q @ qw.T + bq
        if np.any(acc < -(1 << 31)) or np.any(acc > (1 << 31) - 1):
            raise OverflowError(f'{name}: INT32 overflow')
        output = np.empty_like(acc)
        for j in range(shape[0]):
            if any(abs(int(v)) * abs(int(m[j])) > (1 << 63) - 1 for v in acc[:, j]):
                raise OverflowError(f'{name}: INT64 Q31 overflow')
            output[:, j] = round_shift_even(acc[:, j] * int(m[j]), int(sh[j]))
        output = np.clip(output, -127, 127)
        if relu:
            output = np.maximum(output, 0)
        if len(shape) == 3:
            q = output.reshape(n, length, shape[0]).transpose(0, 2, 1)
        else:
            q = output
        assert_equal(q, golden[name], f'{name} ROM vs production')
        assert_equal(read_mem(out / f'{name}_golden_int8.memh', 8).reshape(golden[name].shape), golden[name], f'{name} golden readback')
        print(f'PASS: {name} ROM readback and backend parity, shape={q.shape}')

    production = infer(model, 'cnn', raw, mean, std, activation_scales, 8)
    predicted = np.clip(q[:, 0].astype(np.float64) * activation_scales['output_linear'], 0, 1)
    assert_equal(predicted, production, 'final PER output parity')

    manifest = {'milestone': 'P3-M06-02B', 'model': 'cnn', 'fold': 1, 'bits': 8,
                'method': 'max', 'samples': n, 'checkpoint_sha256': sha(ckpt),
                'original_checkpoint_sha256': sha(original), 'calibration_sha256': sha(cal),
                'reference_vectors_sha256': sha(ref), 'feature_order': FEATURES,
                'input_tensor_order': 'sample,channel,time; 4x10',
                'golden_conv_order': 'sample,output-channel,time',
                'layer_parameters': layer_metadata, 'test_vectors': vectors,
                'rom_readback': 'PASS', 'layerwise_rom_backend_parity': 'PASS',
                'final_per_parity': 'PASS',
                'note': 'Hardware output is INT8; dequantization and [0,1] clipping are external.'}
    (out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    print(f'PASS: CNN fold-1 QAT INT8 ROM export; {n} samples; all four layers and final PER match')
    print(f'Manifest: {out / "manifest.json"}')

if __name__ == '__main__':
    main()
