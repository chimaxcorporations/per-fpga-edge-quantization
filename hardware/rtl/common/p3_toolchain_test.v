`timescale 1ns / 1ps

module p3_toolchain_test (
    input wire clk,
    input wire rst,
    input wire signed [7:0] a,
    input wire signed [7:0] b,
    output reg signed [31:0] result
);

    always @(posedge clk) begin
        if (rst)
            result <= 32'sd0;
        else
            result <= $signed(a) * $signed(b);
    end

endmodule
