"""P3-M03-05A: Post-training fake-QAT versus integer-QAT verification.

Supports:
    - MLP and CNN
    - Folds 1 through 9
    - INT8 Max calibration

Uses frozen held-out reference vectors for numerical diagnostics.
Does not modify model parameters or calibration scales.
"""

import argparse
import json
from pathlib import Path

import numpy as np
import pandas as pd
import torch

from src.qat_int8 import QATMLP, QATCNN

from scripts.verify_qat_calibration import (
    configure_qat,
    SCALE_MAPPING,
)

from scripts.run_integer_ptq import (
    infer,
    scales,
    CAL,
    ROOT,
    FEATURES,
    MLP,
    CNN,
)


def load_checkpoint(name, fold):
    """Load the exported INT8 QAT checkpoint."""

    checkpoint_path = (
        Path("results/p3_qat/training")
        / name
        / f"fold{fold}"
        / f"{name}_fold{fold}_qat_int8.pt"
    )

    if not checkpoint_path.exists():
        raise FileNotFoundError(
            f"QAT checkpoint not found: {checkpoint_path}"
        )

    checkpoint = torch.load(
        checkpoint_path,
        map_location="cpu",
        weights_only=False,
    )

    return checkpoint, checkpoint_path


def create_models(name, checkpoint, activation_scales):
    """Create fake-QAT and integer-inference models."""

    qat = QATMLP() if name == "mlp" else QATCNN()

    result = qat.load_state_dict(
        checkpoint["state_dict"],
        strict=False,
    )

    expected_missing = {
        f"{key}.scale"
        for key in SCALE_MAPPING[name]
    }

    if set(result.missing_keys) != expected_missing:
        raise RuntimeError(
            "Unexpected missing QAT state keys: "
            f"{result.missing_keys}"
        )

    if result.unexpected_keys:
        raise RuntimeError(
            "Unexpected QAT state keys: "
            f"{result.unexpected_keys}"
        )

    configure_qat(
        qat,
        name,
        activation_scales,
    )

    qat.eval()

    integer_model = MLP() if name == "mlp" else CNN()

    integer_model.load_state_dict(
        checkpoint["state_dict"],
        strict=True,
    )

    integer_model.eval()

    return qat, integer_model


def calculate_metrics(fake, integer, output_scale):
    """Calculate prediction differences in PER units and LSBs."""

    difference = fake - integer
    absolute_difference = np.abs(difference)

    return {
        "samples": int(len(fake)),
        "mean_abs_difference": float(
            np.mean(absolute_difference)
        ),
        "max_abs_difference": float(
            np.max(absolute_difference)
        ),
        "rmse_difference": float(
            np.sqrt(np.mean(difference ** 2))
        ),
        "mean_difference_lsb": float(
            np.mean(absolute_difference) / output_scale
        ),
        "max_difference_lsb": float(
            np.max(absolute_difference) / output_scale
        ),
        "output_scale": float(output_scale),
    }


