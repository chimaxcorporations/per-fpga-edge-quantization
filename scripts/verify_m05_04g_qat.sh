#!/usr/bin/env bash
set -euo pipefail

: "${N_SAMPLES:=32}"

BASE="results/p3_m05/qat_hardware/parameter_rom"
OUT="results/p3_m05/qat_hardware/rtl_verification"
TB="tb_mlp_int8_pipelined_v2_qat_layers"

mkdir -p "$OUT"

echo "=========================================="
echo "P3-M05-04G: QAT INT8 Pipeline V2"
echo "=========================================="

# Verify ROM files
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

echo "[1/4] Compiling RTL"

xvlog --sv \
    --work work \
    --log "$OUT/xvlog.log" \
    hardware/rtl/memory/parameter_rom_sync.v \
    hardware/rtl/memory/activation_ram_sync.v \
    hardware/rtl/inference/neuron_int8_pipelined_v2.v \
    hardware/rtl/inference/mlp_int8_pipelined_v2.v \
    hardware/tb/tb_mlp_int8_pipelined_v2_qat_layers.v

echo "[2/4] Elaborating testbench"

xelab \
    work.$TB \
    -s qat_pipeline_v2_sim \
    -generic_top "N_SAMPLES=$N_SAMPLES" \
    --log "$OUT/xelab.log"

echo "[3/4] Running simulation"

xsim qat_pipeline_v2_sim \
    -runall \
    -log "$OUT/xsim.log" \
    2>&1 | tee "$OUT/verification.log"

echo "[4/4] Checking results"

if grep -Eq \
    'FAIL:|FATAL_ERROR|Fatal:|Simulation failed' \
    "$OUT/verification.log"
then
    echo "FAIL: RTL simulation"
    exit 1
fi

if ! grep -q \
    "PASS: P3-M05-04G QAT intermediate-layer RTL equivalence $N_SAMPLES samples" \
    "$OUT/verification.log"
then
    echo "FAIL: Final PASS marker missing"
    exit 1
fi

COUNT=$(
    grep -c '^PASS: sample=' \
    "$OUT/verification.log" || true
)

if [ "$COUNT" -ne "$N_SAMPLES" ]; then
    echo "FAIL: Expected $N_SAMPLES samples, got $COUNT"
    exit 1
fi

sha256sum \
    hardware/rtl/inference/neuron_int8_pipelined_v2.v \
    hardware/rtl/inference/mlp_int8_pipelined_v2.v \
    hardware/tb/tb_mlp_int8_pipelined_v2_qat_layers.v \
    "$BASE"/*.memh \
    > "$OUT/sha256_manifest.txt"

echo
echo "=========================================="
echo "PASS: P3-M05-04G QAT RTL verification"
echo "Samples: $N_SAMPLES"
echo "Neuron comparisons: $((N_SAMPLES * 97))"
echo "=========================================="
