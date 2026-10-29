`timescale 1ns/1ps
module parameter_rom_sync #(
 parameter WIDTH=8, DEPTH=64,
 parameter ADDR_WIDTH=(DEPTH<=1 ? 1 : $clog2(DEPTH)),
 parameter INIT_FILE=""
)(input wire clk, input wire en, input wire [ADDR_WIDTH-1:0] addr,
 output reg [WIDTH-1:0] data);
 reg [WIDTH-1:0] mem [0:DEPTH-1];
 initial begin
   if (INIT_FILE != "") $readmemh(INIT_FILE,mem);
 end
 always @(posedge clk) if (en) data <= mem[addr];
endmodule
