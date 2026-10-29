"""P3-M02.5-V2: Conservative bias-inclusive accumulator and requantization audit.

Read-only: never changes checkpoints or predictions.

Run from repository root:
    python -m scripts.validate_integer_ptq_arithmetic
"""

from pathlib import Path
import math
import numpy as np
import pandas as pd
import torch

from src.integer_ptq import (
    qmax,
    weight_quantize,
    fixedpoint_params,
)


ROOT = Path("artifacts/p3_m01/reference_models")

CAL = Path(
    "results/p3_quantization/calibration/"
    "activation_statistics/activation_percentiles_exact_by_fold.csv"
)

OUT = Path(
    "results/p3_quantization/integer_ptq/validation"
)

LAYERS = {
    "mlp": [
        ("layers.0", "standardized_input", "fc1_relu"),
        ("layers.2", "fc1_relu", "fc2_relu"),
        ("layers.4", "fc2_relu", "output_linear"),
    ],
    "cnn": [
        ("conv.0", "standardized_input", "conv1_relu"),
        ("conv.2", "conv1_relu", "conv2_relu"),
        ("head.1", "conv2_relu", "dense_relu"),
        ("head.3", "dense_relu", "output_linear"),
    ],
}

I64MAX = (1 << 63) - 1
I64MIN = -(1 << 63)
I31MAX = (1 << 31) - 1


def signed_bits(bound):
    """Minimum signed two's-complement width supporting +/- bound."""

    return max(2, int(bound).bit_length() + 1)


def get_scales(cal, fold, model, bits, method):
    """Retrieve fold-specific activation quantization scales."""

    sub = cal[
        (cal.fold == fold) &
        (cal.model == model)
    ]

    expected = 4 if model == "mlp" else 5

    if len(sub) != expected:
        raise RuntimeError(
            f"Incomplete calibration: {model}, fold={fold}"
        )

    col = "absmax" if method == "max" else "abs_p999"

    return {
        r.layer: max(
            float(getattr(r, col)) / qmax(bits),
            1e-12
        )
        for r in sub.itertuples()
    }


