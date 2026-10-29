#!/usr/bin/env python3

from pathlib import Path
import numpy as np
import pandas as pd
import torch

from src.integer_ptq import qmax, weight_quantize

ROOT = Path("artifacts/p3_m01/reference_models")
OUT = Path("results/p3_quantization/integer_ptq/validation")

OUT.mkdir(parents=True, exist_ok=True)

records = []

LAYERS = {
    "mlp": [
        "layers.0",
        "layers.2",
        "layers.4",
    ],
    "cnn": [
        "conv.0",
        "conv.2",
        "head.1",
        "head.3",
    ],
}

for model in ("mlp", "cnn"):

    for fold in range(1, 10):

        checkpoint = torch.load(
            ROOT / model / f"{model}_fold{fold}.pt",
            map_location="cpu",
            weights_only=False,
        )

        state = checkpoint["state_dict"]

        for bits in (8, 16):

            Q = qmax(bits)

            for layer in LAYERS[model]:

                w = state[
                    f"{layer}.weight"
                ].detach().cpu().numpy()

                qw, sw = weight_quantize(w, bits)

                fan_in = int(np.prod(w.shape[1:]))

                # Conservative weight-aware dot-product bound.
                # This uses actual quantized weights but assumes
                # each input activation can attain +/-Q.
                max_sum_abs_weights = max(
                    sum(abs(int(v)) for v in channel.ravel())
                    for channel in qw
                )

                dot_bound = Q * max_sum_abs_weights

                # Bias contribution depends on the activation
                # input scale. It is not included here.
                signed_bits_dot_only = (
                    int(dot_bound).bit_length() + 1
                )

                records.append({
                    "model": model,
                    "fold": fold,
                    "bits": bits,
                    "layer": layer,
                    "fan_in": fan_in,
                    "max_abs_weight_sum": max_sum_abs_weights,
                    "dot_product_bound": dot_bound,
                    "signed_bits_dot_only": signed_bits_dot_only,
                })

df = pd.DataFrame(records)

df.to_csv(
    OUT / "accumulator_widths_by_fold.csv",
    index=False,
)

summary = (
    df.groupby(["model", "bits", "layer"])
    .agg(
        fan_in=("fan_in", "max"),
        max_dot_bound=("dot_product_bound", "max"),
        max_signed_bits_dot_only=(
            "signed_bits_dot_only", "max"
        ),
    )
    .reset_index()
)

summary.to_csv(
    OUT / "accumulator_widths_summary.csv",
    index=False,
)

print("=" * 90)
print("INTEGER ACCUMULATOR WIDTH ANALYSIS")
print("=" * 90)
print(summary.to_string(index=False))

print()
print("ACCUMULATOR ANALYSIS COMPLETE")
