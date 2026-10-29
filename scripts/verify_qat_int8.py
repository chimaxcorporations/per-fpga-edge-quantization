"""P3-M03-02A/B: INT8 QAT smoke tests."""

import torch
import torch.nn.functional as F

from src.qat_int8 import (
    QATMLP,
    QATCNN,
    fake_quantize,
    weight_fake_quant,
)


def test_fake_quantization():
    x = torch.tensor(
        [-200.0, -1.5, -0.5, 0.5, 1.5, 200.0],
        requires_grad=True,
    )

    y = fake_quantize(x, 1.0)

    expected = torch.tensor(
        [-127.0, -2.0, 0.0, 0.0, 2.0, 127.0]
    )

    assert torch.equal(y, expected)

    y.sum().backward()

    assert x.grad is not None
    assert torch.isfinite(x.grad).all()

    print("V1 fake quantization: PASS")


def test_weight_quantization():
    w = torch.randn(16, 4, 3, requires_grad=True)

    wq = weight_fake_quant(w)

    assert wq.shape == w.shape
    assert torch.isfinite(wq).all()

    wq.sum().backward()

    assert w.grad is not None
    assert torch.isfinite(w.grad).all()

    print("V2 per-channel weight quantization: PASS")


def test_model(name, cls):
    torch.manual_seed(42)

    model = cls()

    x = torch.randn(32, 40)
    target = torch.rand(32)

    # Smoke-test scales only; replace with calibrated
    # layer-specific scales before meaningful QAT training.
    for module in model.modules():
        if hasattr(module, "set_scale"):
            module.set_scale(0.05)

    model.train()

    pred = model(x)

    assert pred.shape == (32,)
    assert torch.isfinite(pred).all()

    loss = F.mse_loss(pred, target)

    loss.backward()

    gradients = [
        p.grad
        for p in model.parameters()
        if p.requires_grad
    ]

    assert gradients
    assert all(g is not None for g in gradients)
    assert all(torch.isfinite(g).all() for g in gradients)

    optimizer = torch.optim.Adam(
        model.parameters(),
        lr=1e-4,
    )

    optimizer.step()

    print(
        f"V3 {name}: forward/backward/optimizer PASS; "
        f"loss={loss.item():.8f}"
    )


def main():
    test_fake_quantization()
    test_weight_quantization()

    test_model("MLP", QATMLP)
    test_model("CNN", QATCNN)

    print("\nP3-M03-02A/B SMOKE TESTS: PASS")


if __name__ == "__main__":
    main()
