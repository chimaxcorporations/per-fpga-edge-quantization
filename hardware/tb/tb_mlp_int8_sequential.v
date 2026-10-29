`timescale 1ns/1ps
module tb_mlp_int8_sequential;
 parameter N_SAMPLES=2;
 reg clk=0; always #5 clk=~clk;
 reg rst=1, input_valid=0;
 reg signed [7:0] input_data=0;
 wire input_ready,done,overflow_any;
 wire signed [7:0] output_data;
 reg [7:0] inputs [0:1279];
 reg [7:0] golden [0:31];
 integer sample,feature,cycles;
 mlp_int8_sequential dut(.clk(clk),.rst(rst),.input_valid(input_valid),.input_data(input_data),
  .input_ready(input_ready),.done(done),.output_data(output_data),.overflow_any(overflow_any));
 initial begin
  $readmemh("results/p3_m04/mlp_fold1_parameter_rom/inputs_int8.memh",inputs);
  $readmemh("results/p3_m04/mlp_fold1_parameter_rom/output_golden_int8.memh",golden);
  repeat(4) @(negedge clk); rst=0;
  for(sample=0;sample<N_SAMPLES;sample=sample+1) begin
   wait(input_ready);
   for(feature=0;feature<40;feature=feature+1) begin
    @(negedge clk); input_data=inputs[sample*40+feature]; input_valid=1;
   end
   @(negedge clk); input_valid=0;
   cycles=0;
   while(!done && cycles<30000) begin @(negedge clk); cycles=cycles+1; end
   if(!done) $fatal(1,"FAIL: timeout sample %0d",sample);
   if(output_data !== $signed(golden[sample])) $fatal(1,"FAIL: sample %0d RTL=%0d golden=%0d",sample,output_data,$signed(golden[sample]));
   if(overflow_any) $fatal(1,"FAIL: accumulator overflow sample %0d",sample);
   $display("PASS: integrated sample %0d output=%0d cycles=%0d",sample,output_data,cycles);
   @(negedge clk);
  end
  $display("PASS: P3-M04-04C complete sequential MLP %0d samples",N_SAMPLES);
  $finish;
 end
endmodule
