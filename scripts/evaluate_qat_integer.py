"""P3-M03-04: Evaluate QAT checkpoints with validated integer inference."""

import argparse
import json
from pathlib import Path

import numpy as np
import pandas as pd
import torch

from scripts.run_integer_ptq import (
    MLP,
    CNN,
    infer,
    scales,
    CAL,
    ROOT,
    OUT as PTQ_ROOT,
    FEATURES,
)


def metrics(y, prediction):
    error = prediction - y

    return {
        "mae": float(np.mean(np.abs(error))),
        "rmse": float(np.sqrt(np.mean(error ** 2))),
        "bias": float(np.mean(error)),
    }


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--model",
        choices=["mlp", "cnn"],
        default="mlp",
    )

    parser.add_argument(
        "--fold",
        type=int,
        choices=range(1, 10),
        default=1,
    )

    parser.add_argument(
        "--calibration",
        choices=["max", "p999"],
        default="max",
    )

    args = parser.parse_args()

    name = args.model
    fold = args.fold
    method = args.calibration

    original_path = (
        ROOT / "reference_models" /
        name / f"{name}_fold{fold}.pt"
    )

    qat_path = (
        Path("results/p3_qat/training") /
        name /
        f"fold{fold}" /
        f"{name}_fold{fold}_qat_int8.pt"
    )

    original = torch.load(
        original_path,
        map_location="cpu",
        weights_only=False,
    )

    qat_checkpoint = torch.load(
        qat_path,
        map_location="cpu",
        weights_only=False,
    )

    assert list(original["features"]) == FEATURES
    assert list(qat_checkpoint["features"]) == FEATURES

    np.testing.assert_array_equal(
        qat_checkpoint["scaler_mean"],
        original["scaler_mean"],
    )

    np.testing.assert_array_equal(
        qat_checkpoint["scaler_scale"],
        original["scaler_scale"],
    )

    assert qat_checkpoint["quantization"]["bits"] == 8
    assert qat_checkpoint["quantization"]["calibration"] == method

    model = MLP() if name == "mlp" else CNN()

    model.load_state_dict(
        qat_checkpoint["state_dict"],
        strict=True,
    )

    model.eval()

    reference = pd.read_parquet(
        ROOT / "reference_vectors" /
        f"fold{fold}.parquet"
    )

    raw = reference[FEATURES].to_numpy(
        dtype=np.float64
    )

    target = reference["target_per"].to_numpy(
        dtype=np.float64
    )

    fp32 = reference[
        f"pred_{name}_fp32"
    ].to_numpy(dtype=np.float64)

    previous_path = (
        PTQ_ROOT /
        "int8" /
        method /
        name /
        f"fold{fold}_predictions.parquet"
    )

    previous = pd.read_parquet(previous_path)

    assert len(previous) == len(reference)

    np.testing.assert_array_equal(
        previous["target_per"].to_numpy(),
        target,
    )

    for key in ("scenario", "source_row"):
        np.testing.assert_array_equal(
            previous[key].to_numpy(),
            reference[key].to_numpy(),
        )

    ptq = previous[
        "pred_integer_ptq"
    ].to_numpy(dtype=np.float64)

    calibration = pd.read_csv(CAL)

    activation_scales = scales(
        calibration,
        fold,
        name,
        8,
        method,
    )

    mean = np.asarray(
        qat_checkpoint["scaler_mean"],
        dtype=np.float64,
    )

    std = np.asarray(
        qat_checkpoint["scaler_scale"],
        dtype=np.float64,
    )

    qat = infer(
        model,
        name,
        raw,
        mean,
        std,
        activation_scales,
        8,
        batch_size=128,
    )

    assert len(qat) == len(target)
    assert np.isfinite(qat).all()

    results = {
        "fp32": metrics(target, fp32),
        "integer_ptq": metrics(target, ptq),
        "integer_qat": metrics(target, qat),
    }

    results["comparison"] = {
        "delta_rmse_qat_minus_ptq": (
            results["integer_qat"]["rmse"]
            - results["integer_ptq"]["rmse"]
        ),
        "delta_rmse_qat_minus_fp32": (
            results["integer_qat"]["rmse"]
            - results["fp32"]["rmse"]
        ),
        "mean_abs_qat_ptq_prediction_difference": float(
            np.mean(np.abs(qat - ptq))
        ),
    }

    high = target >= 0.9

    results["high_per"] = {
        "count": int(high.sum()),
    }

    if high.any():
        for label, prediction in (
            ("fp32", fp32),
            ("integer_ptq", ptq),
            ("integer_qat", qat),
        ):
            results["high_per"][label] = {
                "mae": float(
                    np.mean(
                        np.abs(prediction[high] - target[high])
                    )
                ),
                "bias": float(
                    np.mean(
                        prediction[high] - target[high]
                    )
                ),
            }

    output_dir = (
        Path("results/p3_qat/evaluation") /
        "int8" /
        method /
        name
    )

    output_dir.mkdir(
        parents=True,
        exist_ok=True,
    )

    predictions_path = (
        output_dir /
        f"fold{fold}_predictions.parquet"
    )

    pd.DataFrame({
        "fold": fold,
        "scenario": reference["scenario"],
        "source_row": reference["source_row"],
        "target_per": target,
        "pred_fp32": fp32,
        "pred_integer_ptq": ptq,
        "pred_integer_qat": qat,
    }).to_parquet(
        predictions_path,
        index=False,
    )

    metrics_path = (
        output_dir /
        f"fold{fold}_metrics.json"
    )

    metrics_path.write_text(
        json.dumps(results, indent=2)
    )

    print()
    print("=" * 65)
    print("P3-M03-04 INTEGER QAT EVALUATION")
    print("=" * 65)

    print(f"Model: {name.upper()}")
    print(f"Fold: {fold}")
    print(f"Calibration: {method}")
    print(f"Samples: {len(target)}")

    print()
    print(
        f"{'Method':<20}"
        f"{'MAE':>12}"
        f"{'RMSE':>12}"
        f"{'Bias':>12}"
    )

    for label in ("fp32", "integer_ptq", "integer_qat"):
        row = results[label]

        print(
            f"{label:<20}"
            f"{row['mae']:>12.8f}"
            f"{row['rmse']:>12.8f}"
            f"{row['bias']:>12.8f}"
        )

    print()
    print(
        "Delta RMSE (QAT - PTQ):",
        results["comparison"]["delta_rmse_qat_minus_ptq"],
    )

    print(
        "Delta RMSE (QAT - FP32):",
        results["comparison"]["delta_rmse_qat_minus_fp32"],
    )

    print()
    print("Predictions:", predictions_path)
    print("Metrics:", metrics_path)
    print("P3-M03-04 EVALUATION COMPLETE")


if __name__ == "__main__":
    main()
