#!/usr/bin/env python3
"""Independent Python oracle for serial neuron, using Python unbounded integers."""
import argparse, pathlib, random

def rne(value, shift):
    den = 1 << shift
    q, rem = divmod(abs(value), den)
    inc = rem * 2 > den or (rem * 2 == den and q % 2 == 1)
    return (-1 if value < 0 else 1) * (q + int(inc))

def signed32(x):
    return ((x + (1 << 31)) % (1 << 32)) - (1 << 31)

def main():
    p = argparse.ArgumentParser()
    p.add_argument('--count', type=int, default=2000)
    p.add_argument('--features', type=int, default=40)
    p.add_argument('--seed', type=int, default=0x30403A)
    p.add_argument('--output', default='results/p3_m04/neuron_int8_serial/golden_vectors.memh')
    a = p.parse_args()
    if a.count < 1 or a.features < 1: p.error('count and features must be positive')
    rng = random.Random(a.seed)
    dest = pathlib.Path(a.output)
    dest.parent.mkdir(parents=True, exist_ok=True)
    with dest.open('w') as f:
        for case in range(a.count):
            bias = [0, 2147483647, -2147483648, 127, -127, 1, -1][case % 7] if case < 28 else rng.randint(-100000, 100000)
            multiplier = [1, 0x7fffffff, 0x40000000, 3, 0][case % 5] if case < 30 else rng.randint(0, 0x7fffffff)
            shift = [0, 1, 15, 30, 31][case % 5] if case < 40 else rng.randint(0, 31)
            relu = case % 2
            xs = [rng.randint(-127,127) for _ in range(a.features)]
            ws = [rng.randint(-127,127) for _ in range(a.features)]
            if case % 13 == 0: xs = [0] * a.features
            acc, ov = bias, 0
            for x,w in zip(xs,ws):
                nxt = acc + x*w
                ov |= int(nxt < -(1<<31) or nxt > (1<<31)-1)
                acc = signed32(nxt)
            rounded = rne(acc * multiplier, shift)
            y = max(-127,min(127,rounded))
            if relu: y = max(0,y)
            # Header 32b bias, 32b multiplier, 6b shift, 1b relu, 8b expected, 1b overflow.
            header = ((bias & 0xffffffff)<<48) | ((multiplier & 0xffffffff)<<16) | (shift<<10) | (relu<<9) | ((y&255)<<1) | ov
            f.write(f'{header:020x}\n')
            for x,w in zip(xs,ws): f.write(f'{((x&255)<<8)|(w&255):04x}\n')
    print(f'Generated {a.count} cases x {a.features} features: {dest} (seed={a.seed})')
if __name__ == '__main__': main()
