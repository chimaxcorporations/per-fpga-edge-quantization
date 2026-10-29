#!/usr/bin/env bash
set -euo pipefail
: "${N_SAMPLES:=2}"
BASE=results/p3_m04/mlp_fold1_parameter_rom
for f in fc1_{weights,bias,multiplier,shift}.memh fc2_{weights,bias,multiplier,shift}.memh output_{weights,bias,multiplier,shift}.memh inputs_int8.memh output_golden_int8.memh; do
  test -s "$BASE/$f" || { echo "FAIL: missing $BASE/$f"; exit 1; }
done
mkdir -p results/p3_m04/mlp_fold1_controller
iverilog -g2012 -s tb_mlp_int8_sequential -Ptb_mlp_int8_sequential.N_SAMPLES="$N_SAMPLES" \
 -o results/p3_m04/mlp_fold1_controller/sim.vvp \
 hardware/rtl/memory/parameter_rom_sync.v \
 hardware/rtl/memory/activation_ram_sync.v \
 hardware/rtl/inference/neuron_int8_serial.v \
 hardware/rtl/inference/mlp_int8_sequential.v \
 hardware/tb/tb_mlp_int8_sequential.v
vvp -n results/p3_m04/mlp_fold1_controller/sim.vvp
verilator --lint-only -Wno-fatal --top-module mlp_int8_sequential \
 hardware/rtl/memory/parameter_rom_sync.v \
 hardware/rtl/memory/activation_ram_sync.v \
 hardware/rtl/inference/neuron_int8_serial.v \
 hardware/rtl/inference/mlp_int8_sequential.v
printf 'PASS: P3-M04-04C simulation and lint completed\n'
