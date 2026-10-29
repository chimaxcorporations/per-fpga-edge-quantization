`timescale 1ns/1ps
module tb_int8_saturate_relu;
    parameter VECTOR_COUNT = 20000;
    reg signed [63:0] data_in;
    reg relu_enable;
    wire signed [7:0] data_out;
    reg [72:0] vectors [0:VECTOR_COUNT-1];
    reg [7:0] expected;
    integer i;
    integer errors;

    int8_saturate_relu dut (
        .data_in(data_in), .relu_enable(relu_enable), .data_out(data_out)
    );

    initial begin
        errors = 0;
        $readmemh("results/p3_m04/int8_saturate_relu/golden_vectors.memh", vectors);
        for (i = 0; i < VECTOR_COUNT; i = i + 1) begin
            data_in = vectors[i][72:9];
            relu_enable = vectors[i][8];
            expected = vectors[i][7:0];
            #1;
            if (data_out !== expected) begin
                $display("FAIL index=%0d in=%0d relu=%0d got=%0d expected=%0d",
                         i, data_in, relu_enable, data_out, $signed(expected));
                errors = errors + 1;
                if (errors >= 10) $stop;
            end
        end
        if (errors != 0) begin
            $display("FAIL: %0d mismatches", errors);
            $stop;
        end
        $display("PASS: INT8 saturation/ReLU %0d Python-golden vectors", VECTOR_COUNT);
        $finish;
    end
endmodule
