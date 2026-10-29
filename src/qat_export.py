"""Export QAT models to the original integer inference checkpoint format."""

from pathlib import Path

import numpy as np
import torch


def export_qat_checkpoint(
    qat_model,
    original_checkpoint,
    destination,
    model_name,
    fold,
    calibration="max",
):
    destination = Path(destination)
    destination.parent.mkdir(
        parents=True,
        exist_ok=True,
    )

    original_state = original_checkpoint["state_dict"]

    qat_state = qat_model.state_dict()

    # Export original model parameters only.
    exported_state = {}

    for key, original_tensor in original_state.items():
        if key not in qat_state:
            raise KeyError(
                f"Missing QAT parameter: {key}"
            )

        updated = qat_state[key].detach().cpu().clone()

        if updated.shape != original_tensor.shape:
            raise ValueError(
                f"Shape mismatch: {key}"
            )

        if not torch.isfinite(updated).all():
            raise ValueError(
                f"Nonfinite QAT parameter: {key}"
            )

        exported_state[key] = updated

    checkpoint = {
        "state_dict": exported_state,
        "features": list(
            original_checkpoint["features"]
        ),
        "scaler_mean": np.asarray(
            original_checkpoint["scaler_mean"],
            dtype=np.float64,
        ).copy(),
        "scaler_scale": np.asarray(
            original_checkpoint["scaler_scale"],
            dtype=np.float64,
        ).copy(),
        "fold": int(fold),
        "model": model_name,
        "quantization": {
            "bits": 8,
            "method": "qat",
            "weight_scheme": "symmetric_per_channel",
            "activation_scheme": "symmetric_per_tensor",
            "calibration": calibration,
        },
    }

    torch.save(
        checkpoint,
        destination,
    )

    return destination
