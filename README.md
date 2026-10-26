per-fpga-edge-quantization/
│
├── README.md
├── .gitignore
├── requirements.txt
├── pyproject.toml
│
├── configs/
│   ├── models.yaml
│   ├── quantization.yaml
│   └── fpga_targets.yaml
│
├── data/
│   └── README.md
│
├── models/
│   ├── fp32/
│   ├── int16/
│   └── int8/
│
├── src/
│   └── per_fpga/
│       ├── baseline/
│       ├── quantization/
│       ├── evaluation/
│       └── hardware/
│
├── scripts/
│   ├── recover_models.py
│   ├── verify_baseline.py
│   └── compare_models.py
│
├── hls/
│   ├── ridge/
│   ├── mlp/
│   ├── cnn/
│   └── histgb/
│
├── verification/
│   ├── test_vectors/
│   ├── reference_outputs/
│   └── rtl_tests/
│
├── synthesis/
│   ├── scripts/
│   ├── constraints/
│   └── reports/
│
├── results/
│   ├── baseline/
│   ├── quantization/
│   ├── resources/
│   ├── timing/
│   └── power/
│
├── figures/
│
├── manuscript/
│
├── tests/
│
└── docs/
    ├── project_plan.md
    ├── model_selection.md
    └── reproducibility.md
