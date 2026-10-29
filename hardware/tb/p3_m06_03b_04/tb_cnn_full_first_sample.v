`timescale 1ns/1ps
module tb_cnn_full_first_sample;
  reg clk=0; always #5 clk=~clk;
  reg rst=1,start=0,input_valid=0;
  reg signed [7:0] input_data=0;
  wire input_ready,busy,done,conv1_valid,accumulator_overflow,config_error;
  wire [7:0] conv1_index;
  wire signed [7:0] conv1_data;
  reg [7:0] inputs[0:1279];
  reg [7:0] expected[0:5119];
  reg [7:0] expected2[0:5119];
  wire conv2_valid;
  wire [7:0] conv2_index;
  wire signed [7:0] conv2_data;
  integer checked2=0, checked3=0, checked4=0;
  reg [7:0] expected3[0:1023];
  reg [7:0] expected4[0:31];
  wire fc1_valid, output_valid;
  wire [5:0] fc1_index;
  wire signed [7:0] fc1_data, output_data;
  integer i,checked=0,cycles=0;
  cnn_int8_pipelined_v3 dut(
    .clk(clk),.rst(rst),.start(start),.input_valid(input_valid),
    .input_data(input_data),.input_ready(input_ready),.busy(busy),.done(done),
    .conv1_valid(conv1_valid),.conv1_index(conv1_index),.conv1_data(conv1_data),
    .conv2_valid(conv2_valid),.conv2_index(conv2_index),.conv2_data(conv2_data),
    .fc1_valid(fc1_valid),.fc1_index(fc1_index),.fc1_data(fc1_data),
    .output_valid(output_valid),.output_data(output_data),
    .accumulator_overflow(accumulator_overflow),.config_error(config_error));
  initial begin
    $readmemh("../../../results/p3_m06/qat_hardware/parameter_rom/inputs_int8.memh",inputs);
    $readmemh("../../../results/p3_m06/qat_hardware/parameter_rom/conv1_golden_int8.memh",expected);
    $readmemh("../../../results/p3_m06/qat_hardware/parameter_rom/conv2_golden_int8.memh",expected2);
    $readmemh("../../../results/p3_m06/qat_hardware/parameter_rom/fc1_golden_int8.memh",expected3);
    $readmemh("../../../results/p3_m06/qat_hardware/parameter_rom/output_golden_int8.memh",expected4);
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
       if(conv2_valid) begin
          if(checked!=160) $fatal(1,"Conv2 started before Conv1 complete: %0d",checked);
          if(conv2_index!==checked2[7:0])
             $fatal(1,"Conv2 index mismatch got=%0d expected=%0d",conv2_index,checked2);
          if(conv2_data!==$signed(expected2[checked2]))
             $fatal(1,"Conv2 mismatch idx=%0d got=%0d expected=%0d",checked2,conv2_data,$signed(expected2[checked2]));
          checked2=checked2+1;
       end
       if(fc1_valid) begin
          if(checked2!=160) $fatal(1,"FC1 started before Conv2 completed");
          if(fc1_index!==checked3[5:0])
             $fatal(1,"FC1 index mismatch got=%0d expected=%0d",fc1_index,checked3);
          if(fc1_data!==$signed(expected3[checked3]))
             $fatal(1,"FC1 mismatch idx=%0d got=%0d expected=%0d",checked3,fc1_data,$signed(expected3[checked3]));
          checked3=checked3+1;
       end
       if(output_valid) begin
          if(checked3!=32) $fatal(1,"Output started before FC1 completed");
          if(output_data!==$signed(expected4[checked4]))
             $fatal(1,"Output mismatch got=%0d expected=%0d",output_data,$signed(expected4[checked4]));
          checked4=checked4+1;
       end
       if(accumulator_overflow || config_error)
          $fatal(1,"Neuron status error: overflow=%b config_error=%b",accumulator_overflow,config_error);
       if(done) begin
          if(checked!=160 || checked2!=160 || checked3!=32 || checked4!=1)
             $fatal(1,"Expected 160/160/32/1, got %0d/%0d/%0d/%0d",checked,checked2,checked3,checked4);
          $display("PASS: P3-M06-03B-04 full CNN first sample, 353/353 activations, zero mismatches");
          $display("Measured simulation cycles (reset release to done): %0d",cycles);
          $finish;
       end
       if(cycles>120000) $fatal(1,"Timeout; checked=%0d",checked);
    end
  end
endmodule
