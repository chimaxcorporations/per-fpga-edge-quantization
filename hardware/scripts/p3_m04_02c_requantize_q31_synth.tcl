set target_part "xc7a100tcsg324-1"
set outdir "results/p3_m04/requantize_q31"

file mkdir $outdir

if {[llength [get_parts -quiet $target_part]] == 0} {
    error "FPGA device unavailable: $target_part"
}

read_verilog hardware/rtl/common/requantize_q31.v

synth_design \
    -top requantize_q31 \
    -part $target_part

report_utilization \
    -file "$outdir/synthesis_utilization.rpt"

write_checkpoint -force \
    "$outdir/requantize_q31_synth.dcp"

puts "P3-M04-02C VIVADO SYNTHESIS: PASS"
