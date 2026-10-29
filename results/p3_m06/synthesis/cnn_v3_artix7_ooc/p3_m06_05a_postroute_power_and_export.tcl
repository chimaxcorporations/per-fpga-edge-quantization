# P3-M06-05A: post-route power baseline and timing-netlist export.
# Uses existing fully routed OOC DCP. Does not alter verified RTL or DCP.
set root [file normalize [pwd]]
set input_dcp [file join $root reports p3_m06_04c cnn_v3_post_route.dcp]
set out [file join $root reports p3_m06_05]
file mkdir $out
if {![file exists $input_dcp]} {error "Missing routed DCP: $input_dcp"}
open_checkpoint $input_dcp
if {[get_property PART [current_design]] ne "xc7a100tcsg324-1"} {error "Unexpected FPGA part"}
set clks [get_clocks -quiet clk]
if {[llength $clks] == 0} {error "Missing clk timing constraint"}
set period [get_property PERIOD [get_clocks clk]]
if {abs($period - 10.0) > 0.001} {error "Unexpected clock period $period"}
puts "INFO: Loaded post-route checkpoint, clk=$period ns"
report_timing_summary -delay_type min_max -file [file join $out timing_post_route_confirm.rpt]
report_utilization -file [file join $out utilization_post_route_confirm.rpt]
report_route_status -file [file join $out route_status.rpt]
# Vectorless power is a provisional baseline, not workload-based power.
puts "INFO: Generating VECTORLESS power estimate (not SAIF-driven)"
report_power -file [file join $out power_vectorless.rpt]
# Export timing simulation artifacts. Any unsupported command/version issue is recorded.
set exports_ok 1
if {[catch {write_verilog -force -mode timesim -sdf_anno true [file join $out cnn_v3_post_route_timesim.v]} err]} {
    puts "WARNING: write_verilog timesim failed: $err"
    set exports_ok 0
}
if {[catch {write_sdf -force [file join $out cnn_v3_post_route.sdf]} err]} {
    puts "WARNING: write_sdf failed: $err"
    set exports_ok 0
}
if {$exports_ok} {
    puts "RESULT: P3_M06_05A_TIMING_EXPORT=PASS"
} else {
    puts "RESULT: P3_M06_05A_TIMING_EXPORT=INCOMPLETE"
}
puts "RESULT: P3_M06_05A_VECTORLESS_POWER_REPORT=GENERATED"
puts "WARNING: OOC HD.CLK_SRC and HD.PARTPIN_LOCS limitations persist; no board-level timing/power claim."
puts "WARNING: Timing netlist export does not constitute functional verification."
close_design
