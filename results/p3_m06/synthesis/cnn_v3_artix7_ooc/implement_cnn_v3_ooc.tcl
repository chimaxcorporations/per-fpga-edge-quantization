# P3-M06-04C: post-synthesis OOC physical implementation, Vivado 2025.2
# Execute from the existing cnn_v3_artix7_ooc synthesis workspace.
set workdir [file normalize [pwd]]
set reportdir [file join $workdir reports p3_m06_04c]
file mkdir $reportdir
set checkpoint [file join $workdir reports cnn_v3_post_synth.dcp]
if {![file exists $checkpoint]} { error "Missing verified synthesis checkpoint: $checkpoint" }
puts "INFO: Opening checkpoint $checkpoint"
open_checkpoint $checkpoint
set expected_part xc7a100tcsg324-1
set actual_part [get_property PART [current_design]]
if {$actual_part ne $expected_part} { error "Part mismatch: expected $expected_part, found $actual_part" }
set clock_objs [get_clocks -quiet clk]
if {[llength $clock_objs] == 0} {
    puts "WARNING: clk constraint missing from checkpoint; applying 10 ns clock"
    create_clock -name clk -period 10.000 [get_ports clk]
} else {
    set period [get_property PERIOD [get_clocks clk]]
    if {abs($period - 10.0) > 0.001} { error "Unexpected clk period $period; expected 10.000 ns" }
}
puts "INFO: Device=$actual_part, clock period=[get_property PERIOD [get_clocks clk]] ns"
# Explicitly retain OOC semantics. No board-specific pins, no bitstream.
puts "INFO: Running opt_design"
opt_design
write_checkpoint -force [file join $reportdir cnn_v3_post_opt.dcp]
report_utilization -file [file join $reportdir utilization_post_opt.rpt]
puts "INFO: Running place_design"
place_design
write_checkpoint -force [file join $reportdir cnn_v3_post_place.dcp]
report_timing_summary -file [file join $reportdir timing_post_place.rpt]
puts "INFO: Running phys_opt_design"
phys_opt_design
write_checkpoint -force [file join $reportdir cnn_v3_post_phys_opt.dcp]
puts "INFO: Running route_design"
route_design
write_checkpoint -force [file join $reportdir cnn_v3_post_route.dcp]
report_utilization -file [file join $reportdir utilization_post_route.rpt]
report_utilization -hierarchical -file [file join $reportdir utilization_hierarchical_post_route.rpt]
report_timing_summary -delay_type min_max -file [file join $reportdir timing_post_route.rpt]
report_timing -delay_type max -max_paths 20 -path_type full_clock_expanded -file [file join $reportdir timing_paths_post_route.rpt]
report_timing -delay_type min -max_paths 20 -path_type full_clock_expanded -file [file join $reportdir hold_paths_post_route.rpt]
report_drc -file [file join $reportdir drc_post_route.rpt]
report_clock_utilization -file [file join $reportdir clock_utilization_post_route.rpt]
set setup_paths [get_timing_paths -delay_type max -max_paths 1 -quiet]
if {[llength $setup_paths] > 0} {
    set worst_setup [get_property SLACK [lindex $setup_paths 0]]
    puts "RESULT: POST_ROUTE_WNS_NS=$worst_setup"
} else {
    puts "WARNING: No constrained setup path returned; inspect timing report."
}
set hold_paths [get_timing_paths -delay_type min -max_paths 1 -quiet]
if {[llength $hold_paths] > 0} {
    puts "RESULT: POST_ROUTE_WHS_NS=[get_property SLACK [lindex $hold_paths 0]]"
}
puts "RESULT: P3-M06-04C implementation commands completed; review timing, DRC and constraints before declaring PASS."
close_design
