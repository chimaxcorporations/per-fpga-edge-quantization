set target_part "xc7a100tcsg324-1"
set outdir "results/p3_m04/neuron_int8_serial"
file mkdir $outdir
if {[llength [get_parts -quiet $target_part]] == 0} { error "FPGA device unavailable: $target_part" }
read_verilog hardware/rtl/inference/neuron_int8_serial.v
synth_design -top neuron_int8_serial -part $target_part
report_utilization -file "$outdir/synthesis_utilization.rpt"
write_checkpoint -force "$outdir/neuron_int8_serial_synth.dcp"
puts "P3-M04-03A VIVADO SYNTHESIS: PASS"
