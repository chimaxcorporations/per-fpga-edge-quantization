`timescale 1ns/1ps
module tb_cnn_postroute_idx138_debug;
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
      #1;  // Diagnostic: sample outputs 1 ns after rising edge

    if(!rst) begin
      cycles=cycles+1;
      if(cycles>MAX_CYCLES)
        $fatal(1,"Global timeout: sample=%0d completed=%0d cycles=%0d",sample,completed,cycles);
      if(accumulator_overflow || config_error)
        $fatal(1,"Sample %0d: neuron error overflow=%b config=%b",sample,accumulator_overflow,config_error);
      if(conv1_valid) begin
	if (sample == 0 && checked1 >= 136 && checked1 <= 139) begin
	    $display(
		"TRACE time=%0t sample=%0d checked=%0d valid=%b addr=%0d data=%0d expected=%0d",
		$time,
		sample,
		checked1,
		conv1_valid,
		conv1_index,
		$signed(conv1_data),
		$signed(expected1[sample*160+checked1])
	    );
	end
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
  // Diagnostic monitor: observe Conv1 signals at the clock edge
// and 1 ns later, without changing DUT inputs.
always @(posedge clk) begin
    if (!rst && sample == 0 &&
        checked1 >= 137 && checked1 <= 139) begin

        $display(
            "EDGE  t=%0t checked=%0d valid=%b index=%0d data=%0d",
            $time,
            checked1,
            conv1_valid,
            conv1_index,
            $signed(conv1_data)
        );

        #1;

        $display(
            "AFTER t=%0t checked=%0d valid=%b index=%0d data=%0d",
            $time,
            checked1,
            conv1_valid,
            conv1_index,
            $signed(conv1_data)
        );
    end
end

  reg [31:0] acc_d_pre;
  reg [31:0] acc_q_pre;
  reg [31:0] acc_q_post;
  reg acc_ce_pre;
  reg acc_rst_pre;
  reg [31:0] expected_q;

  // Capture before the active clock edge.
  always @(negedge clk) begin
    if (!rst && sample == 0 &&
        checked1 >= 137 && checked1 <= 139) begin

      #4;

      acc_d_pre = dut.neuron.acc;
      acc_q_pre = {
        dut.neuron.p_1_in,
        dut.neuron.\acc_reg_n_0_[30] ,
        dut.neuron.\acc_reg_n_0_[29] ,
        dut.neuron.\acc_reg_n_0_[28] ,
        dut.neuron.\acc_reg_n_0_[27] ,
        dut.neuron.\acc_reg_n_0_[26] ,
        dut.neuron.\acc_reg_n_0_[25] ,
        dut.neuron.\acc_reg_n_0_[24] ,
        dut.neuron.\acc_reg_n_0_[23] ,
        dut.neuron.\acc_reg_n_0_[22] ,
        dut.neuron.\acc_reg_n_0_[21] ,
        dut.neuron.\acc_reg_n_0_[20] ,
        dut.neuron.\acc_reg_n_0_[19] ,
        dut.neuron.\acc_reg_n_0_[18] ,
        dut.neuron.\acc_reg_n_0_[17] ,
        dut.neuron.\acc_reg_n_0_[16] ,
        dut.neuron.\acc_reg_n_0_[15] ,
        dut.neuron.\acc_reg_n_0_[14] ,
        dut.neuron.\acc_reg_n_0_[13] ,
        dut.neuron.\acc_reg_n_0_[12] ,
        dut.neuron.\acc_reg_n_0_[11] ,
        dut.neuron.\acc_reg_n_0_[10] ,
        dut.neuron.\acc_reg_n_0_[9] ,
        dut.neuron.\acc_reg_n_0_[8] ,
        dut.neuron.\acc_reg_n_0_[7] ,
        dut.neuron.\acc_reg_n_0_[6] ,
        dut.neuron.\acc_reg_n_0_[5] ,
        dut.neuron.\acc_reg_n_0_[4] ,
        dut.neuron.\acc_reg_n_0_[3] ,
        dut.neuron.\acc_reg_n_0_[2] ,
        dut.neuron.\acc_reg_n_0_[1] ,
        dut.neuron.\acc_reg_n_0_[0]
      };

      acc_ce_pre = dut.neuron.\acc[31]_i_1_n_0 ;
      acc_rst_pre = rst;

      expected_q = acc_rst_pre ? 32'd0 :
                   acc_ce_pre ? acc_d_pre : acc_q_pre;

      // Observe after the rising edge.
      #3;

      acc_q_post = {
        dut.neuron.p_1_in,
        dut.neuron.\acc_reg_n_0_[30] ,
        dut.neuron.\acc_reg_n_0_[29] ,
        dut.neuron.\acc_reg_n_0_[28] ,
        dut.neuron.\acc_reg_n_0_[27] ,
        dut.neuron.\acc_reg_n_0_[26] ,
        dut.neuron.\acc_reg_n_0_[25] ,
        dut.neuron.\acc_reg_n_0_[24] ,
        dut.neuron.\acc_reg_n_0_[23] ,
        dut.neuron.\acc_reg_n_0_[22] ,
        dut.neuron.\acc_reg_n_0_[21] ,
        dut.neuron.\acc_reg_n_0_[20] ,
        dut.neuron.\acc_reg_n_0_[19] ,
        dut.neuron.\acc_reg_n_0_[18] ,
        dut.neuron.\acc_reg_n_0_[17] ,
        dut.neuron.\acc_reg_n_0_[16] ,
        dut.neuron.\acc_reg_n_0_[15] ,
        dut.neuron.\acc_reg_n_0_[14] ,
        dut.neuron.\acc_reg_n_0_[13] ,
        dut.neuron.\acc_reg_n_0_[12] ,
        dut.neuron.\acc_reg_n_0_[11] ,
        dut.neuron.\acc_reg_n_0_[10] ,
        dut.neuron.\acc_reg_n_0_[9] ,
        dut.neuron.\acc_reg_n_0_[8] ,
        dut.neuron.\acc_reg_n_0_[7] ,
        dut.neuron.\acc_reg_n_0_[6] ,
        dut.neuron.\acc_reg_n_0_[5] ,
        dut.neuron.\acc_reg_n_0_[4] ,
        dut.neuron.\acc_reg_n_0_[3] ,
        dut.neuron.\acc_reg_n_0_[2] ,
        dut.neuron.\acc_reg_n_0_[1] ,
        dut.neuron.\acc_reg_n_0_[0] 
      };

      begin
        $display(
          "ACC_DQ_FULL t=%0t checked=%0d CE=%b R=%b D=%h Q_PRE=%h EXPECTED=%h Q_POST=%h MATCH=%b",
          $time,
          checked1,
          acc_ce_pre,
          acc_rst_pre,
          acc_d_pre,
          acc_q_pre,
          expected_q,
          acc_q_post,
          acc_q_post === expected_q
        );
      end
    end
  end



  // Post-route neuron pipeline diagnostic.
  // Observe registered Q values, not combinational D buses.
  always @(negedge clk) begin
    if (!rst && sample == 0 &&
        checked1 >= 137 && checked1 <= 139) begin

      #3;

      $display(
        "PIPE t=%0t checked=%0d done=%b result=%h",
        $time,
        checked1,
        dut.neuron.done,
        dut.neuron.result
      );


      $display(
        "PIPE_PRODUCT t=%0t checked=%0d value=%h",
        $time,
        checked1,
        {
          dut.neuron.\product_reg_reg_n_0_[16] ,
          dut.neuron.\product_reg_reg_n_0_[15] ,
          dut.neuron.\product_reg_reg_n_0_[14] ,
          dut.neuron.\product_reg_reg_n_0_[13] ,
          dut.neuron.\product_reg_reg_n_0_[12] ,
          dut.neuron.\product_reg_reg_n_0_[11] ,
          dut.neuron.\product_reg_reg_n_0_[10] ,
          dut.neuron.\product_reg_reg_n_0_[9] ,
          dut.neuron.\product_reg_reg_n_0_[8] ,
          dut.neuron.\product_reg_reg_n_0_[7] ,
          dut.neuron.\product_reg_reg_n_0_[6] ,
          dut.neuron.\product_reg_reg_n_0_[5] ,
          dut.neuron.\product_reg_reg_n_0_[4] ,
          dut.neuron.\product_reg_reg_n_0_[3] ,
          dut.neuron.\product_reg_reg_n_0_[2] ,
          dut.neuron.\product_reg_reg_n_0_[1] ,
          dut.neuron.\product_reg_reg_n_0_[0] 
        }
      );

      $display(
        "PIPE_PRODUCT_ALT t=%0t checked=%0d value=%h",
        $time,
        checked1,
        {
          dut.neuron.\product_reg_reg[16]__0_n_0 ,
          dut.neuron.\product_reg_reg[15]__0_n_0 ,
          dut.neuron.\product_reg_reg[14]__0_n_0 ,
          dut.neuron.\product_reg_reg[13]__0_n_0 ,
          dut.neuron.\product_reg_reg[12]__0_n_0 ,
          dut.neuron.\product_reg_reg[11]__0_n_0 ,
          dut.neuron.\product_reg_reg[10]__0_n_0 ,
          dut.neuron.\product_reg_reg[9]__0_n_0 ,
          dut.neuron.\product_reg_reg[8]__0_n_0 ,
          dut.neuron.\product_reg_reg[7]__0_n_0 ,
          dut.neuron.\product_reg_reg[6]__0_n_0 ,
          dut.neuron.\product_reg_reg[5]__0_n_0 ,
          dut.neuron.\product_reg_reg[4]__0_n_0 ,
          dut.neuron.\product_reg_reg[3]__0_n_0 ,
          dut.neuron.\product_reg_reg[2]__0_n_0 ,
          dut.neuron.\product_reg_reg[1]__0_n_0 ,
          dut.neuron.\product_reg_reg[0]__0_n_0 
        }
      );

      $display(
        "PIPE_MAGNITUDE t=%0t checked=%0d value=%h",
        $time,
        checked1,
        {
          dut.neuron.\magnitude_reg_reg_n_0_[63] ,
          dut.neuron.\magnitude_reg_reg_n_0_[62] ,
          dut.neuron.\magnitude_reg_reg_n_0_[61] ,
          dut.neuron.\magnitude_reg_reg_n_0_[60] ,
          dut.neuron.\magnitude_reg_reg_n_0_[59] ,
          dut.neuron.\magnitude_reg_reg_n_0_[58] ,
          dut.neuron.\magnitude_reg_reg_n_0_[57] ,
          dut.neuron.\magnitude_reg_reg_n_0_[56] ,
          dut.neuron.\magnitude_reg_reg_n_0_[55] ,
          dut.neuron.\magnitude_reg_reg_n_0_[54] ,
          dut.neuron.\magnitude_reg_reg_n_0_[53] ,
          dut.neuron.\magnitude_reg_reg_n_0_[52] ,
          dut.neuron.\magnitude_reg_reg_n_0_[51] ,
          dut.neuron.\magnitude_reg_reg_n_0_[50] ,
          dut.neuron.\magnitude_reg_reg_n_0_[49] ,
          dut.neuron.\magnitude_reg_reg_n_0_[48] ,
          dut.neuron.\magnitude_reg_reg_n_0_[47] ,
          dut.neuron.\magnitude_reg_reg_n_0_[46] ,
          dut.neuron.\magnitude_reg_reg_n_0_[45] ,
          dut.neuron.\magnitude_reg_reg_n_0_[44] ,
          dut.neuron.\magnitude_reg_reg_n_0_[43] ,
          dut.neuron.\magnitude_reg_reg_n_0_[42] ,
          dut.neuron.\magnitude_reg_reg_n_0_[41] ,
          dut.neuron.\magnitude_reg_reg_n_0_[40] ,
          dut.neuron.\magnitude_reg_reg_n_0_[39] ,
          dut.neuron.\magnitude_reg_reg_n_0_[38] ,
          dut.neuron.\magnitude_reg_reg_n_0_[37] ,
          dut.neuron.\magnitude_reg_reg_n_0_[36] ,
          dut.neuron.\magnitude_reg_reg_n_0_[35] ,
          dut.neuron.\magnitude_reg_reg_n_0_[34] ,
          dut.neuron.\magnitude_reg_reg_n_0_[33] ,
          dut.neuron.\magnitude_reg_reg_n_0_[32] ,
          dut.neuron.\magnitude_reg_reg_n_0_[31] ,
          dut.neuron.\magnitude_reg_reg_n_0_[30] ,
          dut.neuron.\magnitude_reg_reg_n_0_[29] ,
          dut.neuron.\magnitude_reg_reg_n_0_[28] ,
          dut.neuron.\magnitude_reg_reg_n_0_[27] ,
          dut.neuron.\magnitude_reg_reg_n_0_[26] ,
          dut.neuron.\magnitude_reg_reg_n_0_[25] ,
          dut.neuron.\magnitude_reg_reg_n_0_[24] ,
          dut.neuron.\magnitude_reg_reg_n_0_[23] ,
          dut.neuron.\magnitude_reg_reg_n_0_[22] ,
          dut.neuron.\magnitude_reg_reg_n_0_[21] ,
          dut.neuron.\magnitude_reg_reg_n_0_[20] ,
          dut.neuron.\magnitude_reg_reg_n_0_[19] ,
          dut.neuron.\magnitude_reg_reg_n_0_[18] ,
          dut.neuron.\magnitude_reg_reg_n_0_[17] ,
          dut.neuron.\magnitude_reg_reg_n_0_[16] ,
          dut.neuron.\magnitude_reg_reg_n_0_[15] ,
          dut.neuron.\magnitude_reg_reg_n_0_[14] ,
          dut.neuron.\magnitude_reg_reg_n_0_[13] ,
          dut.neuron.\magnitude_reg_reg_n_0_[12] ,
          dut.neuron.\magnitude_reg_reg_n_0_[11] ,
          dut.neuron.\magnitude_reg_reg_n_0_[10] ,
          dut.neuron.\magnitude_reg_reg_n_0_[9] ,
          dut.neuron.\magnitude_reg_reg_n_0_[8] ,
          dut.neuron.\magnitude_reg_reg_n_0_[7] ,
          dut.neuron.\magnitude_reg_reg_n_0_[6] ,
          dut.neuron.\magnitude_reg_reg_n_0_[5] ,
          dut.neuron.\magnitude_reg_reg_n_0_[4] ,
          dut.neuron.\magnitude_reg_reg_n_0_[3] ,
          dut.neuron.\magnitude_reg_reg_n_0_[2] ,
          dut.neuron.\magnitude_reg_reg_n_0_[1] ,
          dut.neuron.\magnitude_reg_reg_n_0_[0] 
        }
      );

      $display(
        "PIPE_QUOTIENT t=%0t checked=%0d value=%h",
        $time,
        checked1,
        {
          dut.neuron.\quotient_reg_reg_n_0_[63] ,
          dut.neuron.\quotient_reg_reg_n_0_[62] ,
          dut.neuron.\quotient_reg_reg_n_0_[61] ,
          dut.neuron.\quotient_reg_reg_n_0_[60] ,
          dut.neuron.\quotient_reg_reg_n_0_[59] ,
          dut.neuron.\quotient_reg_reg_n_0_[58] ,
          dut.neuron.\quotient_reg_reg_n_0_[57] ,
          dut.neuron.\quotient_reg_reg_n_0_[56] ,
          dut.neuron.\quotient_reg_reg_n_0_[55] ,
          dut.neuron.\quotient_reg_reg_n_0_[54] ,
          dut.neuron.\quotient_reg_reg_n_0_[53] ,
          dut.neuron.\quotient_reg_reg_n_0_[52] ,
          dut.neuron.\quotient_reg_reg_n_0_[51] ,
          dut.neuron.\quotient_reg_reg_n_0_[50] ,
          dut.neuron.\quotient_reg_reg_n_0_[49] ,
          dut.neuron.\quotient_reg_reg_n_0_[48] ,
          dut.neuron.\quotient_reg_reg_n_0_[47] ,
          dut.neuron.\quotient_reg_reg_n_0_[46] ,
          dut.neuron.\quotient_reg_reg_n_0_[45] ,
          dut.neuron.\quotient_reg_reg_n_0_[44] ,
          dut.neuron.\quotient_reg_reg_n_0_[43] ,
          dut.neuron.\quotient_reg_reg_n_0_[42] ,
          dut.neuron.\quotient_reg_reg_n_0_[41] ,
          dut.neuron.\quotient_reg_reg_n_0_[40] ,
          dut.neuron.\quotient_reg_reg_n_0_[39] ,
          dut.neuron.\quotient_reg_reg_n_0_[38] ,
          dut.neuron.\quotient_reg_reg_n_0_[37] ,
          dut.neuron.\quotient_reg_reg_n_0_[36] ,
          dut.neuron.\quotient_reg_reg_n_0_[35] ,
          dut.neuron.\quotient_reg_reg_n_0_[34] ,
          dut.neuron.\quotient_reg_reg_n_0_[33] ,
          dut.neuron.\quotient_reg_reg_n_0_[32] ,
          dut.neuron.\quotient_reg_reg_n_0_[31] ,
          dut.neuron.\quotient_reg_reg_n_0_[30] ,
          dut.neuron.\quotient_reg_reg_n_0_[29] ,
          dut.neuron.\quotient_reg_reg_n_0_[28] ,
          dut.neuron.\quotient_reg_reg_n_0_[27] ,
          dut.neuron.\quotient_reg_reg_n_0_[26] ,
          dut.neuron.\quotient_reg_reg_n_0_[25] ,
          dut.neuron.\quotient_reg_reg_n_0_[24] ,
          dut.neuron.\quotient_reg_reg_n_0_[23] ,
          dut.neuron.\quotient_reg_reg_n_0_[22] ,
          dut.neuron.\quotient_reg_reg_n_0_[21] ,
          dut.neuron.\quotient_reg_reg_n_0_[20] ,
          dut.neuron.\quotient_reg_reg_n_0_[19] ,
          dut.neuron.\quotient_reg_reg_n_0_[18] ,
          dut.neuron.\quotient_reg_reg_n_0_[17] ,
          dut.neuron.\quotient_reg_reg_n_0_[16] ,
          dut.neuron.\quotient_reg_reg_n_0_[15] ,
          dut.neuron.\quotient_reg_reg_n_0_[14] ,
          dut.neuron.\quotient_reg_reg_n_0_[13] ,
          dut.neuron.\quotient_reg_reg_n_0_[12] ,
          dut.neuron.\quotient_reg_reg_n_0_[11] ,
          dut.neuron.\quotient_reg_reg_n_0_[10] ,
          dut.neuron.\quotient_reg_reg_n_0_[9] ,
          dut.neuron.\quotient_reg_reg_n_0_[8] ,
          dut.neuron.\quotient_reg_reg_n_0_[7] ,
          dut.neuron.\quotient_reg_reg_n_0_[6] ,
          dut.neuron.\quotient_reg_reg_n_0_[5] ,
          dut.neuron.\quotient_reg_reg_n_0_[4] ,
          dut.neuron.\quotient_reg_reg_n_0_[3] ,
          dut.neuron.\quotient_reg_reg_n_0_[2] ,
          dut.neuron.\quotient_reg_reg_n_0_[1] ,
          dut.neuron.\quotient_reg_reg_n_0_[0] 
        }
      );

      $display(
        "PIPE_ROUNDED t=%0t checked=%0d value=%h",
        $time,
        checked1,
        {
          dut.neuron.\rounded_reg_reg_n_0_[63] ,
          dut.neuron.\rounded_reg_reg_n_0_[62] ,
          dut.neuron.\rounded_reg_reg_n_0_[61] ,
          dut.neuron.\rounded_reg_reg_n_0_[60] ,
          dut.neuron.\rounded_reg_reg_n_0_[59] ,
          dut.neuron.\rounded_reg_reg_n_0_[58] ,
          dut.neuron.\rounded_reg_reg_n_0_[57] ,
          dut.neuron.\rounded_reg_reg_n_0_[56] ,
          dut.neuron.\rounded_reg_reg_n_0_[55] ,
          dut.neuron.\rounded_reg_reg_n_0_[54] ,
          dut.neuron.\rounded_reg_reg_n_0_[53] ,
          dut.neuron.\rounded_reg_reg_n_0_[52] ,
          dut.neuron.\rounded_reg_reg_n_0_[51] ,
          dut.neuron.\rounded_reg_reg_n_0_[50] ,
          dut.neuron.\rounded_reg_reg_n_0_[49] ,
          dut.neuron.\rounded_reg_reg_n_0_[48] ,
          dut.neuron.\rounded_reg_reg_n_0_[47] ,
          dut.neuron.\rounded_reg_reg_n_0_[46] ,
          dut.neuron.\rounded_reg_reg_n_0_[45] ,
          dut.neuron.\rounded_reg_reg_n_0_[44] ,
          dut.neuron.\rounded_reg_reg_n_0_[43] ,
          dut.neuron.\rounded_reg_reg_n_0_[42] ,
          dut.neuron.\rounded_reg_reg_n_0_[41] ,
          dut.neuron.\rounded_reg_reg_n_0_[40] ,
          dut.neuron.\rounded_reg_reg_n_0_[39] ,
          dut.neuron.\rounded_reg_reg_n_0_[38] ,
          dut.neuron.\rounded_reg_reg_n_0_[37] ,
          dut.neuron.\rounded_reg_reg_n_0_[36] ,
          dut.neuron.\rounded_reg_reg_n_0_[35] ,
          dut.neuron.\rounded_reg_reg_n_0_[34] ,
          dut.neuron.\rounded_reg_reg_n_0_[33] ,
          dut.neuron.\rounded_reg_reg_n_0_[32] ,
          dut.neuron.\rounded_reg_reg_n_0_[31] ,
          dut.neuron.\rounded_reg_reg_n_0_[30] ,
          dut.neuron.\rounded_reg_reg_n_0_[29] ,
          dut.neuron.\rounded_reg_reg_n_0_[28] ,
          dut.neuron.\rounded_reg_reg_n_0_[27] ,
          dut.neuron.\rounded_reg_reg_n_0_[26] ,
          dut.neuron.\rounded_reg_reg_n_0_[25] ,
          dut.neuron.\rounded_reg_reg_n_0_[24] ,
          dut.neuron.\rounded_reg_reg_n_0_[23] ,
          dut.neuron.\rounded_reg_reg_n_0_[22] ,
          dut.neuron.\rounded_reg_reg_n_0_[21] ,
          dut.neuron.\rounded_reg_reg_n_0_[20] ,
          dut.neuron.\rounded_reg_reg_n_0_[19] ,
          dut.neuron.\rounded_reg_reg_n_0_[18] ,
          dut.neuron.\rounded_reg_reg_n_0_[17] ,
          dut.neuron.\rounded_reg_reg_n_0_[16] ,
          dut.neuron.\rounded_reg_reg_n_0_[15] ,
          dut.neuron.\rounded_reg_reg_n_0_[14] ,
          dut.neuron.\rounded_reg_reg_n_0_[13] ,
          dut.neuron.\rounded_reg_reg_n_0_[12] ,
          dut.neuron.\rounded_reg_reg_n_0_[11] ,
          dut.neuron.\rounded_reg_reg_n_0_[10] ,
          dut.neuron.\rounded_reg_reg_n_0_[9] ,
          dut.neuron.\rounded_reg_reg_n_0_[8] ,
          dut.neuron.\rounded_reg_reg_n_0_[7] ,
          dut.neuron.\rounded_reg_reg_n_0_[6] ,
          dut.neuron.\rounded_reg_reg_n_0_[5] ,
          dut.neuron.\rounded_reg_reg_n_0_[4] ,
          dut.neuron.\rounded_reg_reg_n_0_[3] ,
          dut.neuron.\rounded_reg_reg_n_0_[2] ,
          dut.neuron.\rounded_reg_reg_n_0_[1] ,
          dut.neuron.\rounded_reg_reg_n_0_[0] 
        }
      );

    end
  end


  always @(negedge clk) begin
    if (!rst && sample == 0 &&
        checked1 >= 137 && checked1 <= 139) begin

      #3;

      $display(
        "DSP_DEBUG t=%0t checked=%0d A=%h B=%h P=%h CEB2=%b CEP=%b RSTB=%b RSTP=%b",
        $time,
        checked1,
        dut.neuron.wide_product.A,
        dut.neuron.wide_product.B,
        dut.neuron.wide_product.P,
        dut.neuron.wide_product.CEB2,
        dut.neuron.wide_product.CEP,
        dut.neuron.wide_product.RSTB,
        dut.neuron.wide_product.RSTP
      );
    end
  end


  always @(negedge clk) begin
    if (!rst && sample == 0 &&
        checked1 >= 137 && checked1 <= 139) begin

      #3;

      $display(
        "ACC_FULL t=%0t checked=%0d ACC_D=%08h ACC_Q=%08h DSP_B=%05h",
        $time,
        checked1,
        dut.neuron.acc,
        {dut.neuron.p_1_in, dut.neuron.\acc_reg_n_0_[30] , dut.neuron.\acc_reg_n_0_[29] , dut.neuron.\acc_reg_n_0_[28] , dut.neuron.\acc_reg_n_0_[27] , dut.neuron.\acc_reg_n_0_[26] , dut.neuron.\acc_reg_n_0_[25] , dut.neuron.\acc_reg_n_0_[24] , dut.neuron.\acc_reg_n_0_[23] , dut.neuron.\acc_reg_n_0_[22] , dut.neuron.\acc_reg_n_0_[21] , dut.neuron.\acc_reg_n_0_[20] , dut.neuron.\acc_reg_n_0_[19] , dut.neuron.\acc_reg_n_0_[18] , dut.neuron.\acc_reg_n_0_[17] , dut.neuron.\acc_reg_n_0_[16] , dut.neuron.\acc_reg_n_0_[15] , dut.neuron.\acc_reg_n_0_[14] , dut.neuron.\acc_reg_n_0_[13] , dut.neuron.\acc_reg_n_0_[12] , dut.neuron.\acc_reg_n_0_[11] , dut.neuron.\acc_reg_n_0_[10] , dut.neuron.\acc_reg_n_0_[9] , dut.neuron.\acc_reg_n_0_[8] , dut.neuron.\acc_reg_n_0_[7] , dut.neuron.\acc_reg_n_0_[6] , dut.neuron.\acc_reg_n_0_[5] , dut.neuron.\acc_reg_n_0_[4] , dut.neuron.\acc_reg_n_0_[3] , dut.neuron.\acc_reg_n_0_[2] , dut.neuron.\acc_reg_n_0_[1] , dut.neuron.\acc_reg_n_0_[0] },
        dut.neuron.wide_product.B
      );
    end
  end




  // Diagnostic: accumulator LUT inputs immediately before clock edge.
  always @(negedge clk) begin
    if (!rst && sample == 0 && checked1 >= 137 && checked1 <= 139) begin
      #4;

      $display(
        "ACC_LUT t=%0t checked=%0d CE=%b STATE=%b SUM12=%b SUM14=%b BIAS12=%b BIAS31=%b ACC12=%b ACC14=%b ACC_D=%08h",
        $time,
        checked1,
        dut.neuron.\acc[31]_i_1_n_0 ,
        dut.neuron.state,
        dut.neuron.sum[12],
        dut.neuron.sum[14],
        dut.neuron.bias_in[12],
        dut.neuron.bias_in[31],
        dut.neuron.acc[12],
        dut.neuron.acc[14],
        dut.neuron.acc
      );
    end
  end


  // Diagnostic: arithmetic carry chain feeding sum[15:12].
  always @(negedge clk) begin
    if (!rst && sample == 0 && checked1 >= 137 && checked1 <= 139) begin
      #4;

      $display(
        "ACC_CARRY t=%0t checked=%0d CE=%b CI=%b S=%b DI=%b SUM=%b ACC_D=%08h",
        $time,
        checked1,
        dut.neuron.\acc[31]_i_1_n_0 ,
        dut.neuron.\acc_reg[11]_i_2_n_0 ,
        {
          dut.neuron.\acc[15]_i_3_n_0 ,
          dut.neuron.\acc[15]_i_4_n_0 ,
          dut.neuron.\acc[15]_i_5_n_0 ,
          dut.neuron.\acc[15]_i_6_n_0
        },
        {
          dut.neuron.product16,
          dut.neuron.\acc_reg_n_0_[14] ,
          dut.neuron.\acc_reg_n_0_[13] ,
          dut.neuron.\acc_reg_n_0_[12]
        },
        dut.neuron.sum[15:12],
        dut.neuron.acc
      );
    end
  end


  // Diagnostic: operands driving the CARRY4 select XOR LUTs.
  always @(negedge clk) begin
    if (!rst && sample == 0 && checked1 >= 137 && checked1 <= 139) begin
      #4;

      $display(
        "ACC_PRODUCT t=%0t checked=%0d CE=%b AQ12=%b AQ14=%b P12=%b P14=%b XOR12=%b XOR14=%b PRODUCT32=%08h SUM=%h ACC_D=%08h",
        $time,
        checked1,
        dut.neuron.\acc[31]_i_1_n_0 ,
        dut.neuron.\acc_reg_n_0_[12] ,
        dut.neuron.\acc_reg_n_0_[14] ,
        dut.neuron.product32[12],
        dut.neuron.product32[14],
        dut.neuron.\acc[15]_i_6_n_0 ,
        dut.neuron.\acc[15]_i_4_n_0 ,
        dut.neuron.product32,
        dut.neuron.sum[15:12],
        dut.neuron.acc
      );
    end
  end


  // Product-generation carry-chain diagnostic.
  always @(negedge clk) begin
    if (!rst && sample == 0 && checked1 >= 137 && checked1 <= 139) begin
      #4;

      $display(
        "PRODUCT_CARRY t=%0t CE=%b CI=%b S=%b DI=%b O=%b PRODUCT16=%b ACC_D=%08h",
        $time,
        dut.neuron.\acc[31]_i_1_n_0 ,
        dut.neuron.overflow_reg_i_10_n_0,
        {
          dut.neuron.overflow_reg_i_11_n_6,
          dut.neuron.overflow_i_14_n_0,
          dut.neuron.overflow_i_15_n_0,
          dut.neuron.overflow_i_16_n_0
        },
        {
          1'b0,
          dut.neuron.overflow_reg_i_11_n_7,
          dut.neuron.overflow_i_12_n_0,
          dut.neuron.overflow_i_13_n_0
        },
        dut.neuron.product32[14:12],
        dut.neuron.product16,
        dut.neuron.acc
      );
    end
  end


  // Event-driven product CARRY4 timing monitor.
  // Uses $realtime for sub-nanosecond timestamps.

  wire carry_ci_dbg;
  wire [3:0] carry_s_dbg;
  wire [3:0] carry_di_dbg;
  wire [3:0] carry_o_dbg;

  assign carry_ci_dbg = dut.neuron.overflow_reg_i_10_n_0;

  assign carry_s_dbg = {
    dut.neuron.overflow_reg_i_11_n_6,
    dut.neuron.overflow_i_14_n_0,
    dut.neuron.overflow_i_15_n_0,
    dut.neuron.overflow_i_16_n_0
  };

  assign carry_di_dbg = {
    1'b0,
    dut.neuron.overflow_reg_i_11_n_7,
    dut.neuron.overflow_i_12_n_0,
    dut.neuron.overflow_i_13_n_0
  };

  assign carry_o_dbg = {
    dut.neuron.product16,
    dut.neuron.product32[14:12]
  };

  always @(carry_ci_dbg or carry_s_dbg or carry_di_dbg or carry_o_dbg) begin
    if ($realtime >= 24950.0 && $realtime <= 25010.0) begin
      $display(
        "CARRY_EVENT t=%0.3f ns clk=%b CI=%b S=%b DI=%b O=%b",
        $realtime,
        clk,
        carry_ci_dbg,
        carry_s_dbg,
        carry_di_dbg,
        carry_o_dbg
      );
    end
  end


  // Compare CARRY4 primitive ports against connected nets.
  always @(negedge clk) begin
    if (!rst && sample == 0 && checked1 >= 137 && checked1 <= 139) begin
      #4;

      $display(
        "PRIMITIVE_PORT t=%0t CI=%b S=%b DI=%b O=%b NET_O=%b",
        $time,
        dut.neuron.overflow_reg_i_4.CI,
        dut.neuron.overflow_reg_i_4.S,
        dut.neuron.overflow_reg_i_4.DI,
        dut.neuron.overflow_reg_i_4.O,
        {dut.neuron.product16,dut.neuron.product32[14:12]}
      );
    end
  end
endmodule
