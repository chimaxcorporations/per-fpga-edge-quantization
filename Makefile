SHELL := /bin/bash
RTL_IMAGE ?= per-fpga-rtl:ubuntu24.04
DOCKER := docker run --rm --user $(shell id -u):$(shell id -g) -e HOME=/tmp -v $(CURDIR):/workspace:Z -w /workspace $(RTL_IMAGE)
VIVADO ?= vivado
.PHONY: docker-build rtl-test rtl-lint rtl-synth-check vivado-test metadata all-checks

docker-build:
	docker build -f docker/Dockerfile.rtl -t $(RTL_IMAGE) .

rtl-test:
	mkdir -p results/p3_m04/simulation
	$(DOCKER) bash -c 'iverilog -g2005 -s tb_p3_toolchain_test -o /tmp/p3_smoke.vvp hardware/rtl/common/p3_toolchain_test.v hardware/tb/tb_p3_toolchain_test.v && vvp /tmp/p3_smoke.vvp'

rtl-lint:
	$(DOCKER) verilator --lint-only -Wall -Wno-fatal --top-module p3_toolchain_test hardware/rtl/common/p3_toolchain_test.v

rtl-synth-check:
	$(DOCKER) yosys -p 'read_verilog hardware/rtl/common/p3_toolchain_test.v; hierarchy -check -top p3_toolchain_test; proc; opt; check -assert; stat'

vivado-test:
	mkdir -p results/p3_m04/toolchain
	$(VIVADO) -mode batch -source hardware/scripts/p3_toolchain_test.tcl -log results/p3_m04/toolchain/vivado_synthesis.log -journal results/p3_m04/toolchain/vivado_synthesis.jou
	test -s results/p3_m04/toolchain/synthesis_utilization.rpt
	test -s results/p3_m04/toolchain/p3_toolchain_test_synth.dcp

metadata:
	python3 scripts/record_p3_m04_environment.py

all-checks: rtl-test rtl-lint rtl-synth-check vivado-test metadata
