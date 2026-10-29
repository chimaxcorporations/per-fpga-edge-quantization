#!/usr/bin/env python3
"""P3-M02.4: Fake-quantized PTQ evaluation for MLP and CNN."""

from pathlib import Path
import json

import numpy as np
import pandas as pd
import torch
import torch.nn.functional as F
from torch import nn

from src.quantization import quantize, dequantize

torch.set_num_threads(1)

ROOT = Path("artifacts/p3_m01")
CAL = Path("results/p3_quantization/calibration/activation_statistics")
OUT = Path("results/p3_quantization/ptq")

OUT.mkdir(parents=True, exist_ok=True)

FEATURES = [
    f"{name}_lag{lag}"
    for lag in range(10)
    for name in ("per_t", "dist_m", "v_src_mps", "v_dst_mps")
]


class MLP(nn.Module):
    def __init__(self):
        super().__init__()
        self.layers = nn.Sequential(
            nn.Linear(40, 64), nn.ReLU(),
            nn.Linear(64, 32), nn.ReLU(),
            nn.Linear(32, 1),
        )

    def forward(self, x):
        return self.layers(x).squeeze(-1)


class CNN(nn.Module):
    def __init__(self):
        super().__init__()
        self.conv = nn.Sequential(
            nn.Conv1d(4, 16, 3, padding=1), nn.ReLU(),
            nn.Conv1d(16, 16, 3, padding=1), nn.ReLU(),
        )
        self.head = nn.Sequential(
            nn.Flatten(), nn.Linear(160, 32), nn.ReLU(),
            nn.Linear(32, 1),
        )

    def forward(self, x):
        return self.head(
            self.conv(x.reshape(-1, 10, 4).transpose(1, 2))
        ).squeeze(-1)


def activation_scale(cal, fold, model, layer, bits, method):
    row = cal.loc[
        (cal["fold"] == fold)
        & (cal["model"] == model)
        & (cal["layer"] == layer)
    ]

    if len(row) != 1:
        raise RuntimeError(f"Missing calibration: {fold}/{model}/{layer}")

    column = "absmax" if method == "max" else "abs_p999"
    alpha = float(row.iloc[0][column])

    return max(alpha / (2 ** (bits - 1) - 1), 1e-12)


def fq_activation(x, scale, bits):
    q = quantize(x.detach().numpy(), scale, bits)
    return torch.from_numpy(
        dequantize(q, scale).astype(np.float32)
    )


def quantized_weights(layer, bits):
    w = layer.weight.detach().numpy()

    # Independent scale for each output channel.
    axes = tuple(range(1, w.ndim))
    alpha = np.max(np.abs(w), axis=axes, keepdims=True)

    qmax = 2 ** (bits - 1) - 1
    scales = np.maximum(alpha / qmax, 1e-12)

    q = np.clip(
        np.rint(w / scales),
        -qmax,
        qmax,
    )

    w_hat = (q * scales).astype(np.float32)

    # Bias remains FP32 in this fake-quantization experiment.
    b = layer.bias.detach().clone()

    return torch.from_numpy(w_hat), b


def evaluate(model_name, model, x, cal, fold, bits, method):

    def aq(value, layer):
        scale = activation_scale(
            cal, fold, model_name, layer, bits, method
        )
        return fq_activation(value, scale, bits)

    x = aq(x, "standardized_input")

    if model_name == "mlp":

        for index, name in (
            (0, "fc1_relu"),
            (2, "fc2_relu"),
        ):
            layer = model.layers[index]
            w, b = quantized_weights(layer, bits)
            x = F.relu(F.linear(x, w, b))
            x = aq(x, name)

        layer = model.layers[4]
        w, b = quantized_weights(layer, bits)

        return F.linear(x, w, b).squeeze(-1).numpy()

    x = x.reshape(-1, 10, 4).transpose(1, 2)

    for index, name in (
        (0, "conv1_relu"),
        (2, "conv2_relu"),
    ):
        layer = model.conv[index]
        w, b = quantized_weights(layer, bits)
        x = F.relu(
            F.conv1d(x, w, b, padding=1)
        )
        x = aq(x, name)

    x = x.flatten(1)

    layer = model.head[1]
    w, b = quantized_weights(layer, bits)

    x = F.relu(F.linear(x, w, b))
    x = aq(x, "dense_relu")

    layer = model.head[3]
    w, b = quantized_weights(layer, bits)

    return F.linear(x, w, b).squeeze(-1).numpy()


