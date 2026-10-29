`timescale 1ns/1ps
// Verilog-2001 self-checking bench, independent Python oracle via $readmemh.
module tb_requantize_q31;
    parameter VECTOR_COUNT = 20000;
    reg signed [31:0] accumulator;
    reg signed [31:0] multiplier_q31;
    wire signed [63:0] rounded_out;
    reg [127:0] vectors [0:VECTOR_COUNT-1];
    reg signed [63:0] expected;
    integer i;
    integer errors;

    requantize_q31 dut (
        .accumulator(accumulator),
        .multiplier_q31(multiplier_q31),
        .rounded_out(rounded_out)
    );

    initial begin
        errors = 0;
        accumulator = 0;
        multiplier_q31 = 0;
        $readmemh("results/p3_m04/requantize_q31/golden_vectors.memh", vectors);
        for (i = 0; i < VECTOR_COUNT; i = i + 1) begin
            accumulator = vectors[i][127:96];
            multiplier_q31 = vectors[i][95:64];
            expected = vectors[i][63:0];
            #1;
            if (rounded_out !== expected) begin
                $display("FAIL vector=%0d acc=%0d mult=%0d got=%0d expected=%0d",
                         i, accumulator, multiplier_q31, rounded_out, expected);
                errors = errors + 1;
                if (errors >= 20) begin
                    $display("FAIL: too many mismatches");
                    $stop;
                end
            end
        end
        if (errors != 0) begin
            $display("FAIL: %0d mismatches / %0d vectors", errors, VECTOR_COUNT);
            $stop;
        end
        $display("PASS: Q31 ties-to-even %0d Python-golden vectors", VECTOR_COUNT);
        $finish;
    end
endmodule
