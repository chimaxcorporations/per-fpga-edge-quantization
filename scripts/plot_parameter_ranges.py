#!/usr/bin/env python3
"""Plot model parameter ranges across folds."""

from pathlib import Path

import matplotlib
matplotlib.use("Agg")

import matplotlib.pyplot as plt
import pandas as pd

ROOT = Path("results/p3_quantization/parameter_analysis")
DATA = ROOT / "parameter_ranges_all_folds.csv"

df = pd.read_csv(DATA)

FIGURES = ROOT / "figures"
FIGURES.mkdir(parents=True, exist_ok=True)

for model in sorted(df["model"].unique()):

    subset = df[df["model"] == model]

    parameters = sorted(subset["parameter"].unique())

    fig, ax = plt.subplots(
        figsize=(max(10, len(parameters) * 1.2), 6)
    )

    for parameter in parameters:

        rows = subset[
            subset["parameter"] == parameter
        ].sort_values("fold")

        ax.plot(
            rows["fold"],
            rows["absmax"],
            marker="o",
            label=parameter,
        )

    ax.set_title(
        f"{model.upper()} Parameter Magnitudes Across Nine Folds"
    )

    ax.set_xlabel("Cross-validation fold")
    ax.set_ylabel("Maximum absolute parameter value")

    ax.set_xticks(range(1, 10))
    ax.grid(True, alpha=0.3)

    ax.legend(
        fontsize=8,
        loc="best",
    )

    fig.tight_layout()

    for extension in ("png", "pdf", "svg"):

        fig.savefig(
            FIGURES / f"{model}_parameter_ranges.{extension}",
            dpi=300,
            bbox_inches="tight",
        )

    plt.close(fig)

print("Plots saved to:", FIGURES)