def verify(name, fold, method="max"):
    print("=" * 65)
    print("P3-M03 POST-TRAINING QAT NUMERICAL VERIFICATION")
    print("=" * 65)

    print(f"Model: {name.upper()}")
    print(f"Fold: {fold}")
    print(f"Precision: INT8")
    print(f"Calibration: {method}")

    checkpoint, checkpoint_path = load_checkpoint(
        name,
        fold,
    )

    # Verify checkpoint metadata.
    if list(checkpoint["features"]) != FEATURES:
        raise RuntimeError(
            "Checkpoint feature ordering mismatch"
        )

    if int(checkpoint["fold"]) != fold:
        raise RuntimeError(
            "Checkpoint fold mismatch"
        )

    if checkpoint["model"] != name:
        raise RuntimeError(
            "Checkpoint model mismatch"
        )

    quantization = checkpoint.get("quantization", {})

    if quantization.get("bits") != 8:
        raise RuntimeError(
            "Checkpoint is not INT8"
        )

    if quantization.get("calibration") != method:
        raise RuntimeError(
            "Calibration method mismatch"
        )

    # Load frozen training-only activation calibration.
    calibration = pd.read_csv(CAL)

    activation_scales = scales(
        calibration,
        fold,
        name,
        8,
        method,
    )

    qat, integer_model = create_models(
        name,
        checkpoint,
        activation_scales,
    )

    # Load the original held-out reference vectors.
    reference_path = (
        ROOT
        / "reference_vectors"
        / f"fold{fold}.parquet"
    )

    if not reference_path.exists():
        raise FileNotFoundError(
            f"Reference vectors not found: {reference_path}"
        )

    reference = pd.read_parquet(reference_path)

    raw = reference[FEATURES].to_numpy(
        dtype=np.float64
    )

    if len(raw) == 0:
        raise RuntimeError(
            "Reference dataset is empty"
        )

    mean = np.asarray(
        checkpoint["scaler_mean"],
        dtype=np.float64,
    )

    std = np.asarray(
        checkpoint["scaler_scale"],
        dtype=np.float64,
    )

    if (
        not np.isfinite(raw).all()
        or not np.isfinite(mean).all()
        or not np.isfinite(std).all()
        or np.any(std <= 0)
    ):
        raise RuntimeError(
            "Invalid input data or normalization statistics"
        )

    # Match integer inference preprocessing.
    standardized = (
        (raw - mean) / std
    ).astype(np.float32)

    # Fake-quantized inference.
    with torch.no_grad():
        fake = qat(
            torch.from_numpy(standardized)
        ).cpu().numpy().astype(np.float64)

    fake = np.clip(
        fake,
        0.0,
        1.0,
    )

    # Actual integer inference.
    integer = infer(
        integer_model,
        name,
        raw,
        mean,
        std,
        activation_scales,
        8,
        batch_size=128,
    )

    if len(fake) != len(integer):
        raise RuntimeError(
            "Prediction count mismatch"
        )

    if (
        not np.isfinite(fake).all()
        or not np.isfinite(integer).all()
    ):
        raise RuntimeError(
            "Nonfinite predictions"
        )

    output_scale = activation_scales[
        "output_linear"
    ]

    metrics = calculate_metrics(
        fake,
        integer,
        output_scale,
    )

    metrics.update({
        "model": name,
        "fold": fold,
        "bits": 8,
        "calibration": method,
        "checkpoint": str(checkpoint_path),
    })

    # Save results.
    output_dir = (
        Path("results/p3_qat/verification")
        / "post_training"
        / name
    )

    output_dir.mkdir(
        parents=True,
        exist_ok=True,
    )

    prefix = f"fold{fold}_int8_{method}"

    predictions_path = (
        output_dir
        / f"{prefix}_predictions.parquet"
    )

    metrics_path = (
        output_dir
        / f"{prefix}_metrics.json"
    )

    summary_path = (
        output_dir
        / f"{prefix}_summary.csv"
    )

    prediction_data = {
        "fold": np.full(len(fake), fold),
        "pred_fake_qat": fake,
        "pred_integer_qat": integer,
        "abs_difference": np.abs(fake - integer),
        "difference_lsb": (
            np.abs(fake - integer) / output_scale
        ),
    }

    for column in ("scenario", "source_row"):
        if column in reference.columns:
            prediction_data[column] = (
                reference[column].to_numpy()
            )

    pd.DataFrame(
        prediction_data
    ).to_parquet(
        predictions_path,
        index=False,
    )

    metrics_path.write_text(
        json.dumps(
            metrics,
            indent=2,
        )
    )

    pd.DataFrame(
        [metrics]
    ).to_csv(
        summary_path,
        index=False,
    )

    print()
    print("-" * 65)
    print("NUMERICAL COMPARISON")
    print("-" * 65)

    print(
        f"Samples:                 {metrics['samples']}"
    )

    print(
        "Mean absolute difference: "
        f"{metrics['mean_abs_difference']:.12f}"
    )

    print(
        "Maximum absolute difference: "
        f"{metrics['max_abs_difference']:.12f}"
    )

    print(
        "RMSE difference:          "
        f"{metrics['rmse_difference']:.12f}"
    )

    print(
        "Mean difference (LSB):   "
        f"{metrics['mean_difference_lsb']:.8f}"
    )

    print(
        "Maximum difference (LSB): "
        f"{metrics['max_difference_lsb']:.8f}"
    )

    print(
        "Output quantization scale: "
        f"{metrics['output_scale']:.12f}"
    )

    print()
    print("Predictions:", predictions_path)
    print("Metrics:", metrics_path)
    print("Summary:", summary_path)

    print()
    print("P3-M03 POST-TRAINING NUMERICAL DIAGNOSTIC: COMPLETE")


def main():
    parser = argparse.ArgumentParser(
        description=(
            "Verify numerical agreement between "
            "fake-QAT and integer-QAT inference."
        )
    )

    parser.add_argument(
        "--model",
        choices=["mlp", "cnn"],
        required=True,
        help="Model architecture",
    )

    parser.add_argument(
        "--fold",
        type=int,
        choices=range(1, 10),
        default=1,
        help="Cross-validation fold",
    )

    parser.add_argument(
        "--calibration",
        choices=["max", "p999"],
        default="max",
        help="Activation calibration method",
    )

    args = parser.parse_args()

    verify(
        name=args.model,
        fold=args.fold,
        method=args.calibration,
    )


if __name__ == "__main__":
    main()
