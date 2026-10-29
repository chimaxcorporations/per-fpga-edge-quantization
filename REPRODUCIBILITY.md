# P3-M04-01R: Reproducible RTL Toolchain

## Scope
This bundle supplements the existing Project 3 repository. It does not contain the existing `hardware/rtl/common/p3_toolchain_test.v` file; retain the already synthesized Verilog-2001 source in your repository. Do not replace an existing modified `Makefile` or other file without reviewing differences.

## Host prerequisites
- Linux with Docker and a working Docker daemon.
- Vivado 2025.2 installed separately for the Artix-7 part `xc7a100tcsg324-1`.
- Vivado on PATH (`source ~/Projects/utilities/source_vivado.sh` on the original workstation).
- Python 3 for provenance generation.

## Open-source toolchain
Build: `make docker-build`

Run signed multiplier simulation: `make rtl-test`

Lint: `make rtl-lint`

Technology-independent Yosys synthesis: `make rtl-synth-check`

The Dockerfile uses Rocky Linux 9.5 and distribution packages. Package resolution is not fully immutable; record resolved versions and pin an image digest for publication-grade reruns. If packages are unavailable from enabled repositories, adjust and document the package source before claiming the container works.

## Proprietary FPGA synthesis
Run `make vivado-test` in a shell with Vivado 2025.2 available. It creates the synthesized checkpoint and utilization report. Vivado binaries and licenses are NOT redistributed. The Tcl script checks the target part and fails on errors.

## Metadata
Run `make metadata`. It writes `results/p3_m04/toolchain/environment.json` with Git information, tool versions, and input file hashes. Capture container tool versions separately, e.g. `docker run --rm per-fpga-rtl:rocky9.5 verilator --version`.

## Interpretation
The 100 MHz XDC is supplied but NOT applied by the smoke-test synthesis. The smoke test proves RTL synthesis, not timing closure, FPGA implementation, model correctness, or power. FPGA-level results require a later placement/routing flow with timing constraints.
