"""Reproducible symmetric quantization primitives for P3."""

import numpy as np


def quantization_limits(bits):
    if bits not in (8, 16):
        raise ValueError("Supported precisions: INT8 and INT16")

    qmax = 2 ** (bits - 1) - 1
    qmin = -qmax

    return qmin, qmax


def calculate_scale(values, bits, method="max"):
    """Calculate symmetric quantization scale."""

    values = np.asarray(values, dtype=np.float64)

    if not np.isfinite(values).all():
        raise ValueError("Nonfinite calibration values")

    if method == "max":
        alpha = float(np.max(np.abs(values)))

    elif method == "p999":
        alpha = float(
            np.percentile(np.abs(values), 99.9)
        )

    else:
        raise ValueError(f"Unknown calibration method: {method}")

    _, qmax = quantization_limits(bits)

    if alpha == 0:
        return 1.0

    return alpha / qmax


def quantize(values, scale, bits):
    """Quantize floating-point values to signed integers."""

    qmin, qmax = quantization_limits(bits)

    if not np.isfinite(scale) or scale <= 0:
        raise ValueError("Quantization scale must be positive")

    values = np.asarray(values, dtype=np.float64)

    if not np.isfinite(values).all():
        raise ValueError("Nonfinite input values")

    q = np.clip(
        np.rint(values / scale),
        qmin,
        qmax,
    )

    dtype = np.int8 if bits == 8 else np.int16

    return q.astype(dtype)


def dequantize(q, scale):
    """Convert quantized integers back to floating-point."""

    return np.asarray(q, dtype=np.float64) * scale


def fake_quantize(values, scale, bits):
    """Simulate quantization and dequantization."""

    q = quantize(values, scale, bits)

    return dequantize(q, scale)
