"""P3-M02.5-V4: independent integer dense/conv1d reference tests.

Run: python -m scripts.test_integer_ptq_v4
No checkpoints or predictions are modified.
"""
import numpy as np
from src.integer_ptq import dense, conv1d, quantize, qmax, weight_quantize, fixedpoint_params


def round_div_even(n, d):
    assert d > 0
    sign = -1 if n < 0 else 1
    q, r = divmod(abs(int(n)), int(d))
    if 2 * r > d or (2 * r == d and q % 2):
        q += 1
    return sign * q


def reference_dense(qx, w, bias, sx, sy, bits, relu=False):
    qx = np.asarray(qx, dtype=np.int64)
    w = np.asarray(w, dtype=np.float64)
    bias = np.asarray(bias, dtype=np.float64)
    qw, sw = weight_quantize(w, bits)
    Q = qmax(bits)
    out = np.empty((len(qx), len(sw)), dtype=np.int64)
    for row in range(len(qx)):
        for channel in range(len(sw)):
            bq = int(np.rint(float(bias[channel]) / (sx * float(sw[channel]))))
            acc = bq + sum(int(a) * int(b) for a, b in zip(qx[row], qw[channel].ravel()))
            multiplier, shift = fixedpoint_params(sx * float(sw[channel]) / sy)
            val = round_div_even(acc * int(multiplier), 1 << shift)
            val = max(-Q, min(Q, val))
            out[row, channel] = max(0, val) if relu else val
    return out


def reference_conv(qx, w, bias, sx, sy, bits, relu):
    qx = np.asarray(qx, dtype=np.int64)
    w = np.asarray(w, dtype=np.float64)
    n, cin, length = qx.shape
    cout, wcin, kernel = w.shape
    assert cin == wcin and kernel == 3
    patches = []
    for batch in range(n):
        for pos in range(length):
            patches.append([
                int(qx[batch, c, pos + k - 1]) if 0 <= pos + k - 1 < length else 0
                for c in range(cin) for k in range(kernel)
            ])
    result = reference_dense(np.asarray(patches, dtype=np.int64),
                             w.reshape(cout, -1), bias, sx, sy, bits, relu)
    return result.reshape(n, length, cout).transpose(0, 2, 1)


def check_equal(label, actual, expected):
    if not np.array_equal(actual, expected):
        idx = tuple(np.argwhere(actual != expected)[0])
        raise AssertionError(f'{label} mismatch at {idx}: actual={actual[idx]}, expected={expected[idx]}')
    print(f'{label}: PASS ({actual.size} integer outputs)')


def main():
    rng = np.random.default_rng(20261027)
    count = 0
    for bits in (8, 16):
        Q = qmax(bits)
        for relu in (False, True):
            for shape in ((5, 40, 64), (4, 64, 32), (3, 32, 1)):
                batch, inputs, outputs = shape
                x = rng.integers(-Q, Q + 1, size=(batch, inputs), dtype=np.int64)
                x[0, :min(inputs, 4)] = [-Q, Q, 0, 1][:min(inputs, 4)]
                w = rng.normal(0, 0.15, size=(outputs, inputs))
                b = rng.normal(0, 0.08, size=outputs)
                sx, sy = 0.0125, 0.025
                actual = dense(x, w, b, sx, sy, bits, relu=relu)
                expected = reference_dense(x, w, b, sx, sy, bits, relu=relu)
                check_equal(f'INT{bits} dense {shape} relu={relu}', actual, expected)
                count += 1
            for cin, cout, length in ((4, 16, 10), (16, 16, 10)):
                x = rng.integers(-Q, Q + 1, size=(3, cin, length), dtype=np.int64)
                w = rng.normal(0, 0.12, size=(cout, cin, 3))
                b = rng.normal(0, 0.07, size=cout)
                sx, sy = 0.01, 0.02
                actual = conv1d(x, w, b, sx, sy, bits, relu=relu)
                expected = reference_conv(x, w, b, sx, sy, bits, relu=relu)
                check_equal(f'INT{bits} conv {cin}->{cout} relu={relu}', actual, expected)
                count += 1
    print(f'\nP3-M02.5-V4 INDEPENDENT LAYER TESTS PASSED ({count} cases)')
    print('Note: weight_quantize and fixedpoint_params are shared; their independent audit remains separate.')


if __name__ == '__main__':
    main()
