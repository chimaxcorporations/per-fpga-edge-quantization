#!/usr/bin/env python3
"""Deterministic independent integer-arithmetic oracle for Q31 RNE."""
import argparse
import random
from pathlib import Path

I32_MIN, I32_MAX = -(1 << 31), (1 << 31) - 1
MASK32, MASK64 = (1 << 32) - 1, (1 << 64) - 1


def reference(acc: int, mult: int) -> int:
    product = acc * mult
    magnitude = abs(product)
    whole, rem = divmod(magnitude, 1 << 31)
    if 2 * rem > (1 << 31) or (2 * rem == (1 << 31) and whole % 2):
        whole += 1
    return -whole if product < 0 else whole


def generate(count: int, seed: int):
    corners = [I32_MIN, I32_MIN + 1, -(1 << 30), -65537, -65536,
               -32769, -32768, -3, -2, -1, 0, 1, 2, 3, 32767,
               32768, 65535, 65536, 65537, (1 << 30), I32_MAX - 1, I32_MAX]
    pairs = [(a, b) for a in corners for b in corners]
    # Exact positive/negative half ties, both even and odd integer parts.
    pairs += [(a, 1 << 30) for a in range(-17, 18)]
    pairs += [(a, -(1 << 30)) for a in range(-17, 18)]
    rng = random.Random(seed)
    while len(pairs) < count:
        pairs.append((rng.randint(I32_MIN, I32_MAX), rng.randint(I32_MIN, I32_MAX)))
    return pairs[:count]


def main():
    p = argparse.ArgumentParser()
    p.add_argument('--output', default='results/p3_m04/requantize_q31/golden_vectors.memh')
    p.add_argument('--count', type=int, default=20000)
    p.add_argument('--seed', type=int, default=0x31415926)
    args = p.parse_args()
    if args.count < 1:
        p.error('--count must be positive')
    out = Path(args.output)
    out.parent.mkdir(parents=True, exist_ok=True)
    pairs = generate(args.count, args.seed)
    with out.open('w', encoding='ascii') as f:
        for a, m in pairs:
            r = reference(a, m)
            f.write(f'{a & MASK32:08x}{m & MASK32:08x}{r & MASK64:016x}\n')
    print(f'Generated {len(pairs)} bit-exact Q31 RNE vectors: {out} (seed={args.seed})')


if __name__ == '__main__':
    main()