cal = pd.read_csv(
    CAL / "activation_percentiles_exact_by_fold.csv"
)

metrics = []

for model_name in ("mlp", "cnn"):
    for fold in range(1, 10):

        checkpoint = torch.load(
            ROOT / "reference_models" / model_name
            / f"{model_name}_fold{fold}.pt",
            map_location="cpu",
            weights_only=False,
        )

        model = MLP() if model_name == "mlp" else CNN()
        model.load_state_dict(checkpoint["state_dict"])
        model.eval()

        df = pd.read_parquet(
            ROOT / "reference_vectors"
            / f"fold{fold}.parquet"
        )

        raw = df[FEATURES].to_numpy(dtype=np.float64)

        mean = np.asarray(checkpoint["scaler_mean"], dtype=np.float64)
        scale = np.asarray(checkpoint["scaler_scale"], dtype=np.float64)

        x = torch.from_numpy(
            ((raw - mean) / scale).astype(np.float32)
        )

        y = df["target_per"].to_numpy(dtype=np.float64)

        baseline = df[
            f"pred_{model_name}_fp32"
        ].to_numpy(dtype=np.float64)

        for bits in (8, 16):
            for method in ("max", "p999"):

                with torch.no_grad():
                    pred = evaluate(
                        model_name, model, x,
                        cal, fold, bits, method
                    )

                pred = np.clip(pred, 0, 1)

                if not np.isfinite(pred).all():
                    raise RuntimeError("Nonfinite predictions")

                error = pred - y

                rmse = float(np.sqrt(np.mean(error ** 2)))
                mae = float(np.mean(np.abs(error)))

                baseline_rmse = float(
                    np.sqrt(np.mean((baseline - y) ** 2))
                )

                metrics.append({
                    "model": model_name,
                    "fold": fold,
                    "method": method,
                    "bits": bits,
                    "samples": len(y),
                    "rmse": rmse,
                    "mae": mae,
                    "baseline_rmse": baseline_rmse,
                    "delta_rmse": rmse - baseline_rmse,
                    "max_prediction_difference": float(
                        np.max(np.abs(pred - baseline))
                    ),
                })

                destination = (
                    OUT / f"int{bits}" / method / model_name
                )
                destination.mkdir(
                    parents=True, exist_ok=True
                )

                pd.DataFrame({
                    "fold": fold,
                    "scenario": df["scenario"],
                    "source_row": df["source_row"],
                    "target_per": y,
                    "pred_fp32": baseline,
                    "pred_ptq": pred,
                }).to_parquet(
                    destination / f"fold{fold}_predictions.parquet",
                    index=False,
                )

                print(
                    f"{model_name.upper()} "
                    f"fold={fold} INT{bits} {method}: "
                    f"RMSE={rmse:.6f}, "
                    f"Delta={rmse-baseline_rmse:+.6f}",
                    flush=True,
                )


result = pd.DataFrame(metrics)

result.to_csv(
    OUT / "ptq_metrics_all_folds.csv",
    index=False,
)

summary = (
    result.groupby(["model", "method", "bits"])
    .agg(
        mean_rmse=("rmse", "mean"),
        mean_mae=("mae", "mean"),
        mean_delta_rmse=("delta_rmse", "mean"),
        max_prediction_difference=(
            "max_prediction_difference", "max"
        ),
    )
    .reset_index()
)

summary.to_csv(
    OUT / "ptq_metrics_summary.csv",
    index=False,
)

print()
print("=" * 85)
print("PTQ SUMMARY")
print("=" * 85)
print(summary.to_string(index=False))
print()
print("PTQ FAKE-QUANTIZED INFERENCE COMPLETE")
