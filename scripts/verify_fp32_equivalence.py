#!/usr/bin/env python3
"""P3-M02.1: independent inference equivalence tests."""

from pathlib import Path

import joblib
import numpy as np
import pandas as pd
import torch


ROOT = Path("artifacts/p3_m01")
MODELS = ROOT / "reference_models"
VECTORS = ROOT / "reference_vectors"

FEATURES = [
    f"{name}_lag{lag}"
    for lag in range(10)
    for name in ("per_t", "dist_m", "v_src_mps", "v_dst_mps")
]


def relu(x):
    return np.maximum(x, 0)


def linear(x, weight, bias):
    return x @ weight.T + bias


def load_checkpoint(model, fold):
    path = MODELS / model / f"{model}_fold{fold}.pt"
    return torch.load(path, map_location="cpu", weights_only=False)


def scale_neural(x, checkpoint):
    mean = np.asarray(checkpoint["scaler_mean"], dtype=np.float64)
    scale = np.asarray(checkpoint["scaler_scale"], dtype=np.float64)

    return ((x - mean) / scale).astype(np.float32)


def predict_mlp(x, checkpoint):
    state = checkpoint["state_dict"]

    x = scale_neural(x, checkpoint)

    for layer in (0, 2, 4):
        w = state[f"layers.{layer}.weight"].numpy()
        b = state[f"layers.{layer}.bias"].numpy()

        x = linear(x, w, b)

        if layer != 4:
            x = relu(x)

    return np.clip(x.reshape(-1), 0, 1)


def conv1d(x, weight, bias, padding=1):
    """Numpy implementation of stride-1, dilation-1 Conv1D."""

    n, channels, length = x.shape
    out_channels, in_channels, kernel = weight.shape

    assert channels == in_channels

    padded = np.pad(
        x,
        ((0, 0), (0, 0), (padding, padding)),
    )

    output = np.empty(
        (n, out_channels, length),
        dtype=np.float32,
    )

    for position in range(length):
        window = padded[:, :, position:position + kernel]

        output[:, :, position] = (
            np.einsum(
                "nck,ock->no",
                window,
                weight,
                optimize=False,
            )
            + bias
        )

    return output


def predict_cnn(x, checkpoint):
    state = checkpoint["state_dict"]

    x = scale_neural(x, checkpoint)
    x = x.reshape(-1, 10, 4).transpose(0, 2, 1)

    for layer in (0, 2):
        w = state[f"conv.{layer}.weight"].numpy()
        b = state[f"conv.{layer}.bias"].numpy()

        x = relu(conv1d(x, w, b))

    x = x.reshape(len(x), -1)

    for layer in (1, 3):
        w = state[f"head.{layer}.weight"].numpy()
        b = state[f"head.{layer}.bias"].numpy()

        x = linear(x, w, b)

        if layer == 1:
            x = relu(x)

    return np.clip(x.reshape(-1), 0, 1)


def predict_ridge(x, fold):
    pipeline = joblib.load(
        MODELS / "ridge" / f"ridge_fold{fold}.joblib"
    )

    scaler = pipeline.named_steps["standardscaler"]
    ridge = pipeline.named_steps["ridge"]

    scaled = (x - scaler.mean_) / scaler.scale_

    prediction = (
        scaled @ ridge.coef_
        + ridge.intercept_
    )

    return np.clip(prediction, 0, 1)


def predict_histgb(x, fold):
    model = joblib.load(
        MODELS / "histgb" / f"hist_gb_fold{fold}.joblib"
    )

    return np.clip(model.predict(x), 0, 1)


def main():
    print("=" * 80)
    print("P3-M02.1: FP32 NUMERICAL EQUIVALENCE")
    print("=" * 80)

    results = []

    for fold in range(1, 10):
        df = pd.read_parquet(VECTORS / f"fold{fold}.parquet")

        x = df[FEATURES].to_numpy(dtype=np.float64)

        predictions = {
            "ridge": predict_ridge(x, fold),
            "histgb": predict_histgb(x, fold),
            "mlp": predict_mlp(x, load_checkpoint("mlp", fold)),
            "cnn": predict_cnn(x, load_checkpoint("cnn", fold)),
        }

        for model, pred in predictions.items():
            reference = df[
                f"pred_{model}_fp32"
            ].to_numpy(dtype=np.float64)

            error = np.abs(
                pred.astype(np.float64) - reference
            )

            max_error = float(np.max(error))
            mean_error = float(np.mean(error))

            tolerance = 1e-5 if model in ("mlp", "cnn") else 1e-10

            passed = max_error <= tolerance

            results.append({
                "fold": fold,
                "model": model,
                "max_abs_error": max_error,
                "mean_abs_error": mean_error,
                "tolerance": tolerance,
                "passed": passed,
            })

            print(
                f"Fold {fold} {model:7s} "
                f"max={max_error:.3e} "
                f"mean={mean_error:.3e} "
                f"{'PASS' if passed else 'FAIL'}"
            )

    output = Path(
        "artifacts/p3_m02/numerical_equivalence"
    )

    output.mkdir(parents=True, exist_ok=True)

    results_df = pd.DataFrame(results)

    results_df.to_csv(
        output / "fp32_equivalence.csv",
        index=False,
    )

    print()
    print("========================================")
    print("SUMMARY")
    print("========================================")

    print(
        results_df.groupby("model")[
            ["max_abs_error", "mean_abs_error"]
        ].max()
    )

    print()
    print(
        "Passed:",
        int(results_df["passed"].sum()),
        "/",
        len(results_df),
    )

    if not results_df["passed"].all():
        raise SystemExit("FP32 equivalence verification FAILED")

    print("FP32 equivalence verification PASSED")


if __name__ == "__main__":
    main()
