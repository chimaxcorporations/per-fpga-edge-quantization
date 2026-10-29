"""P3-M03-02E: Verify QAT checkpoint export compatibility."""

import tempfile
from pathlib import Path

import numpy as np
import torch

from src.qat_int8 import QATMLP, QATCNN
from src.qat_export import export_qat_checkpoint
from scripts.run_integer_ptq import MLP, CNN


ROOT = Path(
    "artifacts/p3_m01/reference_models"
)


def verify(name, fold=1):
    source = (
        ROOT /
        name /
        f"{name}_fold{fold}.pt"
    )

    original = torch.load(
        source,
        map_location="cpu",
        weights_only=False,
    )

    qat = QATMLP() if name == "mlp" else QATCNN()

    result = qat.load_state_dict(
        original["state_dict"],
        strict=False,
    )

    assert not result.unexpected_keys

    with tempfile.TemporaryDirectory() as temp:
        destination = (
            Path(temp) /
            f"{name}_fold{fold}_qat.pt"
        )

        export_qat_checkpoint(
            qat_model=qat,
            original_checkpoint=original,
            destination=destination,
            model_name=name,
            fold=fold,
        )

        recovered = torch.load(
            destination,
            map_location="cpu",
            weights_only=False,
        )

        reference = MLP() if name == "mlp" else CNN()

        reference.load_state_dict(
            recovered["state_dict"],
            strict=True,
        )

        reference.eval()

        assert recovered["features"] == original["features"]

        np.testing.assert_array_equal(
            recovered["scaler_mean"],
            original["scaler_mean"],
        )

        np.testing.assert_array_equal(
            recovered["scaler_scale"],
            original["scaler_scale"],
        )

        for key, tensor in original["state_dict"].items():
            assert torch.equal(
                recovered["state_dict"][key],
                tensor,
            )

        print(
            f"{name.upper()} fold={fold}: "
            "QAT export PASS"
        )


def main():
    for name in ("mlp", "cnn"):
        for fold in range(1, 10):
            verify(name, fold)

    print()
    print("P3-M03-02E CHECKPOINT EXPORT: PASS")


if __name__ == "__main__":
    main()
