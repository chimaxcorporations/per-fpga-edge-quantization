#!/usr/bin/env python3
"""
P3-M08-05B: Regenerate Figure 1 with matched-sample classical baselines.

Models:
    Ridge FP32
    HistGB FP32
    MLP FP32 / INT8 PTQ / INT8 QAT
    CNN FP32 / INT8 PTQ / INT8 QAT

Uses existing evaluation results only.
No retraining, inference, quantization, or synthesis.
"""

import argparse
import json
from pathlib import Path

import numpy as np
import pandas as pd

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt


ORDER = [
    ("ridge", "FP32 reference"),
    ("hist_gb", "FP32 reference"),
    ("mlp", "FP32"),
    ("mlp", "INT8 PTQ"),
    ("mlp", "INT8 QAT"),
    ("cnn", "FP32"),
    ("cnn", "INT8 PTQ"),
    ("cnn", "INT8 QAT"),
]

DISPLAY = {
    "ridge": "Ridge",
    "hist_gb": "HistGB",
    "mlp": "MLP",
    "cnn": "CNN",
}


def main():

    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--root",
        type=Path,
        default=Path("."),
    )

    args = parser.parse_args()
    root = args.root.resolve()

    classical_path = (
        root
        / "results/p3_m08_05a/classical_fold_metrics.csv"
    )

    neural_path = (
        root
        / "results/p3_qat/analysis/int8/max/tables/fold_metrics.csv"
    )

    audit_path = (
        root
        / "results/p3_m08_05a/reference_alignment_audit.json"
    )

    output_dir = (
        root
        / "results/p3_m08_05a/figures"
    )

    output_dir.mkdir(parents=True, exist_ok=True)

    # --------------------------------------------------
    # Verify reference alignment
    # --------------------------------------------------

    with open(audit_path) as f:
        audit = json.load(f)

    assert audit["status"] == "PASS"
    assert len(audit["folds"]) == 9

    print("Reference alignment: PASS")

    # --------------------------------------------------
    # Load existing metrics
    # --------------------------------------------------

    classical = pd.read_csv(classical_path)
    neural = pd.read_csv(neural_path)

    required = {
        "model",
        "method",
        "fold",
        "n",
        "mae",
        "rmse",
        "r2",
    }

    for name, df in [
        ("classical", classical),
        ("neural", neural),
    ]:
        missing = required - set(df.columns)

        if missing:
            raise ValueError(
                f"{name} missing columns: {missing}"
            )

    combined = pd.concat(
        [classical, neural],
        ignore_index=True,
    )

    # --------------------------------------------------
    # Verify eight configurations and nine folds
    # --------------------------------------------------

    actual = set(
        map(
            tuple,
            combined[["model", "method"]]
            .drop_duplicates()
            .to_numpy(),
        )
    )

    if actual != set(ORDER):
        raise ValueError(
            f"Configuration mismatch: "
            f"missing={set(ORDER)-actual}; "
            f"extra={actual-set(ORDER)}"
        )

    for model, method in ORDER:

        rows = combined[
            (combined["model"] == model)
            & (combined["method"] == method)
        ].sort_values("fold")

        if rows["fold"].tolist() != list(range(1, 10)):
            raise ValueError(
                f"Invalid folds: {model}, {method}"
            )

        if not (rows["n"] == 1000).all():
            raise ValueError(
                f"Invalid sample count: {model}, {method}"
            )

        if not np.isfinite(
            rows[["mae", "rmse", "r2"]].to_numpy()
        ).all():
            raise ValueError(
                f"Non-finite metrics: {model}, {method}"
            )

    print("Eight configurations: PASS")
    print("Nine folds per configuration: PASS")
    print("Reference samples per fold: 1000")

    # --------------------------------------------------
    # Aggregate metrics
    # --------------------------------------------------

    summary = (
        combined
        .groupby(["model", "method"], as_index=False)
        .agg(
            mean_mae=("mae", "mean"),
            sd_mae=("mae", "std"),
            mean_rmse=("rmse", "mean"),
            sd_rmse=("rmse", "std"),
            mean_r2=("r2", "mean"),
            sd_r2=("r2", "std"),
        )
    )

    summary["order"] = summary.apply(
        lambda row: ORDER.index(
            (row["model"], row["method"])
        ),
        axis=1,
    )

    summary = (
        summary
        .sort_values("order")
        .drop(columns="order")
        .reset_index(drop=True)
    )

    summary_path = (
        output_dir
        / "fig1_eight_configuration_summary.csv"
    )

    summary.to_csv(summary_path, index=False)

    # --------------------------------------------------
    # Figure 1
    # --------------------------------------------------

    x = np.arange(len(ORDER))

    labels = []

    for model, method in ORDER:

        precision = (
            "FP32"
            if method == "FP32 reference"
            else method
        )

        labels.append(
            f"{DISPLAY[model]}\n{precision}"
        )

    fig, axes = plt.subplots(
        2,
        1,
        figsize=(10, 7.5),
        sharex=True,
        gridspec_kw={"hspace": 0.15},
    )

    metrics = [
        ("mae", "(a) Mean absolute error"),
        ("rmse", "(b) Root mean squared error"),
    ]

    for ax, (metric, title) in zip(axes, metrics):

        means = summary[
            f"mean_{metric}"
        ].to_numpy()

        deviations = summary[
            f"sd_{metric}"
        ].to_numpy()

        ax.errorbar(
            x,
            means,
            yerr=deviations,
            fmt="o",
            markersize=6,
            capsize=4,
            linewidth=1.5,
            color="#25466b",
        )

        ax.axvline(
            1.5,
            linestyle="--",
            color="gray",
            alpha=0.5,
        )

        ax.axvline(
            4.5,
            linestyle=":",
            color="gray",
            alpha=0.4,
        )

        ax.set_title(
            title,
            loc="left",
            fontsize=11,
            fontweight="bold",
        )

        ax.set_ylabel(
            f"{metric.upper()} (mean ± SD)"
        )

        ax.grid(
            axis="y",
            alpha=0.2,
        )

        ax.set_xlim(-0.6, 7.6)
        ax.set_ylim(bottom=0)

    axes[-1].set_xticks(x)
    axes[-1].set_xticklabels(
        labels,
        fontsize=9,
    )

    fig.suptitle(
        "Nine-fold PER prediction accuracy "
        "on matched held-out reference samples",
        fontsize=12,
        fontweight="bold",
    )

    fig.subplots_adjust(
        left=0.12,
        right=0.98,
        top=0.91,
        bottom=0.15,
    )

    fig.text(
        0.5,
        0.025,
        "1,000 matched reference observations per fold; "
        "error bars show standard deviation across nine folds.",
        ha="center",
        fontsize=9,
    )

    output_base = (
        output_dir / "fig1_all_models_accuracy"
    )

    fig.savefig(
        output_base.with_suffix(".pdf"),
        bbox_inches="tight",
    )

    fig.savefig(
        output_base.with_suffix(".png"),
        dpi=300,
        bbox_inches="tight",
    )

    plt.close(fig)

    # --------------------------------------------------
    # Report
    # --------------------------------------------------

    print("\nP3-M08-05B: PASS")

    print("\nEight-configuration summary:\n")

    print(
        summary.to_string(
            index=False,
            float_format=lambda v: f"{v:.6f}",
        )
    )

    print("\nGenerated files:")

    for path in [
        summary_path,
        output_base.with_suffix(".pdf"),
        output_base.with_suffix(".png"),
    ]:
        print(path)


if __name__ == "__main__":
    main()
