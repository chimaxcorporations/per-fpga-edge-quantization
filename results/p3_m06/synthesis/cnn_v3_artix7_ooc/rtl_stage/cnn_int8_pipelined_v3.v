`timescale 1ns/1ps
// P3-M06-03B-04: full CNN: Conv1, Conv2, FC1, output.
// Raw input is time-major; convolution outputs are channel-major.
module cnn_int8_pipelined_v3 #(
    parameter W_ROM="/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv1_weights.memh",
    parameter B_ROM="/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv1_bias.memh",
    parameter M_ROM="/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv1_multiplier.memh",
    parameter S_ROM="/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv1_shift.memh",
    parameter W2_ROM="/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv2_weights.memh",
    parameter B2_ROM="/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv2_bias.memh",
    parameter M2_ROM="/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv2_multiplier.memh",
    parameter S2_ROM="/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv2_shift.memh",
    parameter W3_ROM="/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/fc1_weights.memh",
    parameter B3_ROM="/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/fc1_bias.memh",
    parameter M3_ROM="/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/fc1_multiplier.memh",
    parameter S3_ROM="/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/fc1_shift.memh",
    parameter W4_ROM="/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/output_weights.memh",
    parameter B4_ROM="/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/output_bias.memh",
    parameter M4_ROM="/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/output_multiplier.memh",
    parameter S4_ROM="/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/output_shift.memh"
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
    output reg fc1_valid,
    output reg [5:0] fc1_index,
    output reg signed [7:0] fc1_data,
    output reg output_valid,
    output reg signed [7:0] output_data,
    output reg accumulator_overflow,
    output reg config_error
);
    localparam IDLE=4'd0, LOAD=4'd1, PARAM_REQ=4'd2,
      PARAM_WAIT=4'd3, NSTART=4'd4, OP_REQ=4'd5,
      OP_WAIT=4'd6, OP_FEED=4'd7, OP_ADV=4'd8,
      NWAIT=4'd9, WRITE=4'd10, NEXT=4'd11, COMPLETE=4'd12;
    reg [3:0] state;
    reg [5:0] load_idx;
    reg [5:0] oc;
    reg [3:0] t;
    reg [7:0] operand;
    reg [1:0] layer; // 0: Conv1, 1: Conv2, 2: FC1, 3: output
    reg signed [31:0] bias_reg, mult_reg;
    reg [5:0] shift_reg;
    reg signed [7:0] feature_reg, weight_reg;
    reg signed [7:0] output_reg;
    reg [7:0] output_addr;
    wire [9:0] waddr2 = (oc * 10'd48) + operand;
    wire [7:0] waddr = (oc * 8'd12) + operand;
    wire [12:0] waddr3 = (oc * 13'd160) + operand;
    wire [4:0] waddr4 = operand[4:0];
    wire [4:0] channel = operand / 8'd3;
    wire [1:0] tap = operand % 8'd3;
    wire signed [5:0] input_t = $signed({2'b00,t}) + $signed({4'b0,tap}) - 6'sd1;
    wire padding = (input_t < 0 || input_t > 9);
    // Raw input ROM: time-major [time][channel]; Conv1 output: channel-major.
    wire [7:0] in_addr = (layer==0) ?
        ((input_t[3:0] * 8'd4) + channel) :
        (layer==1) ? ((channel * 8'd10) + input_t[3:0]) :
        operand[7:0];
    wire [7:0] out_addr = (layer<2) ? (oc * 8'd10) + t : {2'b00,oc};
    wire pad_active = (layer<2) && padding;
    wire rom_req = (state==PARAM_REQ);
    wire operand_req = (state==OP_REQ);
    wire [7:0] w_data, w2_data, w3_data, w4_data;
    wire [31:0] b3_data, m3_data, b4_data, m4_data;
    wire [7:0] s3_data, s4_data;
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

    parameter_rom_sync #(.WIDTH(8),.DEPTH(5120),.ADDR_WIDTH(13),.INIT_FILE(W3_ROM)) weights3_rom(
       .clk(clk),.en(operand_req && layer==2),.addr(waddr3),.data(w3_data));
    parameter_rom_sync #(.WIDTH(8),.DEPTH(32),.ADDR_WIDTH(5),.INIT_FILE(W4_ROM)) weights4_rom(
       .clk(clk),.en(operand_req && layer==3),.addr(waddr4),.data(w4_data));
    parameter_rom_sync #(.WIDTH(32),.DEPTH(32),.ADDR_WIDTH(5),.INIT_FILE(B3_ROM)) bias3_rom(
       .clk(clk),.en(rom_req && layer==2),.addr(oc[4:0]),.data(b3_data));
    parameter_rom_sync #(.WIDTH(32),.DEPTH(32),.ADDR_WIDTH(5),.INIT_FILE(M3_ROM)) multiplier3_rom(
       .clk(clk),.en(rom_req && layer==2),.addr(oc[4:0]),.data(m3_data));
    parameter_rom_sync #(.WIDTH(8),.DEPTH(32),.ADDR_WIDTH(5),.INIT_FILE(S3_ROM)) shift3_rom(
       .clk(clk),.en(rom_req && layer==2),.addr(oc[4:0]),.data(s3_data));
    parameter_rom_sync #(.WIDTH(32),.DEPTH(1),.ADDR_WIDTH(1),.INIT_FILE(B4_ROM)) bias4_rom(
       .clk(clk),.en(rom_req && layer==3),.addr(1'b0),.data(b4_data));
    parameter_rom_sync #(.WIDTH(32),.DEPTH(1),.ADDR_WIDTH(1),.INIT_FILE(M4_ROM)) multiplier4_rom(
       .clk(clk),.en(rom_req && layer==3),.addr(1'b0),.data(m4_data));
    parameter_rom_sync #(.WIDTH(8),.DEPTH(1),.ADDR_WIDTH(1),.INIT_FILE(S4_ROM)) shift4_rom(
       .clk(clk),.en(rom_req && layer==3),.addr(1'b0),.data(s4_data));
    parameter_rom_sync #(.WIDTH(8),.DEPTH(192),.ADDR_WIDTH(8),.INIT_FILE(W_ROM)) weights_rom(
       .clk(clk),.en(operand_req && layer==0),.addr(waddr),.data(w_data));
    parameter_rom_sync #(.WIDTH(8),.DEPTH(768),.ADDR_WIDTH(10),.INIT_FILE(W2_ROM)) weights2_rom(
       .clk(clk),.en(operand_req && layer==1),.addr(waddr2),.data(w2_data));
    parameter_rom_sync #(.WIDTH(32),.DEPTH(16),.ADDR_WIDTH(4),.INIT_FILE(B2_ROM)) bias2_rom(
       .clk(clk),.en(rom_req && layer==1),.addr(oc),.data(b2_data));
    parameter_rom_sync #(.WIDTH(32),.DEPTH(16),.ADDR_WIDTH(4),.INIT_FILE(M2_ROM)) multiplier2_rom(
       .clk(clk),.en(rom_req && layer==1),.addr(oc),.data(m2_data));
    parameter_rom_sync #(.WIDTH(8),.DEPTH(16),.ADDR_WIDTH(4),.INIT_FILE(S2_ROM)) shift2_rom(
       .clk(clk),.en(rom_req && layer==1),.addr(oc),.data(s2_data));
    parameter_rom_sync #(.WIDTH(32),.DEPTH(16),.ADDR_WIDTH(4),.INIT_FILE(B_ROM)) bias_rom(
       .clk(clk),.en(rom_req && layer==0),.addr(oc),.data(b_data));
    parameter_rom_sync #(.WIDTH(32),.DEPTH(16),.ADDR_WIDTH(4),.INIT_FILE(M_ROM)) multiplier_rom(
       .clk(clk),.en(rom_req && layer==0),.addr(oc),.data(m_data));
    parameter_rom_sync #(.WIDTH(8),.DEPTH(16),.ADDR_WIDTH(4),.INIT_FILE(S_ROM)) shift_rom(
       .clk(clk),.en(rom_req && layer==0),.addr(oc),.data(s_data));

    // Ping-pong: A raw input -> B Conv1 -> A Conv2 -> B FC1 -> A output.
    activation_ram_sync #(.DEPTH(160),.ADDR_WIDTH(8)) input_bank(
       .clk(clk),
       .we((state==LOAD && input_valid) || (state==WRITE && (layer==1 || layer==3))),
       .re(operand_req && !pad_active && (layer==0 || layer==2)),
       .waddr((layer==1 || layer==3) ? output_addr : {2'b00,load_idx}),
       .raddr(in_addr),
       .wdata((layer==1 || layer==3) ? output_reg : input_data),
       .rdata(act_data));
    activation_ram_sync #(.DEPTH(160),.ADDR_WIDTH(8)) conv1_bank(
       .clk(clk),
       .we(state==WRITE && (layer==0 || layer==2)),
       .re(operand_req && !pad_active && (layer==1 || layer==3)),
       .waddr(output_addr),.raddr(in_addr),
       .wdata(output_reg),.rdata(act2_data));

    neuron_int8_configurable #(.MAX_FEATURES(160)) neuron(
       .clk(clk),.rst(rst),.start(state==NSTART),
       .valid_in(state==OP_FEED),.feature_count_in(layer==0 ? 8'd12 : layer==1 ? 8'd48 : layer==2 ? 8'd160 : 8'd32),
       .feature_in(neuron_feature),.weight_in(neuron_weight),
       .bias_in(bias_reg),.multiplier_in(mult_reg),.shift_in(shift_reg),
       .relu_in(layer!=3),.busy(neuron_busy),.done(neuron_done),
       .result(neuron_result),.overflow(neuron_overflow),
       .config_error(neuron_config_error));

    always @(posedge clk) begin
       if(rst) begin
          state<=IDLE; load_idx<=0; oc<=0; t<=0; operand<=0; layer<=0;
          bias_reg<=0; mult_reg<=0; shift_reg<=0;
          feature_reg<=0; weight_reg<=0; output_reg<=0; output_addr<=0;
          done<=0; conv1_valid<=0; conv1_index<=0; conv1_data<=0;
          conv2_valid<=0; conv2_index<=0; conv2_data<=0;
          fc1_valid<=0; fc1_index<=0; fc1_data<=0;
          output_valid<=0; output_data<=0;
          accumulator_overflow<=0; config_error<=0;
       end else begin
          done<=0;
          conv1_valid<=0;
          conv2_valid<=0;
          fc1_valid<=0;
          output_valid<=0;
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
                case(layer)
                   0: begin bias_reg<=$signed(b_data); mult_reg<=$signed(m_data); shift_reg<=s_data[5:0]; if(s_data[7:6]!=0) config_error<=1; end
                   1: begin bias_reg<=$signed(b2_data); mult_reg<=$signed(m2_data); shift_reg<=s2_data[5:0]; if(s2_data[7:6]!=0) config_error<=1; end
                   2: begin bias_reg<=$signed(b3_data); mult_reg<=$signed(m3_data); shift_reg<=s3_data[5:0]; if(s3_data[7:6]!=0) config_error<=1; end
                   3: begin bias_reg<=$signed(b4_data); mult_reg<=$signed(m4_data); shift_reg<=s4_data[5:0]; if(s4_data[7:6]!=0) config_error<=1; end
                endcase
                state<=NSTART;
             end
             NSTART: begin operand<=0; state<=OP_REQ; end
             OP_REQ: state<=OP_WAIT;
             OP_WAIT: begin
                case(layer)
                   0: weight_reg<=$signed(w_data);
                   1: weight_reg<=$signed(w2_data);
                   2: weight_reg<=$signed(w3_data);
                   3: weight_reg<=$signed(w4_data);
                endcase
                feature_reg<=pad_active ? 8'sd0 :
                             ((layer==0 || layer==2) ? act_data : act2_data);
                state<=OP_FEED;
             end
             OP_FEED: state<=OP_ADV;
             OP_ADV: begin
                if(operand==(layer==0 ? 8'd11 : layer==1 ? 8'd47 : layer==2 ? 8'd159 : 8'd31)) state<=NWAIT;
                else begin operand<=operand+1'b1; state<=OP_REQ; end
             end
             NWAIT: if(neuron_done) begin
                output_reg<=neuron_result;
                output_addr<=out_addr;
                state<=WRITE;
             end
             WRITE: begin
                case(layer)
                   0: begin conv1_valid<=1; conv1_index<=output_addr; conv1_data<=output_reg; end
                   1: begin conv2_valid<=1; conv2_index<=output_addr; conv2_data<=output_reg; end
                   2: begin fc1_valid<=1; fc1_index<=oc; fc1_data<=output_reg; end
                   3: begin output_valid<=1; output_data<=output_reg; end
                endcase
                state<=NEXT;
             end
             NEXT: begin
                if(layer<2 && t<4'd9) begin
                   t<=t+1'b1;
                   state<=PARAM_REQ;
                end else begin
                   t<=0;
                   if((layer<2 && oc==6'd15) ||
                      (layer==2 && oc==6'd31) ||
                      (layer==3 && oc==6'd0)) begin
                      if(layer==3) state<=COMPLETE;
                      else begin
                         layer<=layer+1'b1;
                         oc<=0;
                         state<=PARAM_REQ;
                      end
                   end else begin
                      oc<=oc+1'b1;
                      state<=PARAM_REQ;
                   end
                end
             end
             COMPLETE: begin done<=1; state<=IDLE; end
             default: state<=IDLE;
          endcase
       end
    end
endmodule
