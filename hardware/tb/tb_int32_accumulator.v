`timescale 1ns/1ps
module tb_int32_accumulator;
    reg clk, rst, clear, en;
    reg signed [31:0] data_in;
    wire signed [31:0] acc;
    wire overflow;
    reg [31:0] expected_acc;
    reg expected_overflow;
    reg [31:0] next_sum;
    integer checks, i;
    reg [31:0] rng;

    int32_accumulator dut (
        .clk(clk), .rst(rst), .clear(clear), .en(en),
        .data_in(data_in), .acc(acc), .overflow(overflow)
    );

    // Inputs change away from the sampling edge. Each step checks post-NBA outputs.
    task step;
        input t_rst, t_clear, t_en;
        input [31:0] t_data;
        begin
            @(negedge clk);
            rst = t_rst; clear = t_clear; en = t_en; data_in = t_data;
            if (t_rst || t_clear) begin
                expected_acc = 32'd0;
                expected_overflow = 1'b0;
            end else if (t_en) begin
                next_sum = expected_acc + t_data;
                expected_overflow = (~(expected_acc[31] ^ t_data[31])) &
                                    (expected_acc[31] ^ next_sum[31]);
                expected_acc = next_sum;
            end else begin
                expected_overflow = 1'b0;
            end
            @(posedge clk);
            #1;
            if (acc !== expected_acc || overflow !== expected_overflow) begin
                $display("FAIL check=%0d rst=%b clear=%b en=%b input=%h got_acc=%h expected_acc=%h got_ovf=%b expected_ovf=%b",
                    checks, t_rst, t_clear, t_en, t_data,
                    acc, expected_acc, overflow, expected_overflow);
                $fatal(1, "INT32 accumulator mismatch");
            end
            checks = checks + 1;
        end
    endtask

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        rst = 0; clear = 0; en = 0; data_in = 0;
        expected_acc = 0; expected_overflow = 0;
        checks = 0;
        rng = 32'h8badf00d;

        step(1, 0, 0, 32'd0);
        step(0, 0, 1, 32'h7fffffff);
        step(0, 0, 1, 32'd1);          // positive overflow
        step(0, 0, 0, 32'hffffffff);  // hold, flag clears
        step(0, 1, 1, 32'h80000000);  // clear priority
        step(0, 0, 1, 32'h80000000);
        step(0, 0, 1, 32'hffffffff);  // negative overflow
        step(1, 1, 1, 32'h7fffffff);  // reset priority
        step(0, 0, 1, 32'hffffffff);
        step(0, 0, 1, 32'd1);          // -1 + 1 = 0
        step(0, 0, 1, 32'h80000000);
        step(0, 0, 1, 32'h80000000);  // wrap to zero
        step(0, 0, 1, 32'h00000000);
        step(0, 0, 0, 32'h7fffffff);

        // Deterministic pseudorandom stream; no external seed dependency.
        for (i = 0; i < 10000; i = i + 1) begin
            rng = (rng * 32'd1664525) + 32'd1013904223;
            step((i % 997) == 0, (i % 113) == 0,
                 (i % 7) != 0, rng);
        end

        $display("PASS: INT32 accumulator %0d self-checking cycles", checks);
        $finish;
    end
endmodule
