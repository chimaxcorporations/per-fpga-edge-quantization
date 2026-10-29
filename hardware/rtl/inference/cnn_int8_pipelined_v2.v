`timescale 1ns/1ps
// P3-M06-03B-02: Conv1-only integration checkpoint of CNN controller.
// Conv1+Conv2 only; FC layers are not yet integrated. 40 time-major input bytes,
// then 160 Conv1 results in channel-major order.
module cnn_int8_pipelined_v2 #(
    parameter W_ROM="../../../results/p3_m06/qat_hardware/parameter_rom/conv1_weights.memh",
    parameter B_ROM="../../../results/p3_m06/qat_hardware/parameter_rom/conv1_bias.memh",
    parameter M_ROM="../../../results/p3_m06/qat_hardware/parameter_rom/conv1_multiplier.memh",
    parameter S_ROM="../../../results/p3_m06/qat_hardware/parameter_rom/conv1_shift.memh",
    parameter W2_ROM="../../../results/p3_m06/qat_hardware/parameter_rom/conv2_weights.memh",
    parameter B2_ROM="../../../results/p3_m06/qat_hardware/parameter_rom/conv2_bias.memh",
    parameter M2_ROM="../../../results/p3_m06/qat_hardware/parameter_rom/conv2_multiplier.memh",
    parameter S2_ROM="../../../results/p3_m06/qat_hardware/parameter_rom/conv2_shift.memh"
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
    output reg conv2_valid,
    output reg [7:0] conv2_index,
    output reg signed [7:0] conv2_data,
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
    reg [5:0] operand;
    reg layer; // 0: Conv1; 1: Conv2
    reg signed [31:0] bias_reg, mult_reg;
    reg [5:0] shift_reg;
    reg signed [7:0] feature_reg, weight_reg;
    reg signed [7:0] output_reg;
    reg [7:0] output_addr;
    wire [9:0] waddr2 = ({6'b0,oc} * 10'd48) + {4'b0,operand};
    wire [7:0] waddr = ({4'b0,oc} * 8'd12) + {2'b0,operand};
    wire [4:0] channel = operand / 6'd3;
    wire [1:0] tap = operand % 6'd3;
    wire signed [5:0] input_t = $signed({2'b00,t}) + $signed({4'b0,tap}) - 6'sd1;
    wire padding = (input_t < 0 || input_t > 9);
    // Raw input ROM: time-major [time][channel]; Conv1 output: channel-major.
    wire [7:0] in_addr = layer ?
        ((channel * 8'd10) + input_t[3:0]) :
        ((input_t[3:0] * 8'd4) + channel);
    wire [7:0] out_addr = ({4'b0,oc} * 8'd10) + {4'b0,t};
    wire rom_req = (state==PARAM_REQ);
    wire operand_req = (state==OP_REQ);
    wire [7:0] w_data, w2_data;
    wire [31:0] b2_data, m2_data;
    wire [7:0] s2_data;
    wire signed [7:0] act2_data;
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
       .clk(clk),.en(operand_req && !layer),.addr(waddr),.data(w_data));
    parameter_rom_sync #(.WIDTH(8),.DEPTH(768),.ADDR_WIDTH(10),.INIT_FILE(W2_ROM)) weights2_rom(
       .clk(clk),.en(operand_req && layer),.addr(waddr2),.data(w2_data));
    parameter_rom_sync #(.WIDTH(32),.DEPTH(16),.ADDR_WIDTH(4),.INIT_FILE(B2_ROM)) bias2_rom(
       .clk(clk),.en(rom_req && layer),.addr(oc),.data(b2_data));
    parameter_rom_sync #(.WIDTH(32),.DEPTH(16),.ADDR_WIDTH(4),.INIT_FILE(M2_ROM)) multiplier2_rom(
       .clk(clk),.en(rom_req && layer),.addr(oc),.data(m2_data));
    parameter_rom_sync #(.WIDTH(8),.DEPTH(16),.ADDR_WIDTH(4),.INIT_FILE(S2_ROM)) shift2_rom(
       .clk(clk),.en(rom_req && layer),.addr(oc),.data(s2_data));
    parameter_rom_sync #(.WIDTH(32),.DEPTH(16),.ADDR_WIDTH(4),.INIT_FILE(B_ROM)) bias_rom(
       .clk(clk),.en(rom_req && !layer),.addr(oc),.data(b_data));
    parameter_rom_sync #(.WIDTH(32),.DEPTH(16),.ADDR_WIDTH(4),.INIT_FILE(M_ROM)) multiplier_rom(
       .clk(clk),.en(rom_req && !layer),.addr(oc),.data(m_data));
    parameter_rom_sync #(.WIDTH(8),.DEPTH(16),.ADDR_WIDTH(4),.INIT_FILE(S_ROM)) shift_rom(
       .clk(clk),.en(rom_req && !layer),.addr(oc),.data(s_data));

    activation_ram_sync #(.DEPTH(160),.ADDR_WIDTH(8)) input_bank(
       .clk(clk),.we((state==LOAD && input_valid) || (state==WRITE && layer)),
       .re(operand_req && !padding && !layer),
       .waddr(layer ? output_addr : {2'b00,load_idx}),
       .raddr(in_addr),.wdata(layer ? output_reg : input_data),.rdata(act_data));
    activation_ram_sync #(.DEPTH(160),.ADDR_WIDTH(8)) conv1_bank(
       .clk(clk),.we(state==WRITE && !layer),
       .re(operand_req && !padding && layer),.waddr(output_addr),
       .raddr(in_addr),.wdata(output_reg),.rdata(act2_data));

    // Conv2 results return to bank A; Conv1 results are retained in bank B.
    // Bank A input reads are disabled during Conv2, avoiding read/write conflict.
    // Bank A is reused only after all Conv1 input consumption is complete.
    neuron_int8_configurable #(.MAX_FEATURES(160)) neuron(
       .clk(clk),.rst(rst),.start(state==NSTART),
       .valid_in(state==OP_FEED),.feature_count_in(layer ? 8'd48 : 8'd12),
       .feature_in(neuron_feature),.weight_in(neuron_weight),
       .bias_in(bias_reg),.multiplier_in(mult_reg),.shift_in(shift_reg),
       .relu_in(1'b1),.busy(neuron_busy),.done(neuron_done),
       .result(neuron_result),.overflow(neuron_overflow),
       .config_error(neuron_config_error));

    always @(posedge clk) begin
       if(rst) begin
          state<=IDLE; load_idx<=0; oc<=0; t<=0; operand<=0; layer<=0;
          bias_reg<=0; mult_reg<=0; shift_reg<=0;
          feature_reg<=0; weight_reg<=0; output_reg<=0; output_addr<=0;
          done<=0; conv1_valid<=0; conv1_index<=0; conv1_data<=0;
          conv2_valid<=0; conv2_index<=0; conv2_data<=0;
          accumulator_overflow<=0; config_error<=0;
       end else begin
          done<=0;
          conv1_valid<=0;
          conv2_valid<=0;
          if(neuron_overflow) accumulator_overflow<=1;
          if(neuron_config_error) config_error<=1;
          case(state)
             IDLE: if(start) begin
                load_idx<=0; oc<=0; t<=0; layer<=0;
                accumulator_overflow<=0; config_error<=0;
                state<=LOAD;
             end
             LOAD: if(input_valid) begin
                if(load_idx==6'd39) begin state<=PARAM_REQ; end
                else load_idx<=load_idx+1'b1;
             end
             PARAM_REQ: state<=PARAM_WAIT;
             PARAM_WAIT: begin
                bias_reg<=layer ? $signed(b2_data) : $signed(b_data);
                mult_reg<=layer ? $signed(m2_data) : $signed(m_data);
                shift_reg<=layer ? s2_data[5:0] : s_data[5:0];
                if(layer ? (s2_data[7:6]!=0) : (s_data[7:6]!=0)) config_error<=1;
                state<=NSTART;
             end
             NSTART: begin operand<=0; state<=OP_REQ; end
             OP_REQ: state<=OP_WAIT;
             OP_WAIT: begin
                weight_reg<=layer ? $signed(w2_data) : $signed(w_data);
                feature_reg<=padding ? 8'sd0 : (layer ? act2_data : act_data);
                state<=OP_FEED;
             end
             OP_FEED: state<=OP_ADV;
             OP_ADV: begin
                if(operand==(layer ? 6'd47 : 6'd11)) state<=NWAIT;
                else begin operand<=operand+1'b1; state<=OP_REQ; end
             end
             NWAIT: if(neuron_done) begin
                output_reg<=neuron_result;
                output_addr<=out_addr;
                state<=WRITE;
             end
             WRITE: begin
                if(!layer) begin
                   conv1_valid<=1;
                   conv1_index<=output_addr;
                   conv1_data<=output_reg;
                end else begin
                   conv2_valid<=1;
                   conv2_index<=output_addr;
                   conv2_data<=output_reg;
                end
                state<=NEXT;
             end
             NEXT: begin
                if(t==4'd9) begin
                   t<=0;
                   if(oc==4'd15) begin
                      if(!layer) begin
                         layer<=1; oc<=0; state<=PARAM_REQ;
                      end else state<=COMPLETE;
                   end
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
