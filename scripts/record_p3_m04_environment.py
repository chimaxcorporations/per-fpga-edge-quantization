#!/usr/bin/env python3
"""
P3-M04-01R: Reproducible FPGA Development Environment

Records:
- Host operating system and Python version
- Git commit and working-tree status
- Vivado and Docker versions
- Docker image identifier
- Containerized RTL tool versions
- Target FPGA
- SHA-256 hashes of experiment files

Does not collect proprietary license information.
"""

import datetime
import hashlib
import json
import pathlib
import platform
import subprocess


ROOT = pathlib.Path(__file__).resolve().parents[1]

OUT = ROOT / "results/p3_m04/toolchain/environment.json"

FPGA_PART = "xc7a100tcsg324-1"

RTL_IMAGE = "per-fpga-rtl:ubuntu24.04"


FILES = [
    "hardware/rtl/common/p3_toolchain_test.v",
    "hardware/tb/tb_p3_toolchain_test.v",
    "hardware/scripts/p3_toolchain_test.tcl",
    "hardware/constraints/clock_100mhz.xdc",
    "docker/Dockerfile.rtl",
    "docker/compose.yaml",
    "Makefile",
    "REPRODUCIBILITY.md",
    "scripts/record_p3_m04_environment.py",
]


def command(*args, timeout=60):
    """Execute a command and capture its result."""

    try:
        result = subprocess.run(
            args,
            cwd=ROOT,
            capture_output=True,
            text=True,
            timeout=timeout,
            check=False,
        )

        return {
            "returncode": result.returncode,
            "output": result.stdout.strip(),
            "stderr": result.stderr.strip(),
        }

    except (FileNotFoundError, subprocess.TimeoutExpired) as error:
        return {
            "error": str(error),
        }


def sha256(path):
    """Calculate the SHA-256 hash of a file."""

    hasher = hashlib.sha256()

    with path.open("rb") as file:
        for block in iter(
            lambda: file.read(1024 * 1024),
            b"",
        ):
            hasher.update(block)

    return hasher.hexdigest()


def container_tool_version(command_args):
    """Execute a tool inside the RTL Docker container."""

    return command(
        "docker",
        "run",
        "--rm",
        RTL_IMAGE,
        *command_args,
        timeout=120,
    )


def docker_image_id():
    """Retrieve the identifier of the locally built RTL image."""

    return command(
        "docker",
        "image",
        "inspect",
        RTL_IMAGE,
        "--format",
        "{{.Id}}",
    )


def collect_metadata():
    """Collect experiment reproducibility information."""

    record = {
        "project": (
            "Hardware-Aware Quantization of Packet Error "
            "Rate Prediction Models for FPGA-Based Edge Computing"
        ),

        "milestone": "P3-M04-01R",

        "timestamp_utc": (
            datetime.datetime.now(
                datetime.timezone.utc
            ).isoformat()
        ),

        "host": {
            "platform": platform.platform(),
            "python": platform.python_version(),
        },

        "fpga": {
            "part": FPGA_PART,
            "target_clock_mhz": 100,
        },

        "git": {
            "commit": command(
                "git",
                "rev-parse",
                "HEAD",
            ),

            "status": command(
                "git",
                "status",
                "--porcelain",
            ),
        },

        "host_tools": {
            "vivado": command(
                "vivado",
                "-version",
            ),

            "docker": command(
                "docker",
                "--version",
            ),
        },

        "docker": {
            "image": RTL_IMAGE,

            "image_id": docker_image_id(),

            "tools": {
                "verilator": container_tool_version(
                    ["verilator", "--version"]
                ),

                "yosys": container_tool_version(
                    ["yosys", "-V"]
                ),

                "iverilog": container_tool_version(
                    ["iverilog", "-V"]
                ),
            },
        },

        "files_sha256": {
            filename: sha256(ROOT / filename)
            for filename in FILES
            if (ROOT / filename).is_file()
        },
    }

    return record


def main():

    record = collect_metadata()

    OUT.parent.mkdir(
        parents=True,
        exist_ok=True,
    )

    OUT.write_text(
        json.dumps(record, indent=2) + "\n",
        encoding="utf-8",
    )

    print(f"Metadata written: {OUT}")

    print(
        "P3-M04-01R environment metadata: "
        "COLLECTION COMPLETE"
    )


if __name__ == "__main__":
    main()
