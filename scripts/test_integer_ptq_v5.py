"""P3-M02.5-V5: Full-model integer PTQ regression validation.

Recomputes all 72 configurations and compares against saved predictions.
Does not overwrite existing predictions or checkpoints.
"""

from pathlib import Path
import hashlib

import numpy as np
import pandas as pd
import torch

from scripts.run_integer_ptq import (
    MLP, CNN, FEATURES, infer, scales,
)

ROOT = Path("artifacts/p3_m01")

CAL = Path(
    "results/p3_quantization/calibration/"
    "activation_statistics/activation_percentiles_exact_by_fold.csv"
)

INTEGER = Path(
    "results/p3_quantization/integer_ptq"
)

OUT = INTEGER / "validation"

OUT.mkdir(parents=True, exist_ok=True)


def sha256(path):
    h = hashlib.sha256()

    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)

    return h.hexdigest()


def main():

    cal = pd.read_csv(CAL)

    records = []
    failures = []

    for name in ("mlp", "cnn"):

        for fold in range(1, 10):

            checkpoint_path = (
                ROOT / "reference_models" /
                name / f"{name}_fold{fold}.pt"
            )

            checkpoint = torch.load(
                checkpoint_path,
                map_location="cpu",
                weights_only=False,
            )

            model = MLP() if name == "mlp" else CNN()

            model.load_state_dict(checkpoint["state_dict"])
            model.eval()

            df = pd.read_parquet(
                ROOT / "reference_vectors" /
                f"fold{fold}.parquet"
            )

            raw = df[FEATURES].to_numpy(
                dtype=np.float64
            )

            mean = np.asarray(
                checkpoint["scaler_mean"],
                dtype=np.float64,
            )

            std = np.asarray(
                checkpoint["scaler_scale"],
                dtype=np.float64,
            )

            for bits in (8, 16):

                for method in ("max", "p999"):

                    s = scales(
                        cal, fold, name, bits, method
                    )

                    recomputed = infer(
                        model,
                        name,
                        raw,
                        mean,
                        std,
                        s,
                        bits,
                    )

                    saved_path = (
                        INTEGER /
                        f"int{bits}" /
                        method /
                        name /
                        f"fold{fold}_predictions.parquet"
                    )

                    saved_df = pd.read_parquet(saved_path)

                    saved = saved_df[
                        "pred_integer_ptq"
                    ].to_numpy(dtype=np.float64)

                    if len(saved) != len(recomputed):
                        raise RuntimeError(
                            f"Length mismatch: {saved_path}"
                        )

                    finite = bool(
                        np.all(np.isfinite(recomputed))
                    )

                    bounded = bool(
                        np.all(
                            (recomputed >= 0) &
                            (recomputed <= 1)
                        )
                    )

                    exact = bool(
                        np.array_equal(saved, recomputed)
                    )

                    diff = np.abs(saved - recomputed)

                    max_error = float(np.max(diff))
                    mean_error = float(np.mean(diff))

                    passed = (
                        finite and bounded and exact
                    )

                    record = {
                        "model": name,
                        "fold": fold,
                        "bits": bits,
                        "method": method,
                        "samples": len(saved),
                        "finite": finite,
                        "bounded": bounded,
                        "exact_match": exact,
                        "max_abs_error": max_error,
                        "mean_abs_error": mean_error,
                        "status": "PASS" if passed else "FAIL",
                    }

                    records.append(record)

                    if not passed:
                        failures.append(record)

                    print(
                        f"{name.upper()} "
                        f"fold={fold} "
                        f"INT{bits} "
                        f"{method}: "
                        f"{record['status']} "
                        f"max_error={max_error:.12g}",
                        flush=True,
                    )

    result = pd.DataFrame(records)

    result.to_csv(
        OUT / "full_model_regression.csv",
        index=False,
    )

    source_files = [
        Path("src/integer_ptq.py"),
        Path("scripts/run_integer_ptq.py"),
        Path("scripts/test_integer_ptq_v5.py"),
        CAL,
    ]

    with open(
        OUT / "baseline_source_hashes.txt",
        "w",
    ) as f:

        for path in source_files:
            f.write(
                f"{sha256(path)}  {path}\n"
            )

    print()
    print("=" * 75)
    print("P3-M02.5-V5 FULL-MODEL REGRESSION SUMMARY")
    print("=" * 75)

    print("Configurations:", len(result))
    print("Prediction rows:", int(result["samples"].sum()))
    print("Passed:", int((result.status == "PASS").sum()))
    print("Failed:", len(failures))

    if failures:
        print("V5 REGRESSION FAILED")
        raise SystemExit(1)

    print("V5 FULL-MODEL REGRESSION PASSED")


if __name__ == "__main__":
    main()
