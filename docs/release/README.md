# Project 3 — Reproducibility Package

## Project

Hardware-Aware Quantization of Packet Error Rate Prediction
Models for FPGA-Based Edge Computing

## Scope

This release supports verification of FP32 reference models,
INT8/INT16 post-training quantization, INT8 quantization-aware
training evaluation, and selected FPGA implementations.

## Numerical Reproducibility

The following verification results were obtained:

- FP32 checkpoint equivalence: 36/36 PASS
- PTQ prediction reproduction: 144/144 PASS
- QAT prediction reproduction: 18/18 PASS
- QAT metrics reproduction: 18/18 PASS

PTQ and QAT evaluation reproduction used archived reference
vectors, calibration statistics, and model checkpoints.

Independent retraining of the FP32 and QAT models is outside
the verified reproduction scope.

## FPGA Implementation

Target device: Xilinx Artix-7 XC7A100T-CSG324-1

Tool: Vivado 2025.2

Selected implementations:

- MLP INT8 PTQ
- MLP INT8 QAT
- CNN INT8 QAT

The release includes supporting RTL, synthesis reports,
timing reports, and simulation evidence.

The timing analysis establishes constrained internal timing
performance. Complete board-level I/O timing closure has
not been demonstrated.

## Hardware Validation

No physical FPGA board was used.

Resource utilization and timing results are derived from
FPGA implementation reports.

Functional verification was performed through simulation.

Physical power consumption was not measured.

## Reproduction Environment

RTL toolchain:
- Dockerfile: docker/Dockerfile.rtl
- Makefile targets: docker-build, rtl-lint, rtl-synth-check,
  rtl-test, metadata

ML environment:
- Python 3.12.15
- PyTorch 2.14.1+cu130
- NumPy 2.5.4
- pandas 3.0.6
- scikit-learn 1.9.1

The complete recorded Python package inventory is available
in docs/release/audit/ml_pip_freeze.txt.

The original ML Docker image was locally available during
verification. Its public distribution and independent rebuild
have not yet been established.

## Reproducibility Evidence

See:

- docs/release/audit/p3_m08_09j_reproduction_results.json
- docs/release/audit/qat_checkpoint_sha256.txt
- docs/release/audit/ptq_postrerun_sha256.txt
- docs/release/P3_M08_09J_RTL_TOOLCHAIN_VALIDATION.md

The PTQ hash manifest represents a post-rerun baseline,
not a verified pre-rerun baseline.

## Limitations

1. Complete FP32 and QAT training reproduction was not verified.
2. Calibration-statistics generation was not independently reproduced.
3. No physical FPGA validation was performed.
4. Full CNN post-route SDF simulation remains unresolved.
5. Board-level I/O timing closure was not demonstrated.
6. No physical power measurements were performed.
