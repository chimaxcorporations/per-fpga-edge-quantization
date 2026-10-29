#!/usr/bin/env bash
set -euo pipefail
: "${N_SAMPLES:=32}"
BASE=results/p3_m04/mlp_fold1_parameter_rom
OUT=results/p3_m04/mlp_fold1_verification
mkdir -p "$OUT"
for f in fc1_{weights,bias,multiplier,shift}.memh fc2_{weights,bias,multiplier,shift}.memh output_{weights,bias,multiplier,shift}.memh inputs_int8.memh fc1_golden_int8.memh fc2_golden_int8.memh output_golden_int8.memh; do
 test -s "$BASE/$f" || { echo "FAIL missing $BASE/$f"; exit 1; }
done
iverilog -g2012 -s tb_mlp_int8_sequential_layers -Ptb_mlp_int8_sequential_layers.N_SAMPLES="$N_SAMPLES" \
 -o "$OUT/sim.vvp" \
 hardware/rtl/memory/parameter_rom_sync.v \
 hardware/rtl/memory/activation_ram_sync.v \
 hardware/rtl/inference/neuron_int8_serial.v \
 hardware/rtl/inference/mlp_int8_sequential.v \
 hardware/tb/tb_mlp_int8_sequential_layers.v
vvp -n "$OUT/sim.vvp"
verilator --lint-only -Wno-fatal --top-module mlp_int8_sequential \
 hardware/rtl/memory/parameter_rom_sync.v \
 hardware/rtl/memory/activation_ram_sync.v \
 hardware/rtl/inference/neuron_int8_serial.v \
 hardware/rtl/inference/mlp_int8_sequential.v
sha256sum hardware/rtl/inference/{neuron_int8_serial,mlp_int8_sequential}.v "$BASE"/*.memh > "$OUT/sha256_manifest.txt"
iverilog -V | head -1 > "$OUT/tool_versions.txt"
verilator --version >> "$OUT/tool_versions.txt"
echo "PASS: P3-M04-04D intermediate-layer equivalence, lint, source manifest"
