#!/usr/bin/env python3
"""P3-M03-01: Verify original training data and checkpoint scalers."""

import argparse
import json
import sys
from pathlib import Path

import numpy as np
import pandas as pd
import torch
from sklearn.preprocessing import StandardScaler


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--p2-root",
        type=Path,
        default=Path("/p2"),
    )
    parser.add_argument(
        "--fold",
        type=int,
        choices=range(1, 10),
        default=1,
    )
    parser.add_argument(
        "--atol",
        type=float,
        default=1e-8,
    )
    args = parser.parse_args()

    p2 = args.p2_root
    fold = args.fold

    sys.path.insert(0, str(p2 / "scripts"))

    from run_scenario_cv_common40 import (
        FEATURES,
        sample_rows,
    )

    data_dir = p2 / "data/temporal_h10"

    fold_file = (
        p2
        / "results/juelich_cv_h10_common40/neural/folds.json"
    )

    settings_file = (
        p2
        / "results/juelich_cv_h10_common40/neural/settings.json"
    )

    folds = json.loads(fold_file.read_text())
    settings = json.loads(settings_file.read_text())

    names = sorted(
        p.name
        for p in data_dir.glob("juelich_core_*.parquet")
    )

    assert len(names) == 27
    assert FEATURES == settings["features"]
    assert len(FEATURES) == 40

    test_names = folds[str(fold)]
    train_names = [
        name for name in names
        if name not in set(test_names)
    ]

    assert len(test_names) == 3
    assert len(train_names) == 24
    assert not set(train_names) & set(test_names)

    print("=" * 65)
    print(f"P3-M03-01 — FOLD {fold}")
    print("=" * 65)

    print("Training scenarios:", len(train_names))
    print("Held-out scenarios:", len(test_names))

    frames = []
    sample_counts = {}

    for index, name in enumerate(train_names, start=1):
        seed = settings["seed"] + names.index(name)

        frame = sample_rows(
            data_dir / name,
            settings["samples_per_scenario"],
            seed,
            50000,
        )

        sample_counts[name] = len(frame)
        frames.append(frame)

        print(
            f"[{index:02d}/24] "
            f"{name}: {len(frame):,} samples",
            flush=True,
        )

    training = pd.concat(
        frames,
        ignore_index=True,
    )

    del frames

    Xraw = training[FEATURES].to_numpy(
        dtype=np.float64
    )

    y = training["target_per"].to_numpy(
        dtype=np.float32
    )

    assert np.isfinite(Xraw).all()
    assert np.isfinite(y).all()

    scaler = StandardScaler().fit(Xraw)

    print("\nTraining observations:", len(training))
    print("Feature matrix:", Xraw.shape)

    report = {
        "fold": fold,
        "training_scenarios": train_names,
        "heldout_scenarios": test_names,
        "sample_counts": sample_counts,
        "training_rows": len(training),
        "features": FEATURES,
        "models": {},
    }

    all_pass = True

    for model in ("mlp", "cnn"):
        checkpoint_path = Path(
            f"artifacts/p3_m01/reference_models/"
            f"{model}/{model}_fold{fold}.pt"
        )

        ckpt = torch.load(
            checkpoint_path,
            map_location="cpu",
            weights_only=False,
        )

        saved_mean = np.asarray(
            ckpt["scaler_mean"],
            dtype=np.float64,
        )

        saved_scale = np.asarray(
            ckpt["scaler_scale"],
            dtype=np.float64,
        )

        assert ckpt["features"] == FEATURES
        assert ckpt["fold"] == fold
        assert ckpt["model"] == model

        mean_error = np.max(
            np.abs(scaler.mean_ - saved_mean)
        )

        scale_error = np.max(
            np.abs(scaler.scale_ - saved_scale)
        )

        passed = bool(
            mean_error <= args.atol
            and scale_error <= args.atol
        )

        report["models"][model] = {
            "max_mean_error": float(mean_error),
            "max_scale_error": float(scale_error),
            "passed": passed,
        }

        print(f"\n{model.upper()} SCALER VERIFICATION")
        print("Maximum mean error:", mean_error)
        print("Maximum scale error:", scale_error)
        print("Status:", "PASS" if passed else "FAIL")

        all_pass &= passed

    report["passed"] = bool(all_pass)

    output_dir = Path(
        "results/p3_qat/data_recovery"
    )

    output_dir.mkdir(
        parents=True,
        exist_ok=True,
    )

    output_path = (
        output_dir
        / f"fold{fold}_scaler_verification.json"
    )

    output_path.write_text(
        json.dumps(report, indent=2) + "\n"
    )

    print("\n" + "=" * 65)
    print("FINAL RESULT")
    print("=" * 65)
    print("Fold:", fold)
    print("Training rows:", len(training))
    print("Models verified:", 2)
    print("Status:", "PASS" if all_pass else "FAIL")
    print("Report:", output_path)

    if not all_pass:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
