`timescale 1ns/1ps
module tb_cnn_conv1_first_sample;
  reg clk=0; always #5 clk=~clk;
  reg rst=1,start=0,input_valid=0;
  reg signed [7:0] input_data=0;
  wire input_ready,busy,done,conv1_valid,accumulator_overflow,config_error;
  wire [7:0] conv1_index;
  wire signed [7:0] conv1_data;
  reg [7:0] inputs[0:1279];
  reg [7:0] expected[0:5119];
  integer i,checked=0,cycles=0;
  cnn_int8_pipelined_v1 dut(
    .clk(clk),.rst(rst),.start(start),.input_valid(input_valid),
    .input_data(input_data),.input_ready(input_ready),.busy(busy),.done(done),
    .conv1_valid(conv1_valid),.conv1_index(conv1_index),.conv1_data(conv1_data),
    .accumulator_overflow(accumulator_overflow),.config_error(config_error));
  initial begin
    $readmemh("../../../results/p3_m06/qat_hardware/parameter_rom/inputs_int8.memh",inputs);
    $readmemh("../../../results/p3_m06/qat_hardware/parameter_rom/conv1_golden_int8.memh",expected);
    repeat(4) @(negedge clk); rst=0;
    @(negedge clk); start=1;
    @(negedge clk); start=0;
    if(!input_ready) $fatal(1,"Controller did not enter input load state");
    for(i=0;i<40;i=i+1) begin
       @(negedge clk);
       if(!input_ready) $fatal(1,"Input not ready at index %0d",i);
       input_data=inputs[i]; input_valid=1;
    end
    @(negedge clk); input_valid=0;
  end
  always @(posedge clk) begin
    if(!rst) begin
       cycles=cycles+1;
       if(conv1_valid) begin
          if(conv1_index!==checked[7:0])
             $fatal(1,"Index mismatch got=%0d expected=%0d",conv1_index,checked);
          if(conv1_data!==$signed(expected[checked]))
             $fatal(1,"Conv1 mismatch idx=%0d got=%0d expected=%0d",checked,conv1_data,$signed(expected[checked]));
          checked=checked+1;
       end
       if(accumulator_overflow || config_error)
          $fatal(1,"Neuron status error: overflow=%b config_error=%b",accumulator_overflow,config_error);
       if(done) begin
          if(checked!=160) $fatal(1,"Expected 160 outputs, got %0d",checked);
          $display("PASS: P3-M06-03B-02 Conv1 first sample, 160/160 activations, zero mismatches");
          $display("Measured simulation cycles (reset release to done): %0d",cycles);
          $finish;
       end
       if(cycles>40000) $fatal(1,"Timeout; checked=%0d",checked);
    end
  end
endmodule
