"""P3-M02.5-V3: Independent fixed-point arithmetic tests."""

from fractions import Fraction
import numpy as np

from src.integer_ptq import (
    qmax,
    quantize,
    fixedpoint_params,
    round_shift_even,
    requantize,
)

I64MAX = np.iinfo(np.int64).max


def exact_round_shift(value, shift):
    """Independent arbitrary-precision ties-to-even reference."""
    value = int(value)
    denominator = 1 << shift

    magnitude = abs(value)
    quotient, remainder = divmod(magnitude, denominator)

    if 2 * remainder > denominator:
        quotient += 1
    elif 2 * remainder == denominator and quotient % 2:
        quotient += 1

    return -quotient if value < 0 else quotient


def test_rounding():
    cases = [
        (0, 1),
        (1, 1),
        (3, 1),
        (5, 1),
        (7, 1),
        (-1, 1),
        (-3, 1),
        (-5, 1),
        (-7, 1),
        (127, 3),
        (-127, 3),
        (32767, 7),
        (-32767, 7),
        (I64MAX, 31),
        (-I64MAX, 31),
    ]

    for value, shift in cases:
        actual = round_shift_even(
            np.array([value], dtype=np.int64),
            shift,
        )[0]

        expected = exact_round_shift(value, shift)

        assert int(actual) == expected, (
            value, shift, actual, expected
        )

    print("Signed rounding tests: PASS")


def test_quantization():
    for bits in (8, 16):
        Q = qmax(bits)

        values = np.array([
	    	-100000.0,
	    	-1.0,
	    	-0.5,
	    	0.0,
	    	0.5,
	    	1.0,
	    	100000.0,
	])

        q = quantize(values, 1.0, bits)

        assert q.min() >= -Q
        assert q.max() <= Q

        assert int(q[0]) == -Q
        assert int(q[-1]) == Q

    print("Quantization saturation tests: PASS")


def test_multiplier():
    ratios = [
        1e-6,
        0.001,
        0.01,
        0.1,
        0.5,
        0.75,
        0.999,
        1.0,
        1.5,
        2.0,
        10.0,
    ]

    for ratio in ratios:
        m, shift = fixedpoint_params(ratio)

        assert 0 < m <= (1 << 31) - 1
        assert shift >= 0

        approximation = Fraction(m, 1 << shift)

        error = abs(float(approximation) - ratio)

        assert error < 1e-6, (
            ratio, m, shift, error
        )

    print("Fixed-point multiplier tests: PASS")


def test_requantization():
    for bits in (8, 16):
        Q = qmax(bits)

        acc = np.array([
            [-10000],
            [-1000],
            [-5],
            [-1],
            [0],
            [1],
            [5],
            [1000],
            [10000],
        ], dtype=np.int64)

        sx = 0.01
        sw = np.array([0.02])
        sy = 0.04

        result = requantize(
            acc, sx, sw, sy, bits
        )

        m, shift = fixedpoint_params(
            sx * sw[0] / sy
        )

        expected = []

        for value in acc[:, 0]:
            product = int(value) * int(m)

            rounded = exact_round_shift(
                product, shift
            )

            expected.append(
                min(Q, max(-Q, rounded))
            )

        assert np.array_equal(
            result[:, 0],
            np.array(expected, dtype=np.int64),
        )

    print("Integer requantization tests: PASS")


def main():
    test_rounding()
    test_quantization()
    test_multiplier()
    test_requantization()

    print()
    print("P3-M02.5-V3 FIXED-POINT TESTS PASSED")


if __name__ == "__main__":
    main()
