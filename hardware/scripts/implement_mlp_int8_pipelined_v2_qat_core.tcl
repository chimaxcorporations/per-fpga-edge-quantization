# P3-M05-05B: Pipelined MLP post-route implementation and timing
# Device: Artix-7 xc7a100tcsg324-1

# Vivado batch-mode arguments
if {![info exists argv]} {
    set argv {}
}

puts "DEBUG_ARGV: $argv"

if {[llength $argv] < 2} {
    puts "INFO: Using default experiment parameters"
    set period_ns 20.000
    set experiment_id T1_50MHz
} else {
    set period_ns [lindex $argv 0]
    set experiment_id [lindex $argv 1]
}

if {![string is double -strict $period_ns] || $period_ns <= 0} {
    error "Clock period must be a positive number"
}

set root_dir [pwd]
set checkpoint [file join $root_dir \
    results/p3_m05/qat_hardware/mlp_pipelined_v2_synthesis/mlp_int8_pipelined_v2_synth.dcp]

set output_dir [file join $root_dir \
    results/p3_m05/qat_hardware/mlp_pipelined_v2_timing/$experiment_id]

file mkdir $output_dir

if {![file exists $checkpoint]} {
    error "Missing synthesis checkpoint: $checkpoint"
}

puts "EXPERIMENT: $experiment_id"
puts "CLOCK_PERIOD_NS: $period_ns"
puts "TARGET_FREQUENCY_MHZ: [expr {1000.0 / $period_ns}]"

open_checkpoint $checkpoint

# Primary clock
set clock_port [get_ports -quiet clk]

if {[llength $clock_port] != 1} {
    error "Expected exactly one top-level clock port named clk"
}

create_clock \
    -name sys_clk \
    -period $period_ns \
    $clock_port

# Interface timing assumptions:
# External input arrival: 2 ns after clock edge.
# External output required: 2 ns before next clock edge.
#
# These are experimental assumptions, not board measurements.

# Core-only timing characterization.
# External interface paths are excluded from this experiment.
# Internal register-to-register timing remains constrained.

set input_ports [get_ports -quiet -filter {DIRECTION == IN && NAME != clk}]
set output_ports [get_ports -quiet -filter {DIRECTION == OUT}]

if {[llength $input_ports] > 0} {
    set_false_path -from $input_ports
}

if {[llength $output_ports] > 0} {
    set_false_path -to $output_ports
}

write_xdc -force \
    [file join $output_dir constraints.xdc]

# Placement and routing
opt_design
place_design
phys_opt_design
route_design

# Timing reports
report_timing_summary \
    -delay_type min_max \
    -report_unconstrained \
    -file [file join $output_dir timing_summary.rpt]

report_timing \
    -delay_type max \
    -max_paths 20 \
    -file [file join $output_dir critical_paths_setup.rpt]

report_timing \
    -delay_type min \
    -max_paths 20 \
    -file [file join $output_dir critical_paths_hold.rpt]

check_timing \
    -verbose \
    -file [file join $output_dir check_timing.rpt]

# Resource and routing reports
report_utilization \
    -file [file join $output_dir utilization_postroute.rpt]

report_route_status \
    -file [file join $output_dir route_status.rpt]

report_drc \
    -file [file join $output_dir drc_postroute.rpt]

write_checkpoint -force \
    [file join $output_dir mlp_int8_pipelined_v2_routed.dcp]

# Record worst setup and hold path slack.
set setup_paths [get_timing_paths \
    -delay_type max \
    -max_paths 1]

set hold_paths [get_timing_paths \
    -delay_type min \
    -max_paths 1]

set setup_slack "UNAVAILABLE"
set hold_slack "UNAVAILABLE"

if {[llength $setup_paths] > 0} {
    set setup_slack [get_property SLACK \
        [lindex $setup_paths 0]]
}

if {[llength $hold_paths] > 0} {
    set hold_slack [get_property SLACK \
        [lindex $hold_paths 0]]
}

set summary_file [open \
    [file join $output_dir experiment_summary.txt] w]

puts $summary_file "Experiment: $experiment_id"
puts $summary_file "Clock period (ns): $period_ns"
puts $summary_file "Target frequency (MHz): [expr {1000.0 / $period_ns}]"
puts $summary_file "Worst setup path slack (ns): $setup_slack"
puts $summary_file "Worst hold path slack (ns): $hold_slack"
puts $summary_file "Interface timing: EXCLUDED"


puts $summary_file "Inference cycles (RTL): 25803"

close $summary_file

puts "SETUP_SLACK_NS: $setup_slack"
puts "HOLD_SLACK_NS: $hold_slack"
puts "IMPLEMENTATION_COMPLETED: $experiment_id"
