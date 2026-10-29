`timescale 1ns/1ps
// P3-M04-04C: fold-1, INT8-max, sequential 40-64-32-1 MLP.
// One 64-feature neuron reused across 97 neurons; short layers zero-pad.
// Parameter files resolved relative to simulation/synthesis working directory.
module mlp_int8_sequential #(
 parameter ROM_DIR="results/p3_m04/mlp_fold1_parameter_rom"
)(input wire clk, input wire rst,
  input wire input_valid, input wire signed [7:0] input_data,
  output wire input_ready, output reg done,
  output reg signed [7:0] output_data, output reg overflow_any);
 localparam IDLE=0, LOAD=1, PARAM_REQ=2, PARAM_WAIT=3, START=4,
            OPER_REQ=5, OPER_WAIT=6, FEED=7, ADVANCE=8,
            WAIT_DONE=9, STORE=10, COMPLETE=11;
 reg [3:0] state;
 reg [1:0] layer;
 reg [6:0] neuron_index;
 reg [6:0] feature_index;
 reg [5:0] input_index;
 wire signed [7:0] neuron_result;
 wire neuron_busy, neuron_done, neuron_overflow;
 reg neuron_start, neuron_valid;
 reg signed [7:0] feature_operand, weight_operand;
 reg signed [31:0] bias_hold, multiplier_hold;
 reg [5:0] shift_hold;
 wire relu = (layer != 2);
 wire [11:0] waddr1 = neuron_index * 12'd40 + {{5{1'b0}}, feature_index};
 wire [10:0] waddr2 = neuron_index * 11'd64 + {{4{1'b0}}, feature_index};
 wire [4:0] waddr3 = feature_index[4:0];
 wire param_read = (state==PARAM_REQ);
 wire operand_read = (state==OPER_REQ);
 wire w1_en=operand_read && layer==0 && feature_index<40;
 wire w2_en=operand_read && layer==1;
 wire w3_en=operand_read && layer==2 && feature_index<32;
 wire p1_en=param_read && layer==0;
 wire p2_en=param_read && layer==1;
 wire p3_en=param_read && layer==2;
 wire [7:0] w1,w2,w3;
 wire [31:0] b1,b2,b3,m1,m2,m3;
 wire [7:0] s1,s2,s3;
 parameter_rom_sync #(.WIDTH(8),.DEPTH(2560),.INIT_FILE({ROM_DIR,"/fc1_weights.memh"})) rom_fc1_weights (.clk(clk),.en(w1_en),.addr(waddr1),.data(w1));
 parameter_rom_sync #(.WIDTH(32),.DEPTH(64),.INIT_FILE({ROM_DIR,"/fc1_bias.memh"})) rom_fc1_bias (.clk(clk),.en(p1_en),.addr(neuron_index[5:0]),.data(b1));
 parameter_rom_sync #(.WIDTH(32),.DEPTH(64),.INIT_FILE({ROM_DIR,"/fc1_multiplier.memh"})) rom_fc1_multiplier (.clk(clk),.en(p1_en),.addr(neuron_index[5:0]),.data(m1));
 parameter_rom_sync #(.WIDTH(8),.DEPTH(64),.INIT_FILE({ROM_DIR,"/fc1_shift.memh"})) rom_fc1_shift (.clk(clk),.en(p1_en),.addr(neuron_index[5:0]),.data(s1));
 parameter_rom_sync #(.WIDTH(8),.DEPTH(2048),.INIT_FILE({ROM_DIR,"/fc2_weights.memh"})) rom_fc2_weights (.clk(clk),.en(w2_en),.addr(waddr2),.data(w2));
 parameter_rom_sync #(.WIDTH(32),.DEPTH(32),.INIT_FILE({ROM_DIR,"/fc2_bias.memh"})) rom_fc2_bias (.clk(clk),.en(p2_en),.addr(neuron_index[4:0]),.data(b2));
 parameter_rom_sync #(.WIDTH(32),.DEPTH(32),.INIT_FILE({ROM_DIR,"/fc2_multiplier.memh"})) rom_fc2_multiplier (.clk(clk),.en(p2_en),.addr(neuron_index[4:0]),.data(m2));
 parameter_rom_sync #(.WIDTH(8),.DEPTH(32),.INIT_FILE({ROM_DIR,"/fc2_shift.memh"})) rom_fc2_shift (.clk(clk),.en(p2_en),.addr(neuron_index[4:0]),.data(s2));
 parameter_rom_sync #(.WIDTH(8),.DEPTH(32),.INIT_FILE({ROM_DIR,"/output_weights.memh"})) rom_output_weights (.clk(clk),.en(w3_en),.addr(waddr3),.data(w3));
 parameter_rom_sync #(.WIDTH(32),.DEPTH(1),.INIT_FILE({ROM_DIR,"/output_bias.memh"})) rom_output_bias (.clk(clk),.en(p3_en),.addr(1'b0),.data(b3));
 parameter_rom_sync #(.WIDTH(32),.DEPTH(1),.INIT_FILE({ROM_DIR,"/output_multiplier.memh"})) rom_output_multiplier (.clk(clk),.en(p3_en),.addr(1'b0),.data(m3));
 parameter_rom_sync #(.WIDTH(8),.DEPTH(1),.INIT_FILE({ROM_DIR,"/output_shift.memh"})) rom_output_shift (.clk(clk),.en(p3_en),.addr(1'b0),.data(s3));
 wire signed [7:0] input_rd, fc1_rd, fc2_rd;
 wire load_write=(state==LOAD && input_valid && input_ready);
 wire store1=(state==STORE && layer==0);
 wire store2=(state==STORE && layer==1);
 activation_ram_sync #(.DEPTH(40)) ram_input(.clk(clk),.we(load_write),.re(operand_read && layer==0 && feature_index<40),
  .waddr(input_index),.raddr(feature_index[5:0]),.wdata(input_data),.rdata(input_rd));
 activation_ram_sync #(.DEPTH(64)) ram_fc1(.clk(clk),.we(store1),.re(operand_read && layer==1),
  .waddr(neuron_index[5:0]),.raddr(feature_index[5:0]),.wdata(neuron_result),.rdata(fc1_rd));
 activation_ram_sync #(.DEPTH(32)) ram_fc2(.clk(clk),.we(store2),.re(operand_read && layer==2 && feature_index<32),
  .waddr(neuron_index[4:0]),.raddr(feature_index[4:0]),.wdata(neuron_result),.rdata(fc2_rd));
 neuron_int8_serial #(.N_FEATURES(64)) core(.clk(clk),.rst(rst),.start(neuron_start),.valid_in(neuron_valid),
  .feature_in(feature_operand),.weight_in(weight_operand),.bias_in(bias_hold),
  .multiplier_in(multiplier_hold),.shift_in(shift_hold),.relu_in(relu),
  .busy(neuron_busy),.done(neuron_done),.result(neuron_result),.overflow(neuron_overflow));
 assign input_ready=(state==LOAD);
 always @(posedge clk) begin
  if(rst) begin
   state<=IDLE; layer<=0; neuron_index<=0; feature_index<=0; input_index<=0;
   done<=0; output_data<=0; overflow_any<=0;
   neuron_start<=0; neuron_valid<=0; feature_operand<=0; weight_operand<=0;
   bias_hold<=0; multiplier_hold<=0; shift_hold<=0;
  end else begin
   done<=0; neuron_start<=0; neuron_valid<=0;
   case(state)
    IDLE: begin input_index<=0; layer<=0; neuron_index<=0; overflow_any<=0; state<=LOAD; end
    LOAD: if(load_write) begin
      if(input_index==39) begin input_index<=0; layer<=0; neuron_index<=0; state<=PARAM_REQ; end
      else input_index<=input_index+1'b1;
    end
    PARAM_REQ: state<=PARAM_WAIT;
    PARAM_WAIT: begin
      bias_hold<=layer==0?$signed(b1):layer==1?$signed(b2):$signed(b3);
      multiplier_hold<=layer==0?$signed(m1):layer==1?$signed(m2):$signed(m3);
      shift_hold<=layer==0?s1[5:0]:layer==1?s2[5:0]:s3[5:0];
      feature_index<=0; state<=START;
    end
    START: begin neuron_start<=1; state<=OPER_REQ; end
    OPER_REQ: state<=OPER_WAIT;
    OPER_WAIT: begin
      feature_operand <= (layer==0 && feature_index<40)?input_rd:
                         (layer==1)?fc1_rd:(layer==2 && feature_index<32)?fc2_rd:8'sd0;
      weight_operand <= (layer==0 && feature_index<40)?$signed(w1):
                        (layer==1)?$signed(w2):(layer==2 && feature_index<32)?$signed(w3):8'sd0;
      state<=FEED;
    end
    FEED: begin neuron_valid<=1; state<=ADVANCE; end
    ADVANCE: begin
      if(feature_index==63) state<=WAIT_DONE;
      else begin feature_index<=feature_index+1'b1; state<=OPER_REQ; end
    end
    WAIT_DONE: if(neuron_done) begin overflow_any<=overflow_any | neuron_overflow; state<=STORE; end
    STORE: begin
      if(layer==2) begin output_data<=neuron_result; state<=COMPLETE; end
      else if((layer==0 && neuron_index==63)||(layer==1 && neuron_index==31)) begin
        layer<=layer+1'b1; neuron_index<=0; state<=PARAM_REQ;
      end else begin neuron_index<=neuron_index+1'b1; state<=PARAM_REQ; end
    end
    COMPLETE: begin done<=1; state<=IDLE; end
    default: state<=IDLE;
   endcase
  end
 end
endmodule
