#!/usr/bin/env python3
"""Deterministic, independently calculated neuron test vectors."""
from pathlib import Path
import random

ROOT = Path(__file__).resolve().parent / 'vectors'
ROOT.mkdir(exist_ok=True)
rng = random.Random(20261028)
counts = [12, 48, 160, 32] * 4

def rnd_even(n, shift):
    mag = abs(n)
    q, rem = divmod(mag, 1 << shift)
    half = (1 << shift) >> 1
    q += int(rem > half or (rem == half and (q & 1))) if shift else 0
    return -q if n < 0 else q

cases = []
features, weights = [], []
for i, count in enumerate(counts):
    x = [rng.randint(-127, 127) for _ in range(count)]
    w = [rng.randint(-127, 127) for _ in range(count)]
    if i == 0:
        x = [0] * count
        w = [0] * count
    if i == 1:
        x = [127] * count
        w = [127] * count
    if i == 2:
        x = [-127] * count
        w = [127] * count
    bias = rng.randint(-10000, 10000)
    multiplier = rng.randint(1, (1 << 30))
    shift = [31, 31, 30, 29][i % 4]
    relu = i % 2
    acc = bias + sum(a * b for a, b in zip(x, w))
    assert -(1 << 31) <= acc < (1 << 31)
    product = acc * multiplier
    assert -(1 << 63) <= product < (1 << 63)
    expected = max(-127, min(127, rnd_even(product, shift)))
    if relu: expected = max(0, expected)
    cases.append((count, bias, multiplier, shift, relu, expected))
    features.extend(x + [0] * (160 - count))
    weights.extend(w + [0] * (160 - count))

def emit(name, values, bits, unsigned=False):
    with (ROOT / name).open('w') as f:
        for v in values:
            assert (0 <= v < (1 << bits)) if unsigned else (-(1 << (bits - 1)) <= v < (1 << (bits - 1)))
            f.write(f'{v & ((1 << bits) - 1):0{bits // 4}x}\n')

emit('features.memh', features, 8)
emit('weights.memh', weights, 8)
for col, bits, name in [(0, 8, 'counts'), (1, 32, 'biases'),
                        (2, 32, 'multipliers'), (3, 8, 'shifts'),
                        (4, 8, 'relu'), (5, 8, 'expected')]:
    emit(name + '.memh', [c[col] for c in cases], bits, unsigned=name in ('counts','shifts','relu'))
print(f'PASS: generated {len(cases)} deterministic neuron cases')
