set target_part "xc7a100tcsg324-1"
set outdir "results/p3_m04/int8_mac"

file mkdir $outdir

puts "P3-M04-02A: INT8 MAC SYNTHESIS"
puts "Vivado version: [version -short]"
puts "Target FPGA: $target_part"

if {[llength [get_parts -quiet $target_part]] == 0} {
    error "FPGA device unavailable: $target_part"
}

read_verilog hardware/rtl/common/int8_mac.v

synth_design \
    -top int8_mac \
    -part $target_part

report_utilization \
    -file "$outdir/synthesis_utilization.rpt"

write_checkpoint \
    -force \
    "$outdir/int8_mac_synth.dcp"

puts "P3-M04-02A VIVADO SYNTHESIS: PASS"
