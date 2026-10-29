`timescale 1ns/1ps
module tb_neuron_int8_serial;
    parameter N_FEATURES = 40;
    parameter N_CASES = 2000;
    reg clk = 0;
    always #5 clk = ~clk;
    reg rst = 1, start = 0, valid_in = 0, relu_in = 0;
    reg signed [7:0] feature_in = 0, weight_in = 0;
    reg signed [31:0] bias_in = 0, multiplier_in = 0;
    reg [5:0] shift_in = 0;
    wire busy, done, overflow;
    wire signed [7:0] result;
    reg [79:0] header;
    reg [15:0] pair;
    reg [7:0] expected;
    reg expected_overflow;
    integer fd, status, c, i;
    reg [1023:0] filename;
    neuron_int8_serial #(.N_FEATURES(N_FEATURES)) dut (
        .clk(clk), .rst(rst), .start(start), .valid_in(valid_in),
        .feature_in(feature_in), .weight_in(weight_in),
        .bias_in(bias_in), .multiplier_in(multiplier_in),
        .shift_in(shift_in), .relu_in(relu_in),
        .busy(busy), .done(done), .result(result), .overflow(overflow)
    );
    initial begin
        if (!$value$plusargs("VECTORS=%s", filename))
            filename = "results/p3_m04/neuron_int8_serial/golden_vectors.memh";
        fd = $fopen(filename, "r");
        if (!fd) begin $display("FAIL: missing vectors %0s", filename); $stop; end
        repeat (2) @(negedge clk);
        rst = 0;
        for (c=0; c<N_CASES; c=c+1) begin
            status = $fscanf(fd, "%h\n", header);
            if (status != 1) begin $display("FAIL: header case %0d", c); $stop; end
            bias_in = header[79:48]; multiplier_in = header[47:16];
            shift_in = header[15:10]; relu_in = header[9];
            expected = header[8:1]; expected_overflow = header[0];
            start = 1;
            @(negedge clk); start = 0;
            if (!busy) begin $display("FAIL: busy missing case %0d", c); $stop; end
            for (i=0; i<N_FEATURES; i=i+1) begin
                status = $fscanf(fd, "%h\n", pair);
                if (status != 1) begin $display("FAIL: pair case %0d idx %0d", c,i); $stop; end
                feature_in = pair[15:8]; weight_in = pair[7:0];
                valid_in = 1;
                @(negedge clk);
            end
            valid_in = 0;
            @(negedge clk);
            if (!done || result !== expected || overflow !== expected_overflow) begin
                $display("FAIL: case=%0d got=%0d expected=%0d done=%b overflow=%b expected_overflow=%b", c,result,$signed(expected),done,overflow,expected_overflow);
                $stop;
            end
            @(negedge clk);
        end
        $fclose(fd);
        $display("PASS: serial neuron %0d Python-golden cases x %0d features",N_CASES,N_FEATURES);
        $finish;
    end
endmodule
