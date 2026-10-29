`timescale 1ns / 1ps
module tb_int8_mac;
    reg clk = 1'b0;
    always #5 clk = ~clk;

    reg rst = 1'b0;
    reg clear = 1'b0;
    reg en = 1'b0;
    reg signed [7:0] activation = 8'sd0;
    reg signed [7:0] weight = 8'sd0;
    wire signed [31:0] acc;

    reg signed [31:0] expected = 32'sd0;
    reg signed [15:0] product_ref;
    integer cases = 0;
    integer i;
    integer j;

    int8_mac dut (
        .clk(clk), .rst(rst), .clear(clear), .en(en),
        .activation(activation), .weight(weight), .acc(acc)
    );

    // Drive before rising edge, check after nonblocking assignments settle.
    task step;
        input reset_in;
        input clear_in;
        input enable_in;
        input signed [7:0] a_in;
        input signed [7:0] w_in;
        begin
            @(negedge clk);
            rst = reset_in;
            clear = clear_in;
            en = enable_in;
            activation = a_in;
            weight = w_in;
            product_ref = a_in * w_in;
            if (reset_in || clear_in)
                expected = 32'sd0;
            else if (enable_in)
                expected = expected + {{16{product_ref[15]}}, product_ref};
            @(posedge clk);
            #1;
            cases = cases + 1;
            if (acc !== expected) begin
                $display("FAIL case=%0d rst=%b clear=%b en=%b a=%0d w=%0d got=%0d expected=%0d", cases, reset_in, clear_in, enable_in, a_in, w_in, acc, expected);
                $fatal(1, "INT8 MAC mismatch");
            end
        end
    endtask

    initial begin
        // Reset, hold, clear, and priority checks.
        step(1, 0, 1, -128, -128);
        step(0, 0, 0, 127, 127);
        step(0, 0, 1, -128, -128);
        step(0, 0, 1, -128, 127);
        step(0, 0, 1, 127, -128);
        step(0, 0, 1, 127, 127);
        step(0, 0, 1, 0, -128);
        step(0, 0, 1, -1, -1);
        step(0, 1, 1, 127, 127);
        step(0, 0, 0, -128, -128);
        step(1, 1, 1, -128, -128);

        // Exhaustive INT8 operand-pair testing: 65,536 MAC updates.
        for (i = -128; i <= 127; i = i + 1)
            for (j = -128; j <= 127; j = j + 1)
                step(0, 0, 1, i, j);

        // Multi-cycle accumulation and occasional hold/clear/reset.
        for (i = 0; i < 4096; i = i + 1) begin
            step(0, 0, 1, $random, $random);
            if ((i % 97) == 0)
                step(0, 0, 0, $random, $random);
            if ((i % 509) == 0)
                step(0, 1, 1, $random, $random);
            if ((i % 997) == 0)
                step(1, 0, 1, $random, $random);
        end

        $display("PASS: INT8 MAC %0d self-checking clock cycles", cases);
        $finish;
    end
endmodule
