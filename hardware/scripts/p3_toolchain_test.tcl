set target_part "xc7a100tcsg324-1"
set outdir "results/p3_m04/toolchain"

file mkdir $outdir

puts "=========================================="
puts "P3-M04-01R VERILOG SYNTHESIS VERIFICATION"
puts "=========================================="

puts "Vivado version: [version -short]"
puts "Target FPGA: $target_part"

if {[llength [get_parts -quiet $target_part]] == 0} {
    error "FPGA device unavailable: $target_part"
}

read_verilog hardware/rtl/common/p3_toolchain_test.v

synth_design \
    -top p3_toolchain_test \
    -part $target_part

report_utilization \
    -file "$outdir/synthesis_utilization.rpt"

write_checkpoint \
    -force "$outdir/p3_toolchain_test_synth.dcp"

puts "=========================================="
puts "P3-M04-01R SYNTHESIS CHECK: PASS"
puts "=========================================="
