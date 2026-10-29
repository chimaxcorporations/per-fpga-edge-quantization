`timescale 1ns/1ps
// P3-M06-03B-02: Conv1-only integration checkpoint of CNN controller.
// NOT a full CNN inference implementation. 40 channel-major input bytes,
// then 160 Conv1 results in channel-major order.
module cnn_int8_pipelined_v1 #(
    parameter W_ROM="../../../results/p3_m06/qat_hardware/parameter_rom/conv1_weights.memh",
    parameter B_ROM="../../../results/p3_m06/qat_hardware/parameter_rom/conv1_bias.memh",
    parameter M_ROM="../../../results/p3_m06/qat_hardware/parameter_rom/conv1_multiplier.memh",
    parameter S_ROM="../../../results/p3_m06/qat_hardware/parameter_rom/conv1_shift.memh"
)(
    input wire clk, rst, start,
    input wire input_valid,
    input wire signed [7:0] input_data,
    output wire input_ready,
    output wire busy,
    output reg done,
    output reg conv1_valid,
    output reg [7:0] conv1_index,
    output reg signed [7:0] conv1_data,
    output reg accumulator_overflow,
    output reg config_error
);
    localparam IDLE=4'd0, LOAD=4'd1, PARAM_REQ=4'd2,
      PARAM_WAIT=4'd3, NSTART=4'd4, OP_REQ=4'd5,
      OP_WAIT=4'd6, OP_FEED=4'd7, OP_ADV=4'd8,
      NWAIT=4'd9, WRITE=4'd10, NEXT=4'd11, COMPLETE=4'd12;
    reg [3:0] state;
    reg [5:0] load_idx;
    reg [3:0] oc, t;
    reg [3:0] operand;
    reg signed [31:0] bias_reg, mult_reg;
    reg [5:0] shift_reg;
    reg signed [7:0] feature_reg, weight_reg;
    reg signed [7:0] output_reg;
    reg [7:0] output_addr;
    wire [7:0] waddr = ({4'b0,oc} * 8'd12) + {4'b0,operand};
    wire [4:0] channel = {1'b0,operand} / 5'd3;
    wire [1:0] tap = {1'b0,operand} % 5'd3;
    wire signed [5:0] input_t = $signed({2'b00,t}) + $signed({4'b0,tap}) - 6'sd1;
    wire padding = (input_t < 0 || input_t > 9);
    wire [7:0] in_addr =    (input_t[3:0] * 8'd4) + channel;
    wire [7:0] out_addr = ({4'b0,oc} * 8'd10) + {4'b0,t};
    wire rom_req = (state==PARAM_REQ);
    wire operand_req = (state==OP_REQ);
    wire [7:0] w_data;
    wire [31:0] b_data,m_data;
    wire [7:0] s_data;
    wire signed [7:0] act_data;
    wire neuron_busy, neuron_done, neuron_overflow, neuron_config_error;
    wire signed [7:0] neuron_result;
    wire signed [7:0] neuron_feature = feature_reg;
    wire signed [7:0] neuron_weight = weight_reg;

    assign input_ready = (state==LOAD);
    assign busy = (state!=IDLE);

    parameter_rom_sync #(.WIDTH(8),.DEPTH(192),.ADDR_WIDTH(8),.INIT_FILE(W_ROM)) weights_rom(
       .clk(clk),.en(operand_req),.addr(waddr),.data(w_data));
    parameter_rom_sync #(.WIDTH(32),.DEPTH(16),.ADDR_WIDTH(4),.INIT_FILE(B_ROM)) bias_rom(
       .clk(clk),.en(rom_req),.addr(oc),.data(b_data));
    parameter_rom_sync #(.WIDTH(32),.DEPTH(16),.ADDR_WIDTH(4),.INIT_FILE(M_ROM)) multiplier_rom(
       .clk(clk),.en(rom_req),.addr(oc),.data(m_data));
    parameter_rom_sync #(.WIDTH(8),.DEPTH(16),.ADDR_WIDTH(4),.INIT_FILE(S_ROM)) shift_rom(
       .clk(clk),.en(rom_req),.addr(oc),.data(s_data));

    activation_ram_sync #(.DEPTH(160),.ADDR_WIDTH(8)) input_bank(
       .clk(clk),.we(state==LOAD && input_valid),
       .re(operand_req && !padding),.waddr({2'b00,load_idx}),
       .raddr(in_addr),.wdata(input_data),.rdata(act_data));
    activation_ram_sync #(.DEPTH(160),.ADDR_WIDTH(8)) conv1_bank(
       .clk(clk),.we(state==WRITE),.re(1'b0),.waddr(output_addr),
       .raddr(8'd0),.wdata(output_reg),.rdata());

    neuron_int8_configurable #(.MAX_FEATURES(160)) neuron(
       .clk(clk),.rst(rst),.start(state==NSTART),
       .valid_in(state==OP_FEED),.feature_count_in(8'd12),
       .feature_in(neuron_feature),.weight_in(neuron_weight),
       .bias_in(bias_reg),.multiplier_in(mult_reg),.shift_in(shift_reg),
       .relu_in(1'b1),.busy(neuron_busy),.done(neuron_done),
       .result(neuron_result),.overflow(neuron_overflow),
       .config_error(neuron_config_error));

    always @(posedge clk) begin
       if(rst) begin
          state<=IDLE; load_idx<=0; oc<=0; t<=0; operand<=0;
          bias_reg<=0; mult_reg<=0; shift_reg<=0;
          feature_reg<=0; weight_reg<=0; output_reg<=0; output_addr<=0;
          done<=0; conv1_valid<=0; conv1_index<=0; conv1_data<=0;
          accumulator_overflow<=0; config_error<=0;
       end else begin
          done<=0;
          conv1_valid<=0;
          if(neuron_overflow) accumulator_overflow<=1;
          if(neuron_config_error) config_error<=1;
          case(state)
             IDLE: if(start) begin
                load_idx<=0; oc<=0; t<=0;
                accumulator_overflow<=0; config_error<=0;
                state<=LOAD;
             end
             LOAD: if(input_valid) begin
                if(load_idx==6'd39) begin state<=PARAM_REQ; end
                else load_idx<=load_idx+1'b1;
             end
             PARAM_REQ: state<=PARAM_WAIT;
             PARAM_WAIT: begin
                bias_reg<=$signed(b_data);
                mult_reg<=$signed(m_data);
                shift_reg<=s_data[5:0];
                if(s_data[7:6]!=0) config_error<=1;
                state<=NSTART;
             end
             NSTART: begin operand<=0; state<=OP_REQ; end
             OP_REQ: state<=OP_WAIT;
             OP_WAIT: begin
                weight_reg<=$signed(w_data);
                feature_reg<=padding ? 8'sd0 : act_data;
                state<=OP_FEED;
             end
             OP_FEED: state<=OP_ADV;
             OP_ADV: begin
                if(operand==4'd11) state<=NWAIT;
                else begin operand<=operand+1'b1; state<=OP_REQ; end
             end
             NWAIT: if(neuron_done) begin
                output_reg<=neuron_result;
                output_addr<=out_addr;
                state<=WRITE;
             end
             WRITE: begin
                conv1_valid<=1;
                conv1_index<=output_addr;
                conv1_data<=output_reg;
                state<=NEXT;
             end
             NEXT: begin
                if(t==4'd9) begin
                   t<=0;
                   if(oc==4'd15) state<=COMPLETE;
                   else begin oc<=oc+1'b1; state<=PARAM_REQ; end
                end else begin
                   t<=t+1'b1; state<=PARAM_REQ;
                end
             end
             COMPLETE: begin done<=1; state<=IDLE; end
             default: state<=IDLE;
          endcase
       end
    end
endmodule
