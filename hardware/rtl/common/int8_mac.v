`timescale 1ns / 1ps
// P3-M04-02A: signed INT8 multiply-accumulate, Verilog-2001.
// Synchronous reset > clear > enable; modulo-2^32 overflow semantics.
module int8_mac (
    input  wire               clk,
    input  wire               rst,
    input  wire               clear,
    input  wire               en,
    input  wire signed [7:0]  activation,
    input  wire signed [7:0]  weight,
    output reg  signed [31:0] acc
);
    wire signed [15:0] product;
    wire signed [31:0] product_extended;

    assign product = activation * weight;
    assign product_extended = {{16{product[15]}}, product};

    always @(posedge clk) begin
        if (rst)
            acc <= 32'sd0;
        else if (clear)
            acc <= 32'sd0;
        else if (en)
            acc <= acc + product_extended;
    end
endmodule
