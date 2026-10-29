#!/usr/bin/env bash
set -euo pipefail

: "${N_SAMPLES:=32}"

BASE="results/p3_m04/mlp_fold1_parameter_rom"
OUT="results/p3_m04/mlp_pipeline_verification"

mkdir -p "$OUT"

echo "=========================================="
echo "P3-M04-05D"
echo "Pipelined INT8 MLP verification"
echo "=========================================="

# Check required reference data.
for f in \
    fc1_{weights,bias,multiplier,shift}.memh \
    fc2_{weights,bias,multiplier,shift}.memh \
    output_{weights,bias,multiplier,shift}.memh \
    inputs_int8.memh \
    fc1_golden_int8.memh \
    fc2_golden_int8.memh \
    output_golden_int8.memh
do
    test -s "$BASE/$f" || {
        echo "FAIL: Missing $BASE/$f"
        exit 1
    }
done

echo "[1/3] Compiling pipelined MLP"

iverilog -g2012 \
    -s tb_mlp_int8_pipelined_layers \
    -Ptb_mlp_int8_pipelined_layers.N_SAMPLES="$N_SAMPLES" \
    -o "$OUT/sim_pipelined.vvp" \
    hardware/rtl/memory/parameter_rom_sync.v \
    hardware/rtl/memory/activation_ram_sync.v \
    hardware/rtl/inference/neuron_int8_pipelined.v \
    hardware/rtl/inference/mlp_int8_pipelined.v \
    hardware/tb/tb_mlp_int8_pipelined_layers.v

echo "[2/3] Running 32-sample golden-vector verification"

vvp -n "$OUT/sim_pipelined.vvp" \
    | tee "$OUT/pipelined_verification.log"

echo "[3/3] Recording reproducibility information"

sha256sum \
    hardware/rtl/inference/neuron_int8_pipelined.v \
    hardware/rtl/inference/mlp_int8_pipelined.v \
    hardware/tb/tb_mlp_int8_pipelined_layers.v \
    "$BASE"/*.memh \
    > "$OUT/pipelined_sha256_manifest.txt"

iverilog -V 2>&1 | head -1 > "$OUT/tool_versions.txt"

echo "PASS: P3-M04-05D pipelined MLP verification"
