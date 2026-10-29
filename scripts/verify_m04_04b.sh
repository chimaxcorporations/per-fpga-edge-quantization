#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
ROM_DIR="${ROM_DIR:-results/p3_m04/mlp_fold1_parameter_rom}"
RTL=hardware/rtl/memory
TB=hardware/tb
for layer in fc1 fc2 output; do
 case "$layer" in fc1) nin=40; nout=64;; fc2) nin=64; nout=32;; output) nin=32; nout=1;; esac
 for field in weights bias multiplier shift; do
  case "$field" in weights) depth=$((nin*nout)); width=8;; bias|multiplier) depth=$nout; width=32;; shift) depth=$nout; width=8;; esac
  file="$ROM_DIR/${layer}_${field}.memh"
  test -s "$file" || { echo "FAIL: missing $file"; exit 1; }
  iverilog -g2012 -s tb_parameter_rom_sync \
    -Ptb_parameter_rom_sync.WIDTH="$width" -Ptb_parameter_rom_sync.DEPTH="$depth" \
    -Ptb_parameter_rom_sync.INIT_FILE="\"$file\"" \
    -Ptb_parameter_rom_sync.GOLDEN_FILE="\"$file\"" \
    -Ptb_parameter_rom_sync.ROM_NAME="\"${layer}_${field}\"" \
    -o /tmp/p3_m04_04b_rom.vvp "$RTL/parameter_rom_sync.v" "$TB/tb_parameter_rom_sync.v"
  vvp -n /tmp/p3_m04_04b_rom.vvp
 done
done
for depth in 40 64 32; do
  iverilog -g2012 -s tb_activation_ram_sync -Ptb_activation_ram_sync.DEPTH="$depth" \
    -o /tmp/p3_m04_04b_ram.vvp "$RTL/activation_ram_sync.v" "$TB/tb_activation_ram_sync.v"
  vvp -n /tmp/p3_m04_04b_ram.vvp
done
verilator --lint-only -Wall -Wno-fatal --top-module parameter_rom_sync "$RTL/parameter_rom_sync.v"
verilator --lint-only -Wall -Wno-fatal --top-module activation_ram_sync "$RTL/activation_ram_sync.v"
yosys -Q -T -p "read_verilog $RTL/parameter_rom_sync.v $RTL/activation_ram_sync.v; hierarchy -check; proc; check" >/tmp/p3_m04_04b_yosys.log
if grep -Eq '(^| )[1-9][0-9]* problems' /tmp/p3_m04_04b_yosys.log; then echo 'FAIL: Yosys check'; exit 1; fi
echo 'PASS: P3-M04-04B all 12 parameter ROMs, 3 activation RAMs; lint and structural checks completed'
