#!/usr/bin/env python3
"""P3-M02.2: Model parameter analysis across all nine folds."""

from pathlib import Path

import joblib
import numpy as np
import pandas as pd
import torch

ROOT = Path("artifacts/p3_m01/reference_models")

OUTPUT = Path("results/p3_quantization/parameter_analysis")
OUTPUT.mkdir(parents=True, exist_ok=True)

records = []


def record(fold, model, parameter, values):

    x = np.asarray(values, dtype=np.float64).ravel()
    x = x[np.isfinite(x)]

    if len(x) == 0:
        return

    records.append({
        "fold": fold,
        "model": model,
        "parameter": parameter,
        "count": len(x),
        "min": float(x.min()),
        "max": float(x.max()),
        "absmax": float(np.abs(x).max()),
        "mean": float(x.mean()),
        "std": float(x.std()),
        "p01": float(np.percentile(x, 1)),
        "p50": float(np.percentile(x, 50)),
        "p99": float(np.percentile(x, 99)),
    })


for fold in range(1, 10):

    print(f"Processing fold {fold}/9")

    # Ridge
    ridge = joblib.load(
        ROOT / "ridge" / f"ridge_fold{fold}.joblib"
    )

    scaler = ridge.named_steps["standardscaler"]
    estimator = ridge.named_steps["ridge"]

    record(fold, "ridge", "coefficients", estimator.coef_)
    record(fold, "ridge", "intercept", estimator.intercept_)
    record(fold, "ridge", "scaler_mean", scaler.mean_)
    record(fold, "ridge", "scaler_scale", scaler.scale_)

    # HistGB
    histgb = joblib.load(
        ROOT / "histgb" / f"hist_gb_fold{fold}.joblib"
    )

    thresholds = []
    leaves = []
    categorical_count = 0

    for stage in histgb._predictors:
        for tree in stage:

            nodes = tree.nodes
            internal = nodes["is_leaf"] == 0
            leaf = nodes["is_leaf"] == 1

            categorical_count += int(
                np.count_nonzero(
                    nodes["is_categorical"][internal]
                )
            )

            thresholds.extend(nodes["num_threshold"][internal])
            leaves.extend(nodes["value"][leaf])

    if categorical_count:
        raise RuntimeError(
            f"Fold {fold}: categorical HistGB splits detected"
        )

    record(fold, "histgb", "thresholds", thresholds)
    record(fold, "histgb", "leaf_values", leaves)
    record(
        fold,
        "histgb",
        "baseline",
        histgb._baseline_prediction,
    )

    # MLP and CNN
    for model in ("mlp", "cnn"):

        checkpoint = torch.load(
            ROOT / model / f"{model}_fold{fold}.pt",
            map_location="cpu",
            weights_only=False,
        )

        for name, tensor in checkpoint["state_dict"].items():
            record(
                fold,
                model,
                name,
                tensor.numpy(),
            )

        record(
            fold,
            model,
            "scaler_mean",
            checkpoint["scaler_mean"],
        )

        record(
            fold,
            model,
            "scaler_scale",
            checkpoint["scaler_scale"],
        )


df = pd.DataFrame(records)

df.to_csv(
    OUTPUT / "parameter_ranges_all_folds.csv",
    index=False,
)

summary = (
    df.groupby(["model", "parameter"])
    .agg(
        global_min=("min", "min"),
        global_max=("max", "max"),
        global_absmax=("absmax", "max"),
        folds=("fold", "nunique"),
    )
    .reset_index()
)

summary.to_csv(
    OUTPUT / "parameter_ranges_summary.csv",
    index=False,
)

print()
print("=" * 80)
print("GLOBAL PARAMETER RANGE SUMMARY")
print("=" * 80)

print(
    summary[
        ["model", "parameter", "global_absmax", "folds"]
    ].to_string(index=False)
)

print()
print("Saved results to:", OUTPUT)
print("PARAMETER RANGE ANALYSIS COMPLETE")
