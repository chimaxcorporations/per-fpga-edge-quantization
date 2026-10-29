`timescale 1ns/1ps
// P3-M04-02B: signed 32-bit accumulator; wraparound on overflow.
module int32_accumulator (
    input  wire               clk,
    input  wire               rst,
    input  wire               clear,
    input  wire               en,
    input  wire signed [31:0] data_in,
    output reg  signed [31:0] acc,
    output reg                overflow
);
    wire [31:0] sum_bits = $unsigned(acc) + $unsigned(data_in);
    wire overflow_next = (~(acc[31] ^ data_in[31])) & (acc[31] ^ sum_bits[31]);

    always @(posedge clk) begin
        if (rst) begin
            acc <= 32'sd0;
            overflow <= 1'b0;
        end else if (clear) begin
            acc <= 32'sd0;
            overflow <= 1'b0;
        end else if (en) begin
            acc <= sum_bits;
            overflow <= overflow_next;
        end else begin
            overflow <= 1'b0;
        end
    end
endmodule
