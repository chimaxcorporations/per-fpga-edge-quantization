set target_part "xc7a100tcsg324-1"
set outdir "results/p3_m04/int32_accumulator"
file mkdir $outdir
if {[llength [get_parts -quiet $target_part]] == 0} {
    error "FPGA device unavailable: $target_part"
}
read_verilog hardware/rtl/common/int32_accumulator.v
synth_design -top int32_accumulator -part $target_part
report_utilization -file "$outdir/synthesis_utilization.rpt"
write_checkpoint -force "$outdir/int32_accumulator_synth.dcp"
puts "P3-M04-02B VIVADO SYNTHESIS: PASS"
