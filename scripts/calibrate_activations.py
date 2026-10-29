#!/usr/bin/env python3
"""P3-M02.3: Training-only activation calibration for MLP and CNN."""

from pathlib import Path
import json

import numpy as np
import pandas as pd
import torch
from torch import nn

torch.set_num_threads(1)

ROOT = Path("artifacts/p3_m01/reference_models")
CAL = Path("results/p3_quantization/calibration")
OUT = CAL / "activation_statistics"

OUT.mkdir(parents=True, exist_ok=True)

FEATURES = [
    f"{name}_lag{lag}"
    for lag in range(10)
    for name in (
        "per_t",
        "dist_m",
        "v_src_mps",
        "v_dst_mps",
    )
]


class MLP(nn.Module):
    def __init__(self):
        super().__init__()
        self.layers = nn.Sequential(
            nn.Linear(40, 64),
            nn.ReLU(),
            nn.Linear(64, 32),
            nn.ReLU(),
            nn.Linear(32, 1),
        )

    def forward(self, x):
        return self.layers(x).squeeze(-1)


class CNN(nn.Module):
    def __init__(self):
        super().__init__()
        self.conv = nn.Sequential(
            nn.Conv1d(4, 16, 3, padding=1),
            nn.ReLU(),
            nn.Conv1d(16, 16, 3, padding=1),
            nn.ReLU(),
        )
        self.head = nn.Sequential(
            nn.Flatten(),
            nn.Linear(160, 32),
            nn.ReLU(),
            nn.Linear(32, 1),
        )

    def forward(self, x):
        x = x.reshape(-1, 10, 4).transpose(1, 2)
        return self.head(self.conv(x)).squeeze(-1)


records = []


def statistics(fold, model, layer, x):

    x = x.detach().cpu().numpy().astype(np.float64).ravel()

    if not np.isfinite(x).all():
        raise RuntimeError(
            f"Nonfinite activations: fold={fold}, "
            f"model={model}, layer={layer}"
        )

    records.append({
        "fold": fold,
        "model": model,
        "layer": layer,
        "count": len(x),
        "min": float(x.min()),
        "max": float(x.max()),
        "absmax": float(np.abs(x).max()),
        "mean": float(x.mean()),
        "std": float(x.std()),
        "abs_p99": float(np.percentile(np.abs(x), 99)),
        "abs_p999": float(np.percentile(np.abs(x), 99.9)),
    })


def calibrate(fold, model_name):

    checkpoint = torch.load(
        ROOT / model_name / f"{model_name}_fold{fold}.pt",
        map_location="cpu",
        weights_only=False,
    )

    model = MLP() if model_name == "mlp" else CNN()

    model.load_state_dict(checkpoint["state_dict"])
    model.eval()

    df = pd.read_parquet(
        CAL / f"fold{fold}_calibration.parquet",
        columns=FEATURES,
    )

    X = df[FEATURES].to_numpy(dtype=np.float64)

    mean = np.asarray(
        checkpoint["scaler_mean"],
        dtype=np.float64,
    )

    scale = np.asarray(
        checkpoint["scaler_scale"],
        dtype=np.float64,
    )

    if mean.shape != (40,) or scale.shape != (40,):
        raise RuntimeError("Unexpected scaler dimensions")

    if not np.all(scale > 0):
        raise RuntimeError("Invalid scaler scale")

    X = ((X - mean) / scale).astype(np.float32)

    x = torch.from_numpy(X)

    captured = {}

    hooks = []

    modules = (
        model.layers
        if model_name == "mlp"
        else None
    )

    if model_name == "mlp":

        selected = {
            "fc1_relu": model.layers[1],
            "fc2_relu": model.layers[3],
            "output_linear": model.layers[4],
        }

    else:

        selected = {
            "conv1_relu": model.conv[1],
            "conv2_relu": model.conv[3],
            "dense_relu": model.head[2],
            "output_linear": model.head[3],
        }

    for name, module in selected.items():

        def make_hook(layer_name):
            def hook(_module, _inputs, output):
                captured[layer_name] = output.detach()
            return hook

        hooks.append(
            module.register_forward_hook(
                make_hook(name)
            )
        )

    batch_size = 512

    for start in range(0, len(x), batch_size):

        batch = x[start:start + batch_size]

        with torch.no_grad():
            model(batch)

        if model_name == "cnn":
            input_tensor = (
                batch.reshape(-1, 10, 4)
                .transpose(1, 2)
            )
        else:
            input_tensor = batch

        statistics(
            fold,
            model_name,
            "standardized_input_batch",
            input_tensor,
        )

        for layer, values in captured.items():
            statistics(
                fold,
                model_name,
                layer + "_batch",
                values,
            )

        captured.clear()

    for hook in hooks:
        hook.remove()


for fold in range(1, 10):

    print(f"Calibrating fold {fold}/9")

    for model_name in ("mlp", "cnn"):
        calibrate(fold, model_name)


raw = pd.DataFrame(records)

raw.to_csv(
    OUT / "activation_statistics_batches.csv",
    index=False,
)

# Aggregate batch statistics conservatively.
# The maximum/minimum are exact across batches.
# Percentile aggregation is approximate and will be
# refined using pooled activation histograms later.

summary = (
    raw.groupby(["fold", "model", "layer"])
    .agg(
        count=("count", "sum"),
        min=("min", "min"),
        max=("max", "max"),
        absmax=("absmax", "max"),
        abs_p99_max_batch=("abs_p99", "max"),
        abs_p999_max_batch=("abs_p999", "max"),
    )
    .reset_index()
)

summary.to_csv(
    OUT / "activation_ranges_by_fold.csv",
    index=False,
)

print()
print("=" * 80)
print("ACTIVATION CALIBRATION SUMMARY")
print("=" * 80)

global_summary = (
    summary.groupby(["model", "layer"])
    .agg(
        global_absmax=("absmax", "max"),
        max_batch_abs_p999=("abs_p999_max_batch", "max"),
        folds=("fold", "nunique"),
    )
    .reset_index()
)

print(global_summary.to_string(index=False))

global_summary.to_csv(
    OUT / "activation_ranges_global.csv",
    index=False,
)

print()
print("Saved calibration results to:", OUT)
print("ACTIVATION CALIBRATION COMPLETE")
