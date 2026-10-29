#!/usr/bin/env python3
"""Exact pooled activation percentiles for MLP and CNN calibration."""

from pathlib import Path

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
    for name in ("per_t", "dist_m", "v_src_mps", "v_dst_mps")
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


def summarize(fold, model, layer, arrays):
    x = np.concatenate(arrays).astype(np.float64, copy=False)
    if not np.isfinite(x).all():
        raise RuntimeError(f"Nonfinite values: {fold}/{model}/{layer}")

    a = np.abs(x)

    records.append({
        "fold": fold,
        "model": model,
        "layer": layer,
        "count": len(x),
        "min": float(x.min()),
        "max": float(x.max()),
        "absmax": float(a.max()),
        "abs_p99": float(np.percentile(a, 99)),
        "abs_p999": float(np.percentile(a, 99.9)),
        "abs_p9999": float(np.percentile(a, 99.99)),
    })


for fold in range(1, 10):
    print(f"Processing fold {fold}/9", flush=True)

    df = pd.read_parquet(
        CAL / f"fold{fold}_calibration.parquet",
        columns=FEATURES,
    )

    raw = df[FEATURES].to_numpy(dtype=np.float64)

    for model_name in ("mlp", "cnn"):
        checkpoint = torch.load(
            ROOT / model_name / f"{model_name}_fold{fold}.pt",
            map_location="cpu",
            weights_only=False,
        )

        model = MLP() if model_name == "mlp" else CNN()
        model.load_state_dict(checkpoint["state_dict"])
        model.eval()

        mean = np.asarray(checkpoint["scaler_mean"], dtype=np.float64)
        scale = np.asarray(checkpoint["scaler_scale"], dtype=np.float64)

        if mean.shape != (40,) or scale.shape != (40,):
            raise RuntimeError("Unexpected scaler dimensions")

        if not np.isfinite(scale).all() or np.any(scale <= 0):
            raise RuntimeError("Invalid scaler scale")

        X = ((raw - mean) / scale).astype(np.float32)

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

        collected = {
            "standardized_input": []
        }
        collected.update({name: [] for name in selected})

        hooks = []

        for name, module in selected.items():
            def make_hook(layer_name):
                def hook(_module, _inputs, output):
                    collected[layer_name].append(
                        output.detach().cpu().numpy().ravel().copy()
                    )
                return hook

            hooks.append(module.register_forward_hook(make_hook(name)))

        with torch.no_grad():
            for start in range(0, len(X), 512):
                batch = torch.from_numpy(X[start:start + 512])

                collected["standardized_input"].append(
                    batch.numpy().ravel().copy()
                )

                model(batch)

        for hook in hooks:
            hook.remove()

        for layer, arrays in collected.items():
            summarize(fold, model_name, layer, arrays)

        del model, collected


results = pd.DataFrame(records)

results.to_csv(
    OUT / "activation_percentiles_exact_by_fold.csv",
    index=False,
)

print()
print("=" * 90)
print("EXACT POOLED ACTIVATION PERCENTILES")
print("=" * 90)

summary = (
    results.groupby(["model", "layer"])
    .agg(
        global_absmax=("absmax", "max"),
        max_fold_abs_p99=("abs_p99", "max"),
        max_fold_abs_p999=("abs_p999", "max"),
        max_fold_abs_p9999=("abs_p9999", "max"),
        folds=("fold", "nunique"),
    )
    .reset_index()
)

summary.to_csv(
    OUT / "activation_percentiles_exact_summary.csv",
    index=False,
)

print(summary.to_string(index=False))

print()
print("EXACT ACTIVATION PERCENTILE CALIBRATION COMPLETE")
