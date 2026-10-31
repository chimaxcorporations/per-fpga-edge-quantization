P3-M08-05 publication figure inputs
Accuracy: results/p3_qat/analysis/int8/max/tables/aggregate_metrics.csv
Paired comparisons: results/p3_qat/analysis/int8/max/tables/paired_difference_summary.csv
Hardware: post-route reports audited in P3-M08-04, Fold 1 only.
MLP PTQ: results/p3_m04/mlp_fold1_pipelined_v2_timing/T6_107p5MHz/
MLP QAT: results/p3_m05/qat_hardware/mlp_pipelined_v2_timing/T1_107p5MHz/
CNN QAT: results/p3_m06/synthesis/cnn_v3_artix7_ooc/reports/p3_m06_05/
Fig 1 error bars: standard deviation across nine folds (not confidence intervals).
Fig 2 intervals: descriptive, unadjusted paired-t 95% intervals.
Fig 4 mixes nine-fold software accuracy and Fold 1 routed implementation latency; clock rates differ (MLP 107.5 MHz, CNN 100 MHz).
Post-route timing excludes complete external I/O timing constraints.
No physical FPGA measurements; CNN SDF timing simulation unresolved.
