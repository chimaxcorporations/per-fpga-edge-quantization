`timescale 1ns/1ps

module tb_neuron_pipeline_equivalence;

    reg clk = 0;
    always #5 clk = ~clk;

    reg rst = 1;
    reg start = 0;
    reg valid_in = 0;

    reg signed [7:0] feature_in = 0;
    reg signed [7:0] weight_in = 0;

    reg signed [31:0] bias_in = 0;
    reg signed [31:0] multiplier_in = 0;

    reg [5:0] shift_in = 0;
    reg relu_in = 0;

    wire busy_ref, done_ref, overflow_ref;
    wire busy_opt, done_opt, overflow_opt;

    wire signed [7:0] result_ref;
    wire signed [7:0] result_opt;

    integer errors = 0;
    integer tests = 0;
    integer cycle_count = 0;

    always @(posedge clk)
        cycle_count <= cycle_count + 1;

    neuron_int8_serial #(.N_FEATURES(4)) reference (
        .clk(clk),
        .rst(rst),
        .start(start),
        .valid_in(valid_in),
        .feature_in(feature_in),
        .weight_in(weight_in),
        .bias_in(bias_in),
        .multiplier_in(multiplier_in),
        .shift_in(shift_in),
        .relu_in(relu_in),
        .busy(busy_ref),
        .done(done_ref),
        .result(result_ref),
        .overflow(overflow_ref)
    );

    neuron_int8_pipelined #(.N_FEATURES(4)) optimized (
        .clk(clk),
        .rst(rst),
        .start(start),
        .valid_in(valid_in),
        .feature_in(feature_in),
        .weight_in(weight_in),
        .bias_in(bias_in),
        .multiplier_in(multiplier_in),
        .shift_in(shift_in),
        .relu_in(relu_in),
        .busy(busy_opt),
        .done(done_opt),
        .result(result_opt),
        .overflow(overflow_opt)
    );

    task run_test;
        input signed [31:0] bias;
        input signed [31:0] multiplier;
        input [5:0] shift;
        input relu;
        input signed [7:0] feature;
        input signed [7:0] weight;

        integer i;
        integer ref_cycle;
        integer opt_cycle;
        reg ref_seen;
        reg opt_seen;
        reg signed [7:0] captured_ref;
        reg signed [7:0] captured_opt;
        reg captured_overflow_ref;
        reg captured_overflow_opt;

        begin
            tests = tests + 1;

            ref_seen = 0;
            opt_seen = 0;
            ref_cycle = -1;
            opt_cycle = -1;

            captured_ref = 0;
            captured_opt = 0;
            captured_overflow_ref = 0;
            captured_overflow_opt = 0;

            @(negedge clk);

            start = 1;
            bias_in = bias;
            multiplier_in = multiplier;
            shift_in = shift;
            relu_in = relu;

            @(negedge clk);
            start = 0;

            for (i = 0; i < 4; i = i + 1) begin
                valid_in = 1;
                feature_in = feature;
                weight_in = weight;

                @(negedge clk);
            end

            valid_in = 0;

            for (i = 0; i < 20; i = i + 1) begin

                @(negedge clk);

                if (done_ref && !ref_seen) begin
                    ref_seen = 1;
                    ref_cycle = cycle_count;
                    captured_ref = result_ref;
                    captured_overflow_ref = overflow_ref;
                end

                if (done_opt && !opt_seen) begin
                    opt_seen = 1;
                    opt_cycle = cycle_count;
                    captured_opt = result_opt;
                    captured_overflow_opt = overflow_opt;
                end

            end

            if (!ref_seen || !opt_seen) begin
                $display("FAIL: completion timeout, test=%0d", tests);
                errors = errors + 1;
            end else begin

                if (captured_ref !== captured_opt ||
                    captured_overflow_ref !== captured_overflow_opt) begin

                    $display(
                        "FAIL test=%0d ref=%0d opt=%0d overflow_ref=%0d overflow_opt=%0d",
                        tests,
                        captured_ref,
                        captured_opt,
                        captured_overflow_ref,
                        captured_overflow_opt
                    );

                    errors = errors + 1;

                end

                if (opt_cycle - ref_cycle != 2) begin

                    $display(
                        "FAIL latency test=%0d ref_cycle=%0d opt_cycle=%0d",
                        tests,
                        ref_cycle,
                        opt_cycle
                    );

                    errors = errors + 1;

                end

            end

        end
    endtask

    initial begin

        repeat (4) @(negedge clk);
        rst = 0;

        run_test(0, 1073741824, 30, 0, 10, 5);
        run_test(0, 1073741824, 30, 1, -10, 5);

        run_test(100, 1073741824, 30, 0, 127, 127);
        run_test(-100, 1073741824, 30, 0, -128, 127);

        run_test(2147483647, 1073741824, 30, 0, 127, 127);
        run_test(-2147483647, 1073741824, 30, 0, -128, 127);

        run_test(0, 2147483647, 31, 0, 127, 127);
        run_test(0, 2147483647, 31, 1, -128, 127);

        run_test(0, 1073741824, 0, 0, 1, 1);
        run_test(0, 1073741824, 1, 0, 1, 1);

        run_test(0, 1073741824, 2, 0, 1, 1);
        run_test(0, 1073741824, 2, 0, 3, 1);

        if (errors == 0) begin
            $display(
                "PASS: %0d neuron equivalence tests",
                tests
            );
        end else begin
            $display(
                "FAIL: %0d errors across %0d tests",
                errors,
                tests
            );
            $fatal(1);
        end

        $finish;

    end

endmodule
