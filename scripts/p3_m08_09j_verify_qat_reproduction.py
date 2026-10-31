from pathlib import Path

import numpy as np
import pandas as pd

original = Path("/original/results/p3_qat/evaluation/int8/max")
reproduction = Path("/reproduction/results/p3_qat/evaluation/int8/max")

total = 0
passed = 0
failures = []
max_difference = 0.0

original_files = {
    p.relative_to(original)
    for p in original.rglob("*_predictions.parquet")
}

reproduction_files = {
    p.relative_to(reproduction)
    for p in reproduction.rglob("*_predictions.parquet")
}

for p in sorted(original_files - reproduction_files):
    failures.append(f"MISSING: {p}")

for p in sorted(reproduction_files - original_files):
    failures.append(f"EXTRA: {p}")

for relative in sorted(original_files & reproduction_files):
    total += 1

    a = pd.read_parquet(original / relative)
    b = pd.read_parquet(reproduction / relative)

    if not a.columns.equals(b.columns):
        failures.append(f"COLUMN MISMATCH: {relative}")
        continue

    if a.shape != b.shape:
        failures.append(f"SHAPE MISMATCH: {relative}")
        continue

    if a.equals(b):
        passed += 1
        continue

    failures.append(f"VALUE MISMATCH: {relative}")

    for column in a.select_dtypes(include="number").columns:
        x = a[column].to_numpy(dtype=np.float64)
        y = b[column].to_numpy(dtype=np.float64)

        finite = np.isfinite(x) & np.isfinite(y)

        if finite.any():
            difference = np.max(np.abs(x[finite] - y[finite]))
            max_difference = max(
                max_difference,
                float(difference),
            )

print("=" * 65)
print("P3-M08-09J-02P — QAT PREDICTION REPRODUCTION")
print("=" * 65)
print(f"Files compared:        {total}")
print(f"Files identical:       {passed}")
print(f"Maximum finite delta:  {max_difference:.12g}")
print(f"Failures:              {len(failures)}")

if failures:
    print("\nFailure details:")
    for failure in failures:
        print(failure)

if total == 18 and passed == 18 and not failures:
    print("\nRESULT: PASS — 18/18 QAT prediction files identical")
else:
    print("\nRESULT: FAIL — QAT reproduction discrepancies detected")
    raise SystemExit(1)
