#!/usr/bin/env python3
"""P3-M02.1b: independent HistGB tree traversal verification."""

from pathlib import Path

import joblib
import numpy as np
import pandas as pd


ROOT = Path("artifacts/p3_m01")
MODELS = ROOT / "reference_models" / "histgb"
VECTORS = ROOT / "reference_vectors"

OUTPUT = Path(
    "artifacts/p3_m02/numerical_equivalence"
)

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


def traverse_tree(x, tree):
    """Evaluate a numerical regression tree independently."""

    nodes = tree.nodes

    index = 0

    while True:

        node = nodes[index]

        if node["is_leaf"]:
            return float(node["value"])

        if node["is_categorical"]:
            raise NotImplementedError(
                "Categorical tree splits require separate handling."
            )

        feature = int(node["feature_idx"])
        threshold = float(node["num_threshold"])

        value = x[feature]

        if np.isnan(value):
            go_left = bool(node["missing_go_to_left"])
        else:
            go_left = value <= threshold

        if go_left:
            index = int(node["left"])
        else:
            index = int(node["right"])


def predict_independent(model, X):
    """Evaluate the complete boosting ensemble."""

    baseline = float(
        np.asarray(model._baseline_prediction).reshape(-1)[0]
    )

    predictions = np.full(
        len(X),
        baseline,
        dtype=np.float64,
    )

    for stage in model._predictors:

        for tree in stage:

            for row in range(len(X)):

                predictions[row] += traverse_tree(
                    X[row],
                    tree,
                )

    return np.clip(predictions, 0.0, 1.0)


def main():

    OUTPUT.mkdir(parents=True, exist_ok=True)

    results = []

    print("=" * 78)
    print("P3-M02.1b: INDEPENDENT HISTGB TREE TRAVERSAL")
    print("=" * 78)

    for fold in range(1, 10):

        model_path = (
            MODELS / f"hist_gb_fold{fold}.joblib"
        )

        vector_path = (
            VECTORS / f"fold{fold}.parquet"
        )

        model = joblib.load(model_path)
        df = pd.read_parquet(vector_path)

        X = df[FEATURES].to_numpy(dtype=np.float64)

        reference = df[
            "pred_histgb_fp32"
        ].to_numpy(dtype=np.float64)

        categorical_nodes = sum(
            int(np.count_nonzero(tree.nodes["is_categorical"]))
            for stage in model._predictors
            for tree in stage
        )

        if categorical_nodes:
            raise RuntimeError(
                f"Fold {fold}: found {categorical_nodes} "
                "categorical nodes; numerical-only traversal "
                "is not sufficient."
            )

        prediction = predict_independent(model, X)

        error = np.abs(prediction - reference)

        max_error = float(np.max(error))
        mean_error = float(np.mean(error))

        tolerance = 1e-10

        passed = max_error <= tolerance

        results.append({
            "fold": fold,
            "samples": len(X),
            "trees": sum(
                len(stage)
                for stage in model._predictors
            ),
            "max_abs_error": max_error,
            "mean_abs_error": mean_error,
            "tolerance": tolerance,
            "passed": passed,
        })

        print(
            f"Fold {fold}: "
            f"max={max_error:.3e}, "
            f"mean={mean_error:.3e}, "
            f"{'PASS' if passed else 'FAIL'}"
        )

    results_df = pd.DataFrame(results)

    results_df.to_csv(
        OUTPUT / "histgb_independent_traversal.csv",
        index=False,
    )

    print()
    print("=" * 78)
    print("SUMMARY")
    print("=" * 78)

    print("Folds:", len(results_df))
    print("Samples:", results_df["samples"].sum())
    print("Maximum absolute error:",
          results_df["max_abs_error"].max())
    print("Passed:", int(results_df["passed"].sum()),
          "/", len(results_df))

    if not results_df["passed"].all():
        raise SystemExit(
            "Independent HistGB traversal verification FAILED"
        )

    print()
    print("INDEPENDENT HISTGB TRAVERSAL VERIFIED")


if __name__ == "__main__":
    main()
