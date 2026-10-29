"""INT8 fake quantization for FPGA-oriented PER prediction models.

M03-02A/B: Differentiable quantization-aware training.

This module provides:
- Symmetric INT8 activation fake quantization
- Per-output-channel INT8 weight fake quantization
- Straight-through gradient estimation
- QAT-compatible MLP and CNN architectures

Integer-backend equivalence is NOT assumed; it must be verified
separately against src/integer_ptq.py.
"""

import torch
import torch.nn as nn
import torch.nn.functional as F


INT8_QMAX = 127


class RoundSTE(torch.autograd.Function):
    """Round to nearest even, with identity backward approximation."""

    @staticmethod
    def forward(ctx, x):
        return torch.round(x)

    @staticmethod
    def backward(ctx, grad_output):
        return grad_output


def fake_quantize(x, scale, qmax=INT8_QMAX):
    """Symmetric fake quantization with saturation-aware STE."""

    scale = torch.as_tensor(
        scale, dtype=x.dtype, device=x.device
    )

    if torch.any(scale <= 0):
        raise ValueError("Quantization scale must be positive")

    normalized = x / scale
    clipped = torch.clamp(normalized, -qmax, qmax)

    # Gradient through clamp is zero outside the representable range.
    quantized = RoundSTE.apply(clipped)

    return quantized * scale


def weight_fake_quant(w, qmax=INT8_QMAX):
    """Symmetric per-output-channel weight quantization."""

    axes = tuple(range(1, w.ndim))

    # Fixed scales during each forward/backward step.
    # Gradients flow through weights, not through scale estimation.
    with torch.no_grad():
        absmax = torch.amax(torch.abs(w), dim=axes)
        scales = torch.clamp(
            absmax / qmax,
            min=1e-12,
        )

    shape = (-1,) + (1,) * (w.ndim - 1)

    return fake_quantize(
        w,
        scales.reshape(shape),
        qmax,
    )


class FakeQuantActivation(nn.Module):
    """Per-tensor symmetric fake quantizer with configurable scale."""

    def __init__(self, scale=1.0):
        super().__init__()

        self.register_buffer(
            "scale",
            torch.tensor(float(scale)),
        )

    def set_scale(self, scale):
        value = float(scale)

        if not 0 < value < float("inf"):
            raise ValueError("Invalid activation scale")

        self.scale.fill_(value)

    def forward(self, x):
        return fake_quantize(x, self.scale)


class QATLinear(nn.Linear):
    """Linear layer with fake-quantized INT8 weights."""

    def forward(self, x):
        wq = weight_fake_quant(self.weight)

        return F.linear(
            x,
            wq,
            self.bias,
        )


class QATConv1d(nn.Conv1d):
    """Conv1D layer with fake-quantized INT8 weights."""

    def forward(self, x):
        wq = weight_fake_quant(self.weight)

        return F.conv1d(
            x,
            wq,
            self.bias,
            stride=self.stride,
            padding=self.padding,
            dilation=self.dilation,
            groups=self.groups,
        )


class QATMLP(nn.Module):
    """40 -> 64 -> 32 -> 1 MLP."""

    def __init__(self):
        super().__init__()

        self.layers = nn.Sequential(
            QATLinear(40, 64),
            nn.ReLU(),
            QATLinear(64, 32),
            nn.ReLU(),
            QATLinear(32, 1),
        )

        self.quant_input = FakeQuantActivation()
        self.quant_hidden1 = FakeQuantActivation()
        self.quant_hidden2 = FakeQuantActivation()
        self.quant_output = FakeQuantActivation()

    def forward(self, x):
        x = self.quant_input(x)

        x = self.layers[0](x)
        x = self.layers[1](x)
        x = self.quant_hidden1(x)

        x = self.layers[2](x)
        x = self.layers[3](x)
        x = self.quant_hidden2(x)

        x = self.layers[4](x)
        x = self.quant_output(x)

        return x.squeeze(-1)


class QATCNN(nn.Module):
    """Original 4-channel, 10-step CNN architecture."""

    def __init__(self):
        super().__init__()

        self.conv = nn.Sequential(
            QATConv1d(4, 16, kernel_size=3, padding=1),
            nn.ReLU(),
            QATConv1d(16, 16, kernel_size=3, padding=1),
            nn.ReLU(),
        )

        self.head = nn.Sequential(
            nn.Flatten(),
            QATLinear(160, 32),
            nn.ReLU(),
            QATLinear(32, 1),
        )

        self.quant_input = FakeQuantActivation()
        self.quant_conv1 = FakeQuantActivation()
        self.quant_conv2 = FakeQuantActivation()
        self.quant_hidden = FakeQuantActivation()
        self.quant_output = FakeQuantActivation()

    def forward(self, x):
        x = x.reshape(-1, 10, 4).transpose(1, 2)
        x = self.quant_input(x)

        x = self.conv[0](x)
        x = self.conv[1](x)
        x = self.quant_conv1(x)

        x = self.conv[2](x)
        x = self.conv[3](x)
        x = self.quant_conv2(x)

        x = self.head[0](x)
        x = self.head[1](x)
        x = self.head[2](x)
        x = self.quant_hidden(x)

        x = self.head[3](x)
        x = self.quant_output(x)

        return x.squeeze(-1)
