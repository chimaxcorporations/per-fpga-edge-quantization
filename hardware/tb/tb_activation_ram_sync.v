`timescale 1ns/1ps
module tb_activation_ram_sync;
 parameter DEPTH=64;
 parameter ADDR_WIDTH=(DEPTH<=1 ? 1 : $clog2(DEPTH));
 reg clk=0; always #5 clk=~clk;
 reg we=0,re=0;
 reg [ADDR_WIDTH-1:0] waddr=0,raddr=0;
 reg signed [7:0] wdata=0;
 wire signed [7:0] rdata;
 integer i;
 reg [7:0] expected;
 activation_ram_sync #(.DEPTH(DEPTH),.ADDR_WIDTH(ADDR_WIDTH)) dut
 (.clk(clk),.we(we),.re(re),.waddr(waddr),.raddr(raddr),.wdata(wdata),.rdata(rdata));
 initial begin
  for(i=0;i<DEPTH;i=i+1) begin
   @(negedge clk); we=1; re=0; waddr=i; wdata=(i*73+129)&255;
  end
  @(negedge clk); we=0;
  for(i=0;i<DEPTH;i=i+1) begin
   @(negedge clk); re=1; raddr=i;
   @(negedge clk); expected=(i*73+129)&255;
   if(rdata !== expected) begin $display("FAIL: RAM index=%0d got=%h expected=%h",i,rdata,expected); $fatal(1); end
  end
  $display("PASS: activation RAM %0d x INT8 write/read",DEPTH);
  $finish;
 end
endmodule
