#!/usr/bin/env python3
"""Generate deterministic, held-out FP32 reference inference vectors."""

import argparse
import hashlib
import json
from pathlib import Path

import joblib
import numpy as np
import pandas as pd
import pyarrow.parquet as pq
import torch
from torch import nn


HISTORY = 10
CHANNELS = 4

FEATURES = [
    f"{name}_lag{lag}"
    for lag in range(HISTORY)
    for name in ("per_t", "dist_m", "v_src_mps", "v_dst_mps")
]

MODELS = ("ridge", "histgb", "mlp", "cnn")


class MLP(nn.Module):
    def __init__(self):
        super().__init__()
        self.layers = nn.Sequential(
            nn.Linear(40, 64),
            nn.ReLU(),
            nn.Linear(64, 32),
            nn.ReLU(),
            nn.Linear(32, 1),
        )

    def forward(self, x):
        return self.layers(x).squeeze(-1)


class CNN(nn.Module):
    def __init__(self):
        super().__init__()
        self.conv = nn.Sequential(
            nn.Conv1d(4, 16, kernel_size=3, padding=1),
            nn.ReLU(),
            nn.Conv1d(16, 16, kernel_size=3, padding=1),
            nn.ReLU(),
        )
        self.head = nn.Sequential(
            nn.Flatten(),
            nn.Linear(160, 32),
            nn.ReLU(),
            nn.Linear(32, 1),
        )

    def forward(self, x):
        x = x.reshape(-1, HISTORY, CHANNELS).transpose(1, 2)
        return self.head(self.conv(x)).squeeze(-1)


def sha256(path):
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def sample_parquet(path, count, seed, batch_size=100000):
    """Sample deterministic row positions without loading the whole file."""

    pf = pq.ParquetFile(path)
    total = pf.metadata.num_rows

    if total < count:
        raise ValueError(f"{path}: only {total} rows, need {count}")

    indices = np.sort(
        np.random.default_rng(seed).choice(
            total, size=count, replace=False
        )
    )

    columns = FEATURES + ["target_per", "target_tx"]

    frames = []
    offset = 0

    for batch in pf.iter_batches(
        batch_size=batch_size,
        columns=columns,
    ):
        stop = offset + batch.num_rows

        left = np.searchsorted(indices, offset)
        right = np.searchsorted(indices, stop)

        if right > left:
            frame = batch.to_pandas()
            selected = indices[left:right] - offset

            part = frame.iloc[selected].copy()
            part["source_row"] = indices[left:right]

            frames.append(part)

        offset = stop

    if not frames:
        raise RuntimeError(f"No observations selected from {path}")

    result = pd.concat(frames, ignore_index=True)

    assert len(result) == count

    return result


def load_neural(path, cls, fold, model_name):
    # Load only trusted checkpoints produced by this project.
    checkpoint = torch.load(
        path,
        map_location="cpu",
        weights_only=False,
    )

    assert checkpoint["features"] == FEATURES
    assert int(checkpoint["fold"]) == fold
    assert checkpoint["model"] == model_name

    model = cls()
    model.load_state_dict(checkpoint["state_dict"])
    model.eval()

    mean = np.asarray(checkpoint["scaler_mean"], dtype=np.float64)
    scale = np.asarray(checkpoint["scaler_scale"], dtype=np.float64)

    assert mean.shape == (40,)
    assert scale.shape == (40,)
    assert np.isfinite(mean).all()
    assert np.isfinite(scale).all()
    assert (scale > 0).all()

    return model, mean, scale


