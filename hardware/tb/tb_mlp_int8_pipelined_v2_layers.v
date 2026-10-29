`timescale 1ns/1ps
module tb_mlp_int8_pipelined_v2_layers;
 parameter N_SAMPLES=32;
 reg clk=0; always #5 clk=~clk;
 reg rst=1, input_valid=0;
 reg signed [7:0] input_data=0;
 wire input_ready,done,overflow_any;
 wire signed [7:0] output_data;
 reg [7:0] inputs [0:1279];
 reg [7:0] gold_fc1 [0:2047];
 reg [7:0] gold_fc2 [0:1023];
 reg [7:0] gold_out [0:31];
 integer sample,feature,cycles,seen_fc1,seen_fc2,seen_out,done_count;
 integer k;
 mlp_int8_pipelined_v2 dut(.clk(clk),.rst(rst),.input_valid(input_valid),.input_data(input_data),
  .input_ready(input_ready),.done(done),.output_data(output_data),.overflow_any(overflow_any));
 initial begin
  $readmemh("results/p3_m04/mlp_fold1_parameter_rom/inputs_int8.memh",inputs);
  $readmemh("results/p3_m04/mlp_fold1_parameter_rom/fc1_golden_int8.memh",gold_fc1);
  $readmemh("results/p3_m04/mlp_fold1_parameter_rom/fc2_golden_int8.memh",gold_fc2);
  $readmemh("results/p3_m04/mlp_fold1_parameter_rom/output_golden_int8.memh",gold_out);
  repeat(4) @(negedge clk); rst=0;
  for(sample=0;sample<N_SAMPLES;sample=sample+1) begin
   wait(input_ready);
   for(feature=0;feature<40;feature=feature+1) begin
    @(negedge clk); input_data=inputs[sample*40+feature]; input_valid=1;
   end
   @(negedge clk); input_valid=0;
   cycles=0; seen_fc1=0; seen_fc2=0; seen_out=0; done_count=0;
   // Observe the registered FSM at negative edges; STORE data is stable here.
   begin : sample_run
    for(k=0;k<40000;k=k+1) begin
     @(negedge clk); cycles=cycles+1;
     if(dut.state==10) begin
      case(dut.layer)
       0: begin
        if(dut.neuron_index !== seen_fc1) $fatal(1,"FAIL FC1 neuron order sample=%0d index=%0d expected=%0d",sample,dut.neuron_index,seen_fc1);
        if(dut.neuron_result !== $signed(gold_fc1[sample*64+seen_fc1]))
         $fatal(1,"FAIL FC1 sample=%0d neuron=%0d rtl=%0d golden=%0d",sample,seen_fc1,dut.neuron_result,$signed(gold_fc1[sample*64+seen_fc1]));
        seen_fc1=seen_fc1+1;
       end
       1: begin
        if(dut.neuron_index !== seen_fc2) $fatal(1,"FAIL FC2 neuron order sample=%0d index=%0d expected=%0d",sample,dut.neuron_index,seen_fc2);
        if(dut.neuron_result !== $signed(gold_fc2[sample*32+seen_fc2]))
         $fatal(1,"FAIL FC2 sample=%0d neuron=%0d rtl=%0d golden=%0d",sample,seen_fc2,dut.neuron_result,$signed(gold_fc2[sample*32+seen_fc2]));
        seen_fc2=seen_fc2+1;
       end
       2: begin
        if(dut.neuron_index !== 0) $fatal(1,"FAIL output neuron index");
        if(dut.neuron_result !== $signed(gold_out[sample]))
         $fatal(1,"FAIL output sample=%0d rtl=%0d golden=%0d",sample,dut.neuron_result,$signed(gold_out[sample]));
        seen_out=seen_out+1;
       end
       default: $fatal(1,"FAIL unexpected layer");
      endcase
     end
     if(done) begin
      done_count=done_count+1;
      if(seen_fc1!=64 || seen_fc2!=32 || seen_out!=1)
       $fatal(1,"FAIL neuron count sample=%0d fc1=%0d fc2=%0d output=%0d",sample,seen_fc1,seen_fc2,seen_out);
      if(output_data !== $signed(gold_out[sample])) $fatal(1,"FAIL output latch sample=%0d",sample);
      if(overflow_any) $fatal(1,"FAIL accumulator overflow sample=%0d",sample);
      $display("PASS: sample=%0d fc1=64 fc2=32 output=1 cycles=%0d int8=%0d",sample,cycles,output_data);
      disable sample_run;
     end
    end
   end
   if(done_count!=1) $fatal(1,"FAIL timeout or done count sample=%0d",sample);
   @(negedge clk);
   if(done) $fatal(1,"FAIL done pulse longer than one cycle");
  end
  $display("PASS: P3-M04-04D intermediate-layer RTL equivalence %0d samples",N_SAMPLES);
  $finish;
 end
endmodule