def main():

    cal = pd.read_csv(CAL)

    records = []

    for model in ("mlp", "cnn"):

        for fold in range(1, 10):

            path = (
                ROOT /
                model /
                f"{model}_fold{fold}.pt"
            )

            ckpt = torch.load(
                path,
                map_location="cpu",
                weights_only=False,
            )

            state = ckpt["state_dict"]

            for bits in (8, 16):

                Q = qmax(bits)

                for method in ("max", "p999"):

                    scales = get_scales(
                        cal,
                        fold,
                        model,
                        bits,
                        method,
                    )

                    for layer, input_name, output_name in LAYERS[model]:

                        w = (
                            state[layer + ".weight"]
                            .detach()
                            .cpu()
                            .numpy()
                            .astype(np.float64)
                        )

                        b = (
                            state[layer + ".bias"]
                            .detach()
                            .cpu()
                            .numpy()
                            .astype(np.float64)
                        )

                        qw, sw = weight_quantize(w, bits)

                        sx = scales[input_name]
                        sy = scales[output_name]

                        for j in range(w.shape[0]):

                            # Conservative dot-product bound
                            # using actual quantized weights.

                            sum_abs_w = sum(
                                abs(int(z))
                                for z in qw[j].flat
                            )

                            dot_bound = int(Q) * sum_abs_w

                            # Integer bias:
                            #
                            # bq = round(b / (sx * sw))

                            real_bias = (
                                float(b[j]) /
                                (float(sx) * float(sw[j]))
                            )

                            if not math.isfinite(real_bias):
                                raise RuntimeError(
                                    "Nonfinite quantized bias"
                                )

                            bias_q = int(np.rint(real_bias))

                            bias_fits_i64 = (
                                I64MIN <= bias_q <= I64MAX
                            )

                            # Complete conservative accumulator bound:
                            #
                            # |A| <= Q * sum(|wq|) + |bq|

                            full_bound = (
                                dot_bound + abs(bias_q)
                            )

                            # Fixed-point requantization:
                            #
                            # ratio = sx * sw / sy
                            # ratio approximately M / 2**shift

                            ratio = (
                                float(sx) *
                                float(sw[j]) /
                                float(sy)
                            )

                            m, shift = fixedpoint_params(ratio)

                            multiplier_fits_q31 = (
                                0 < m <= I31MAX
                            )

                            product_bound = (
                                full_bound * int(m)
                            )

                            approximated_ratio = (
                                float(m) / (2 ** shift)
                            )

                            records.append({
                                "model": model,
                                "fold": fold,
                                "bits": bits,
                                "method": method,
                                "layer": layer,
                                "channel": j,
                                "fan_in": int(
                                    np.prod(w.shape[1:])
                                ),
                                "sx": sx,
                                "sw": float(sw[j]),
                                "sy": sy,
                                "quantized_bias": bias_q,
                                "dot_bound": dot_bound,
                                "accumulator_bound": full_bound,
                                "signed_accumulator_bits": signed_bits(
                                    full_bound
                                ),
                                "bias_fits_int64": bias_fits_i64,
                                "accumulator_fits_int64": (
                                    full_bound <= I64MAX
                                ),
                                "multiplier": m,
                                "shift": shift,
                                "scale_ratio": ratio,
                                "approximated_ratio": approximated_ratio,
                                "ratio_absolute_error": abs(
                                    ratio - approximated_ratio
                                ),
                                "multiplier_fits_q31": (
                                    multiplier_fits_q31
                                ),
                                "requant_product_bound": product_bound,
                                "requant_product_fits_int64": (
                                    product_bound <= I64MAX
                                ),
                            })

    OUT.mkdir(
        parents=True,
        exist_ok=True,
    )

    df = pd.DataFrame(records)

    detail = (
        OUT /
        "bias_inclusive_arithmetic_by_channel.csv"
    )

    df.to_csv(
        detail,
        index=False,
    )

    summary = (
        df.groupby(
            ["model", "bits", "method", "layer"],
            as_index=False,
        )
        .agg(
            max_accumulator_bound=(
                "accumulator_bound",
                "max",
            ),
            required_accumulator_bits=(
                "signed_accumulator_bits",
                "max",
            ),
            max_requant_product_bound=(
                "requant_product_bound",
                "max",
            ),
            max_ratio_absolute_error=(
                "ratio_absolute_error",
                "max",
            ),
            bias_int64_ok=(
                "bias_fits_int64",
                "all",
            ),
            accumulator_int64_ok=(
                "accumulator_fits_int64",
                "all",
            ),
            multiplier_q31_ok=(
                "multiplier_fits_q31",
                "all",
            ),
            requant_product_int64_ok=(
                "requant_product_fits_int64",
                "all",
            ),
        )
    )

    summary.to_csv(
        OUT / "bias_inclusive_arithmetic_summary.csv",
        index=False,
    )

    print("=" * 90)
    print("P3-M02.5-V2: BIAS-INCLUSIVE ARITHMETIC AUDIT")
    print("=" * 90)

    print(
        "Channel/configuration records:",
        len(df),
    )

    print(
        summary[
            [
                "model",
                "bits",
                "method",
                "layer",
                "required_accumulator_bits",
                "accumulator_int64_ok",
                "multiplier_q31_ok",
                "requant_product_int64_ok",
            ]
        ].to_string(index=False)
    )

    flags = [
        "bias_fits_int64",
        "accumulator_fits_int64",
        "multiplier_fits_q31",
        "requant_product_fits_int64",
    ]

    failed = df.loc[
        ~df[flags].all(axis=1)
    ]

    print()
    print(
        "Failed channel configurations:",
        len(failed),
    )

    if len(failed):

        print(
            failed[
                [
                    "model",
                    "fold",
                    "bits",
                    "method",
                    "layer",
                    "channel",
                ] + flags
            ].head(30).to_string(index=False)
        )

        print(
            "V2 AUDIT FAILED — do not freeze baseline"
        )

        raise SystemExit(1)

    print(
        "V2 BOUND AUDIT PASSED — "
        "runtime arithmetic and independent "
        "reference tests still required"
    )


if __name__ == "__main__":
    main()
