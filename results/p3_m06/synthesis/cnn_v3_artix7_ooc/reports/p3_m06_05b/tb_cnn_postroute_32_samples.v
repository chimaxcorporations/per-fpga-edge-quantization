`timescale 1ns/1ps
module tb_cnn_postroute_32_samples;
  reg clk=0; always #5 clk=~clk;
  reg rst=1, start=0, input_valid=0;
  reg signed [7:0] input_data=0;
  wire input_ready,busy,done,conv1_valid,conv2_valid,fc1_valid,output_valid;
  wire accumulator_overflow,config_error;
  wire [7:0] conv1_index,conv2_index;
  wire [5:0] fc1_index;
  wire signed [7:0] conv1_data,conv2_data,fc1_data,output_data;
  reg [7:0] inputs[0:1279];
  reg [7:0] expected1[0:5119],expected2[0:5119];
  reg [7:0] expected3[0:1023],expected4[0:31];
  integer sample=0, i, checked1=0, checked2=0, checked3=0, checked4=0;
  integer completed=0, cycles=0, sample_start_cycle=0, total_checks=0;
  localparam integer MAX_CYCLES=2400000;

  cnn_int8_pipelined_v3 dut(
    .clk(clk),.rst(rst),.start(start),.input_valid(input_valid),
    .input_data(input_data),.input_ready(input_ready),.busy(busy),.done(done),
    .conv1_valid(conv1_valid),.conv1_index(conv1_index),.conv1_data(conv1_data),
    .conv2_valid(conv2_valid),.conv2_index(conv2_index),.conv2_data(conv2_data),
    .fc1_valid(fc1_valid),.fc1_index(fc1_index),.fc1_data(fc1_data),
    .output_valid(output_valid),.output_data(output_data),
    .accumulator_overflow(accumulator_overflow),.config_error(config_error));

  initial begin
    $readmemh("golden/inputs_int8.memh",inputs);
    $readmemh("golden/conv1_golden_int8.memh",expected1);
    $readmemh("golden/conv2_golden_int8.memh",expected2);
    $readmemh("golden/fc1_golden_int8.memh",expected3);
    $readmemh("golden/output_golden_int8.memh",expected4);
    repeat(120) @(negedge clk); // allow GSR/GWE release in Xilinx gate-level simulation
    rst=0;
    for(sample=0;sample<32;sample=sample+1) begin
      // Drive all transaction controls on falling edges to avoid DUT races.
      @(negedge clk);
      if(busy || done || input_ready)
        $fatal(1,"Sample %0d: controller not idle before start",sample);
      checked1=0; checked2=0; checked3=0; checked4=0;
      sample_start_cycle=cycles;
      start=1;
      @(negedge clk);
      start=0;
      if(!input_ready)
        $fatal(1,"Sample %0d: LOAD state not entered",sample);
      for(i=0;i<40;i=i+1) begin
        @(negedge clk);
        if(!input_ready)
          $fatal(1,"Sample %0d: input_ready dropped at feature %0d",sample,i);
        input_data=$signed(inputs[sample*40+i]);
        input_valid=1;
      end
      @(negedge clk);
      input_valid=0;
      // done is registered by DUT at posedge; monitor observes it on next posedge.
      wait(done===1'b1);
      @(negedge clk);
      if(checked1!=160 || checked2!=160 || checked3!=32 || checked4!=1)
        $fatal(1,"Sample %0d: counts %0d/%0d/%0d/%0d (expected 160/160/32/1)",
               sample,checked1,checked2,checked3,checked4);
      if(accumulator_overflow || config_error)
        $fatal(1,"Sample %0d: status error",sample);
      completed=completed+1;
      $display("PASS sample=%0d activations=353 cycles=%0d output_int8=%0d",
               sample,cycles-sample_start_cycle,$signed(expected4[sample]));
      // COMPLETE sets done for one cycle; ensure next start is issued only in IDLE.
      @(negedge clk);
    end
    if(completed!=32 || total_checks!=11296)
      $fatal(1,"Regression totals: completed=%0d comparisons=%0d",completed,total_checks);
    $display("PASS: P3-M06-05B post-route CNN 32/32 samples, 11296/11296 activations, zero mismatches");
    $display("Total simulation cycles since reset release: %0d",cycles);
    $finish;
  end

  always @(posedge clk) begin
    if(!rst) begin
      cycles=cycles+1;
      if(cycles>MAX_CYCLES)
        $fatal(1,"Global timeout: sample=%0d completed=%0d cycles=%0d",sample,completed,cycles);
      if(accumulator_overflow || config_error)
        $fatal(1,"Sample %0d: neuron error overflow=%b config=%b",sample,accumulator_overflow,config_error);
      if(conv1_valid) begin
        if(checked1>=160 || conv1_index!==checked1[7:0] ||
           conv1_data!==$signed(expected1[sample*160+checked1]))
          $fatal(1,"Conv1 sample=%0d idx=%0d got_addr=%0d got=%0d expected=%0d",
                 sample,checked1,conv1_index,conv1_data,$signed(expected1[sample*160+checked1]));
        checked1=checked1+1; total_checks=total_checks+1;
      end
      if(conv2_valid) begin
        if(checked1!=160 || checked2>=160 || conv2_index!==checked2[7:0] ||
           conv2_data!==$signed(expected2[sample*160+checked2]))
          $fatal(1,"Conv2 sample=%0d idx=%0d got_addr=%0d got=%0d expected=%0d",
                 sample,checked2,conv2_index,conv2_data,$signed(expected2[sample*160+checked2]));
        checked2=checked2+1; total_checks=total_checks+1;
      end
      if(fc1_valid) begin
        if(checked2!=160 || checked3>=32 || fc1_index!==checked3[5:0] ||
           fc1_data!==$signed(expected3[sample*32+checked3]))
          $fatal(1,"FC1 sample=%0d idx=%0d got_addr=%0d got=%0d expected=%0d",
                 sample,checked3,fc1_index,fc1_data,$signed(expected3[sample*32+checked3]));
        checked3=checked3+1; total_checks=total_checks+1;
      end
      if(output_valid) begin
        if(checked3!=32 || checked4!=0 || output_data!==$signed(expected4[sample]))
          $fatal(1,"FC2 sample=%0d got=%0d expected=%0d",sample,output_data,$signed(expected4[sample]));
        checked4=checked4+1; total_checks=total_checks+1;
      end
    end
  end
endmodule
