"""P3-M03-02D: Compare fake INT8 against integer INT8.

Uses deterministic outer-training samples only.
Does not update model parameters or calibration scales.
"""

import argparse
import json
import sys
from pathlib import Path

import numpy as np
import pandas as pd
import torch

from src.qat_int8 import QATMLP, QATCNN
from scripts.verify_qat_calibration import configure_qat
from scripts.run_integer_ptq import (
    MLP,
    CNN,
    infer,
    scales,
)


ROOT = Path("artifacts/p3_m01")

CAL = Path(
    "results/p3_quantization/calibration/"
    "activation_statistics/"
    "activation_percentiles_exact_by_fold.csv"
)


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
        "--samples",
        type=int,
        default=1000,
    )
    parser.add_argument(
        "--seed",
        type=int,
        default=42,
    )

    args = parser.parse_args()

    if args.samples < 1:
        parser.error("--samples must be positive")

    p2 = args.p2_root

    sys.path.insert(
        0,
        str(p2 / "scripts"),
    )

    from run_scenario_cv_common40 import (
        FEATURES,
        sample_rows,
    )

    folds = json.loads(
        (
            p2 /
            "results/juelich_cv_h10_common40/"
            "neural/folds.json"
        ).read_text()
    )

    data_dir = p2 / "data/temporal_h10"

    names = sorted(
        p.name
        for p in data_dir.glob("juelich_core_*.parquet")
    )

    assert len(names) == 27

    heldout = set(folds[str(args.fold)])

    train_names = [
        name
        for name in names
        if name not in heldout
    ]

    assert len(train_names) == 24
    assert not set(train_names) & heldout

    # Distribute diagnostic samples across all training scenarios.
    per_scenario = (
        args.samples + len(train_names) - 1
    ) // len(train_names)

    frames = []

    for name in train_names:
        seed = args.seed + names.index(name)

        frame = sample_rows(
            data_dir / name,
            per_scenario,
            seed,
            50000,
        )

        frames.append(frame)

    diagnostic = pd.concat(
        frames,
        ignore_index=True,
    ).iloc[:args.samples]

    assert len(diagnostic) == args.samples

    raw = diagnostic[FEATURES].to_numpy(
        dtype=np.float64
    )

    assert np.isfinite(raw).all()

    calibration = pd.read_csv(CAL)

    rows = []

    for name in ("mlp", "cnn"):
        checkpoint_path = (
            ROOT /
            "reference_models" /
            name /
            f"{name}_fold{args.fold}.pt"
        )

        checkpoint = torch.load(
            checkpoint_path,
            map_location="cpu",
            weights_only=False,
        )

        mean = np.asarray(
            checkpoint["scaler_mean"],
            dtype=np.float64,
        )

        std = np.asarray(
            checkpoint["scaler_scale"],
            dtype=np.float64,
        )

        assert checkpoint["features"] == FEATURES

        activation_scales = scales(
            calibration,
            args.fold,
            name,
            8,
            "max",
        )

        # Original FP32 architecture for integer backend.
        reference = MLP() if name == "mlp" else CNN()

        reference.load_state_dict(
            checkpoint["state_dict"]
        )

        reference.eval()

        # QAT architecture.
        qat = QATMLP() if name == "mlp" else QATCNN()

        result = qat.load_state_dict(
            checkpoint["state_dict"],
            strict=False,
        )

        assert not result.unexpected_keys

        configure_qat(
            qat,
            name,
            activation_scales,
        )

        qat.eval()

        standardized = (
            (raw - mean) / std
        ).astype(np.float32)

        with torch.no_grad():
            fake = qat(
                torch.from_numpy(standardized)
            ).cpu().numpy().astype(np.float64)

        fake = np.clip(fake, 0.0, 1.0)

        integer = infer(
            reference,
            name,
            raw,
            mean,
            std,
            activation_scales,
            8,
            batch_size=128,
        )

        assert len(fake) == len(integer)
        assert np.isfinite(fake).all()
        assert np.isfinite(integer).all()

        difference = np.abs(fake - integer)

        output_scale = activation_scales[
            "output_linear"
        ]

        result = {
            "model": name,
            "fold": args.fold,
            "samples": len(raw),
            "mean_abs_difference": float(
                difference.mean()
            ),
            "max_abs_difference": float(
                difference.max()
            ),
            "rmse_difference": float(
                np.sqrt(np.mean((fake - integer) ** 2))
            ),
            "output_scale": float(output_scale),
            "mean_difference_lsb": float(
                difference.mean() / output_scale
            ),
            "max_difference_lsb": float(
                difference.max() / output_scale
            ),
        }

        rows.append(result)

        print()
        print(f"{name.upper()} — FOLD {args.fold}")
        print("Samples:", len(raw))
        print(
            "Mean absolute difference:",
            result["mean_abs_difference"],
        )
        print(
            "Maximum absolute difference:",
            result["max_abs_difference"],
        )
        print(
            "RMSE difference:",
            result["rmse_difference"],
        )
        print(
            "Mean difference (output LSB):",
            result["mean_difference_lsb"],
        )
        print(
            "Maximum difference (output LSB):",
            result["max_difference_lsb"],
        )

    output_dir = Path(
        "results/p3_qat/verification"
    )

    output_dir.mkdir(
        parents=True,
        exist_ok=True,
    )

    output = (
        output_dir /
        f"fold{args.fold}_fake_integer_comparison.csv"
    )

    pd.DataFrame(rows).to_csv(
        output,
        index=False,
    )

    print()
    print("Comparison report:", output)
    print("P3-M03-02D DIAGNOSTIC: COMPLETE")
    print(
        "Numerical compatibility has been measured, "
        "not yet accepted."
    )


if __name__ == "__main__":
    main()
