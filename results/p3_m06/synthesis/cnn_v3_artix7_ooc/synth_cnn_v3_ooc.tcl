# P3-M06-04A: isolated synthesis-only experiment; NO post-route timing claim.
set workdir [file normalize [pwd]]
set part xc7a100tcsg324-1
create_project cnn_v3_ooc [file join $workdir vivado_project] -part $part -force
set_property target_language Verilog [current_project]
set rtl_dir [file join $workdir rtl_stage]
set rtl_files [list \
  [file join $rtl_dir parameter_rom_sync.v] \
  [file join $rtl_dir activation_ram_sync.v] \
  [file join $rtl_dir neuron_int8_configurable.v] \
  [file join $rtl_dir cnn_int8_pipelined_v3.v]]
foreach f $rtl_files {
    if {![file exists $f]} { error "Missing staged RTL: $f" }
    add_files -norecurse $f
}
set_property top cnn_int8_pipelined_v3 [current_fileset]
update_compile_order -fileset sources_1
# Clock constraint is for synthesis reporting; board pin and IO constraints are intentionally absent.
set xdc_file [file join $workdir clock_100mhz.xdc]
set fh [open $xdc_file w]
puts $fh {create_clock -name clk -period 10.000 [get_ports clk]}
close $fh
add_files -fileset constrs_1 -norecurse $xdc_file
set_property used_in_synthesis true [get_files $xdc_file]
set_property used_in_implementation true [get_files $xdc_file]
file mkdir [file join $workdir reports]
# Synth OOC removes top-level I/O buffers and does not require a board pinout.
synth_design -top cnn_int8_pipelined_v3 -part $part -mode out_of_context -flatten_hierarchy none
write_checkpoint -force [file join $workdir reports cnn_v3_post_synth.dcp]
report_utilization -hierarchical -file [file join $workdir reports utilization_hierarchical.rpt]
report_utilization -file [file join $workdir reports utilization.rpt]
report_timing_summary -file [file join $workdir reports timing_synthesis.rpt]
report_drc -file [file join $workdir reports drc_synthesis.rpt]
if {[llength [info commands report_ram_utilization]]} {
  report_ram_utilization -file [file join $workdir reports ram_utilization.rpt]
}
puts "P3-M06-04A: SYNTHESIS COMMAND COMPLETED; inspect reports and warnings before PASS."
close_project