def predict_neural(model, mean, scale, raw, batch_size=2048):
    # Match sklearn StandardScaler.transform followed by float32 conversion.
    scaled = np.ascontiguousarray(
        ((raw - mean) / scale).astype(np.float32)
    )

    predictions = []

    with torch.inference_mode():
        for start in range(0, len(scaled), batch_size):
            x = torch.from_numpy(scaled[start:start + batch_size])
            y = model(x).cpu().numpy().astype(np.float64)
            predictions.append(y)

    return np.clip(np.concatenate(predictions), 0.0, 1.0)


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument("--p2-root", type=Path, required=True)
    parser.add_argument("--p3-root", type=Path, required=True)
    parser.add_argument("--samples-per-fold", type=int, default=1000)
    parser.add_argument("--seed", type=int, default=42)

    args = parser.parse_args()

    if args.samples_per_fold < 3:
        parser.error("--samples-per-fold must be at least 3")

    p2 = args.p2_root
    p3 = args.p3_root

    model_dir = p3 / "artifacts/p3_m01/reference_models"
    output_dir = p3 / "artifacts/p3_m01/reference_vectors"
    verification_dir = p3 / "artifacts/p3_m01/verification"

    output_dir.mkdir(parents=True, exist_ok=True)
    verification_dir.mkdir(parents=True, exist_ok=True)

    folds_path = (
        p2 / "results/juelich_cv_h10_common40/neural/folds.json"
    )

    with open(folds_path) as f:
        folds = json.load(f)

    assert len(folds) == 9

    torch.set_num_threads(4)

    manifest = []

    for fold in range(1, 10):
        scenarios = folds[str(fold)]

        assert len(scenarios) == 3

        print(f"\n===== FOLD {fold} =====", flush=True)

        base_count, remainder = divmod(args.samples_per_fold, 3)

        frames = []

        for j, scenario in enumerate(scenarios):
            count = base_count + (1 if j < remainder else 0)

            path = p2 / "data/temporal_h10" / scenario

            frame = sample_parquet(
                path,
                count=count,
                seed=args.seed + fold * 100 + j,
            )

            frame.insert(0, "scenario", scenario)
            frame.insert(0, "fold", fold)

            frames.append(frame)

        data = pd.concat(frames, ignore_index=True)

        assert len(data) == args.samples_per_fold

        raw = data[FEATURES].to_numpy(dtype=np.float64)

        target = data["target_per"].to_numpy(dtype=np.float64)
        weight = data["target_tx"].to_numpy(dtype=np.float64)

        assert np.isfinite(raw).all()
        assert np.isfinite(target).all()
        assert np.isfinite(weight).all()
        assert (weight > 0).all()

        # Classical reference predictions
        ridge_path = model_dir / "ridge" / f"ridge_fold{fold}.joblib"
        hist_path = model_dir / "histgb" / f"hist_gb_fold{fold}.joblib"

        ridge = joblib.load(ridge_path)
        histgb = joblib.load(hist_path)

        data["pred_ridge_fp32"] = np.clip(
            ridge.predict(raw), 0.0, 1.0
        )

        data["pred_histgb_fp32"] = np.clip(
            histgb.predict(raw), 0.0, 1.0
        )

        # Neural reference predictions
        for name, cls in (("mlp", MLP), ("cnn", CNN)):
            path = model_dir / name / f"{name}_fold{fold}.pt"

            model, mean, scale = load_neural(
                path, cls, fold, name
            )

            predictions = predict_neural(
                model, mean, scale, raw
            )

            data[f"pred_{name}_fp32"] = predictions

        for name in MODELS:
            pred = data[f"pred_{name}_fp32"].to_numpy()

            assert np.isfinite(pred).all()
            assert ((pred >= 0) & (pred <= 1)).all()

            rmse = np.sqrt(np.mean((target - pred) ** 2))

            print(
                f"{name:7s}: RMSE={rmse:.8f}",
                flush=True,
            )

        output_path = output_dir / f"fold{fold}.parquet"
        data.to_parquet(output_path, index=False)

        manifest.append({
            "fold": fold,
            "samples": len(data),
            "scenarios": scenarios,
            "vector_file": str(output_path.relative_to(p3)),
            "vector_sha256": sha256(output_path),
        })

        print(f"Saved: {output_path}", flush=True)

    manifest_path = verification_dir / "reference_vectors_manifest.json"

    with open(manifest_path, "w") as f:
        json.dump(manifest, f, indent=2)

    print("\n==========================================")
    print("REFERENCE VECTOR EXPORT COMPLETE")
    print("==========================================")
    print("Folds:", len(manifest))
    print("Samples:", sum(x["samples"] for x in manifest))
    print("Model predictions:", sum(x["samples"] for x in manifest) * 4)


if __name__ == "__main__":
    main()
