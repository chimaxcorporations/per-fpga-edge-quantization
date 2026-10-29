`timescale 1ns/1ps
module tb_parameter_rom_sync;
 parameter WIDTH=8, DEPTH=64;
 parameter ADDR_WIDTH=(DEPTH<=1 ? 1 : $clog2(DEPTH));
 reg clk=0; always #5 clk=~clk;
 reg en=0; reg [ADDR_WIDTH-1:0] addr=0;
 wire [WIDTH-1:0] data;
 reg [WIDTH-1:0] expected [0:DEPTH-1];
 reg [1023:0] filename;
 integer i, fd;
 parameter INIT_FILE="";
 parameter GOLDEN_FILE="";
 parameter ROM_NAME="rom";
 parameter_rom_sync #(.WIDTH(WIDTH),.DEPTH(DEPTH),.ADDR_WIDTH(ADDR_WIDTH),.INIT_FILE(INIT_FILE)) dut
 (.clk(clk),.en(en),.addr(addr),.data(data));
 initial begin
  fd=$fopen(GOLDEN_FILE,"r");
  if (!fd) begin $display("FAIL: missing golden %0s",GOLDEN_FILE); $fatal(1); end
  $fclose(fd);
  $readmemh(GOLDEN_FILE,expected);
  for(i=0;i<DEPTH;i=i+1) begin
   @(negedge clk); en=1; addr=i;
   @(negedge clk);
   if (data !== expected[i]) begin
    $display("FAIL: %0s index=%0d got=%h expected=%h",ROM_NAME,i,data,expected[i]); $fatal(1);
   end
  end
  $display("PASS: %0s synchronous ROM readback %0d words x %0d bits",ROM_NAME,DEPTH,WIDTH);
  $finish;
 end
endmodule
