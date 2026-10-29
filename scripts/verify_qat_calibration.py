"""P3-M03-02C: FP32 checkpoint and INT8 calibration compatibility."""

from pathlib import Path

import numpy as np
import pandas as pd
import torch

from src.qat_int8 import QATMLP, QATCNN
from scripts.run_integer_ptq import scales


ROOT = Path("artifacts/p3_m01")

CAL = Path(
    "results/p3_quantization/calibration/"
    "activation_statistics/activation_percentiles_exact_by_fold.csv"
)

SCALE_MAPPING = {
    "mlp": {
        "quant_input": "standardized_input",
        "quant_hidden1": "fc1_relu",
        "quant_hidden2": "fc2_relu",
        "quant_output": "output_linear",
    },
    "cnn": {
        "quant_input": "standardized_input",
        "quant_conv1": "conv1_relu",
        "quant_conv2": "conv2_relu",
        "quant_hidden": "dense_relu",
        "quant_output": "output_linear",
    },
}


def configure_qat(model, name, activation_scales):
    """Install frozen training-only activation scales."""

    for module_name, layer_name in SCALE_MAPPING[name].items():
        module = getattr(model, module_name)
        module.set_scale(activation_scales[layer_name])


def verify_model(name, fold, calibration):
    path = (
        ROOT / "reference_models" /
        name / f"{name}_fold{fold}.pt"
    )

    checkpoint = torch.load(
        path,
        map_location="cpu",
        weights_only=False,
    )

    model = QATMLP() if name == "mlp" else QATCNN()

    # Quantizer buffers are new; original trainable weights
    # must otherwise map exactly to the QAT architecture.
    result = model.load_state_dict(
        checkpoint["state_dict"],
        strict=False,
    )

    assert not result.unexpected_keys

    expected_missing = {
        f"{key}.scale"
        for key in SCALE_MAPPING[name]
    }

    assert set(result.missing_keys) == expected_missing, (
        f"Unexpected missing keys: {result.missing_keys}"
    )

    # Verify all original trainable parameters.
    for key, value in checkpoint["state_dict"].items():
        recovered = model.state_dict()[key]

        assert torch.equal(
            recovered,
            value,
        ), f"Weight mismatch: {name} fold {fold}, {key}"

    activation_scales = scales(
        calibration,
        fold,
        name,
        8,
        "max",
    )

    assert set(activation_scales) == set(
        SCALE_MAPPING[name].values()
    )

    configure_qat(
        model,
        name,
        activation_scales,
    )

    for module_name, layer_name in SCALE_MAPPING[name].items():
        actual = float(
            getattr(model, module_name).scale.item()
        )

        expected = float(
            np.float32(activation_scales[layer_name])
        )

        assert actual == expected

    # Verify the calibrated QAT forward pass is executable.
    # This is not an integer-equivalence test.
    model.eval()

    with torch.no_grad():
        x = torch.zeros(4, 40)
        output = model(x)

    assert output.shape == (4,)
    assert torch.isfinite(output).all()

    print(
        f"{name.upper()} fold={fold}: "
        "checkpoint PASS, calibration PASS, forward PASS",
        flush=True,
    )


def main():
    calibration = pd.read_csv(CAL)

    for name in ("mlp", "cnn"):
        for fold in range(1, 10):
            verify_model(
                name,
                fold,
                calibration,
            )

    print()
    print("P3-M03-02C CALIBRATION VERIFICATION: PASS")


if __name__ == "__main__":
    main()
