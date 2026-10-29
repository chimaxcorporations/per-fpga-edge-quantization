"""P3-M03-03: INT8 QAT fine-tuning.

Reconstructs original outer-training data, initializes from the
frozen FP32 checkpoint, and trains with frozen activation scales.

No held-out test data is loaded.
"""

import argparse
import json
import random
import sys
from pathlib import Path

import numpy as np
import pandas as pd
import torch
from torch.utils.data import DataLoader, TensorDataset

from src.qat_int8 import QATMLP, QATCNN
from src.qat_export import export_qat_checkpoint
from scripts.verify_qat_calibration import configure_qat
from scripts.run_integer_ptq import scales


ROOT = Path("artifacts/p3_m01")

CAL = Path(
    "results/p3_quantization/calibration/"
    "activation_statistics/"
    "activation_percentiles_exact_by_fold.csv"
)


def load_training_data(p2_root, fold):
    sys.path.insert(0, str(p2_root / "scripts"))

    from run_scenario_cv_common40 import (
        FEATURES,
        sample_rows,
    )

    folds_path = (
        p2_root /
        "results/juelich_cv_h10_common40/"
        "neural/folds.json"
    )

    folds = json.loads(folds_path.read_text())

    data_dir = p2_root / "data/temporal_h10"

    names = sorted(
        p.name
        for p in data_dir.glob("juelich_core_*.parquet")
    )

    if len(names) != 27:
        raise RuntimeError(
            f"Expected 27 scenarios, found {len(names)}"
        )

    heldout = set(folds[str(fold)])

    train_names = [
        name for name in names
        if name not in heldout
    ]

    if len(train_names) != 24 or len(heldout) != 3:
        raise RuntimeError("Invalid fold partition")

    frames = []

    for index, name in enumerate(train_names, 1):
        frame = sample_rows(
            data_dir / name,
            30000,
            42 + names.index(name),
            50000,
        )

        if len(frame) != 30000:
            raise RuntimeError(
                f"Unexpected sample count: {name}"
            )

        frames.append(frame)

        print(
            f"[{index:02d}/24] {name}: "
            f"{len(frame)} observations",
            flush=True,
        )

    train = pd.concat(
        frames,
        ignore_index=True,
    )

    if len(train) != 720000:
        raise RuntimeError("Training sample count mismatch")

    return train, FEATURES


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument(
        "--p2-root",
        type=Path,
        default=Path("/p2"),
    )

    parser.add_argument(
        "--model",
        choices=["mlp", "cnn"],
        default="mlp",
    )

    parser.add_argument(
        "--fold",
        type=int,
        choices=range(1, 10),
        default=1,
    )

    parser.add_argument(
        "--epochs",
        type=int,
        default=10,
    )

    parser.add_argument(
        "--batch-size",
        type=int,
        default=2048,
    )

    parser.add_argument(
        "--lr",
        type=float,
        default=1e-4,
    )

    parser.add_argument(
        "--seed",
        type=int,
        default=42,
    )

    parser.add_argument(
        "--device",
        choices=["cpu", "cuda"],
        default="cpu",
    )

    args = parser.parse_args()

    if args.epochs < 1 or args.batch_size < 1 or args.lr <= 0:
        parser.error("Invalid training hyperparameters")

    random.seed(args.seed)
    np.random.seed(args.seed)
    torch.manual_seed(args.seed)

    if args.device == "cuda":
        if not torch.cuda.is_available():
            raise RuntimeError("CUDA is unavailable")

        torch.cuda.manual_seed_all(args.seed)

    device = torch.device(args.device)

    print("=" * 60)
    print("P3-M03-03 INT8 QAT TRAINING")
    print("=" * 60)

    print("Model:", args.model)
    print("Fold:", args.fold)
    print("Device:", device)

    checkpoint_path = (
        ROOT /
        "reference_models" /
        args.model /
        f"{args.model}_fold{args.fold}.pt"
    )

    original = torch.load(
        checkpoint_path,
        map_location="cpu",
        weights_only=False,
    )

    train, features = load_training_data(
        args.p2_root,
        args.fold,
    )

    if list(original["features"]) != list(features):
        raise RuntimeError("Feature ordering mismatch")

    raw = train[features].to_numpy(
        dtype=np.float64
    )

    target = train["target_per"].to_numpy(
        dtype=np.float32
    )

    mean = np.asarray(
        original["scaler_mean"],
        dtype=np.float64,
    )

    std = np.asarray(
        original["scaler_scale"],
        dtype=np.float64,
    )

    if (
        not np.isfinite(raw).all()
        or not np.isfinite(target).all()
        or not np.isfinite(mean).all()
        or not np.isfinite(std).all()
        or np.any(std <= 0)
    ):
        raise RuntimeError("Invalid training data or scaler")

    X = np.ascontiguousarray(
        ((raw - mean) / std).astype(np.float32)
    )

    del raw, train

    dataset = TensorDataset(
        torch.from_numpy(X),
        torch.from_numpy(target),
    )

    generator = torch.Generator()
    generator.manual_seed(args.seed)

    loader = DataLoader(
        dataset,
        batch_size=args.batch_size,
        shuffle=True,
        generator=generator,
        num_workers=0,
    )

    model = (
        QATMLP()
        if args.model == "mlp"
        else QATCNN()
    )

    result = model.load_state_dict(
        original["state_dict"],
        strict=False,
    )

    if result.unexpected_keys:
        raise RuntimeError(result.unexpected_keys)

    expected_missing = {
        f"{name}.scale"
        for name in (
            (
                "quant_input",
                "quant_hidden1",
                "quant_hidden2",
                "quant_output",
            )
            if args.model == "mlp"
            else (
                "quant_input",
                "quant_conv1",
                "quant_conv2",
                "quant_hidden",
                "quant_output",
            )
        )
    }

    if set(result.missing_keys) != expected_missing:
        raise RuntimeError(result.missing_keys)

    calibration = pd.read_csv(CAL)

    activation_scales = scales(
        calibration,
        args.fold,
        args.model,
        8,
        "max",
    )

    configure_qat(
        model,
        args.model,
        activation_scales,
    )

    model = model.to(device)

    optimizer = torch.optim.Adam(
        model.parameters(),
        lr=args.lr,
    )

    criterion = torch.nn.MSELoss()

    output_dir = (
        Path("results/p3_qat/training")
        / args.model
        / f"fold{args.fold}"
    )

    output_dir.mkdir(
        parents=True,
        exist_ok=True,
    )

    history = []

    print()
    print("Training observations:", len(dataset))
    print("Feature count:", X.shape[1])
    print("Epochs:", args.epochs)
    print("Batch size:", args.batch_size)
    print("Learning rate:", args.lr)
    print()

    for epoch in range(1, args.epochs + 1):
        model.train()

        total_squared_error = 0.0
        total_samples = 0

        for xb, yb in loader:
            xb = xb.to(device)
            yb = yb.to(device)

            optimizer.zero_grad(set_to_none=True)

            prediction = model(xb)

            loss = criterion(
                prediction,
                yb,
            )

            if not torch.isfinite(loss):
                raise RuntimeError(
                    f"Nonfinite loss at epoch {epoch}"
                )

            loss.backward()

            optimizer.step()

            n = len(xb)

            total_squared_error += (
                loss.item() * n
            )

            total_samples += n

        mse = total_squared_error / total_samples
        rmse = float(np.sqrt(mse))

        history.append({
            "epoch": epoch,
            "train_mse": mse,
            "train_rmse": rmse,
        })

        print(
            f"Epoch {epoch:02d}/{args.epochs}: "
            f"MSE={mse:.8f}, RMSE={rmse:.8f}",
            flush=True,
        )

    history_path = output_dir / "training_history.csv"

    pd.DataFrame(history).to_csv(
        history_path,
        index=False,
    )

    checkpoint_output = (
        output_dir /
        f"{args.model}_fold{args.fold}_qat_int8.pt"
    )

    export_qat_checkpoint(
        qat_model=model.cpu(),
        original_checkpoint=original,
        destination=checkpoint_output,
        model_name=args.model,
        fold=args.fold,
        calibration="max",
    )

    config = {
        "model": args.model,
        "fold": args.fold,
        "bits": 8,
        "calibration": "max",
        "epochs": args.epochs,
        "batch_size": args.batch_size,
        "learning_rate": args.lr,
        "seed": args.seed,
        "device": args.device,
        "training_samples": len(dataset),
        "activation_scales": activation_scales,
        "checkpoint": str(checkpoint_output),
        "checkpoint_selection": "final_epoch",
        "heldout_data_used": False,
    }

    config_path = output_dir / "training_config.json"

    config_path.write_text(
        json.dumps(
            config,
            indent=2,
        )
    )

    print()
    print("QAT TRAINING COMPLETE")
    print("Checkpoint:", checkpoint_output)
    print("History:", history_path)
    print("Configuration:", config_path)


if __name__ == "__main__":
    main()
