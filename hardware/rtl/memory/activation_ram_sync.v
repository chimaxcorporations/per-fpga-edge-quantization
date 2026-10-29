`timescale 1ns/1ps
module activation_ram_sync #(
 parameter DEPTH=64,
 parameter ADDR_WIDTH=(DEPTH<=1 ? 1 : $clog2(DEPTH))
)(input wire clk, input wire we, input wire re,
 input wire [ADDR_WIDTH-1:0] waddr, raddr,
 input wire signed [7:0] wdata, output reg signed [7:0] rdata);
 reg signed [7:0] mem [0:DEPTH-1];
 always @(posedge clk) begin
   if (we) mem[waddr] <= wdata;
   if (re) rdata <= mem[raddr];
 end
 // Read-during-write to same address is not specified for the integration controller.
endmodule
