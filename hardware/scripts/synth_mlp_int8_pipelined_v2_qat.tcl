# P3-M04-05E: Pipelined INT8 MLP synthesis
# Target: Artix-7 XC7A100T-CSG324-1

set part_name xc7a100tcsg324-1
set top_name mlp_int8_pipelined_v2
set output_dir results/p3_m05/qat_hardware/mlp_pipelined_v2_synthesis
set rom_dir results/p3_m05/qat_hardware/parameter_rom

file mkdir $output_dir

# Verify all parameter initialization files exist.
set rom_files {
    fc1_weights.memh
    fc1_bias.memh
    fc1_multiplier.memh
    fc1_shift.memh
    fc2_weights.memh
    fc2_bias.memh
    fc2_multiplier.memh
    fc2_shift.memh
    output_weights.memh
    output_bias.memh
    output_multiplier.memh
    output_shift.memh
}

foreach filename $rom_files {
    set path [file join $rom_dir $filename]

    if {![file exists $path]} {
        error "Missing ROM initialization file: $path"
    }

    puts "ROM_FOUND: $path"
}

# Read RTL source files.
read_verilog -sv {
    hardware/rtl/memory/parameter_rom_sync.v
    hardware/rtl/memory/activation_ram_sync.v
    hardware/rtl/inference/neuron_int8_pipelined_v2.v
    hardware/rtl/inference/mlp_int8_pipelined_v2.v
}

# Synthesize the complete accelerator.
synth_design \
    -top $top_name \
    -part $part_name \
    -mode out_of_context \
    -flatten_hierarchy none \
    -generic "ROM_DIR=$rom_dir" 

# Generate reports.
report_utilization \
    -hierarchical \
    -file $output_dir/utilization_hierarchical.rpt

report_utilization \
    -file $output_dir/utilization.rpt

report_drc \
    -file $output_dir/drc.rpt

# Save synthesized netlist.
write_checkpoint -force \
    $output_dir/mlp_int8_pipelined_v2_synth.dcp

write_verilog -force \
    $output_dir/mlp_int8_pipelined_v2_synth_netlist.v

puts "P3-M05-05A QAT pipelined synthesis completed."
