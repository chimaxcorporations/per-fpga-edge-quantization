`timescale 1ns/1ps
module tb_p3_toolchain_test;
  reg clk = 0;
  reg rst = 1;
  reg signed [7:0] a = 0;
  reg signed [7:0] b = 0;
  wire signed [31:0] result;
  integer i;
  reg signed [31:0] expected;
  p3_toolchain_test dut(.clk(clk), .rst(rst), .a(a), .b(b), .result(result));
  always #5 clk = ~clk;
  initial begin
    @(negedge clk);
    rst = 0;
    for (i = 0; i < 1024; i = i + 1) begin
      a = (i * 37) - 128;
      b = (i * 53) - 128;
      expected = $signed(a) * $signed(b);
      @(posedge clk);
      #1;
      if (result !== expected) begin
        $display("FAIL i=%0d a=%0d b=%0d got=%0d expected=%0d",i,a,b,result,expected);
        $fatal(1);
      end
      @(negedge clk);
    end
    $display("PASS: 1024 signed multiplication test cases");
    $finish;
  end
endmodule
