"""Integer-only arithmetic reference for symmetric INT8/INT16 PTQ.

Weights/activations use signed symmetric ranges [-Q,Q]. Per-output-channel
weight scales, per-tensor activation scales. Integer bias and integer
multiply-accumulate. Requantization uses Q31 multiplier and right shift.
Only the final output is dequantized for evaluation.
"""
import numpy as np


def qmax(bits):
    if bits not in (8, 16):
        raise ValueError(bits)
    return (1 << (bits - 1)) - 1


def quantize(x, scale, bits):
    if not np.all(np.isfinite(x)) or not np.all(np.isfinite(scale)) or np.any(np.asarray(scale) <= 0):
        raise ValueError('Nonfinite values or invalid scales')
    Q = qmax(bits)
    return np.clip(np.rint(np.asarray(x, dtype=np.float64) / scale), -Q, Q).astype(np.int64)


def weight_quantize(w, bits):
    w = np.asarray(w, dtype=np.float64)
    axes = tuple(range(1, w.ndim))
    scales = np.maximum(np.max(np.abs(w), axis=axes) / qmax(bits), 1e-12)
    shaped = scales.reshape((-1,) + (1,) * (w.ndim - 1))
    return quantize(w, shaped, bits), scales


def fixedpoint_params(ratio):
    """Positive real multiplier represented by (M / 2**shift), M <= 2**31-1."""
    ratio = float(ratio)
    if not np.isfinite(ratio) or ratio <= 0:
        raise ValueError(ratio)
    shift = 31
    while ratio * (1 << shift) > (1 << 31) - 1 and shift > 0:
        shift -= 1
    if ratio * (1 << shift) > (1 << 31) - 1:
        raise OverflowError('Multiplier ratio too large')
    m = max(1, int(np.rint(ratio * (1 << shift))))
    return m, shift


def round_shift_even(x, shift):
    """Signed integer division by 2**shift, round nearest ties to even.

    Handles the full signed INT64 domain, including -2**63.
    """
    x = np.asarray(x, dtype=np.int64)

    if not isinstance(shift, (int, np.integer)):
        raise TypeError("shift must be an integer")

    if not 0 <= shift <= 63:
        raise ValueError("shift must be between 0 and 63")

    if shift == 0:
        return x.copy()

    negative = x < 0

    # Convert to unsigned before computing magnitude.
    ux = x.view(np.uint64)
    mag = np.where(
        negative,
        np.uint64(0) - ux,
        ux,
    )

    den = np.uint64(1) << np.uint64(shift)

    quo = mag // den
    rem = mag % den

    half = den >> np.uint64(1)

    inc = (rem > half) | (
        (rem == half) & ((quo & np.uint64(1)) == 1)
    )

    rounded = quo + inc.astype(np.uint64)

    # Two's-complement reconstruction without signed overflow.
    signed_bits = np.where(
        negative,
        np.uint64(0) - rounded,
        rounded,
    )

    return signed_bits.view(np.int64)


def requantize(acc, sx, sw, sy, bits):
    acc = np.asarray(acc, dtype=np.int64)
    out = np.empty_like(acc)
    for j in range(len(sw)):
        multiplier, shift = fixedpoint_params(float(sx * sw[j] / sy))
        column = acc[:, j]
        unsigned = column.view(np.uint64)
        magnitudes = np.where(
            column < 0,
            np.uint64(0) - unsigned,
            unsigned,
        )
        limit = np.uint64(np.iinfo(np.int64).max // multiplier)
        if np.any(magnitudes > limit):
            raise OverflowError('INT64 intermediate multiplication overflow')
        out[:, j] = round_shift_even(acc[:, j] * multiplier, shift)
    Q = qmax(bits)
    return np.clip(out, -Q, Q)


def dense(qx, w, bias, sx, sy, bits, relu=False):
    qw, sw = weight_quantize(w, bits)
    bq = np.rint(np.asarray(bias, dtype=np.float64) / (sx * sw)).astype(np.int64)
    acc = qx.astype(np.int64) @ qw.T + bq
    out = requantize(acc, sx, sw, sy, bits)
    return np.maximum(out, 0) if relu else out


def conv1d(qx, w, bias, sx, sy, bits, relu=True):
    """NCL convolution with kernel 3, padding 1, stride 1, dilation 1."""
    if w.shape[2] != 3:
        raise ValueError('Expected kernel width 3')
    n, cin, length = qx.shape
    cout = w.shape[0]
    padded = np.pad(qx, ((0, 0), (0, 0), (1, 1)))
    # Each row is an output position; flatten input-channel x kernel dimensions.
    patches = np.stack([padded[:, :, i:i + length] for i in range(3)], axis=-1)
    patches = patches.transpose(0, 2, 1, 3).reshape(n * length, cin * 3)
    out = dense(patches, w.reshape(cout, -1), bias, sx, sy, bits, relu)
    return out.reshape(n, length, cout).transpose(0, 2, 1)
