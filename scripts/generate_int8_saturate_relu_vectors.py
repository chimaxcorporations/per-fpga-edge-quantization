#!/usr/bin/env python3
"""Deterministic independent Python reference for signed INT64 -> symmetric INT8 + ReLU."""
import argparse
import hashlib
import random
from pathlib import Path

MASK64 = (1 << 64) - 1

def reference(x: int, relu: int) -> int:
    assert -(1 << 63) <= x < (1 << 63)
    y = max(-127, min(127, x))
    return max(0, y) if relu else y

def main():
    p = argparse.ArgumentParser()
    p.add_argument('--count', type=int, default=20000)
    p.add_argument('--seed', type=int, default=0x02D2026)
    p.add_argument('--output', default='results/p3_m04/int8_saturate_relu/golden_vectors.memh')
    args = p.parse_args()
    boundary = [-(1 << 63), -(1 << 63)+1, -(1 << 32), -1000000, -256,
                -129, -128, -127, -126, -1, 0, 1, 126, 127, 128, 129,
                255, 256, 1000000, (1 << 32)-1, (1 << 63)-2, (1 << 63)-1]
    directed = [(x, r) for x in boundary for r in (0, 1)]
    if args.count < len(directed):
        p.error(f'--count must be >= {len(directed)}')
    rng = random.Random(args.seed)
    vectors = directed + [(rng.randrange(-(1 << 63), 1 << 63), rng.randrange(2))
                          for _ in range(args.count - len(directed))]
    path = Path(args.output)
    path.parent.mkdir(parents=True, exist_ok=True)
    # 73 bits: [72:9] input, [8] relu, [7:0] expected output
    with path.open('w', encoding='ascii') as f:
        for x, relu in vectors:
            expected = reference(x, relu)
            packed = ((x & MASK64) << 9) | (relu << 8) | (expected & 0xff)
            f.write(f'{packed:019x}\n')
    digest = hashlib.sha256(path.read_bytes()).hexdigest()
    print(f'Generated {len(vectors)} Python-golden vectors: {path}')
    print(f'seed={args.seed} sha256={digest} directed={len(directed)}')

if __name__ == '__main__':
    main()
