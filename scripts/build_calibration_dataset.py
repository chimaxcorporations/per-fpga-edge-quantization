#!/usr/bin/env python3
"""P3-M02.3: Leakage-safe calibration dataset generation."""

from pathlib import Path
import hashlib
import json

import numpy as np
import pandas as pd

P2 = Path("/p2")

MANIFEST = (
    P2 / "results/juelich_cv_h10_common40/neural/folds.json"
)

DATA = P2 / "data/temporal_h10"

OUTPUT = Path(
    "/p3/results/p3_quantization/calibration"
)

OUTPUT.mkdir(parents=True, exist_ok=True)

SEED = 42
SAMPLES_PER_SCENARIO = 1000

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

with open(MANIFEST) as f:
    folds = json.load(f)

ALL_SCENARIOS = sorted({
    filename
    for heldout in folds.values()
    for filename in heldout
})

assert len(ALL_SCENARIOS) == 27

# Four PER strata, including high-loss conditions.
PER_BINS = [-np.inf, 0.01, 0.1, 0.9, np.inf]


def sample_scenario(df, n, seed):
    """Deterministic stratified sampling without replacement."""

    df = df.copy()

    df["per_stratum"] = pd.cut(
        df["target_per"],
        bins=PER_BINS,
        labels=False,
        include_lowest=True,
    )

    if len(df) <= n:
        return df.drop(columns=["per_stratum"])

    groups = {
        int(k): group
        for k, group in df.groupby(
            "per_stratum",
            dropna=False,
        )
        if pd.notna(k)
    }

    if not groups:
        raise ValueError("No valid PER strata")

    # Allocate approximately equal samples to populated strata.
    selected = []
    remaining = n

    quota = n // len(groups)

    for stratum, group in sorted(groups.items()):

        count = min(quota, len(group))

        chosen = group.sample(
            n=count,
            random_state=seed + stratum,
        )

        selected.append(chosen)
        remaining -= count

    result = pd.concat(selected)

    # Fill remaining capacity from unused observations.
    if remaining > 0:

        unused = df.loc[
            ~df.index.isin(result.index)
        ]

        extra = unused.sample(
            n=min(remaining, len(unused)),
            random_state=seed + 100,
        )

        result = pd.concat([result, extra])

    if len(result) != n:
        raise RuntimeError(
            f"Expected {n} samples, got {len(result)}"
        )

    return result.drop(columns=["per_stratum"])


manifest_records = []

for fold in range(1, 10):

    heldout = set(folds[str(fold)])

    training = [
        scenario
        for scenario in ALL_SCENARIOS
        if scenario not in heldout
    ]

    assert len(training) == 24

    frames = []

    for scenario_index, scenario in enumerate(training):

        path = DATA / scenario

        columns = FEATURES + ["target_per", "target_tx"]

        df = pd.read_parquet(
            path,
            columns=columns,
        )

        df["source_row"] = np.arange(len(df))

        # Remove invalid observations.
        valid = np.isfinite(
            df[FEATURES + ["target_per"]]
            .to_numpy(dtype=np.float64)
        ).all(axis=1)

        df = df.loc[valid].copy()

        df = df[
            df["target_per"].between(0, 1)
        ]

        sampled = sample_scenario(
            df,
            SAMPLES_PER_SCENARIO,
            SEED + fold * 1000 + scenario_index,
        )

        sampled["scenario"] = scenario
        sampled["fold"] = fold

        frames.append(sampled)

    calibration = pd.concat(
        frames,
        ignore_index=True,
    )

    if set(calibration["scenario"]) & heldout:
        raise RuntimeError("Held-out scenario leakage detected")

    output_path = OUTPUT / f"fold{fold}_calibration.parquet"

    calibration.to_parquet(
        output_path,
        index=False,
    )

    digest = hashlib.sha256(
        output_path.read_bytes()
    ).hexdigest()

    manifest_records.append({
        "fold": fold,
        "training_scenarios": len(training),
        "heldout_scenarios": len(heldout),
        "calibration_samples": len(calibration),
        "high_per_samples": int(
            (calibration["target_per"] >= 0.9).sum()
        ),
        "sha256": digest,
        "filename": output_path.name,
    })

    print(
        f"Fold {fold}: "
        f"{len(calibration):,} samples, "
        f"{(calibration['target_per'] >= 0.9).sum():,} "
        f"high-PER samples — PASS"
    )

summary = pd.DataFrame(manifest_records)

summary.to_csv(
    OUTPUT / "calibration_manifest.csv",
    index=False,
)

with open(OUTPUT / "calibration_config.json", "w") as f:
    json.dump(
        {
            "seed": SEED,
            "samples_per_scenario": SAMPLES_PER_SCENARIO,
            "features": FEATURES,
            "sampling": "PER-stratified without replacement",
            "source": str(DATA),
            "fold_manifest": str(MANIFEST),
            "purpose": "PTQ calibration only",
        },
        f,
        indent=2,
    )

print()
print("=" * 75)
print("CALIBRATION DATASET GENERATION COMPLETE")
print("=" * 75)

print(summary.to_string(index=False))
