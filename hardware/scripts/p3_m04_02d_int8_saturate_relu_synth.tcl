set target_part "xc7a100tcsg324-1"
set outdir "results/p3_m04/int8_saturate_relu"
file mkdir $outdir
if {[llength [get_parts -quiet $target_part]] == 0} {
    error "FPGA device unavailable: $target_part"
}
read_verilog hardware/rtl/common/int8_saturate_relu.v
synth_design -top int8_saturate_relu -part $target_part
report_utilization -file "$outdir/synthesis_utilization.rpt"
write_checkpoint -force "$outdir/int8_saturate_relu_synth.dcp"
puts "P3-M04-02D VIVADO SYNTHESIS: PASS"
