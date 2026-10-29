`timescale 1ns/1ps
module tb_neuron_int8_configurable;
    reg clk=0;
    always #5 clk=~clk;
    reg rst=1, start=0, valid_in=0;
    reg [7:0] feature_count_in=0;
    reg signed [7:0] feature_in=0, weight_in=0;
    reg signed [31:0] bias_in=0, multiplier_in=0;
    reg [5:0] shift_in=0;
    reg relu_in=0;
    wire busy, done, overflow, config_error;
    wire signed [7:0] result;
    neuron_int8_configurable #(.MAX_FEATURES(160)) dut (
        .clk(clk),.rst(rst),.start(start),.valid_in(valid_in),
        .feature_count_in(feature_count_in),.feature_in(feature_in),
        .weight_in(weight_in),.bias_in(bias_in),.multiplier_in(multiplier_in),
        .shift_in(shift_in),.relu_in(relu_in),.busy(busy),.done(done),
        .result(result),.overflow(overflow),.config_error(config_error));
    reg [7:0] fmem[0:2559], wmem[0:2559];
    reg [7:0] counts[0:15], shifts[0:15], relus[0:15], expected[0:15];
    reg [31:0] biases[0:15], multipliers[0:15];
    integer c,j,timeout,comparisons=0;
    initial begin
        $readmemh("vectors/features.memh",fmem);
        $readmemh("vectors/weights.memh",wmem);
        $readmemh("vectors/counts.memh",counts);
        $readmemh("vectors/biases.memh",biases);
        $readmemh("vectors/multipliers.memh",multipliers);
        $readmemh("vectors/shifts.memh",shifts);
        $readmemh("vectors/relu.memh",relus);
        $readmemh("vectors/expected.memh",expected);
        repeat(3) @(negedge clk);
        rst=0;
        for(c=0;c<16;c=c+1) begin
            @(negedge clk);
            feature_count_in=counts[c];
            bias_in=biases[c]; multiplier_in=multipliers[c];
            shift_in=shifts[c][5:0]; relu_in=relus[c][0];
            start=1;
            @(negedge clk); start=0;
            if(!busy || done || config_error) $fatal(1,"Start handshake failed case %0d",c);
            for(j=0;j<counts[c];j=j+1) begin
                @(negedge clk);
                // Insert deterministic bubbles: valid samples only are counted.
                if(j%7==0) begin
                    valid_in=0;
                    @(negedge clk);
                end
                feature_in=fmem[c*160+j];
                weight_in=wmem[c*160+j];
                valid_in=1;
                @(negedge clk);
                valid_in=0;
                // Mutate count during execution to verify it was latched.
                feature_count_in=8'd1;
            end
            timeout=0;
            while(!done && timeout<30) begin
                @(negedge clk); timeout=timeout+1;
            end
            if(!done) $fatal(1,"Timeout case %0d",c);
            if(overflow || config_error || result !== expected[c])
                $fatal(1,"Mismatch case %0d: got %0d expected %0d overflow=%b error=%b",
                       c,result,$signed(expected[c]),overflow,config_error);
            comparisons=comparisons+1;
            @(negedge clk);
            if(done || busy) $fatal(1,"Completion handshake failed case %0d",c);
        end
        // Invalid count must complete with config_error and no busy operation.
        @(negedge clk); feature_count_in=0; start=1;
        @(negedge clk); start=0;
        if(!done || !config_error || busy) $fatal(1,"Zero-count rejection failed");
        @(negedge clk);
        if(done) $fatal(1,"Invalid-count done was not a pulse");
        $display("PASS: P3-M06-03A configurable neuron, %0d arithmetic comparisons, stalls and handshakes",comparisons);
        $finish;
    end
endmodule
