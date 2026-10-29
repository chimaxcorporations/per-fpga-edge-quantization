"""Validate calibration uniqueness and integer PTQ prediction alignment."""

from pathlib import Path
import numpy as np
import pandas as pd

ROOT = Path("artifacts/p3_m01")
CAL = Path(
    "results/p3_quantization/calibration/"
    "activation_statistics/activation_percentiles_exact_by_fold.csv"
)
PTQ = Path("results/p3_quantization/ptq")
INTEGER = Path("results/p3_quantization/integer_ptq")

cal = pd.read_csv(CAL)

required = {"fold", "model", "layer", "absmax", "abs_p999"}

if not required.issubset(cal.columns):
    raise RuntimeError("Missing calibration columns")

if cal.duplicated(["fold", "model", "layer"]).any():
    raise RuntimeError("Duplicate calibration records")

expected_layers = {
    "mlp": {
        "standardized_input",
        "fc1_relu",
        "fc2_relu",
        "output_linear",
    },
    "cnn": {
        "standardized_input",
        "conv1_relu",
        "conv2_relu",
        "dense_relu",
        "output_linear",
    },
}

for model in ("mlp", "cnn"):
    for fold in range(1, 10):
        subset = cal[
            (cal["model"] == model) &
            (cal["fold"] == fold)
        ]

        if set(subset["layer"]) != expected_layers[model]:
            raise RuntimeError(
                f"Calibration layer mismatch: {model}, fold {fold}"
            )

        values = subset[["absmax", "abs_p999"]].to_numpy(
            dtype=np.float64
        )

        if not np.all(np.isfinite(values)):
            raise RuntimeError("Nonfinite calibration values")

        if np.any(values < 0):
            raise RuntimeError("Negative calibration magnitude")

        if np.any(values[:, 1] > values[:, 0] + 1e-12):
            raise RuntimeError("P99.9 exceeds maximum")

records = []

for model in ("mlp", "cnn"):
    for fold in range(1, 10):

        reference = pd.read_parquet(
            ROOT / "reference_vectors" /
            f"fold{fold}.parquet"
        )

        for bits in (8, 16):
            for method in ("max", "p999"):

                fake = pd.read_parquet(
                    PTQ / f"int{bits}" / method /
                    model / f"fold{fold}_predictions.parquet"
                )

                integer = pd.read_parquet(
                    INTEGER / f"int{bits}" / method /
                    model / f"fold{fold}_predictions.parquet"
                )

                if not (
                    len(reference) == len(fake) == len(integer)
                ):
                    raise RuntimeError("Row-count mismatch")

                for col in ("scenario", "source_row", "target_per"):

                    if col not in fake.columns:
                        raise RuntimeError(
                            f"Missing fake PTQ column: {col}"
                        )

                    if col not in integer.columns:
                        raise RuntimeError(
                            f"Missing integer PTQ column: {col}"
                        )

                    ref_values = reference[col].to_numpy()
                    fake_values = fake[col].to_numpy()
                    int_values = integer[col].to_numpy()

                    if not np.array_equal(
                        ref_values, fake_values
                    ):
                        raise RuntimeError(
                            f"Fake PTQ alignment failure: "
                            f"{model}, fold {fold}, "
                            f"INT{bits}, {method}, {col}"
                        )

                    if not np.array_equal(
                        ref_values, int_values
                    ):
                        raise RuntimeError(
                            f"Integer PTQ alignment failure: "
                            f"{model}, fold {fold}, "
                            f"INT{bits}, {method}, {col}"
                        )

                for col in (
                    "pred_fp32",
                    "pred_fake_ptq",
                    "pred_integer_ptq",
                ):
                    if col not in integer.columns:
                        raise RuntimeError(
                            f"Missing prediction column: {col}"
                        )

                    values = integer[col].to_numpy(
                        dtype=np.float64
                    )

                    if not np.all(np.isfinite(values)):
                        raise RuntimeError(
                            f"Nonfinite predictions: {col}"
                        )

                if not np.array_equal(
                    integer["pred_fp32"].to_numpy(),
                    reference[f"pred_{model}_fp32"].to_numpy(),
                ):
                    raise RuntimeError(
                        "FP32 reference mismatch"
                    )

                if not np.array_equal(
                    integer["pred_fake_ptq"].to_numpy(),
                    fake["pred_ptq"].to_numpy(),
                ):
                    raise RuntimeError(
                        "Fake PTQ prediction mismatch"
                    )

                records.append({
                    "model": model,
                    "fold": fold,
                    "bits": bits,
                    "method": method,
                    "samples": len(integer),
                    "status": "PASS",
                })

result = pd.DataFrame(records)

out = INTEGER / "validation"
out.mkdir(parents=True, exist_ok=True)

result.to_csv(
    out / "prediction_alignment_validation.csv",
    index=False,
)

print("=" * 75)
print("INTEGER PTQ DATA VALIDATION")
print("=" * 75)

print("Configurations checked:", len(result))
print("Total prediction rows checked:", result["samples"].sum())
print("Calibration uniqueness: PASS")
print("Calibration completeness: PASS")
print("Prediction alignment: PASS")
print("FP32 reference consistency: PASS")
print("Fake PTQ consistency: PASS")
print()
print("P3-M02.5-V1 VALIDATION COMPLETE")
