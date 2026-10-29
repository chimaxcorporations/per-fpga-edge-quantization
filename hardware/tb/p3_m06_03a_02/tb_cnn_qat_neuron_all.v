`timescale 1ns/1ps
// P3-M06-03A-02: all 11,296 real CNN QAT neurons, independently golden-checked.
module tb_cnn_qat_neuron_all;
    localparam CASES=11296;
    localparam OPERANDS=472064;
    reg clk=0;
    always #5 clk=~clk;
    reg rst=1,start=0,valid_in=0;
    reg [7:0] feature_count_in=0;
    reg signed [7:0] feature_in=0,weight_in=0;
    reg signed [31:0] bias_in=0,multiplier_in=0;
    reg [5:0] shift_in=0;
    reg relu_in=0;
    wire busy,done,overflow,config_error;
    wire signed [7:0] result;
    neuron_int8_configurable #(.MAX_FEATURES(160)) dut(
        .clk(clk),.rst(rst),.start(start),.valid_in(valid_in),
        .feature_count_in(feature_count_in),.feature_in(feature_in),.weight_in(weight_in),
        .bias_in(bias_in),.multiplier_in(multiplier_in),.shift_in(shift_in),.relu_in(relu_in),
        .busy(busy),.done(done),.result(result),.overflow(overflow),.config_error(config_error));
    reg [7:0] features[0:OPERANDS-1],weights[0:OPERANDS-1];
    reg [7:0] counts[0:CASES-1],shifts[0:CASES-1],relus[0:CASES-1],expected[0:CASES-1];
    reg [7:0] layer_ids[0:CASES-1],sample_ids[0:CASES-1];
    reg [15:0] neuron_ids[0:CASES-1];
    reg [31:0] biases[0:CASES-1],multipliers[0:CASES-1];
    integer c,j,offset=0,checks=0,overflows=0,timeout;
    initial begin
        $readmemh("vectors/features.memh",features);
        $readmemh("vectors/weights.memh",weights);
        $readmemh("vectors/counts.memh",counts);
        $readmemh("vectors/biases.memh",biases);
        $readmemh("vectors/multipliers.memh",multipliers);
        $readmemh("vectors/shifts.memh",shifts);
        $readmemh("vectors/relus.memh",relus);
        $readmemh("vectors/expected.memh",expected);
        $readmemh("vectors/layer_ids.memh",layer_ids);
        $readmemh("vectors/sample_ids.memh",sample_ids);
        $readmemh("vectors/neuron_ids.memh",neuron_ids);
        repeat(3) @(negedge clk);
        rst=0;
        for(c=0;c<CASES;c=c+1) begin
            if(counts[c]!=12 && counts[c]!=48 && counts[c]!=160 && counts[c]!=32)
                $fatal(1,"Invalid vector count case=%0d",c);
            if(offset+counts[c]>OPERANDS)
                $fatal(1,"Operand bounds violation case=%0d",c);
            @(negedge clk);
            feature_count_in=counts[c];
            bias_in=biases[c];multiplier_in=multipliers[c];
            shift_in=shifts[c][5:0];relu_in=relus[c][0];
            valid_in=0;start=1;
            @(negedge clk);start=0;
            if(!busy || done || config_error)
                $fatal(1,"Start handshake failed case=%0d layer=%0d",c,layer_ids[c]);
            for(j=0;j<counts[c];j=j+1) begin
                @(negedge clk);
                // Inject a stall every 17th MAC and verify that only valid inputs count.
                if(j%17==0) begin
                    valid_in=0;
                    @(negedge clk);
                end
                feature_in=features[offset+j];
                weight_in=weights[offset+j];
                valid_in=1;
                @(negedge clk);
                valid_in=0;
                // Verify feature_count_in is latched on start.
                feature_count_in=8'd1;
            end
            offset=offset+counts[c];
            timeout=0;
            while(!done && timeout<25) begin
                @(negedge clk);
                timeout=timeout+1;
            end
            if(!done)
                $fatal(1,"Timeout case=%0d layer=%0d sample=%0d neuron=%0d",c,layer_ids[c],sample_ids[c],neuron_ids[c]);
            if(overflow) overflows=overflows+1;
            if(overflow || config_error || result !== expected[c])
                $fatal(1,"Mismatch case=%0d layer=%0d sample=%0d neuron=%0d got=%0d expected=%0d overflow=%b config_error=%b",
                       c,layer_ids[c],sample_ids[c],neuron_ids[c],result,$signed(expected[c]),overflow,config_error);
            checks=checks+1;
            @(negedge clk);
            if(done || busy)
                $fatal(1,"Completion handshake failed case=%0d",c);
            if((c+1)%1000==0)
                $display("PROGRESS: %0d/%0d CNN QAT neurons verified",c+1,CASES);
        end
        if(offset!=OPERANDS)
            $fatal(1,"Operand stream length mismatch consumed=%0d expected=%0d",offset,OPERANDS);
        $display("CNN neuron comparisons : %0d",checks);
        $display("Arithmetic mismatches  : 0");
        $display("Accumulator overflows  : %0d",overflows);
        $display("Result                 : PASS");
        $display("PASS: CNN QAT fold-1 configurable neuron verification");
        $finish;
    end
endmodule
