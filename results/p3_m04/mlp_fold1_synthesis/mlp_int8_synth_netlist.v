// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Wed Oct 28 11:44:22 2026
// Host        : localhost.localdomain running 64-bit Rocky Linux 9.5 (Blue Onyx)
// Command     : write_verilog -force results/p3_m04/mlp_fold1_synthesis/mlp_int8_synth_netlist.v
// Design      : mlp_int8_sequential
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ADDR_WIDTH = "6" *) (* DEPTH = "40" *) 
module activation_ram_sync
   (clk,
    we,
    re,
    waddr,
    raddr,
    wdata,
    rdata);
  input clk;
  input we;
  input re;
  input [5:0]waddr;
  input [5:0]raddr;
  input [7:0]wdata;
  output [7:0]rdata;

  wire \<const0> ;
  wire clk;
  wire [5:0]raddr;
  wire [7:0]rdata;
  wire [7:0]rdata0;
  wire re;
  wire [5:0]waddr;
  wire [7:0]wdata;
  wire we;

  GND GND
       (.G(\<const0> ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "activation_ram_sync/mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "39" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M mem_reg_0_63_0_2
       (.ADDRA(raddr),
        .ADDRB(raddr),
        .ADDRC(raddr),
        .ADDRD(waddr),
        .DIA(wdata[0]),
        .DIB(wdata[1]),
        .DIC(wdata[2]),
        .DID(\<const0> ),
        .DOA(rdata0[0]),
        .DOB(rdata0[1]),
        .DOC(rdata0[2]),
        .WCLK(clk),
        .WE(we));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "activation_ram_sync/mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "39" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M mem_reg_0_63_3_5
       (.ADDRA(raddr),
        .ADDRB(raddr),
        .ADDRC(raddr),
        .ADDRD(waddr),
        .DIA(wdata[3]),
        .DIB(wdata[4]),
        .DIC(wdata[5]),
        .DID(\<const0> ),
        .DOA(rdata0[3]),
        .DOB(rdata0[4]),
        .DOC(rdata0[5]),
        .WCLK(clk),
        .WE(we));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "320" *) 
  (* RTL_RAM_NAME = "activation_ram_sync/mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "39" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "7" *) 
  RAM64M mem_reg_0_63_6_7
       (.ADDRA(raddr),
        .ADDRB(raddr),
        .ADDRC(raddr),
        .ADDRD(waddr),
        .DIA(wdata[6]),
        .DIB(wdata[7]),
        .DIC(\<const0> ),
        .DID(\<const0> ),
        .DOA(rdata0[6]),
        .DOB(rdata0[7]),
        .WCLK(clk),
        .WE(we));
  FDRE \rdata_reg[0] 
       (.C(clk),
        .CE(re),
        .D(rdata0[0]),
        .Q(rdata[0]),
        .R(\<const0> ));
  FDRE \rdata_reg[1] 
       (.C(clk),
        .CE(re),
        .D(rdata0[1]),
        .Q(rdata[1]),
        .R(\<const0> ));
  FDRE \rdata_reg[2] 
       (.C(clk),
        .CE(re),
        .D(rdata0[2]),
        .Q(rdata[2]),
        .R(\<const0> ));
  FDRE \rdata_reg[3] 
       (.C(clk),
        .CE(re),
        .D(rdata0[3]),
        .Q(rdata[3]),
        .R(\<const0> ));
  FDRE \rdata_reg[4] 
       (.C(clk),
        .CE(re),
        .D(rdata0[4]),
        .Q(rdata[4]),
        .R(\<const0> ));
  FDRE \rdata_reg[5] 
       (.C(clk),
        .CE(re),
        .D(rdata0[5]),
        .Q(rdata[5]),
        .R(\<const0> ));
  FDRE \rdata_reg[6] 
       (.C(clk),
        .CE(re),
        .D(rdata0[6]),
        .Q(rdata[6]),
        .R(\<const0> ));
  FDRE \rdata_reg[7] 
       (.C(clk),
        .CE(re),
        .D(rdata0[7]),
        .Q(rdata[7]),
        .R(\<const0> ));
endmodule

(* ADDR_WIDTH = "6" *) (* DEPTH = "64" *) (* ORIG_REF_NAME = "activation_ram_sync" *) 
module activation_ram_sync__parameterized0
   (clk,
    we,
    re,
    waddr,
    raddr,
    wdata,
    rdata);
  input clk;
  input we;
  input re;
  input [5:0]waddr;
  input [5:0]raddr;
  input [7:0]wdata;
  output [7:0]rdata;

  wire \<const0> ;
  wire clk;
  wire [5:0]raddr;
  wire [7:0]rdata;
  wire [7:0]rdata0;
  wire re;
  wire [5:0]waddr;
  wire [7:0]wdata;
  wire we;

  GND GND
       (.G(\<const0> ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "512" *) 
  (* RTL_RAM_NAME = "activation_ram_sync/mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "2" *) 
  RAM64M mem_reg_0_63_0_2
       (.ADDRA(raddr),
        .ADDRB(raddr),
        .ADDRC(raddr),
        .ADDRD(waddr),
        .DIA(wdata[0]),
        .DIB(wdata[1]),
        .DIC(wdata[2]),
        .DID(\<const0> ),
        .DOA(rdata0[0]),
        .DOB(rdata0[1]),
        .DOC(rdata0[2]),
        .WCLK(clk),
        .WE(we));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "512" *) 
  (* RTL_RAM_NAME = "activation_ram_sync/mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "3" *) 
  (* ram_slice_end = "5" *) 
  RAM64M mem_reg_0_63_3_5
       (.ADDRA(raddr),
        .ADDRB(raddr),
        .ADDRC(raddr),
        .ADDRD(waddr),
        .DIA(wdata[3]),
        .DIB(wdata[4]),
        .DIC(wdata[5]),
        .DID(\<const0> ),
        .DOA(rdata0[3]),
        .DOB(rdata0[4]),
        .DOC(rdata0[5]),
        .WCLK(clk),
        .WE(we));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "512" *) 
  (* RTL_RAM_NAME = "activation_ram_sync/mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "7" *) 
  RAM64M mem_reg_0_63_6_7
       (.ADDRA(raddr),
        .ADDRB(raddr),
        .ADDRC(raddr),
        .ADDRD(waddr),
        .DIA(wdata[6]),
        .DIB(wdata[7]),
        .DIC(\<const0> ),
        .DID(\<const0> ),
        .DOA(rdata0[6]),
        .DOB(rdata0[7]),
        .WCLK(clk),
        .WE(we));
  FDRE \rdata_reg[0] 
       (.C(clk),
        .CE(re),
        .D(rdata0[0]),
        .Q(rdata[0]),
        .R(\<const0> ));
  FDRE \rdata_reg[1] 
       (.C(clk),
        .CE(re),
        .D(rdata0[1]),
        .Q(rdata[1]),
        .R(\<const0> ));
  FDRE \rdata_reg[2] 
       (.C(clk),
        .CE(re),
        .D(rdata0[2]),
        .Q(rdata[2]),
        .R(\<const0> ));
  FDRE \rdata_reg[3] 
       (.C(clk),
        .CE(re),
        .D(rdata0[3]),
        .Q(rdata[3]),
        .R(\<const0> ));
  FDRE \rdata_reg[4] 
       (.C(clk),
        .CE(re),
        .D(rdata0[4]),
        .Q(rdata[4]),
        .R(\<const0> ));
  FDRE \rdata_reg[5] 
       (.C(clk),
        .CE(re),
        .D(rdata0[5]),
        .Q(rdata[5]),
        .R(\<const0> ));
  FDRE \rdata_reg[6] 
       (.C(clk),
        .CE(re),
        .D(rdata0[6]),
        .Q(rdata[6]),
        .R(\<const0> ));
  FDRE \rdata_reg[7] 
       (.C(clk),
        .CE(re),
        .D(rdata0[7]),
        .Q(rdata[7]),
        .R(\<const0> ));
endmodule

(* ADDR_WIDTH = "5" *) (* DEPTH = "32" *) (* ORIG_REF_NAME = "activation_ram_sync" *) 
module activation_ram_sync__parameterized1
   (clk,
    we,
    re,
    waddr,
    raddr,
    wdata,
    rdata);
  input clk;
  input we;
  input re;
  input [4:0]waddr;
  input [4:0]raddr;
  input [7:0]wdata;
  output [7:0]rdata;

  wire \<const0> ;
  wire clk;
  wire [4:0]raddr;
  wire [7:0]rdata;
  wire [7:0]rdata0;
  wire re;
  wire [4:0]waddr;
  wire [7:0]wdata;
  wire we;

  GND GND
       (.G(\<const0> ));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "256" *) 
  (* RTL_RAM_NAME = "activation_ram_sync/mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "5" *) 
  RAM32M mem_reg_0_31_0_5
       (.ADDRA(raddr),
        .ADDRB(raddr),
        .ADDRC(raddr),
        .ADDRD(waddr),
        .DIA(wdata[1:0]),
        .DIB(wdata[3:2]),
        .DIC(wdata[5:4]),
        .DID({\<const0> ,\<const0> }),
        .DOA(rdata0[1:0]),
        .DOB(rdata0[3:2]),
        .DOC(rdata0[5:4]),
        .WCLK(clk),
        .WE(we));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "256" *) 
  (* RTL_RAM_NAME = "activation_ram_sync/mem_reg_0_31_6_7" *) 
  (* RTL_RAM_STYLE = "NONE" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "6" *) 
  (* ram_slice_end = "6" *) 
  RAM32X1D mem_reg_0_31_6_7
       (.A0(waddr[0]),
        .A1(waddr[1]),
        .A2(waddr[2]),
        .A3(waddr[3]),
        .A4(waddr[4]),
        .D(wdata[6]),
        .DPO(rdata0[6]),
        .DPRA0(raddr[0]),
        .DPRA1(raddr[1]),
        .DPRA2(raddr[2]),
        .DPRA3(raddr[3]),
        .DPRA4(raddr[4]),
        .WCLK(clk),
        .WE(we));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  (* RTL_RAM_BITS = "256" *) 
  (* RTL_RAM_NAME = "activation_ram_sync/mem_reg_0_31_6_7" *) 
  (* RTL_RAM_STYLE = "NONE" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "31" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "7" *) 
  (* ram_slice_end = "7" *) 
  RAM32X1D mem_reg_0_31_6_7__0
       (.A0(waddr[0]),
        .A1(waddr[1]),
        .A2(waddr[2]),
        .A3(waddr[3]),
        .A4(waddr[4]),
        .D(wdata[7]),
        .DPO(rdata0[7]),
        .DPRA0(raddr[0]),
        .DPRA1(raddr[1]),
        .DPRA2(raddr[2]),
        .DPRA3(raddr[3]),
        .DPRA4(raddr[4]),
        .WCLK(clk),
        .WE(we));
  FDRE \rdata_reg[0] 
       (.C(clk),
        .CE(re),
        .D(rdata0[0]),
        .Q(rdata[0]),
        .R(\<const0> ));
  FDRE \rdata_reg[1] 
       (.C(clk),
        .CE(re),
        .D(rdata0[1]),
        .Q(rdata[1]),
        .R(\<const0> ));
  FDRE \rdata_reg[2] 
       (.C(clk),
        .CE(re),
        .D(rdata0[2]),
        .Q(rdata[2]),
        .R(\<const0> ));
  FDRE \rdata_reg[3] 
       (.C(clk),
        .CE(re),
        .D(rdata0[3]),
        .Q(rdata[3]),
        .R(\<const0> ));
  FDRE \rdata_reg[4] 
       (.C(clk),
        .CE(re),
        .D(rdata0[4]),
        .Q(rdata[4]),
        .R(\<const0> ));
  FDRE \rdata_reg[5] 
       (.C(clk),
        .CE(re),
        .D(rdata0[5]),
        .Q(rdata[5]),
        .R(\<const0> ));
  FDRE \rdata_reg[6] 
       (.C(clk),
        .CE(re),
        .D(rdata0[6]),
        .Q(rdata[6]),
        .R(\<const0> ));
  FDRE \rdata_reg[7] 
       (.C(clk),
        .CE(re),
        .D(rdata0[7]),
        .Q(rdata[7]),
        .R(\<const0> ));
endmodule

(* ADVANCE = "8" *) (* COMPLETE = "11" *) (* FEED = "7" *) 
(* IDLE = "0" *) (* LOAD = "1" *) (* OPER_REQ = "5" *) 
(* OPER_WAIT = "6" *) (* PARAM_REQ = "2" *) (* PARAM_WAIT = "3" *) 
(* ROM_DIR = "results/p3_m04/mlp_fold1_parameter_rom" *) (* START = "4" *) (* STORE = "10" *) 
(* WAIT_DONE = "9" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module mlp_int8_sequential
   (clk,
    rst,
    input_valid,
    input_data,
    input_ready,
    done,
    output_data,
    overflow_any);
  input clk;
  input rst;
  input input_valid;
  input [7:0]input_data;
  output input_ready;
  output done;
  output [7:0]output_data;
  output overflow_any;

  wire \<const0> ;
  wire \<const1> ;
  wire \FSM_onehot_state[10]_i_1_n_0 ;
  wire \FSM_onehot_state[10]_i_2_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[3]_i_1_n_0 ;
  wire \FSM_onehot_state[7]_i_1_n_0 ;
  wire \FSM_onehot_state[7]_i_2_n_0 ;
  wire \FSM_onehot_state[7]_i_3_n_0 ;
  wire \FSM_onehot_state[7]_i_4_n_0 ;
  wire \FSM_onehot_state[7]_i_5_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[10] ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire \FSM_onehot_state_reg_n_0_[4] ;
  wire \FSM_onehot_state_reg_n_0_[5] ;
  wire \FSM_onehot_state_reg_n_0_[9] ;
  wire [31:0]b1;
  wire [31:0]b2;
  wire [0:0]bias_hold;
  wire \bias_hold[0]_i_1_n_0 ;
  wire \bias_hold[10]_i_1_n_0 ;
  wire \bias_hold[11]_i_1_n_0 ;
  wire \bias_hold[12]_i_1_n_0 ;
  wire \bias_hold[13]_i_1_n_0 ;
  wire \bias_hold[14]_i_1_n_0 ;
  wire \bias_hold[1]_i_1_n_0 ;
  wire \bias_hold[2]_i_1_n_0 ;
  wire \bias_hold[31]_i_1_n_0 ;
  wire \bias_hold[3]_i_1_n_0 ;
  wire \bias_hold[4]_i_1_n_0 ;
  wire \bias_hold[5]_i_1_n_0 ;
  wire \bias_hold[6]_i_1_n_0 ;
  wire \bias_hold[7]_i_1_n_0 ;
  wire \bias_hold[8]_i_1_n_0 ;
  wire \bias_hold[9]_i_1_n_0 ;
  wire \bias_hold_reg_n_0_[0] ;
  wire \bias_hold_reg_n_0_[10] ;
  wire \bias_hold_reg_n_0_[11] ;
  wire \bias_hold_reg_n_0_[12] ;
  wire \bias_hold_reg_n_0_[13] ;
  wire \bias_hold_reg_n_0_[14] ;
  wire \bias_hold_reg_n_0_[1] ;
  wire \bias_hold_reg_n_0_[2] ;
  wire \bias_hold_reg_n_0_[31] ;
  wire \bias_hold_reg_n_0_[3] ;
  wire \bias_hold_reg_n_0_[4] ;
  wire \bias_hold_reg_n_0_[5] ;
  wire \bias_hold_reg_n_0_[6] ;
  wire \bias_hold_reg_n_0_[7] ;
  wire \bias_hold_reg_n_0_[8] ;
  wire \bias_hold_reg_n_0_[9] ;
  wire clk;
  wire done;
  wire [7:0]fc1_rd;
  wire [7:0]fc2_rd;
  wire feature_index0;
  wire \feature_index[0]_i_1_n_0 ;
  wire \feature_index[1]_i_1_n_0 ;
  wire \feature_index[2]_i_1_n_0 ;
  wire \feature_index[3]_i_1_n_0 ;
  wire \feature_index[4]_i_1_n_0 ;
  wire \feature_index[5]_i_1_n_0 ;
  wire \feature_index[6]_i_2_n_0 ;
  wire \feature_index_reg_n_0_[0] ;
  wire \feature_index_reg_n_0_[1] ;
  wire \feature_index_reg_n_0_[2] ;
  wire \feature_index_reg_n_0_[3] ;
  wire \feature_index_reg_n_0_[4] ;
  wire \feature_index_reg_n_0_[5] ;
  wire \feature_index_reg_n_0_[6] ;
  wire [0:0]feature_operand;
  wire \feature_operand[7]_i_2_n_0 ;
  wire \feature_operand[7]_i_3_n_0 ;
  wire \feature_operand_reg_n_0_[0] ;
  wire \feature_operand_reg_n_0_[1] ;
  wire \feature_operand_reg_n_0_[2] ;
  wire \feature_operand_reg_n_0_[3] ;
  wire \feature_operand_reg_n_0_[4] ;
  wire \feature_operand_reg_n_0_[5] ;
  wire \feature_operand_reg_n_0_[6] ;
  wire \feature_operand_reg_n_0_[7] ;
  wire [7:0]input_data;
  wire [5:0]input_index;
  wire \input_index[5]_i_1_n_0 ;
  wire \input_index[5]_i_3_n_0 ;
  wire \input_index_reg_n_0_[0] ;
  wire \input_index_reg_n_0_[1] ;
  wire \input_index_reg_n_0_[2] ;
  wire \input_index_reg_n_0_[3] ;
  wire \input_index_reg_n_0_[4] ;
  wire \input_index_reg_n_0_[5] ;
  wire [7:0]input_rd;
  wire input_ready;
  wire input_valid;
  wire \layer[0]_i_1_n_0 ;
  wire \layer[1]_i_1_n_0 ;
  wire \layer[1]_i_2_n_0 ;
  wire \layer_reg_n_0_[0] ;
  wire \layer_reg_n_0_[1] ;
  wire load_write;
  wire [31:0]m1;
  wire [24:0]m2;
  wire [31:0]multiplier_hold;
  wire \multiplier_hold[0]_i_1_n_0 ;
  wire \multiplier_hold[10]_i_1_n_0 ;
  wire \multiplier_hold[11]_i_1_n_0 ;
  wire \multiplier_hold[12]_i_1_n_0 ;
  wire \multiplier_hold[13]_i_1_n_0 ;
  wire \multiplier_hold[14]_i_1_n_0 ;
  wire \multiplier_hold[15]_i_1_n_0 ;
  wire \multiplier_hold[16]_i_1_n_0 ;
  wire \multiplier_hold[17]_i_1_n_0 ;
  wire \multiplier_hold[18]_i_1_n_0 ;
  wire \multiplier_hold[19]_i_1_n_0 ;
  wire \multiplier_hold[1]_i_1_n_0 ;
  wire \multiplier_hold[20]_i_1_n_0 ;
  wire \multiplier_hold[21]_i_1_n_0 ;
  wire \multiplier_hold[22]_i_1_n_0 ;
  wire \multiplier_hold[23]_i_1_n_0 ;
  wire \multiplier_hold[24]_i_1_n_0 ;
  wire \multiplier_hold[2]_i_1_n_0 ;
  wire \multiplier_hold[31]_i_1_n_0 ;
  wire \multiplier_hold[3]_i_1_n_0 ;
  wire \multiplier_hold[4]_i_1_n_0 ;
  wire \multiplier_hold[5]_i_1_n_0 ;
  wire \multiplier_hold[6]_i_1_n_0 ;
  wire \multiplier_hold[7]_i_1_n_0 ;
  wire \multiplier_hold[8]_i_1_n_0 ;
  wire \multiplier_hold[9]_i_1_n_0 ;
  wire neuron_done;
  wire \neuron_index[0]_i_1_n_0 ;
  wire \neuron_index[1]_i_1_n_0 ;
  wire \neuron_index[2]_i_1_n_0 ;
  wire \neuron_index[3]_i_1_n_0 ;
  wire \neuron_index[4]_i_1_n_0 ;
  wire \neuron_index[5]_i_1_n_0 ;
  wire \neuron_index[6]_i_1_n_0 ;
  wire \neuron_index[6]_i_2_n_0 ;
  wire \neuron_index[6]_i_3_n_0 ;
  wire \neuron_index_reg_n_0_[0] ;
  wire \neuron_index_reg_n_0_[1] ;
  wire \neuron_index_reg_n_0_[2] ;
  wire \neuron_index_reg_n_0_[3] ;
  wire \neuron_index_reg_n_0_[4] ;
  wire \neuron_index_reg_n_0_[5] ;
  wire \neuron_index_reg_n_0_[6] ;
  wire neuron_overflow;
  wire [7:0]neuron_result;
  wire neuron_start;
  wire neuron_start_reg_n_0;
  wire neuron_valid;
  wire neuron_valid_reg_n_0;
  wire operand_read;
  wire [7:0]output_data;
  wire \output_data[7]_i_1_n_0 ;
  wire overflow_any;
  wire overflow_any_i_1_n_0;
  wire p1_en;
  wire p2_en;
  wire [7:0]p_0_in__0;
  wire p_1_in;
  wire relu;
  wire rom_fc1_weights_i_10_n_0;
  wire rom_fc1_weights_i_11_n_0;
  wire rom_fc1_weights_i_12_n_0;
  wire rom_fc1_weights_i_13_n_0;
  wire rom_fc1_weights_i_14_n_0;
  wire rom_fc1_weights_i_15_n_0;
  wire rom_fc1_weights_i_16_n_0;
  wire rom_fc1_weights_i_2_n_7;
  wire rom_fc1_weights_i_3_n_0;
  wire rom_fc1_weights_i_3_n_1;
  wire rom_fc1_weights_i_3_n_2;
  wire rom_fc1_weights_i_3_n_3;
  wire rom_fc1_weights_i_3_n_4;
  wire rom_fc1_weights_i_3_n_5;
  wire rom_fc1_weights_i_3_n_6;
  wire rom_fc1_weights_i_3_n_7;
  wire rom_fc1_weights_i_4_n_0;
  wire rom_fc1_weights_i_4_n_1;
  wire rom_fc1_weights_i_4_n_2;
  wire rom_fc1_weights_i_4_n_3;
  wire rom_fc1_weights_i_4_n_4;
  wire rom_fc1_weights_i_4_n_5;
  wire rom_fc1_weights_i_4_n_6;
  wire rom_fc1_weights_i_4_n_7;
  wire rom_fc1_weights_i_5_n_0;
  wire rom_fc1_weights_i_6_n_1;
  wire rom_fc1_weights_i_6_n_2;
  wire rom_fc1_weights_i_6_n_3;
  wire rom_fc1_weights_i_7_n_0;
  wire rom_fc1_weights_i_7_n_1;
  wire rom_fc1_weights_i_7_n_2;
  wire rom_fc1_weights_i_7_n_3;
  wire rom_fc1_weights_i_8_n_0;
  wire rom_fc1_weights_i_9_n_0;
  wire rom_fc2_weights_i_2_n_3;
  wire rom_fc2_weights_i_2_n_6;
  wire rom_fc2_weights_i_2_n_7;
  wire rom_fc2_weights_i_3_n_0;
  wire rom_fc2_weights_i_3_n_1;
  wire rom_fc2_weights_i_3_n_2;
  wire rom_fc2_weights_i_3_n_3;
  wire rom_fc2_weights_i_3_n_4;
  wire rom_fc2_weights_i_3_n_5;
  wire rom_fc2_weights_i_3_n_6;
  wire rom_fc2_weights_i_3_n_7;
  wire rom_fc2_weights_i_4_n_0;
  wire rst;
  wire \shift_hold_reg_n_0_[0] ;
  wire store1;
  wire store2;
  wire [7:0]w1;
  wire w1_en;
  wire [7:0]w2;
  wire w2_en;
  wire [7:0]w3;
  wire w3_en;
  wire [11:4]waddr10;
  wire [7:0]weight_operand;
  wire \weight_operand[0]_i_1_n_0 ;
  wire \weight_operand[1]_i_1_n_0 ;
  wire \weight_operand[2]_i_1_n_0 ;
  wire \weight_operand[3]_i_1_n_0 ;
  wire \weight_operand[4]_i_1_n_0 ;
  wire \weight_operand[5]_i_1_n_0 ;
  wire \weight_operand[6]_i_1_n_0 ;
  wire \weight_operand[7]_i_1_n_0 ;
  wire [31:0]NLW_rom_fc1_bias_data_UNCONNECTED;
  wire [31:0]NLW_rom_fc1_multiplier_data_UNCONNECTED;
  wire [31:0]NLW_rom_fc2_bias_data_UNCONNECTED;

  LUT5 #(
    .INIT(32'h00002000)) 
    \FSM_onehot_state[10]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[9] ),
        .I1(\feature_index_reg_n_0_[6] ),
        .I2(\feature_index_reg_n_0_[5] ),
        .I3(\feature_index_reg_n_0_[4] ),
        .I4(\FSM_onehot_state[10]_i_2_n_0 ),
        .O(\FSM_onehot_state[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \FSM_onehot_state[10]_i_2 
       (.I0(\feature_index_reg_n_0_[3] ),
        .I1(\feature_index_reg_n_0_[1] ),
        .I2(\feature_index_reg_n_0_[0] ),
        .I3(\feature_index_reg_n_0_[2] ),
        .O(\FSM_onehot_state[10]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEEEEEAEEEEEE)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(neuron_start),
        .I1(\FSM_onehot_state_reg_n_0_[9] ),
        .I2(\FSM_onehot_state[10]_i_2_n_0 ),
        .I3(\feature_index_reg_n_0_[4] ),
        .I4(\feature_index_reg_n_0_[5] ),
        .I5(\feature_index_reg_n_0_[6] ),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'hEAEE)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(input_ready),
        .I1(p_1_in),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .O(\FSM_onehot_state[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \FSM_onehot_state[7]_i_1 
       (.I0(\FSM_onehot_state[7]_i_2_n_0 ),
        .I1(\FSM_onehot_state[7]_i_3_n_0 ),
        .I2(\FSM_onehot_state_reg_n_0_[3] ),
        .I3(neuron_start),
        .I4(neuron_valid),
        .O(\FSM_onehot_state[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'hEAAA)) 
    \FSM_onehot_state[7]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[4] ),
        .I1(\FSM_onehot_state[7]_i_4_n_0 ),
        .I2(input_ready),
        .I3(input_valid),
        .O(\FSM_onehot_state[7]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \FSM_onehot_state[7]_i_3 
       (.I0(\FSM_onehot_state_reg_n_0_[5] ),
        .I1(feature_operand),
        .I2(operand_read),
        .I3(\FSM_onehot_state_reg_n_0_[9] ),
        .I4(\FSM_onehot_state[7]_i_5_n_0 ),
        .O(\FSM_onehot_state[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000800000)) 
    \FSM_onehot_state[7]_i_4 
       (.I0(\input_index_reg_n_0_[2] ),
        .I1(\input_index_reg_n_0_[1] ),
        .I2(\input_index_reg_n_0_[0] ),
        .I3(\input_index_reg_n_0_[3] ),
        .I4(\input_index_reg_n_0_[5] ),
        .I5(\input_index_reg_n_0_[4] ),
        .O(\FSM_onehot_state[7]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'hFFF8)) 
    \FSM_onehot_state[7]_i_5 
       (.I0(neuron_done),
        .I1(\FSM_onehot_state_reg_n_0_[10] ),
        .I2(bias_hold),
        .I3(p_1_in),
        .O(\FSM_onehot_state[7]_i_5_n_0 ));
  (* FSM_ENCODED_STATES = "PARAM_WAIT:000000000001,START:000000000010,PARAM_REQ:000000001000,COMPLETE:000000100000,STORE:000001000000,LOAD:000010000000,IDLE:000000010000,FEED:000100000000,WAIT_DONE:010000000000,ADVANCE:001000000000,OPER_WAIT:100000000000,OPER_REQ:000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk),
        .CE(\FSM_onehot_state[7]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[3] ),
        .Q(bias_hold),
        .R(rst));
  (* FSM_ENCODED_STATES = "PARAM_WAIT:000000000001,START:000000000010,PARAM_REQ:000000001000,COMPLETE:000000100000,STORE:000001000000,LOAD:000010000000,IDLE:000000010000,FEED:000100000000,WAIT_DONE:010000000000,ADVANCE:001000000000,OPER_WAIT:100000000000,OPER_REQ:000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[10] 
       (.C(clk),
        .CE(\FSM_onehot_state[7]_i_1_n_0 ),
        .D(\FSM_onehot_state[10]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[10] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "PARAM_WAIT:000000000001,START:000000000010,PARAM_REQ:000000001000,COMPLETE:000000100000,STORE:000001000000,LOAD:000010000000,IDLE:000000010000,FEED:000100000000,WAIT_DONE:010000000000,ADVANCE:001000000000,OPER_WAIT:100000000000,OPER_REQ:000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[11] 
       (.C(clk),
        .CE(\FSM_onehot_state[7]_i_1_n_0 ),
        .D(operand_read),
        .Q(feature_operand),
        .R(rst));
  (* FSM_ENCODED_STATES = "PARAM_WAIT:000000000001,START:000000000010,PARAM_REQ:000000001000,COMPLETE:000000100000,STORE:000001000000,LOAD:000010000000,IDLE:000000010000,FEED:000100000000,WAIT_DONE:010000000000,ADVANCE:001000000000,OPER_WAIT:100000000000,OPER_REQ:000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk),
        .CE(\FSM_onehot_state[7]_i_1_n_0 ),
        .D(bias_hold),
        .Q(neuron_start),
        .R(rst));
  (* FSM_ENCODED_STATES = "PARAM_WAIT:000000000001,START:000000000010,PARAM_REQ:000000001000,COMPLETE:000000100000,STORE:000001000000,LOAD:000010000000,IDLE:000000010000,FEED:000100000000,WAIT_DONE:010000000000,ADVANCE:001000000000,OPER_WAIT:100000000000,OPER_REQ:000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk),
        .CE(\FSM_onehot_state[7]_i_1_n_0 ),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(operand_read),
        .R(rst));
  (* FSM_ENCODED_STATES = "PARAM_WAIT:000000000001,START:000000000010,PARAM_REQ:000000001000,COMPLETE:000000100000,STORE:000001000000,LOAD:000010000000,IDLE:000000010000,FEED:000100000000,WAIT_DONE:010000000000,ADVANCE:001000000000,OPER_WAIT:100000000000,OPER_REQ:000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(clk),
        .CE(\FSM_onehot_state[7]_i_1_n_0 ),
        .D(\FSM_onehot_state[3]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[3] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "PARAM_WAIT:000000000001,START:000000000010,PARAM_REQ:000000001000,COMPLETE:000000100000,STORE:000001000000,LOAD:000010000000,IDLE:000000010000,FEED:000100000000,WAIT_DONE:010000000000,ADVANCE:001000000000,OPER_WAIT:100000000000,OPER_REQ:000000000100" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[4] 
       (.C(clk),
        .CE(\FSM_onehot_state[7]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[5] ),
        .Q(\FSM_onehot_state_reg_n_0_[4] ),
        .S(rst));
  (* FSM_ENCODED_STATES = "PARAM_WAIT:000000000001,START:000000000010,PARAM_REQ:000000001000,COMPLETE:000000100000,STORE:000001000000,LOAD:000010000000,IDLE:000000010000,FEED:000100000000,WAIT_DONE:010000000000,ADVANCE:001000000000,OPER_WAIT:100000000000,OPER_REQ:000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[5] 
       (.C(clk),
        .CE(\FSM_onehot_state[7]_i_1_n_0 ),
        .D(\output_data[7]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[5] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "PARAM_WAIT:000000000001,START:000000000010,PARAM_REQ:000000001000,COMPLETE:000000100000,STORE:000001000000,LOAD:000010000000,IDLE:000000010000,FEED:000100000000,WAIT_DONE:010000000000,ADVANCE:001000000000,OPER_WAIT:100000000000,OPER_REQ:000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[6] 
       (.C(clk),
        .CE(\FSM_onehot_state[7]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[10] ),
        .Q(p_1_in),
        .R(rst));
  (* FSM_ENCODED_STATES = "PARAM_WAIT:000000000001,START:000000000010,PARAM_REQ:000000001000,COMPLETE:000000100000,STORE:000001000000,LOAD:000010000000,IDLE:000000010000,FEED:000100000000,WAIT_DONE:010000000000,ADVANCE:001000000000,OPER_WAIT:100000000000,OPER_REQ:000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[7] 
       (.C(clk),
        .CE(\FSM_onehot_state[7]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[4] ),
        .Q(input_ready),
        .R(rst));
  (* FSM_ENCODED_STATES = "PARAM_WAIT:000000000001,START:000000000010,PARAM_REQ:000000001000,COMPLETE:000000100000,STORE:000001000000,LOAD:000010000000,IDLE:000000010000,FEED:000100000000,WAIT_DONE:010000000000,ADVANCE:001000000000,OPER_WAIT:100000000000,OPER_REQ:000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[8] 
       (.C(clk),
        .CE(\FSM_onehot_state[7]_i_1_n_0 ),
        .D(feature_operand),
        .Q(neuron_valid),
        .R(rst));
  (* FSM_ENCODED_STATES = "PARAM_WAIT:000000000001,START:000000000010,PARAM_REQ:000000001000,COMPLETE:000000100000,STORE:000001000000,LOAD:000010000000,IDLE:000000010000,FEED:000100000000,WAIT_DONE:010000000000,ADVANCE:001000000000,OPER_WAIT:100000000000,OPER_REQ:000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[9] 
       (.C(clk),
        .CE(\FSM_onehot_state[7]_i_1_n_0 ),
        .D(neuron_valid),
        .Q(\FSM_onehot_state_reg_n_0_[9] ),
        .R(rst));
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \bias_hold[0]_i_1 
       (.I0(b1[0]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(b2[0]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\bias_hold[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \bias_hold[10]_i_1 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(b1[10]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(b2[10]),
        .O(\bias_hold[10]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \bias_hold[11]_i_1 
       (.I0(b1[11]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(b2[11]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\bias_hold[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'h00E2)) 
    \bias_hold[12]_i_1 
       (.I0(b1[12]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(b2[12]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\bias_hold[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h0B08)) 
    \bias_hold[13]_i_1 
       (.I0(b2[31]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\layer_reg_n_0_[1] ),
        .I3(b1[13]),
        .O(\bias_hold[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h0B08)) 
    \bias_hold[14]_i_1 
       (.I0(b2[31]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\layer_reg_n_0_[1] ),
        .I3(b1[14]),
        .O(\bias_hold[14]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \bias_hold[1]_i_1 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(b1[1]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(b2[1]),
        .O(\bias_hold[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \bias_hold[2]_i_1 
       (.I0(b1[2]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(b2[2]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\bias_hold[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h0B08)) 
    \bias_hold[31]_i_1 
       (.I0(b2[31]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\layer_reg_n_0_[1] ),
        .I3(b1[31]),
        .O(\bias_hold[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \bias_hold[3]_i_1 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(b1[3]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(b2[3]),
        .O(\bias_hold[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \bias_hold[4]_i_1 
       (.I0(b1[4]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(b2[4]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\bias_hold[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \bias_hold[5]_i_1 
       (.I0(b1[5]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(b2[5]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\bias_hold[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \bias_hold[6]_i_1 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(b1[6]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(b2[6]),
        .O(\bias_hold[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \bias_hold[7]_i_1 
       (.I0(b1[7]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(b2[7]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\bias_hold[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \bias_hold[8]_i_1 
       (.I0(b1[8]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(b2[8]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\bias_hold[8]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \bias_hold[9]_i_1 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(b1[9]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(b2[9]),
        .O(\bias_hold[9]_i_1_n_0 ));
  FDRE \bias_hold_reg[0] 
       (.C(clk),
        .CE(bias_hold),
        .D(\bias_hold[0]_i_1_n_0 ),
        .Q(\bias_hold_reg_n_0_[0] ),
        .R(rst));
  FDRE \bias_hold_reg[10] 
       (.C(clk),
        .CE(bias_hold),
        .D(\bias_hold[10]_i_1_n_0 ),
        .Q(\bias_hold_reg_n_0_[10] ),
        .R(rst));
  FDRE \bias_hold_reg[11] 
       (.C(clk),
        .CE(bias_hold),
        .D(\bias_hold[11]_i_1_n_0 ),
        .Q(\bias_hold_reg_n_0_[11] ),
        .R(rst));
  FDRE \bias_hold_reg[12] 
       (.C(clk),
        .CE(bias_hold),
        .D(\bias_hold[12]_i_1_n_0 ),
        .Q(\bias_hold_reg_n_0_[12] ),
        .R(rst));
  FDRE \bias_hold_reg[13] 
       (.C(clk),
        .CE(bias_hold),
        .D(\bias_hold[13]_i_1_n_0 ),
        .Q(\bias_hold_reg_n_0_[13] ),
        .R(rst));
  FDRE \bias_hold_reg[14] 
       (.C(clk),
        .CE(bias_hold),
        .D(\bias_hold[14]_i_1_n_0 ),
        .Q(\bias_hold_reg_n_0_[14] ),
        .R(rst));
  FDRE \bias_hold_reg[1] 
       (.C(clk),
        .CE(bias_hold),
        .D(\bias_hold[1]_i_1_n_0 ),
        .Q(\bias_hold_reg_n_0_[1] ),
        .R(rst));
  FDRE \bias_hold_reg[2] 
       (.C(clk),
        .CE(bias_hold),
        .D(\bias_hold[2]_i_1_n_0 ),
        .Q(\bias_hold_reg_n_0_[2] ),
        .R(rst));
  FDRE \bias_hold_reg[31] 
       (.C(clk),
        .CE(bias_hold),
        .D(\bias_hold[31]_i_1_n_0 ),
        .Q(\bias_hold_reg_n_0_[31] ),
        .R(rst));
  FDRE \bias_hold_reg[3] 
       (.C(clk),
        .CE(bias_hold),
        .D(\bias_hold[3]_i_1_n_0 ),
        .Q(\bias_hold_reg_n_0_[3] ),
        .R(rst));
  FDRE \bias_hold_reg[4] 
       (.C(clk),
        .CE(bias_hold),
        .D(\bias_hold[4]_i_1_n_0 ),
        .Q(\bias_hold_reg_n_0_[4] ),
        .R(rst));
  FDRE \bias_hold_reg[5] 
       (.C(clk),
        .CE(bias_hold),
        .D(\bias_hold[5]_i_1_n_0 ),
        .Q(\bias_hold_reg_n_0_[5] ),
        .R(rst));
  FDRE \bias_hold_reg[6] 
       (.C(clk),
        .CE(bias_hold),
        .D(\bias_hold[6]_i_1_n_0 ),
        .Q(\bias_hold_reg_n_0_[6] ),
        .R(rst));
  FDRE \bias_hold_reg[7] 
       (.C(clk),
        .CE(bias_hold),
        .D(\bias_hold[7]_i_1_n_0 ),
        .Q(\bias_hold_reg_n_0_[7] ),
        .R(rst));
  FDRE \bias_hold_reg[8] 
       (.C(clk),
        .CE(bias_hold),
        .D(\bias_hold[8]_i_1_n_0 ),
        .Q(\bias_hold_reg_n_0_[8] ),
        .R(rst));
  FDRE \bias_hold_reg[9] 
       (.C(clk),
        .CE(bias_hold),
        .D(\bias_hold[9]_i_1_n_0 ),
        .Q(\bias_hold_reg_n_0_[9] ),
        .R(rst));
  (* CW = "6" *) 
  (* LAST_COUNT = "6'b111111" *) 
  (* N_FEATURES = "64" *) 
  neuron_int8_serial core
       (.bias_in({\bias_hold_reg_n_0_[31] ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\bias_hold_reg_n_0_[14] ,\bias_hold_reg_n_0_[13] ,\bias_hold_reg_n_0_[12] ,\bias_hold_reg_n_0_[11] ,\bias_hold_reg_n_0_[10] ,\bias_hold_reg_n_0_[9] ,\bias_hold_reg_n_0_[8] ,\bias_hold_reg_n_0_[7] ,\bias_hold_reg_n_0_[6] ,\bias_hold_reg_n_0_[5] ,\bias_hold_reg_n_0_[4] ,\bias_hold_reg_n_0_[3] ,\bias_hold_reg_n_0_[2] ,\bias_hold_reg_n_0_[1] ,\bias_hold_reg_n_0_[0] }),
        .clk(clk),
        .done(neuron_done),
        .feature_in({\feature_operand_reg_n_0_[7] ,\feature_operand_reg_n_0_[6] ,\feature_operand_reg_n_0_[5] ,\feature_operand_reg_n_0_[4] ,\feature_operand_reg_n_0_[3] ,\feature_operand_reg_n_0_[2] ,\feature_operand_reg_n_0_[1] ,\feature_operand_reg_n_0_[0] }),
        .multiplier_in({multiplier_hold[31],\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,multiplier_hold[24:0]}),
        .overflow(neuron_overflow),
        .relu_in(relu),
        .result(neuron_result),
        .rst(rst),
        .shift_in({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\shift_hold_reg_n_0_[0] }),
        .start(neuron_start_reg_n_0),
        .valid_in(neuron_valid_reg_n_0),
        .weight_in(weight_operand));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT2 #(
    .INIT(4'hB)) 
    core_i_1
       (.I0(\layer_reg_n_0_[0] ),
        .I1(\layer_reg_n_0_[1] ),
        .O(relu));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(\FSM_onehot_state_reg_n_0_[5] ),
        .Q(done),
        .R(rst));
  LUT2 #(
    .INIT(4'h2)) 
    \feature_index[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[9] ),
        .I1(\feature_index_reg_n_0_[0] ),
        .O(\feature_index[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \feature_index[1]_i_1 
       (.I0(\feature_index_reg_n_0_[0] ),
        .I1(\feature_index_reg_n_0_[1] ),
        .I2(\FSM_onehot_state_reg_n_0_[9] ),
        .O(\feature_index[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \feature_index[2]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[9] ),
        .I1(\feature_index_reg_n_0_[1] ),
        .I2(\feature_index_reg_n_0_[0] ),
        .I3(\feature_index_reg_n_0_[2] ),
        .O(\feature_index[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT5 #(
    .INIT(32'h7F800000)) 
    \feature_index[3]_i_1 
       (.I0(\feature_index_reg_n_0_[2] ),
        .I1(\feature_index_reg_n_0_[0] ),
        .I2(\feature_index_reg_n_0_[1] ),
        .I3(\feature_index_reg_n_0_[3] ),
        .I4(\FSM_onehot_state_reg_n_0_[9] ),
        .O(\feature_index[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \feature_index[4]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[9] ),
        .I1(\feature_index_reg_n_0_[3] ),
        .I2(\feature_index_reg_n_0_[1] ),
        .I3(\feature_index_reg_n_0_[0] ),
        .I4(\feature_index_reg_n_0_[2] ),
        .I5(\feature_index_reg_n_0_[4] ),
        .O(\feature_index[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h8A20)) 
    \feature_index[5]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[9] ),
        .I1(\FSM_onehot_state[10]_i_2_n_0 ),
        .I2(\feature_index_reg_n_0_[4] ),
        .I3(\feature_index_reg_n_0_[5] ),
        .O(\feature_index[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEEEEEEAEEEEEE)) 
    \feature_index[6]_i_1 
       (.I0(bias_hold),
        .I1(\FSM_onehot_state_reg_n_0_[9] ),
        .I2(\FSM_onehot_state[10]_i_2_n_0 ),
        .I3(\feature_index_reg_n_0_[4] ),
        .I4(\feature_index_reg_n_0_[5] ),
        .I5(\feature_index_reg_n_0_[6] ),
        .O(feature_index0));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT5 #(
    .INIT(32'hA2AA0800)) 
    \feature_index[6]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[9] ),
        .I1(\feature_index_reg_n_0_[4] ),
        .I2(\FSM_onehot_state[10]_i_2_n_0 ),
        .I3(\feature_index_reg_n_0_[5] ),
        .I4(\feature_index_reg_n_0_[6] ),
        .O(\feature_index[6]_i_2_n_0 ));
  FDRE \feature_index_reg[0] 
       (.C(clk),
        .CE(feature_index0),
        .D(\feature_index[0]_i_1_n_0 ),
        .Q(\feature_index_reg_n_0_[0] ),
        .R(rst));
  FDRE \feature_index_reg[1] 
       (.C(clk),
        .CE(feature_index0),
        .D(\feature_index[1]_i_1_n_0 ),
        .Q(\feature_index_reg_n_0_[1] ),
        .R(rst));
  FDRE \feature_index_reg[2] 
       (.C(clk),
        .CE(feature_index0),
        .D(\feature_index[2]_i_1_n_0 ),
        .Q(\feature_index_reg_n_0_[2] ),
        .R(rst));
  FDRE \feature_index_reg[3] 
       (.C(clk),
        .CE(feature_index0),
        .D(\feature_index[3]_i_1_n_0 ),
        .Q(\feature_index_reg_n_0_[3] ),
        .R(rst));
  FDRE \feature_index_reg[4] 
       (.C(clk),
        .CE(feature_index0),
        .D(\feature_index[4]_i_1_n_0 ),
        .Q(\feature_index_reg_n_0_[4] ),
        .R(rst));
  FDRE \feature_index_reg[5] 
       (.C(clk),
        .CE(feature_index0),
        .D(\feature_index[5]_i_1_n_0 ),
        .Q(\feature_index_reg_n_0_[5] ),
        .R(rst));
  FDRE \feature_index_reg[6] 
       (.C(clk),
        .CE(feature_index0),
        .D(\feature_index[6]_i_2_n_0 ),
        .Q(\feature_index_reg_n_0_[6] ),
        .R(rst));
  LUT6 #(
    .INIT(64'h22F2FFFF22F222F2)) 
    \feature_operand[0]_i_1 
       (.I0(fc1_rd[0]),
        .I1(\feature_operand[7]_i_2_n_0 ),
        .I2(fc2_rd[0]),
        .I3(\feature_operand[7]_i_3_n_0 ),
        .I4(rom_fc1_weights_i_5_n_0),
        .I5(input_rd[0]),
        .O(p_0_in__0[0]));
  LUT6 #(
    .INIT(64'h22F2FFFF22F222F2)) 
    \feature_operand[1]_i_1 
       (.I0(fc1_rd[1]),
        .I1(\feature_operand[7]_i_2_n_0 ),
        .I2(fc2_rd[1]),
        .I3(\feature_operand[7]_i_3_n_0 ),
        .I4(rom_fc1_weights_i_5_n_0),
        .I5(input_rd[1]),
        .O(p_0_in__0[1]));
  LUT6 #(
    .INIT(64'h22F2FFFF22F222F2)) 
    \feature_operand[2]_i_1 
       (.I0(fc1_rd[2]),
        .I1(\feature_operand[7]_i_2_n_0 ),
        .I2(fc2_rd[2]),
        .I3(\feature_operand[7]_i_3_n_0 ),
        .I4(rom_fc1_weights_i_5_n_0),
        .I5(input_rd[2]),
        .O(p_0_in__0[2]));
  LUT6 #(
    .INIT(64'h22F2FFFF22F222F2)) 
    \feature_operand[3]_i_1 
       (.I0(fc1_rd[3]),
        .I1(\feature_operand[7]_i_2_n_0 ),
        .I2(fc2_rd[3]),
        .I3(\feature_operand[7]_i_3_n_0 ),
        .I4(rom_fc1_weights_i_5_n_0),
        .I5(input_rd[3]),
        .O(p_0_in__0[3]));
  LUT6 #(
    .INIT(64'h22F2FFFF22F222F2)) 
    \feature_operand[4]_i_1 
       (.I0(fc1_rd[4]),
        .I1(\feature_operand[7]_i_2_n_0 ),
        .I2(fc2_rd[4]),
        .I3(\feature_operand[7]_i_3_n_0 ),
        .I4(rom_fc1_weights_i_5_n_0),
        .I5(input_rd[4]),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'h22F2FFFF22F222F2)) 
    \feature_operand[5]_i_1 
       (.I0(fc1_rd[5]),
        .I1(\feature_operand[7]_i_2_n_0 ),
        .I2(fc2_rd[5]),
        .I3(\feature_operand[7]_i_3_n_0 ),
        .I4(rom_fc1_weights_i_5_n_0),
        .I5(input_rd[5]),
        .O(p_0_in__0[5]));
  LUT6 #(
    .INIT(64'h22F2FFFF22F222F2)) 
    \feature_operand[6]_i_1 
       (.I0(fc1_rd[6]),
        .I1(\feature_operand[7]_i_2_n_0 ),
        .I2(fc2_rd[6]),
        .I3(\feature_operand[7]_i_3_n_0 ),
        .I4(rom_fc1_weights_i_5_n_0),
        .I5(input_rd[6]),
        .O(p_0_in__0[6]));
  LUT6 #(
    .INIT(64'h22F2FFFF22F222F2)) 
    \feature_operand[7]_i_1 
       (.I0(fc1_rd[7]),
        .I1(\feature_operand[7]_i_2_n_0 ),
        .I2(fc2_rd[7]),
        .I3(\feature_operand[7]_i_3_n_0 ),
        .I4(rom_fc1_weights_i_5_n_0),
        .I5(input_rd[7]),
        .O(p_0_in__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \feature_operand[7]_i_2 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(\layer_reg_n_0_[0] ),
        .O(\feature_operand[7]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'hFFFD)) 
    \feature_operand[7]_i_3 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\feature_index_reg_n_0_[6] ),
        .I3(\feature_index_reg_n_0_[5] ),
        .O(\feature_operand[7]_i_3_n_0 ));
  FDRE \feature_operand_reg[0] 
       (.C(clk),
        .CE(feature_operand),
        .D(p_0_in__0[0]),
        .Q(\feature_operand_reg_n_0_[0] ),
        .R(rst));
  FDRE \feature_operand_reg[1] 
       (.C(clk),
        .CE(feature_operand),
        .D(p_0_in__0[1]),
        .Q(\feature_operand_reg_n_0_[1] ),
        .R(rst));
  FDRE \feature_operand_reg[2] 
       (.C(clk),
        .CE(feature_operand),
        .D(p_0_in__0[2]),
        .Q(\feature_operand_reg_n_0_[2] ),
        .R(rst));
  FDRE \feature_operand_reg[3] 
       (.C(clk),
        .CE(feature_operand),
        .D(p_0_in__0[3]),
        .Q(\feature_operand_reg_n_0_[3] ),
        .R(rst));
  FDRE \feature_operand_reg[4] 
       (.C(clk),
        .CE(feature_operand),
        .D(p_0_in__0[4]),
        .Q(\feature_operand_reg_n_0_[4] ),
        .R(rst));
  FDRE \feature_operand_reg[5] 
       (.C(clk),
        .CE(feature_operand),
        .D(p_0_in__0[5]),
        .Q(\feature_operand_reg_n_0_[5] ),
        .R(rst));
  FDRE \feature_operand_reg[6] 
       (.C(clk),
        .CE(feature_operand),
        .D(p_0_in__0[6]),
        .Q(\feature_operand_reg_n_0_[6] ),
        .R(rst));
  FDRE \feature_operand_reg[7] 
       (.C(clk),
        .CE(feature_operand),
        .D(p_0_in__0[7]),
        .Q(\feature_operand_reg_n_0_[7] ),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \input_index[0]_i_1 
       (.I0(input_ready),
        .I1(\input_index_reg_n_0_[0] ),
        .O(input_index[0]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \input_index[1]_i_1 
       (.I0(input_ready),
        .I1(\input_index_reg_n_0_[0] ),
        .I2(\input_index_reg_n_0_[1] ),
        .O(input_index[1]));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \input_index[2]_i_1 
       (.I0(input_ready),
        .I1(\input_index_reg_n_0_[1] ),
        .I2(\input_index_reg_n_0_[0] ),
        .I3(\input_index_reg_n_0_[2] ),
        .O(input_index[2]));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'hF00000D0)) 
    \input_index[3]_i_1 
       (.I0(\input_index_reg_n_0_[5] ),
        .I1(\input_index_reg_n_0_[4] ),
        .I2(input_ready),
        .I3(\input_index[5]_i_3_n_0 ),
        .I4(\input_index_reg_n_0_[3] ),
        .O(input_index[3]));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \input_index[4]_i_1 
       (.I0(input_ready),
        .I1(\input_index_reg_n_0_[3] ),
        .I2(\input_index_reg_n_0_[2] ),
        .I3(\input_index_reg_n_0_[1] ),
        .I4(\input_index_reg_n_0_[0] ),
        .I5(\input_index_reg_n_0_[4] ),
        .O(input_index[4]));
  LUT3 #(
    .INIT(8'hEA)) 
    \input_index[5]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[4] ),
        .I1(input_valid),
        .I2(input_ready),
        .O(\input_index[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT5 #(
    .INIT(32'hB4E00000)) 
    \input_index[5]_i_2 
       (.I0(\input_index[5]_i_3_n_0 ),
        .I1(\input_index_reg_n_0_[3] ),
        .I2(\input_index_reg_n_0_[5] ),
        .I3(\input_index_reg_n_0_[4] ),
        .I4(input_ready),
        .O(input_index[5]));
  LUT3 #(
    .INIT(8'h7F)) 
    \input_index[5]_i_3 
       (.I0(\input_index_reg_n_0_[0] ),
        .I1(\input_index_reg_n_0_[1] ),
        .I2(\input_index_reg_n_0_[2] ),
        .O(\input_index[5]_i_3_n_0 ));
  FDRE \input_index_reg[0] 
       (.C(clk),
        .CE(\input_index[5]_i_1_n_0 ),
        .D(input_index[0]),
        .Q(\input_index_reg_n_0_[0] ),
        .R(rst));
  FDRE \input_index_reg[1] 
       (.C(clk),
        .CE(\input_index[5]_i_1_n_0 ),
        .D(input_index[1]),
        .Q(\input_index_reg_n_0_[1] ),
        .R(rst));
  FDRE \input_index_reg[2] 
       (.C(clk),
        .CE(\input_index[5]_i_1_n_0 ),
        .D(input_index[2]),
        .Q(\input_index_reg_n_0_[2] ),
        .R(rst));
  FDRE \input_index_reg[3] 
       (.C(clk),
        .CE(\input_index[5]_i_1_n_0 ),
        .D(input_index[3]),
        .Q(\input_index_reg_n_0_[3] ),
        .R(rst));
  FDRE \input_index_reg[4] 
       (.C(clk),
        .CE(\input_index[5]_i_1_n_0 ),
        .D(input_index[4]),
        .Q(\input_index_reg_n_0_[4] ),
        .R(rst));
  FDRE \input_index_reg[5] 
       (.C(clk),
        .CE(\input_index[5]_i_1_n_0 ),
        .D(input_index[5]),
        .Q(\input_index_reg_n_0_[5] ),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h0B505A50)) 
    \layer[0]_i_1 
       (.I0(\FSM_onehot_state[7]_i_2_n_0 ),
        .I1(\layer_reg_n_0_[1] ),
        .I2(\layer_reg_n_0_[0] ),
        .I3(p_1_in),
        .I4(\layer[1]_i_2_n_0 ),
        .O(\layer[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT5 #(
    .INIT(32'h3C446C44)) 
    \layer[1]_i_1 
       (.I0(\FSM_onehot_state[7]_i_2_n_0 ),
        .I1(\layer_reg_n_0_[1] ),
        .I2(\layer_reg_n_0_[0] ),
        .I3(p_1_in),
        .I4(\layer[1]_i_2_n_0 ),
        .O(\layer[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT5 #(
    .INIT(32'h00000220)) 
    \layer[1]_i_2 
       (.I0(\neuron_index[6]_i_3_n_0 ),
        .I1(\neuron_index_reg_n_0_[6] ),
        .I2(\neuron_index_reg_n_0_[5] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(\layer_reg_n_0_[1] ),
        .O(\layer[1]_i_2_n_0 ));
  FDRE \layer_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\layer[0]_i_1_n_0 ),
        .Q(\layer_reg_n_0_[0] ),
        .R(rst));
  FDRE \layer_reg[1] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\layer[1]_i_1_n_0 ),
        .Q(\layer_reg_n_0_[1] ),
        .R(rst));
  LUT4 #(
    .INIT(16'h00E2)) 
    \multiplier_hold[0]_i_1 
       (.I0(m1[0]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(m2[0]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\multiplier_hold[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \multiplier_hold[10]_i_1 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(m1[10]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(m2[10]),
        .O(\multiplier_hold[10]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \multiplier_hold[11]_i_1 
       (.I0(m1[11]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(m2[11]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\multiplier_hold[11]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \multiplier_hold[12]_i_1 
       (.I0(m1[12]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(m2[12]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\multiplier_hold[12]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \multiplier_hold[13]_i_1 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(m1[13]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(m2[13]),
        .O(\multiplier_hold[13]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \multiplier_hold[14]_i_1 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(m1[14]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(m2[14]),
        .O(\multiplier_hold[14]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \multiplier_hold[15]_i_1 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(m1[15]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(m2[15]),
        .O(\multiplier_hold[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \multiplier_hold[16]_i_1 
       (.I0(m1[16]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(m2[16]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\multiplier_hold[16]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \multiplier_hold[17]_i_1 
       (.I0(m1[17]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(m2[17]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\multiplier_hold[17]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \multiplier_hold[18]_i_1 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(m1[18]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(m2[18]),
        .O(\multiplier_hold[18]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \multiplier_hold[19]_i_1 
       (.I0(m1[19]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(m2[19]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\multiplier_hold[19]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \multiplier_hold[1]_i_1 
       (.I0(m1[1]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(m2[1]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\multiplier_hold[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \multiplier_hold[20]_i_1 
       (.I0(m1[20]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(m2[20]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\multiplier_hold[20]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \multiplier_hold[21]_i_1 
       (.I0(m1[21]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(m2[21]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\multiplier_hold[21]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \multiplier_hold[22]_i_1 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(m1[22]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(m2[22]),
        .O(\multiplier_hold[22]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \multiplier_hold[23]_i_1 
       (.I0(m1[23]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(m2[23]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\multiplier_hold[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \multiplier_hold[24]_i_1 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(m1[31]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(m2[24]),
        .O(\multiplier_hold[24]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \multiplier_hold[2]_i_1 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(m1[2]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(m2[2]),
        .O(\multiplier_hold[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \multiplier_hold[31]_i_1 
       (.I0(m1[31]),
        .I1(\layer_reg_n_0_[1] ),
        .I2(\layer_reg_n_0_[0] ),
        .O(\multiplier_hold[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \multiplier_hold[3]_i_1 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(m1[3]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(m2[3]),
        .O(\multiplier_hold[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \multiplier_hold[4]_i_1 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(m1[4]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(m2[4]),
        .O(\multiplier_hold[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \multiplier_hold[5]_i_1 
       (.I0(m1[5]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(m2[5]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\multiplier_hold[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \multiplier_hold[6]_i_1 
       (.I0(m1[6]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(m2[6]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\multiplier_hold[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \multiplier_hold[7]_i_1 
       (.I0(m1[7]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(m2[7]),
        .I3(\layer_reg_n_0_[1] ),
        .O(\multiplier_hold[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \multiplier_hold[8]_i_1 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(m1[8]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(m2[8]),
        .O(\multiplier_hold[8]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFEAE)) 
    \multiplier_hold[9]_i_1 
       (.I0(\layer_reg_n_0_[1] ),
        .I1(m1[9]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(m2[9]),
        .O(\multiplier_hold[9]_i_1_n_0 ));
  FDRE \multiplier_hold_reg[0] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[0]_i_1_n_0 ),
        .Q(multiplier_hold[0]),
        .R(rst));
  FDRE \multiplier_hold_reg[10] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[10]_i_1_n_0 ),
        .Q(multiplier_hold[10]),
        .R(rst));
  FDRE \multiplier_hold_reg[11] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[11]_i_1_n_0 ),
        .Q(multiplier_hold[11]),
        .R(rst));
  FDRE \multiplier_hold_reg[12] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[12]_i_1_n_0 ),
        .Q(multiplier_hold[12]),
        .R(rst));
  FDRE \multiplier_hold_reg[13] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[13]_i_1_n_0 ),
        .Q(multiplier_hold[13]),
        .R(rst));
  FDRE \multiplier_hold_reg[14] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[14]_i_1_n_0 ),
        .Q(multiplier_hold[14]),
        .R(rst));
  FDRE \multiplier_hold_reg[15] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[15]_i_1_n_0 ),
        .Q(multiplier_hold[15]),
        .R(rst));
  FDRE \multiplier_hold_reg[16] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[16]_i_1_n_0 ),
        .Q(multiplier_hold[16]),
        .R(rst));
  FDRE \multiplier_hold_reg[17] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[17]_i_1_n_0 ),
        .Q(multiplier_hold[17]),
        .R(rst));
  FDRE \multiplier_hold_reg[18] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[18]_i_1_n_0 ),
        .Q(multiplier_hold[18]),
        .R(rst));
  FDRE \multiplier_hold_reg[19] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[19]_i_1_n_0 ),
        .Q(multiplier_hold[19]),
        .R(rst));
  FDRE \multiplier_hold_reg[1] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[1]_i_1_n_0 ),
        .Q(multiplier_hold[1]),
        .R(rst));
  FDRE \multiplier_hold_reg[20] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[20]_i_1_n_0 ),
        .Q(multiplier_hold[20]),
        .R(rst));
  FDRE \multiplier_hold_reg[21] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[21]_i_1_n_0 ),
        .Q(multiplier_hold[21]),
        .R(rst));
  FDRE \multiplier_hold_reg[22] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[22]_i_1_n_0 ),
        .Q(multiplier_hold[22]),
        .R(rst));
  FDRE \multiplier_hold_reg[23] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[23]_i_1_n_0 ),
        .Q(multiplier_hold[23]),
        .R(rst));
  FDRE \multiplier_hold_reg[24] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[24]_i_1_n_0 ),
        .Q(multiplier_hold[24]),
        .R(rst));
  FDRE \multiplier_hold_reg[2] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[2]_i_1_n_0 ),
        .Q(multiplier_hold[2]),
        .R(rst));
  FDRE \multiplier_hold_reg[31] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[31]_i_1_n_0 ),
        .Q(multiplier_hold[31]),
        .R(rst));
  FDRE \multiplier_hold_reg[3] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[3]_i_1_n_0 ),
        .Q(multiplier_hold[3]),
        .R(rst));
  FDRE \multiplier_hold_reg[4] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[4]_i_1_n_0 ),
        .Q(multiplier_hold[4]),
        .R(rst));
  FDRE \multiplier_hold_reg[5] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[5]_i_1_n_0 ),
        .Q(multiplier_hold[5]),
        .R(rst));
  FDRE \multiplier_hold_reg[6] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[6]_i_1_n_0 ),
        .Q(multiplier_hold[6]),
        .R(rst));
  FDRE \multiplier_hold_reg[7] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[7]_i_1_n_0 ),
        .Q(multiplier_hold[7]),
        .R(rst));
  FDRE \multiplier_hold_reg[8] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[8]_i_1_n_0 ),
        .Q(multiplier_hold[8]),
        .R(rst));
  FDRE \multiplier_hold_reg[9] 
       (.C(clk),
        .CE(bias_hold),
        .D(\multiplier_hold[9]_i_1_n_0 ),
        .Q(multiplier_hold[9]),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \neuron_index[0]_i_1 
       (.I0(p_1_in),
        .I1(\neuron_index_reg_n_0_[0] ),
        .O(\neuron_index[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \neuron_index[1]_i_1 
       (.I0(\neuron_index_reg_n_0_[1] ),
        .I1(\neuron_index_reg_n_0_[0] ),
        .I2(p_1_in),
        .O(\neuron_index[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h2A80)) 
    \neuron_index[2]_i_1 
       (.I0(p_1_in),
        .I1(\neuron_index_reg_n_0_[0] ),
        .I2(\neuron_index_reg_n_0_[1] ),
        .I3(\neuron_index_reg_n_0_[2] ),
        .O(\neuron_index[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT5 #(
    .INIT(32'h7F800000)) 
    \neuron_index[3]_i_1 
       (.I0(\neuron_index_reg_n_0_[2] ),
        .I1(\neuron_index_reg_n_0_[1] ),
        .I2(\neuron_index_reg_n_0_[0] ),
        .I3(\neuron_index_reg_n_0_[3] ),
        .I4(p_1_in),
        .O(\neuron_index[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \neuron_index[4]_i_1 
       (.I0(p_1_in),
        .I1(\neuron_index_reg_n_0_[3] ),
        .I2(\neuron_index_reg_n_0_[0] ),
        .I3(\neuron_index_reg_n_0_[1] ),
        .I4(\neuron_index_reg_n_0_[2] ),
        .I5(\neuron_index_reg_n_0_[4] ),
        .O(\neuron_index[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000FF00FB000000)) 
    \neuron_index[5]_i_1 
       (.I0(\neuron_index_reg_n_0_[6] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\layer_reg_n_0_[1] ),
        .I3(p_1_in),
        .I4(\neuron_index[6]_i_3_n_0 ),
        .I5(\neuron_index_reg_n_0_[5] ),
        .O(\neuron_index[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hEAEE)) 
    \neuron_index[6]_i_1 
       (.I0(\FSM_onehot_state[7]_i_2_n_0 ),
        .I1(p_1_in),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .O(\neuron_index[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00F0F0F0E0000000)) 
    \neuron_index[6]_i_2 
       (.I0(\layer_reg_n_0_[0] ),
        .I1(\layer_reg_n_0_[1] ),
        .I2(p_1_in),
        .I3(\neuron_index_reg_n_0_[5] ),
        .I4(\neuron_index[6]_i_3_n_0 ),
        .I5(\neuron_index_reg_n_0_[6] ),
        .O(\neuron_index[6]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \neuron_index[6]_i_3 
       (.I0(\neuron_index_reg_n_0_[4] ),
        .I1(\neuron_index_reg_n_0_[2] ),
        .I2(\neuron_index_reg_n_0_[1] ),
        .I3(\neuron_index_reg_n_0_[0] ),
        .I4(\neuron_index_reg_n_0_[3] ),
        .O(\neuron_index[6]_i_3_n_0 ));
  FDRE \neuron_index_reg[0] 
       (.C(clk),
        .CE(\neuron_index[6]_i_1_n_0 ),
        .D(\neuron_index[0]_i_1_n_0 ),
        .Q(\neuron_index_reg_n_0_[0] ),
        .R(rst));
  FDRE \neuron_index_reg[1] 
       (.C(clk),
        .CE(\neuron_index[6]_i_1_n_0 ),
        .D(\neuron_index[1]_i_1_n_0 ),
        .Q(\neuron_index_reg_n_0_[1] ),
        .R(rst));
  FDRE \neuron_index_reg[2] 
       (.C(clk),
        .CE(\neuron_index[6]_i_1_n_0 ),
        .D(\neuron_index[2]_i_1_n_0 ),
        .Q(\neuron_index_reg_n_0_[2] ),
        .R(rst));
  FDRE \neuron_index_reg[3] 
       (.C(clk),
        .CE(\neuron_index[6]_i_1_n_0 ),
        .D(\neuron_index[3]_i_1_n_0 ),
        .Q(\neuron_index_reg_n_0_[3] ),
        .R(rst));
  FDRE \neuron_index_reg[4] 
       (.C(clk),
        .CE(\neuron_index[6]_i_1_n_0 ),
        .D(\neuron_index[4]_i_1_n_0 ),
        .Q(\neuron_index_reg_n_0_[4] ),
        .R(rst));
  FDRE \neuron_index_reg[5] 
       (.C(clk),
        .CE(\neuron_index[6]_i_1_n_0 ),
        .D(\neuron_index[5]_i_1_n_0 ),
        .Q(\neuron_index_reg_n_0_[5] ),
        .R(rst));
  FDRE \neuron_index_reg[6] 
       (.C(clk),
        .CE(\neuron_index[6]_i_1_n_0 ),
        .D(\neuron_index[6]_i_2_n_0 ),
        .Q(\neuron_index_reg_n_0_[6] ),
        .R(rst));
  FDRE neuron_start_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(neuron_start),
        .Q(neuron_start_reg_n_0),
        .R(rst));
  FDRE neuron_valid_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(neuron_valid),
        .Q(neuron_valid_reg_n_0),
        .R(rst));
  LUT3 #(
    .INIT(8'h08)) 
    \output_data[7]_i_1 
       (.I0(p_1_in),
        .I1(\layer_reg_n_0_[1] ),
        .I2(\layer_reg_n_0_[0] ),
        .O(\output_data[7]_i_1_n_0 ));
  FDRE \output_data_reg[0] 
       (.C(clk),
        .CE(\output_data[7]_i_1_n_0 ),
        .D(neuron_result[0]),
        .Q(output_data[0]),
        .R(rst));
  FDRE \output_data_reg[1] 
       (.C(clk),
        .CE(\output_data[7]_i_1_n_0 ),
        .D(neuron_result[1]),
        .Q(output_data[1]),
        .R(rst));
  FDRE \output_data_reg[2] 
       (.C(clk),
        .CE(\output_data[7]_i_1_n_0 ),
        .D(neuron_result[2]),
        .Q(output_data[2]),
        .R(rst));
  FDRE \output_data_reg[3] 
       (.C(clk),
        .CE(\output_data[7]_i_1_n_0 ),
        .D(neuron_result[3]),
        .Q(output_data[3]),
        .R(rst));
  FDRE \output_data_reg[4] 
       (.C(clk),
        .CE(\output_data[7]_i_1_n_0 ),
        .D(neuron_result[4]),
        .Q(output_data[4]),
        .R(rst));
  FDRE \output_data_reg[5] 
       (.C(clk),
        .CE(\output_data[7]_i_1_n_0 ),
        .D(neuron_result[5]),
        .Q(output_data[5]),
        .R(rst));
  FDRE \output_data_reg[6] 
       (.C(clk),
        .CE(\output_data[7]_i_1_n_0 ),
        .D(neuron_result[6]),
        .Q(output_data[6]),
        .R(rst));
  FDRE \output_data_reg[7] 
       (.C(clk),
        .CE(\output_data[7]_i_1_n_0 ),
        .D(neuron_result[7]),
        .Q(output_data[7]),
        .R(rst));
  LUT5 #(
    .INIT(32'hFF33A800)) 
    overflow_any_i_1
       (.I0(neuron_overflow),
        .I1(\FSM_onehot_state_reg_n_0_[4] ),
        .I2(neuron_done),
        .I3(\FSM_onehot_state_reg_n_0_[10] ),
        .I4(overflow_any),
        .O(overflow_any_i_1_n_0));
  FDRE overflow_any_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(overflow_any_i_1_n_0),
        .Q(overflow_any),
        .R(rst));
  (* ADDR_WIDTH = "6" *) 
  (* DEPTH = "64" *) 
  activation_ram_sync__parameterized0 ram_fc1
       (.clk(clk),
        .raddr({\feature_index_reg_n_0_[5] ,\feature_index_reg_n_0_[4] ,\feature_index_reg_n_0_[3] ,\feature_index_reg_n_0_[2] ,\feature_index_reg_n_0_[1] ,\feature_index_reg_n_0_[0] }),
        .rdata(fc1_rd),
        .re(w2_en),
        .waddr({\neuron_index_reg_n_0_[5] ,\neuron_index_reg_n_0_[4] ,\neuron_index_reg_n_0_[3] ,\neuron_index_reg_n_0_[2] ,\neuron_index_reg_n_0_[1] ,\neuron_index_reg_n_0_[0] }),
        .wdata(neuron_result),
        .we(store1));
  LUT3 #(
    .INIT(8'h02)) 
    ram_fc1_i_1
       (.I0(p_1_in),
        .I1(\layer_reg_n_0_[1] ),
        .I2(\layer_reg_n_0_[0] ),
        .O(store1));
  (* ADDR_WIDTH = "5" *) 
  (* DEPTH = "32" *) 
  activation_ram_sync__parameterized1 ram_fc2
       (.clk(clk),
        .raddr({\feature_index_reg_n_0_[4] ,\feature_index_reg_n_0_[3] ,\feature_index_reg_n_0_[2] ,\feature_index_reg_n_0_[1] ,\feature_index_reg_n_0_[0] }),
        .rdata(fc2_rd),
        .re(w3_en),
        .waddr({\neuron_index_reg_n_0_[4] ,\neuron_index_reg_n_0_[3] ,\neuron_index_reg_n_0_[2] ,\neuron_index_reg_n_0_[1] ,\neuron_index_reg_n_0_[0] }),
        .wdata(neuron_result),
        .we(store2));
  LUT3 #(
    .INIT(8'h08)) 
    ram_fc2_i_1
       (.I0(p_1_in),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\layer_reg_n_0_[1] ),
        .O(store2));
  (* ADDR_WIDTH = "6" *) 
  (* DEPTH = "40" *) 
  activation_ram_sync ram_input
       (.clk(clk),
        .raddr({\feature_index_reg_n_0_[5] ,\feature_index_reg_n_0_[4] ,\feature_index_reg_n_0_[3] ,\feature_index_reg_n_0_[2] ,\feature_index_reg_n_0_[1] ,\feature_index_reg_n_0_[0] }),
        .rdata(input_rd),
        .re(w1_en),
        .waddr({\input_index_reg_n_0_[5] ,\input_index_reg_n_0_[4] ,\input_index_reg_n_0_[3] ,\input_index_reg_n_0_[2] ,\input_index_reg_n_0_[1] ,\input_index_reg_n_0_[0] }),
        .wdata(input_data),
        .we(load_write));
  LUT2 #(
    .INIT(4'h8)) 
    ram_input_i_1
       (.I0(input_ready),
        .I1(input_valid),
        .O(load_write));
  (* ADDR_WIDTH = "6" *) 
  (* DEPTH = "64" *) 
  (* INIT_FILE = "416'b01110010011001010111001101110101011011000111010001110011001011110111000000110011010111110110110100110000001101000010111101101101011011000111000001011111011001100110111101101100011001000011000101011111011100000110000101110010011000010110110101100101011101000110010101110010010111110111001001101111011011010010111101100110011000110011000101011111011000100110100101100001011100110010111001101101011001010110110101101000" *) 
  (* WIDTH = "32" *) 
  parameter_rom_sync__parameterized0 rom_fc1_bias
       (.addr({\neuron_index_reg_n_0_[5] ,\neuron_index_reg_n_0_[4] ,\neuron_index_reg_n_0_[3] ,\neuron_index_reg_n_0_[2] ,\neuron_index_reg_n_0_[1] ,\neuron_index_reg_n_0_[0] }),
        .clk(clk),
        .data(b1),
        .en(p1_en));
  LUT3 #(
    .INIT(8'h02)) 
    rom_fc1_bias_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\layer_reg_n_0_[1] ),
        .I2(\layer_reg_n_0_[0] ),
        .O(p1_en));
  (* ADDR_WIDTH = "6" *) 
  (* DEPTH = "64" *) 
  (* INIT_FILE = "464'b01110010011001010111001101110101011011000111010001110011001011110111000000110011010111110110110100110000001101000010111101101101011011000111000001011111011001100110111101101100011001000011000101011111011100000110000101110010011000010110110101100101011101000110010101110010010111110111001001101111011011010010111101100110011000110011000101011111011011010111010101101100011101000110100101110000011011000110100101100101011100100010111001101101011001010110110101101000" *) 
  (* WIDTH = "32" *) 
  parameter_rom_sync__parameterized1 rom_fc1_multiplier
       (.addr({\neuron_index_reg_n_0_[5] ,\neuron_index_reg_n_0_[4] ,\neuron_index_reg_n_0_[3] ,\neuron_index_reg_n_0_[2] ,\neuron_index_reg_n_0_[1] ,\neuron_index_reg_n_0_[0] }),
        .clk(clk),
        .data(m1),
        .en(p1_en));
  (* ADDR_WIDTH = "12" *) 
  (* DEPTH = "2560" *) 
  (* INIT_FILE = "440'b01110010011001010111001101110101011011000111010001110011001011110111000000110011010111110110110100110000001101000010111101101101011011000111000001011111011001100110111101101100011001000011000101011111011100000110000101110010011000010110110101100101011101000110010101110010010111110111001001101111011011010010111101100110011000110011000101011111011101110110010101101001011001110110100001110100011100110010111001101101011001010110110101101000" *) 
  (* WIDTH = "8" *) 
  parameter_rom_sync rom_fc1_weights
       (.addr({rom_fc1_weights_i_2_n_7,rom_fc1_weights_i_3_n_4,rom_fc1_weights_i_3_n_5,rom_fc1_weights_i_3_n_6,rom_fc1_weights_i_3_n_7,rom_fc1_weights_i_4_n_4,rom_fc1_weights_i_4_n_5,rom_fc1_weights_i_4_n_6,rom_fc1_weights_i_4_n_7,\feature_index_reg_n_0_[2] ,\feature_index_reg_n_0_[1] ,\feature_index_reg_n_0_[0] }),
        .clk(clk),
        .data(w1),
        .en(w1_en));
  LUT2 #(
    .INIT(4'h2)) 
    rom_fc1_weights_i_1
       (.I0(operand_read),
        .I1(rom_fc1_weights_i_5_n_0),
        .O(w1_en));
  LUT2 #(
    .INIT(4'h6)) 
    rom_fc1_weights_i_10
       (.I0(waddr10[4]),
        .I1(\feature_index_reg_n_0_[4] ),
        .O(rom_fc1_weights_i_10_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rom_fc1_weights_i_11
       (.I0(\neuron_index_reg_n_0_[0] ),
        .I1(\feature_index_reg_n_0_[3] ),
        .O(rom_fc1_weights_i_11_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rom_fc1_weights_i_12
       (.I0(\neuron_index_reg_n_0_[6] ),
        .I1(\neuron_index_reg_n_0_[4] ),
        .O(rom_fc1_weights_i_12_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rom_fc1_weights_i_13
       (.I0(\neuron_index_reg_n_0_[5] ),
        .I1(\neuron_index_reg_n_0_[3] ),
        .O(rom_fc1_weights_i_13_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rom_fc1_weights_i_14
       (.I0(\neuron_index_reg_n_0_[4] ),
        .I1(\neuron_index_reg_n_0_[2] ),
        .O(rom_fc1_weights_i_14_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rom_fc1_weights_i_15
       (.I0(\neuron_index_reg_n_0_[3] ),
        .I1(\neuron_index_reg_n_0_[1] ),
        .O(rom_fc1_weights_i_15_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rom_fc1_weights_i_16
       (.I0(\neuron_index_reg_n_0_[2] ),
        .I1(\neuron_index_reg_n_0_[0] ),
        .O(rom_fc1_weights_i_16_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 rom_fc1_weights_i_2
       (.CI(rom_fc1_weights_i_3_n_0),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rom_fc1_weights_i_2_n_7),
        .S({\<const0> ,\<const0> ,\<const0> ,waddr10[11]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 rom_fc1_weights_i_3
       (.CI(rom_fc1_weights_i_4_n_0),
        .CO({rom_fc1_weights_i_3_n_0,rom_fc1_weights_i_3_n_1,rom_fc1_weights_i_3_n_2,rom_fc1_weights_i_3_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({rom_fc1_weights_i_3_n_4,rom_fc1_weights_i_3_n_5,rom_fc1_weights_i_3_n_6,rom_fc1_weights_i_3_n_7}),
        .S(waddr10[10:7]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 rom_fc1_weights_i_4
       (.CI(\<const0> ),
        .CO({rom_fc1_weights_i_4_n_0,rom_fc1_weights_i_4_n_1,rom_fc1_weights_i_4_n_2,rom_fc1_weights_i_4_n_3}),
        .CYINIT(\<const0> ),
        .DI({waddr10[6:4],\neuron_index_reg_n_0_[0] }),
        .O({rom_fc1_weights_i_4_n_4,rom_fc1_weights_i_4_n_5,rom_fc1_weights_i_4_n_6,rom_fc1_weights_i_4_n_7}),
        .S({rom_fc1_weights_i_8_n_0,rom_fc1_weights_i_9_n_0,rom_fc1_weights_i_10_n_0,rom_fc1_weights_i_11_n_0}));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFE0)) 
    rom_fc1_weights_i_5
       (.I0(\feature_index_reg_n_0_[3] ),
        .I1(\feature_index_reg_n_0_[4] ),
        .I2(\feature_index_reg_n_0_[5] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(\layer_reg_n_0_[1] ),
        .I5(\feature_index_reg_n_0_[6] ),
        .O(rom_fc1_weights_i_5_n_0));
  CARRY4 rom_fc1_weights_i_6
       (.CI(rom_fc1_weights_i_7_n_0),
        .CO({rom_fc1_weights_i_6_n_1,rom_fc1_weights_i_6_n_2,rom_fc1_weights_i_6_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\neuron_index_reg_n_0_[6] ,\neuron_index_reg_n_0_[5] }),
        .O(waddr10[11:8]),
        .S({\neuron_index_reg_n_0_[6] ,\neuron_index_reg_n_0_[5] ,rom_fc1_weights_i_12_n_0,rom_fc1_weights_i_13_n_0}));
  CARRY4 rom_fc1_weights_i_7
       (.CI(\<const0> ),
        .CO({rom_fc1_weights_i_7_n_0,rom_fc1_weights_i_7_n_1,rom_fc1_weights_i_7_n_2,rom_fc1_weights_i_7_n_3}),
        .CYINIT(\<const0> ),
        .DI({\neuron_index_reg_n_0_[4] ,\neuron_index_reg_n_0_[3] ,\neuron_index_reg_n_0_[2] ,\<const0> }),
        .O(waddr10[7:4]),
        .S({rom_fc1_weights_i_14_n_0,rom_fc1_weights_i_15_n_0,rom_fc1_weights_i_16_n_0,\neuron_index_reg_n_0_[1] }));
  LUT2 #(
    .INIT(4'h6)) 
    rom_fc1_weights_i_8
       (.I0(waddr10[6]),
        .I1(\feature_index_reg_n_0_[6] ),
        .O(rom_fc1_weights_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    rom_fc1_weights_i_9
       (.I0(waddr10[5]),
        .I1(\feature_index_reg_n_0_[5] ),
        .O(rom_fc1_weights_i_9_n_0));
  (* ADDR_WIDTH = "5" *) 
  (* DEPTH = "32" *) 
  (* INIT_FILE = "416'b01110010011001010111001101110101011011000111010001110011001011110111000000110011010111110110110100110000001101000010111101101101011011000111000001011111011001100110111101101100011001000011000101011111011100000110000101110010011000010110110101100101011101000110010101110010010111110111001001101111011011010010111101100110011000110011001001011111011000100110100101100001011100110010111001101101011001010110110101101000" *) 
  (* WIDTH = "32" *) 
  parameter_rom_sync__parameterized4 rom_fc2_bias
       (.addr({\neuron_index_reg_n_0_[4] ,\neuron_index_reg_n_0_[3] ,\neuron_index_reg_n_0_[2] ,\neuron_index_reg_n_0_[1] ,\neuron_index_reg_n_0_[0] }),
        .clk(clk),
        .data(b2),
        .en(p2_en));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT3 #(
    .INIT(8'h08)) 
    rom_fc2_bias_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\layer_reg_n_0_[1] ),
        .O(p2_en));
  (* ADDR_WIDTH = "5" *) 
  (* DEPTH = "32" *) 
  (* INIT_FILE = "464'b01110010011001010111001101110101011011000111010001110011001011110111000000110011010111110110110100110000001101000010111101101101011011000111000001011111011001100110111101101100011001000011000101011111011100000110000101110010011000010110110101100101011101000110010101110010010111110111001001101111011011010010111101100110011000110011001001011111011011010111010101101100011101000110100101110000011011000110100101100101011100100010111001101101011001010110110101101000" *) 
  (* WIDTH = "32" *) 
  parameter_rom_sync__parameterized5 rom_fc2_multiplier
       (.addr({\neuron_index_reg_n_0_[4] ,\neuron_index_reg_n_0_[3] ,\neuron_index_reg_n_0_[2] ,\neuron_index_reg_n_0_[1] ,\neuron_index_reg_n_0_[0] }),
        .clk(clk),
        .data(m2),
        .en(p2_en));
  (* ADDR_WIDTH = "11" *) 
  (* DEPTH = "2048" *) 
  (* INIT_FILE = "440'b01110010011001010111001101110101011011000111010001110011001011110111000000110011010111110110110100110000001101000010111101101101011011000111000001011111011001100110111101101100011001000011000101011111011100000110000101110010011000010110110101100101011101000110010101110010010111110111001001101111011011010010111101100110011000110011001001011111011101110110010101101001011001110110100001110100011100110010111001101101011001010110110101101000" *) 
  (* WIDTH = "8" *) 
  parameter_rom_sync__parameterized3 rom_fc2_weights
       (.addr({rom_fc2_weights_i_2_n_6,rom_fc2_weights_i_2_n_7,rom_fc2_weights_i_3_n_4,rom_fc2_weights_i_3_n_5,rom_fc2_weights_i_3_n_6,rom_fc2_weights_i_3_n_7,\feature_index_reg_n_0_[4] ,\feature_index_reg_n_0_[3] ,\feature_index_reg_n_0_[2] ,\feature_index_reg_n_0_[1] ,\feature_index_reg_n_0_[0] }),
        .clk(clk),
        .data(w2),
        .en(w2_en));
  LUT3 #(
    .INIT(8'h08)) 
    rom_fc2_weights_i_1
       (.I0(operand_read),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\layer_reg_n_0_[1] ),
        .O(w2_en));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 rom_fc2_weights_i_2
       (.CI(rom_fc2_weights_i_3_n_0),
        .CO(rom_fc2_weights_i_2_n_3),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({rom_fc2_weights_i_2_n_6,rom_fc2_weights_i_2_n_7}),
        .S({\<const0> ,\<const0> ,\neuron_index_reg_n_0_[4] ,\neuron_index_reg_n_0_[3] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 rom_fc2_weights_i_3
       (.CI(\<const0> ),
        .CO({rom_fc2_weights_i_3_n_0,rom_fc2_weights_i_3_n_1,rom_fc2_weights_i_3_n_2,rom_fc2_weights_i_3_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\neuron_index_reg_n_0_[0] ,\<const0> }),
        .O({rom_fc2_weights_i_3_n_4,rom_fc2_weights_i_3_n_5,rom_fc2_weights_i_3_n_6,rom_fc2_weights_i_3_n_7}),
        .S({\neuron_index_reg_n_0_[2] ,\neuron_index_reg_n_0_[1] ,rom_fc2_weights_i_4_n_0,\feature_index_reg_n_0_[5] }));
  LUT2 #(
    .INIT(4'h6)) 
    rom_fc2_weights_i_4
       (.I0(\neuron_index_reg_n_0_[0] ),
        .I1(\feature_index_reg_n_0_[6] ),
        .O(rom_fc2_weights_i_4_n_0));
  (* ADDR_WIDTH = "5" *) 
  (* DEPTH = "32" *) 
  (* INIT_FILE = "464'b01110010011001010111001101110101011011000111010001110011001011110111000000110011010111110110110100110000001101000010111101101101011011000111000001011111011001100110111101101100011001000011000101011111011100000110000101110010011000010110110101100101011101000110010101110010010111110111001001101111011011010010111101101111011101010111010001110000011101010111010001011111011101110110010101101001011001110110100001110100011100110010111001101101011001010110110101101000" *) 
  (* WIDTH = "8" *) 
  parameter_rom_sync__parameterized7 rom_output_weights
       (.addr({\feature_index_reg_n_0_[4] ,\feature_index_reg_n_0_[3] ,\feature_index_reg_n_0_[2] ,\feature_index_reg_n_0_[1] ,\feature_index_reg_n_0_[0] }),
        .clk(clk),
        .data(w3),
        .en(w3_en));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT5 #(
    .INIT(32'h00020000)) 
    rom_output_weights_i_1
       (.I0(operand_read),
        .I1(\feature_index_reg_n_0_[5] ),
        .I2(\feature_index_reg_n_0_[6] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(\layer_reg_n_0_[1] ),
        .O(w3_en));
  FDRE \shift_hold_reg[0] 
       (.C(clk),
        .CE(bias_hold),
        .D(\<const1> ),
        .Q(\shift_hold_reg_n_0_[0] ),
        .R(rst));
  LUT6 #(
    .INIT(64'h22F2FFFF22F222F2)) 
    \weight_operand[0]_i_1 
       (.I0(w2[0]),
        .I1(\feature_operand[7]_i_2_n_0 ),
        .I2(w3[0]),
        .I3(\feature_operand[7]_i_3_n_0 ),
        .I4(rom_fc1_weights_i_5_n_0),
        .I5(w1[0]),
        .O(\weight_operand[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h22F2FFFF22F222F2)) 
    \weight_operand[1]_i_1 
       (.I0(w2[1]),
        .I1(\feature_operand[7]_i_2_n_0 ),
        .I2(w3[1]),
        .I3(\feature_operand[7]_i_3_n_0 ),
        .I4(rom_fc1_weights_i_5_n_0),
        .I5(w1[1]),
        .O(\weight_operand[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h22F2FFFF22F222F2)) 
    \weight_operand[2]_i_1 
       (.I0(w2[2]),
        .I1(\feature_operand[7]_i_2_n_0 ),
        .I2(w3[2]),
        .I3(\feature_operand[7]_i_3_n_0 ),
        .I4(rom_fc1_weights_i_5_n_0),
        .I5(w1[2]),
        .O(\weight_operand[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h22F2FFFF22F222F2)) 
    \weight_operand[3]_i_1 
       (.I0(w2[3]),
        .I1(\feature_operand[7]_i_2_n_0 ),
        .I2(w3[3]),
        .I3(\feature_operand[7]_i_3_n_0 ),
        .I4(rom_fc1_weights_i_5_n_0),
        .I5(w1[3]),
        .O(\weight_operand[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h22F2FFFF22F222F2)) 
    \weight_operand[4]_i_1 
       (.I0(w2[4]),
        .I1(\feature_operand[7]_i_2_n_0 ),
        .I2(w3[4]),
        .I3(\feature_operand[7]_i_3_n_0 ),
        .I4(rom_fc1_weights_i_5_n_0),
        .I5(w1[4]),
        .O(\weight_operand[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h22F2FFFF22F222F2)) 
    \weight_operand[5]_i_1 
       (.I0(w2[5]),
        .I1(\feature_operand[7]_i_2_n_0 ),
        .I2(w3[5]),
        .I3(\feature_operand[7]_i_3_n_0 ),
        .I4(rom_fc1_weights_i_5_n_0),
        .I5(w1[5]),
        .O(\weight_operand[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h22F2FFFF22F222F2)) 
    \weight_operand[6]_i_1 
       (.I0(w2[6]),
        .I1(\feature_operand[7]_i_2_n_0 ),
        .I2(w3[6]),
        .I3(\feature_operand[7]_i_3_n_0 ),
        .I4(rom_fc1_weights_i_5_n_0),
        .I5(w1[6]),
        .O(\weight_operand[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h22F2FFFF22F222F2)) 
    \weight_operand[7]_i_1 
       (.I0(w2[7]),
        .I1(\feature_operand[7]_i_2_n_0 ),
        .I2(w3[7]),
        .I3(\feature_operand[7]_i_3_n_0 ),
        .I4(rom_fc1_weights_i_5_n_0),
        .I5(w1[7]),
        .O(\weight_operand[7]_i_1_n_0 ));
  FDRE \weight_operand_reg[0] 
       (.C(clk),
        .CE(feature_operand),
        .D(\weight_operand[0]_i_1_n_0 ),
        .Q(weight_operand[0]),
        .R(rst));
  FDRE \weight_operand_reg[1] 
       (.C(clk),
        .CE(feature_operand),
        .D(\weight_operand[1]_i_1_n_0 ),
        .Q(weight_operand[1]),
        .R(rst));
  FDRE \weight_operand_reg[2] 
       (.C(clk),
        .CE(feature_operand),
        .D(\weight_operand[2]_i_1_n_0 ),
        .Q(weight_operand[2]),
        .R(rst));
  FDRE \weight_operand_reg[3] 
       (.C(clk),
        .CE(feature_operand),
        .D(\weight_operand[3]_i_1_n_0 ),
        .Q(weight_operand[3]),
        .R(rst));
  FDRE \weight_operand_reg[4] 
       (.C(clk),
        .CE(feature_operand),
        .D(\weight_operand[4]_i_1_n_0 ),
        .Q(weight_operand[4]),
        .R(rst));
  FDRE \weight_operand_reg[5] 
       (.C(clk),
        .CE(feature_operand),
        .D(\weight_operand[5]_i_1_n_0 ),
        .Q(weight_operand[5]),
        .R(rst));
  FDRE \weight_operand_reg[6] 
       (.C(clk),
        .CE(feature_operand),
        .D(\weight_operand[6]_i_1_n_0 ),
        .Q(weight_operand[6]),
        .R(rst));
  FDRE \weight_operand_reg[7] 
       (.C(clk),
        .CE(feature_operand),
        .D(\weight_operand[7]_i_1_n_0 ),
        .Q(weight_operand[7]),
        .R(rst));
endmodule

(* CW = "6" *) (* LAST_COUNT = "6'b111111" *) (* N_FEATURES = "64" *) 
module neuron_int8_serial
   (clk,
    rst,
    start,
    valid_in,
    feature_in,
    weight_in,
    bias_in,
    multiplier_in,
    shift_in,
    relu_in,
    .busy(\<const0> ),
    done,
    result,
    overflow);
  input clk;
  input rst;
  input start;
  input valid_in;
  input [7:0]feature_in;
  input [7:0]weight_in;
  input [31:0]bias_in;
  input [31:0]multiplier_in;
  input [5:0]shift_in;
  input relu_in;
  output done;
  output [7:0]result;
  output overflow;
  output \<const0> ;

  wire \<const0> ;
  wire \<const1> ;
  wire CEA2;
  wire GND_2;
  wire VCC_2;
  wire \acc[0]_i_12_n_0 ;
  wire \acc[0]_i_13_n_0 ;
  wire \acc[0]_i_14_n_0 ;
  wire \acc[0]_i_15_n_0 ;
  wire \acc[0]_i_16_n_0 ;
  wire \acc[0]_i_17_n_0 ;
  wire \acc[0]_i_18_n_0 ;
  wire \acc[0]_i_19_n_0 ;
  wire \acc[0]_i_20_n_0 ;
  wire \acc[0]_i_21_n_0 ;
  wire \acc[0]_i_22_n_0 ;
  wire \acc[0]_i_23_n_0 ;
  wire \acc[0]_i_24_n_0 ;
  wire \acc[0]_i_25_n_0 ;
  wire \acc[0]_i_2_n_0 ;
  wire \acc[0]_i_3_n_0 ;
  wire \acc[0]_i_4_n_0 ;
  wire \acc[0]_i_5_n_0 ;
  wire \acc[0]_i_6_n_0 ;
  wire \acc[0]_i_7_n_0 ;
  wire \acc[0]_i_8_n_0 ;
  wire \acc[0]_i_9_n_0 ;
  wire \acc[12]_i_2_n_0 ;
  wire \acc[12]_i_3_n_0 ;
  wire \acc[12]_i_4_n_0 ;
  wire \acc[12]_i_5_n_0 ;
  wire \acc[12]_i_6_n_0 ;
  wire \acc[12]_i_7_n_0 ;
  wire \acc[12]_i_8_n_0 ;
  wire \acc[12]_i_9_n_0 ;
  wire \acc[16]_i_2_n_0 ;
  wire \acc[16]_i_3_n_0 ;
  wire \acc[16]_i_4_n_0 ;
  wire \acc[16]_i_5_n_0 ;
  wire \acc[16]_i_6_n_0 ;
  wire \acc[16]_i_7_n_0 ;
  wire \acc[16]_i_8_n_0 ;
  wire \acc[16]_i_9_n_0 ;
  wire \acc[20]_i_2_n_0 ;
  wire \acc[20]_i_3_n_0 ;
  wire \acc[20]_i_4_n_0 ;
  wire \acc[20]_i_5_n_0 ;
  wire \acc[20]_i_6_n_0 ;
  wire \acc[20]_i_7_n_0 ;
  wire \acc[20]_i_8_n_0 ;
  wire \acc[20]_i_9_n_0 ;
  wire \acc[24]_i_2_n_0 ;
  wire \acc[24]_i_3_n_0 ;
  wire \acc[24]_i_4_n_0 ;
  wire \acc[24]_i_5_n_0 ;
  wire \acc[24]_i_6_n_0 ;
  wire \acc[24]_i_7_n_0 ;
  wire \acc[24]_i_8_n_0 ;
  wire \acc[24]_i_9_n_0 ;
  wire \acc[28]_i_2_n_0 ;
  wire \acc[28]_i_3_n_0 ;
  wire \acc[28]_i_4_n_0 ;
  wire \acc[28]_i_5_n_0 ;
  wire \acc[28]_i_6_n_0 ;
  wire \acc[28]_i_7_n_0 ;
  wire \acc[28]_i_8_n_0 ;
  wire \acc[4]_i_11_n_0 ;
  wire \acc[4]_i_12_n_0 ;
  wire \acc[4]_i_13_n_0 ;
  wire \acc[4]_i_14_n_0 ;
  wire \acc[4]_i_15_n_0 ;
  wire \acc[4]_i_16_n_0 ;
  wire \acc[4]_i_17_n_0 ;
  wire \acc[4]_i_18_n_0 ;
  wire \acc[4]_i_2_n_0 ;
  wire \acc[4]_i_3_n_0 ;
  wire \acc[4]_i_4_n_0 ;
  wire \acc[4]_i_5_n_0 ;
  wire \acc[4]_i_6_n_0 ;
  wire \acc[4]_i_7_n_0 ;
  wire \acc[4]_i_8_n_0 ;
  wire \acc[4]_i_9_n_0 ;
  wire \acc[8]_i_2_n_0 ;
  wire \acc[8]_i_3_n_0 ;
  wire \acc[8]_i_4_n_0 ;
  wire \acc[8]_i_5_n_0 ;
  wire \acc[8]_i_6_n_0 ;
  wire \acc[8]_i_7_n_0 ;
  wire \acc[8]_i_8_n_0 ;
  wire \acc[8]_i_9_n_0 ;
  wire [30:0]acc_reg;
  wire \acc_reg[0]_i_10_n_0 ;
  wire \acc_reg[0]_i_10_n_1 ;
  wire \acc_reg[0]_i_10_n_2 ;
  wire \acc_reg[0]_i_10_n_3 ;
  wire \acc_reg[0]_i_10_n_4 ;
  wire \acc_reg[0]_i_11_n_0 ;
  wire \acc_reg[0]_i_11_n_1 ;
  wire \acc_reg[0]_i_11_n_2 ;
  wire \acc_reg[0]_i_11_n_3 ;
  wire \acc_reg[0]_i_11_n_4 ;
  wire \acc_reg[0]_i_11_n_5 ;
  wire \acc_reg[0]_i_11_n_6 ;
  wire \acc_reg[0]_i_11_n_7 ;
  wire \acc_reg[0]_i_1_n_0 ;
  wire \acc_reg[0]_i_1_n_1 ;
  wire \acc_reg[0]_i_1_n_2 ;
  wire \acc_reg[0]_i_1_n_3 ;
  wire \acc_reg[0]_i_1_n_4 ;
  wire \acc_reg[0]_i_1_n_5 ;
  wire \acc_reg[0]_i_1_n_6 ;
  wire \acc_reg[0]_i_1_n_7 ;
  wire \acc_reg[12]_i_1_n_0 ;
  wire \acc_reg[12]_i_1_n_1 ;
  wire \acc_reg[12]_i_1_n_2 ;
  wire \acc_reg[12]_i_1_n_3 ;
  wire \acc_reg[12]_i_1_n_4 ;
  wire \acc_reg[12]_i_1_n_5 ;
  wire \acc_reg[12]_i_1_n_6 ;
  wire \acc_reg[12]_i_1_n_7 ;
  wire \acc_reg[16]_i_1_n_0 ;
  wire \acc_reg[16]_i_1_n_1 ;
  wire \acc_reg[16]_i_1_n_2 ;
  wire \acc_reg[16]_i_1_n_3 ;
  wire \acc_reg[16]_i_1_n_4 ;
  wire \acc_reg[16]_i_1_n_5 ;
  wire \acc_reg[16]_i_1_n_6 ;
  wire \acc_reg[16]_i_1_n_7 ;
  wire \acc_reg[20]_i_1_n_0 ;
  wire \acc_reg[20]_i_1_n_1 ;
  wire \acc_reg[20]_i_1_n_2 ;
  wire \acc_reg[20]_i_1_n_3 ;
  wire \acc_reg[20]_i_1_n_4 ;
  wire \acc_reg[20]_i_1_n_5 ;
  wire \acc_reg[20]_i_1_n_6 ;
  wire \acc_reg[20]_i_1_n_7 ;
  wire \acc_reg[24]_i_1_n_0 ;
  wire \acc_reg[24]_i_1_n_1 ;
  wire \acc_reg[24]_i_1_n_2 ;
  wire \acc_reg[24]_i_1_n_3 ;
  wire \acc_reg[24]_i_1_n_4 ;
  wire \acc_reg[24]_i_1_n_5 ;
  wire \acc_reg[24]_i_1_n_6 ;
  wire \acc_reg[24]_i_1_n_7 ;
  wire \acc_reg[28]_i_1_n_1 ;
  wire \acc_reg[28]_i_1_n_2 ;
  wire \acc_reg[28]_i_1_n_3 ;
  wire \acc_reg[28]_i_1_n_4 ;
  wire \acc_reg[28]_i_1_n_5 ;
  wire \acc_reg[28]_i_1_n_6 ;
  wire \acc_reg[28]_i_1_n_7 ;
  wire \acc_reg[4]_i_10_n_0 ;
  wire \acc_reg[4]_i_10_n_1 ;
  wire \acc_reg[4]_i_10_n_2 ;
  wire \acc_reg[4]_i_10_n_3 ;
  wire \acc_reg[4]_i_1_n_0 ;
  wire \acc_reg[4]_i_1_n_1 ;
  wire \acc_reg[4]_i_1_n_2 ;
  wire \acc_reg[4]_i_1_n_3 ;
  wire \acc_reg[4]_i_1_n_4 ;
  wire \acc_reg[4]_i_1_n_5 ;
  wire \acc_reg[4]_i_1_n_6 ;
  wire \acc_reg[4]_i_1_n_7 ;
  wire \acc_reg[8]_i_1_n_0 ;
  wire \acc_reg[8]_i_1_n_1 ;
  wire \acc_reg[8]_i_1_n_2 ;
  wire \acc_reg[8]_i_1_n_3 ;
  wire \acc_reg[8]_i_1_n_4 ;
  wire \acc_reg[8]_i_1_n_5 ;
  wire \acc_reg[8]_i_1_n_6 ;
  wire \acc_reg[8]_i_1_n_7 ;
  wire [31:0]bias_in;
  wire busy0;
  wire busy010_out;
  wire busy_i_1_n_0;
  wire busy_reg_n_0;
  wire [7:0]clipped;
  wire clipped1;
  wire clipped2;
  wire clk;
  wire [0:0]count;
  wire \count[5]_i_1_n_0 ;
  wire \count[5]_i_4_n_0 ;
  wire [5:0]count_reg;
  wire done;
  wire done_i_1_n_0;
  wire [7:0]feature_in;
  wire finish_pending_i_1_n_0;
  wire finish_pending_i_2_n_0;
  wire finish_pending_i_3_n_0;
  wire finish_pending_reg_n_0;
  wire increment10_in;
  wire increment2;
  wire [63:1]magnitude0;
  wire [31:0]multiplier_in;
  wire overflow;
  wire overflow_i_11_n_0;
  wire overflow_i_12_n_0;
  wire overflow_i_13_n_0;
  wire overflow_i_14_n_0;
  wire overflow_i_15_n_0;
  wire overflow_i_16_n_0;
  wire overflow_i_17_n_0;
  wire overflow_i_18_n_0;
  wire overflow_i_19_n_0;
  wire overflow_i_1_n_0;
  wire overflow_i_20_n_0;
  wire overflow_i_21_n_0;
  wire overflow_i_22_n_0;
  wire overflow_i_23_n_0;
  wire overflow_i_25_n_0;
  wire overflow_i_26_n_0;
  wire overflow_i_2_n_0;
  wire overflow_i_32_n_0;
  wire overflow_i_33_n_0;
  wire overflow_i_34_n_0;
  wire overflow_i_35_n_0;
  wire overflow_i_36_n_0;
  wire overflow_i_37_n_0;
  wire overflow_i_38_n_0;
  wire overflow_i_39_n_0;
  wire overflow_i_40_n_0;
  wire overflow_i_41_n_0;
  wire overflow_i_42_n_0;
  wire overflow_i_43_n_0;
  wire overflow_i_44_n_0;
  wire overflow_i_45_n_0;
  wire overflow_i_46_n_0;
  wire overflow_i_47_n_0;
  wire overflow_i_48_n_0;
  wire overflow_i_49_n_0;
  wire overflow_i_50_n_0;
  wire overflow_i_51_n_0;
  wire overflow_i_52_n_0;
  wire overflow_i_53_n_0;
  wire overflow_i_54_n_0;
  wire overflow_i_55_n_0;
  wire overflow_i_56_n_0;
  wire overflow_i_57_n_0;
  wire overflow_i_58_n_0;
  wire overflow_i_59_n_0;
  wire overflow_i_5_n_0;
  wire overflow_i_60_n_0;
  wire overflow_i_61_n_0;
  wire overflow_i_62_n_0;
  wire overflow_i_63_n_0;
  wire overflow_i_64_n_0;
  wire overflow_i_65_n_0;
  wire overflow_i_66_n_0;
  wire overflow_i_67_n_0;
  wire overflow_i_68_n_0;
  wire overflow_i_69_n_0;
  wire overflow_i_6_n_0;
  wire overflow_i_70_n_0;
  wire overflow_i_71_n_0;
  wire overflow_i_72_n_0;
  wire overflow_i_73_n_0;
  wire overflow_i_74_n_0;
  wire overflow_i_75_n_0;
  wire overflow_i_76_n_0;
  wire overflow_i_77_n_0;
  wire overflow_i_78_n_0;
  wire overflow_i_7_n_0;
  wire overflow_i_8_n_0;
  wire overflow_reg_i_10_n_3;
  wire overflow_reg_i_10_n_6;
  wire overflow_reg_i_10_n_7;
  wire overflow_reg_i_24_n_0;
  wire overflow_reg_i_24_n_1;
  wire overflow_reg_i_24_n_2;
  wire overflow_reg_i_24_n_3;
  wire overflow_reg_i_24_n_4;
  wire overflow_reg_i_24_n_5;
  wire overflow_reg_i_24_n_6;
  wire overflow_reg_i_24_n_7;
  wire overflow_reg_i_27_n_1;
  wire overflow_reg_i_27_n_3;
  wire overflow_reg_i_27_n_6;
  wire overflow_reg_i_27_n_7;
  wire overflow_reg_i_28_n_1;
  wire overflow_reg_i_28_n_3;
  wire overflow_reg_i_28_n_6;
  wire overflow_reg_i_28_n_7;
  wire overflow_reg_i_29_n_0;
  wire overflow_reg_i_29_n_1;
  wire overflow_reg_i_29_n_2;
  wire overflow_reg_i_29_n_3;
  wire overflow_reg_i_29_n_4;
  wire overflow_reg_i_29_n_5;
  wire overflow_reg_i_29_n_6;
  wire overflow_reg_i_29_n_7;
  wire overflow_reg_i_30_n_0;
  wire overflow_reg_i_30_n_1;
  wire overflow_reg_i_30_n_2;
  wire overflow_reg_i_30_n_3;
  wire overflow_reg_i_30_n_4;
  wire overflow_reg_i_30_n_5;
  wire overflow_reg_i_30_n_6;
  wire overflow_reg_i_30_n_7;
  wire overflow_reg_i_31_n_0;
  wire overflow_reg_i_31_n_1;
  wire overflow_reg_i_31_n_2;
  wire overflow_reg_i_31_n_3;
  wire overflow_reg_i_31_n_4;
  wire overflow_reg_i_31_n_5;
  wire overflow_reg_i_31_n_6;
  wire overflow_reg_i_31_n_7;
  wire overflow_reg_i_3_n_1;
  wire overflow_reg_i_3_n_2;
  wire overflow_reg_i_3_n_3;
  wire overflow_reg_i_4_n_1;
  wire overflow_reg_i_4_n_2;
  wire overflow_reg_i_4_n_3;
  wire overflow_reg_i_9_n_0;
  wire overflow_reg_i_9_n_1;
  wire overflow_reg_i_9_n_2;
  wire overflow_reg_i_9_n_3;
  wire [63:0]p_0_in;
  wire [5:0]p_0_in__0;
  wire [63:0]p_1_in;
  wire p_1_in__0;
  wire [15:15]product16;
  wire [14:0]product32;
  wire relu_in;
  wire relu_reg;
  wire relu_reg_i_1_n_0;
  wire [7:0]result;
  wire \result[3]_i_100_n_0 ;
  wire \result[3]_i_105_n_0 ;
  wire \result[3]_i_106_n_0 ;
  wire \result[3]_i_107_n_0 ;
  wire \result[3]_i_108_n_0 ;
  wire \result[3]_i_109_n_0 ;
  wire \result[3]_i_110_n_0 ;
  wire \result[3]_i_111_n_0 ;
  wire \result[3]_i_112_n_0 ;
  wire \result[3]_i_11_n_0 ;
  wire \result[3]_i_19_n_0 ;
  wire \result[3]_i_20_n_0 ;
  wire \result[3]_i_21_n_0 ;
  wire \result[3]_i_22_n_0 ;
  wire \result[3]_i_24_n_0 ;
  wire \result[3]_i_25_n_0 ;
  wire \result[3]_i_26_n_0 ;
  wire \result[3]_i_28_n_0 ;
  wire \result[3]_i_29_n_0 ;
  wire \result[3]_i_30_n_0 ;
  wire \result[3]_i_31_n_0 ;
  wire \result[3]_i_32_n_0 ;
  wire \result[3]_i_33_n_0 ;
  wire \result[3]_i_34_n_0 ;
  wire \result[3]_i_3_n_0 ;
  wire \result[3]_i_41_n_0 ;
  wire \result[3]_i_42_n_0 ;
  wire \result[3]_i_43_n_0 ;
  wire \result[3]_i_44_n_0 ;
  wire \result[3]_i_46_n_0 ;
  wire \result[3]_i_47_n_0 ;
  wire \result[3]_i_48_n_0 ;
  wire \result[3]_i_49_n_0 ;
  wire \result[3]_i_4_n_0 ;
  wire \result[3]_i_50_n_0 ;
  wire \result[3]_i_51_n_0 ;
  wire \result[3]_i_53_n_0 ;
  wire \result[3]_i_54_n_0 ;
  wire \result[3]_i_55_n_0 ;
  wire \result[3]_i_56_n_0 ;
  wire \result[3]_i_57_n_0 ;
  wire \result[3]_i_58_n_0 ;
  wire \result[3]_i_59_n_0 ;
  wire \result[3]_i_5_n_0 ;
  wire \result[3]_i_60_n_0 ;
  wire \result[3]_i_67_n_0 ;
  wire \result[3]_i_68_n_0 ;
  wire \result[3]_i_69_n_0 ;
  wire \result[3]_i_6_n_0 ;
  wire \result[3]_i_70_n_0 ;
  wire \result[3]_i_71_n_0 ;
  wire \result[3]_i_72_n_0 ;
  wire \result[3]_i_73_n_0 ;
  wire \result[3]_i_74_n_0 ;
  wire \result[3]_i_75_n_0 ;
  wire \result[3]_i_76_n_0 ;
  wire \result[3]_i_77_n_0 ;
  wire \result[3]_i_79_n_0 ;
  wire \result[3]_i_7_n_0 ;
  wire \result[3]_i_81_n_0 ;
  wire \result[3]_i_82_n_0 ;
  wire \result[3]_i_83_n_0 ;
  wire \result[3]_i_84_n_0 ;
  wire \result[3]_i_85_n_0 ;
  wire \result[3]_i_86_n_0 ;
  wire \result[3]_i_87_n_0 ;
  wire \result[3]_i_88_n_0 ;
  wire \result[3]_i_93_n_0 ;
  wire \result[3]_i_94_n_0 ;
  wire \result[3]_i_95_n_0 ;
  wire \result[3]_i_96_n_0 ;
  wire \result[3]_i_97_n_0 ;
  wire \result[3]_i_98_n_0 ;
  wire \result[3]_i_99_n_0 ;
  wire \result[4]_i_3_n_0 ;
  wire \result[4]_i_4_n_0 ;
  wire \result[4]_i_5_n_0 ;
  wire \result[4]_i_6_n_0 ;
  wire \result[4]_i_7_n_0 ;
  wire \result[7]_i_100_n_0 ;
  wire \result[7]_i_101_n_0 ;
  wire \result[7]_i_102_n_0 ;
  wire \result[7]_i_103_n_0 ;
  wire \result[7]_i_104_n_0 ;
  wire \result[7]_i_106_n_0 ;
  wire \result[7]_i_107_n_0 ;
  wire \result[7]_i_108_n_0 ;
  wire \result[7]_i_109_n_0 ;
  wire \result[7]_i_10_n_0 ;
  wire \result[7]_i_114_n_0 ;
  wire \result[7]_i_115_n_0 ;
  wire \result[7]_i_116_n_0 ;
  wire \result[7]_i_117_n_0 ;
  wire \result[7]_i_11_n_0 ;
  wire \result[7]_i_126_n_0 ;
  wire \result[7]_i_127_n_0 ;
  wire \result[7]_i_128_n_0 ;
  wire \result[7]_i_129_n_0 ;
  wire \result[7]_i_12_n_0 ;
  wire \result[7]_i_136_n_0 ;
  wire \result[7]_i_137_n_0 ;
  wire \result[7]_i_138_n_0 ;
  wire \result[7]_i_139_n_0 ;
  wire \result[7]_i_13_n_0 ;
  wire \result[7]_i_140_n_0 ;
  wire \result[7]_i_141_n_0 ;
  wire \result[7]_i_142_n_0 ;
  wire \result[7]_i_143_n_0 ;
  wire \result[7]_i_145_n_0 ;
  wire \result[7]_i_146_n_0 ;
  wire \result[7]_i_147_n_0 ;
  wire \result[7]_i_148_n_0 ;
  wire \result[7]_i_149_n_0 ;
  wire \result[7]_i_14_n_0 ;
  wire \result[7]_i_150_n_0 ;
  wire \result[7]_i_151_n_0 ;
  wire \result[7]_i_152_n_0 ;
  wire \result[7]_i_157_n_0 ;
  wire \result[7]_i_158_n_0 ;
  wire \result[7]_i_159_n_0 ;
  wire \result[7]_i_15_n_0 ;
  wire \result[7]_i_160_n_0 ;
  wire \result[7]_i_161_n_0 ;
  wire \result[7]_i_162_n_0 ;
  wire \result[7]_i_163_n_0 ;
  wire \result[7]_i_164_n_0 ;
  wire \result[7]_i_165_n_0 ;
  wire \result[7]_i_166_n_0 ;
  wire \result[7]_i_167_n_0 ;
  wire \result[7]_i_168_n_0 ;
  wire \result[7]_i_169_n_0 ;
  wire \result[7]_i_16_n_0 ;
  wire \result[7]_i_170_n_0 ;
  wire \result[7]_i_171_n_0 ;
  wire \result[7]_i_172_n_0 ;
  wire \result[7]_i_17_n_0 ;
  wire \result[7]_i_180_n_0 ;
  wire \result[7]_i_181_n_0 ;
  wire \result[7]_i_182_n_0 ;
  wire \result[7]_i_183_n_0 ;
  wire \result[7]_i_185_n_0 ;
  wire \result[7]_i_186_n_0 ;
  wire \result[7]_i_187_n_0 ;
  wire \result[7]_i_188_n_0 ;
  wire \result[7]_i_189_n_0 ;
  wire \result[7]_i_18_n_0 ;
  wire \result[7]_i_190_n_0 ;
  wire \result[7]_i_191_n_0 ;
  wire \result[7]_i_192_n_0 ;
  wire \result[7]_i_194_n_0 ;
  wire \result[7]_i_195_n_0 ;
  wire \result[7]_i_196_n_0 ;
  wire \result[7]_i_197_n_0 ;
  wire \result[7]_i_198_n_0 ;
  wire \result[7]_i_199_n_0 ;
  wire \result[7]_i_19_n_0 ;
  wire \result[7]_i_1_n_0 ;
  wire \result[7]_i_200_n_0 ;
  wire \result[7]_i_201_n_0 ;
  wire \result[7]_i_206_n_0 ;
  wire \result[7]_i_207_n_0 ;
  wire \result[7]_i_208_n_0 ;
  wire \result[7]_i_209_n_0 ;
  wire \result[7]_i_20_n_0 ;
  wire \result[7]_i_210_n_0 ;
  wire \result[7]_i_211_n_0 ;
  wire \result[7]_i_212_n_0 ;
  wire \result[7]_i_213_n_0 ;
  wire \result[7]_i_214_n_0 ;
  wire \result[7]_i_215_n_0 ;
  wire \result[7]_i_216_n_0 ;
  wire \result[7]_i_217_n_0 ;
  wire \result[7]_i_218_n_0 ;
  wire \result[7]_i_219_n_0 ;
  wire \result[7]_i_21_n_0 ;
  wire \result[7]_i_220_n_0 ;
  wire \result[7]_i_221_n_0 ;
  wire \result[7]_i_239_n_0 ;
  wire \result[7]_i_23_n_0 ;
  wire \result[7]_i_240_n_0 ;
  wire \result[7]_i_241_n_0 ;
  wire \result[7]_i_242_n_0 ;
  wire \result[7]_i_247_n_0 ;
  wire \result[7]_i_248_n_0 ;
  wire \result[7]_i_249_n_0 ;
  wire \result[7]_i_24_n_0 ;
  wire \result[7]_i_250_n_0 ;
  wire \result[7]_i_252_n_0 ;
  wire \result[7]_i_253_n_0 ;
  wire \result[7]_i_254_n_0 ;
  wire \result[7]_i_255_n_0 ;
  wire \result[7]_i_256_n_0 ;
  wire \result[7]_i_257_n_0 ;
  wire \result[7]_i_258_n_0 ;
  wire \result[7]_i_259_n_0 ;
  wire \result[7]_i_25_n_0 ;
  wire \result[7]_i_261_n_0 ;
  wire \result[7]_i_262_n_0 ;
  wire \result[7]_i_263_n_0 ;
  wire \result[7]_i_264_n_0 ;
  wire \result[7]_i_265_n_0 ;
  wire \result[7]_i_266_n_0 ;
  wire \result[7]_i_267_n_0 ;
  wire \result[7]_i_268_n_0 ;
  wire \result[7]_i_26_n_0 ;
  wire \result[7]_i_273_n_0 ;
  wire \result[7]_i_274_n_0 ;
  wire \result[7]_i_275_n_0 ;
  wire \result[7]_i_276_n_0 ;
  wire \result[7]_i_277_n_0 ;
  wire \result[7]_i_278_n_0 ;
  wire \result[7]_i_279_n_0 ;
  wire \result[7]_i_27_n_0 ;
  wire \result[7]_i_280_n_0 ;
  wire \result[7]_i_281_n_0 ;
  wire \result[7]_i_282_n_0 ;
  wire \result[7]_i_283_n_0 ;
  wire \result[7]_i_284_n_0 ;
  wire \result[7]_i_285_n_0 ;
  wire \result[7]_i_286_n_0 ;
  wire \result[7]_i_287_n_0 ;
  wire \result[7]_i_288_n_0 ;
  wire \result[7]_i_28_n_0 ;
  wire \result[7]_i_298_n_0 ;
  wire \result[7]_i_299_n_0 ;
  wire \result[7]_i_29_n_0 ;
  wire \result[7]_i_300_n_0 ;
  wire \result[7]_i_301_n_0 ;
  wire \result[7]_i_302_n_0 ;
  wire \result[7]_i_303_n_0 ;
  wire \result[7]_i_304_n_0 ;
  wire \result[7]_i_305_n_0 ;
  wire \result[7]_i_307_n_0 ;
  wire \result[7]_i_308_n_0 ;
  wire \result[7]_i_309_n_0 ;
  wire \result[7]_i_30_n_0 ;
  wire \result[7]_i_310_n_0 ;
  wire \result[7]_i_311_n_0 ;
  wire \result[7]_i_312_n_0 ;
  wire \result[7]_i_313_n_0 ;
  wire \result[7]_i_314_n_0 ;
  wire \result[7]_i_319_n_0 ;
  wire \result[7]_i_320_n_0 ;
  wire \result[7]_i_321_n_0 ;
  wire \result[7]_i_322_n_0 ;
  wire \result[7]_i_323_n_0 ;
  wire \result[7]_i_324_n_0 ;
  wire \result[7]_i_325_n_0 ;
  wire \result[7]_i_326_n_0 ;
  wire \result[7]_i_327_n_0 ;
  wire \result[7]_i_328_n_0 ;
  wire \result[7]_i_329_n_0 ;
  wire \result[7]_i_32_n_0 ;
  wire \result[7]_i_330_n_0 ;
  wire \result[7]_i_331_n_0 ;
  wire \result[7]_i_332_n_0 ;
  wire \result[7]_i_333_n_0 ;
  wire \result[7]_i_334_n_0 ;
  wire \result[7]_i_336_n_0 ;
  wire \result[7]_i_337_n_0 ;
  wire \result[7]_i_338_n_0 ;
  wire \result[7]_i_339_n_0 ;
  wire \result[7]_i_33_n_0 ;
  wire \result[7]_i_340_n_0 ;
  wire \result[7]_i_341_n_0 ;
  wire \result[7]_i_342_n_0 ;
  wire \result[7]_i_343_n_0 ;
  wire \result[7]_i_344_n_0 ;
  wire \result[7]_i_345_n_0 ;
  wire \result[7]_i_346_n_0 ;
  wire \result[7]_i_347_n_0 ;
  wire \result[7]_i_348_n_0 ;
  wire \result[7]_i_349_n_0 ;
  wire \result[7]_i_352_n_0 ;
  wire \result[7]_i_353_n_0 ;
  wire \result[7]_i_354_n_0 ;
  wire \result[7]_i_355_n_0 ;
  wire \result[7]_i_356_n_0 ;
  wire \result[7]_i_357_n_0 ;
  wire \result[7]_i_358_n_0 ;
  wire \result[7]_i_359_n_0 ;
  wire \result[7]_i_35_n_0 ;
  wire \result[7]_i_360_n_0 ;
  wire \result[7]_i_361_n_0 ;
  wire \result[7]_i_362_n_0 ;
  wire \result[7]_i_363_n_0 ;
  wire \result[7]_i_364_n_0 ;
  wire \result[7]_i_365_n_0 ;
  wire \result[7]_i_366_n_0 ;
  wire \result[7]_i_367_n_0 ;
  wire \result[7]_i_368_n_0 ;
  wire \result[7]_i_369_n_0 ;
  wire \result[7]_i_36_n_0 ;
  wire \result[7]_i_370_n_0 ;
  wire \result[7]_i_371_n_0 ;
  wire \result[7]_i_372_n_0 ;
  wire \result[7]_i_373_n_0 ;
  wire \result[7]_i_374_n_0 ;
  wire \result[7]_i_375_n_0 ;
  wire \result[7]_i_376_n_0 ;
  wire \result[7]_i_377_n_0 ;
  wire \result[7]_i_378_n_0 ;
  wire \result[7]_i_379_n_0 ;
  wire \result[7]_i_37_n_0 ;
  wire \result[7]_i_380_n_0 ;
  wire \result[7]_i_381_n_0 ;
  wire \result[7]_i_382_n_0 ;
  wire \result[7]_i_383_n_0 ;
  wire \result[7]_i_38_n_0 ;
  wire \result[7]_i_39_n_0 ;
  wire \result[7]_i_40_n_0 ;
  wire \result[7]_i_41_n_0 ;
  wire \result[7]_i_42_n_0 ;
  wire \result[7]_i_50_n_0 ;
  wire \result[7]_i_51_n_0 ;
  wire \result[7]_i_52_n_0 ;
  wire \result[7]_i_53_n_0 ;
  wire \result[7]_i_61_n_0 ;
  wire \result[7]_i_62_n_0 ;
  wire \result[7]_i_63_n_0 ;
  wire \result[7]_i_64_n_0 ;
  wire \result[7]_i_65_n_0 ;
  wire \result[7]_i_66_n_0 ;
  wire \result[7]_i_67_n_0 ;
  wire \result[7]_i_68_n_0 ;
  wire \result[7]_i_70_n_0 ;
  wire \result[7]_i_71_n_0 ;
  wire \result[7]_i_72_n_0 ;
  wire \result[7]_i_73_n_0 ;
  wire \result[7]_i_74_n_0 ;
  wire \result[7]_i_75_n_0 ;
  wire \result[7]_i_76_n_0 ;
  wire \result[7]_i_77_n_0 ;
  wire \result[7]_i_82_n_0 ;
  wire \result[7]_i_83_n_0 ;
  wire \result[7]_i_84_n_0 ;
  wire \result[7]_i_85_n_0 ;
  wire \result[7]_i_86_n_0 ;
  wire \result[7]_i_87_n_0 ;
  wire \result[7]_i_88_n_0 ;
  wire \result[7]_i_89_n_0 ;
  wire \result[7]_i_90_n_0 ;
  wire \result[7]_i_91_n_0 ;
  wire \result[7]_i_92_n_0 ;
  wire \result[7]_i_93_n_0 ;
  wire \result[7]_i_94_n_0 ;
  wire \result[7]_i_95_n_0 ;
  wire \result[7]_i_96_n_0 ;
  wire \result[7]_i_97_n_0 ;
  wire \result[7]_i_98_n_0 ;
  wire \result[7]_i_99_n_0 ;
  wire \result_reg[3]_i_10_n_2 ;
  wire \result_reg[3]_i_10_n_3 ;
  wire \result_reg[3]_i_12_n_1 ;
  wire \result_reg[3]_i_12_n_2 ;
  wire \result_reg[3]_i_12_n_3 ;
  wire \result_reg[3]_i_13_n_0 ;
  wire \result_reg[3]_i_13_n_1 ;
  wire \result_reg[3]_i_13_n_2 ;
  wire \result_reg[3]_i_13_n_3 ;
  wire \result_reg[3]_i_18_n_0 ;
  wire \result_reg[3]_i_18_n_1 ;
  wire \result_reg[3]_i_18_n_2 ;
  wire \result_reg[3]_i_18_n_3 ;
  wire \result_reg[3]_i_23_n_0 ;
  wire \result_reg[3]_i_23_n_1 ;
  wire \result_reg[3]_i_23_n_2 ;
  wire \result_reg[3]_i_23_n_3 ;
  wire \result_reg[3]_i_27_n_0 ;
  wire \result_reg[3]_i_27_n_1 ;
  wire \result_reg[3]_i_27_n_2 ;
  wire \result_reg[3]_i_27_n_3 ;
  wire \result_reg[3]_i_2_n_0 ;
  wire \result_reg[3]_i_2_n_1 ;
  wire \result_reg[3]_i_2_n_2 ;
  wire \result_reg[3]_i_2_n_3 ;
  wire \result_reg[3]_i_35_n_0 ;
  wire \result_reg[3]_i_35_n_1 ;
  wire \result_reg[3]_i_35_n_2 ;
  wire \result_reg[3]_i_35_n_3 ;
  wire \result_reg[3]_i_40_n_0 ;
  wire \result_reg[3]_i_40_n_1 ;
  wire \result_reg[3]_i_40_n_2 ;
  wire \result_reg[3]_i_40_n_3 ;
  wire \result_reg[3]_i_45_n_0 ;
  wire \result_reg[3]_i_45_n_1 ;
  wire \result_reg[3]_i_45_n_2 ;
  wire \result_reg[3]_i_45_n_3 ;
  wire \result_reg[3]_i_52_n_0 ;
  wire \result_reg[3]_i_52_n_1 ;
  wire \result_reg[3]_i_52_n_2 ;
  wire \result_reg[3]_i_52_n_3 ;
  wire \result_reg[3]_i_61_n_0 ;
  wire \result_reg[3]_i_61_n_1 ;
  wire \result_reg[3]_i_61_n_2 ;
  wire \result_reg[3]_i_61_n_3 ;
  wire \result_reg[3]_i_66_n_0 ;
  wire \result_reg[3]_i_66_n_1 ;
  wire \result_reg[3]_i_66_n_2 ;
  wire \result_reg[3]_i_66_n_3 ;
  wire \result_reg[3]_i_78_n_0 ;
  wire \result_reg[3]_i_78_n_1 ;
  wire \result_reg[3]_i_78_n_2 ;
  wire \result_reg[3]_i_78_n_3 ;
  wire \result_reg[3]_i_80_n_0 ;
  wire \result_reg[3]_i_80_n_1 ;
  wire \result_reg[3]_i_80_n_2 ;
  wire \result_reg[3]_i_80_n_3 ;
  wire \result_reg[3]_i_8_n_0 ;
  wire \result_reg[3]_i_8_n_1 ;
  wire \result_reg[3]_i_8_n_2 ;
  wire \result_reg[3]_i_8_n_3 ;
  wire \result_reg[3]_i_9_n_0 ;
  wire \result_reg[3]_i_9_n_1 ;
  wire \result_reg[3]_i_9_n_2 ;
  wire \result_reg[3]_i_9_n_3 ;
  wire \result_reg[4]_i_2_n_0 ;
  wire \result_reg[4]_i_2_n_1 ;
  wire \result_reg[4]_i_2_n_2 ;
  wire \result_reg[4]_i_2_n_3 ;
  wire \result_reg[7]_i_105_n_0 ;
  wire \result_reg[7]_i_105_n_1 ;
  wire \result_reg[7]_i_105_n_2 ;
  wire \result_reg[7]_i_105_n_3 ;
  wire \result_reg[7]_i_135_n_0 ;
  wire \result_reg[7]_i_135_n_1 ;
  wire \result_reg[7]_i_135_n_2 ;
  wire \result_reg[7]_i_135_n_3 ;
  wire \result_reg[7]_i_144_n_0 ;
  wire \result_reg[7]_i_144_n_1 ;
  wire \result_reg[7]_i_144_n_2 ;
  wire \result_reg[7]_i_144_n_3 ;
  wire \result_reg[7]_i_153_n_0 ;
  wire \result_reg[7]_i_153_n_1 ;
  wire \result_reg[7]_i_153_n_2 ;
  wire \result_reg[7]_i_153_n_3 ;
  wire \result_reg[7]_i_154_n_0 ;
  wire \result_reg[7]_i_154_n_1 ;
  wire \result_reg[7]_i_154_n_2 ;
  wire \result_reg[7]_i_154_n_3 ;
  wire \result_reg[7]_i_155_n_0 ;
  wire \result_reg[7]_i_155_n_1 ;
  wire \result_reg[7]_i_155_n_2 ;
  wire \result_reg[7]_i_155_n_3 ;
  wire \result_reg[7]_i_156_n_0 ;
  wire \result_reg[7]_i_156_n_1 ;
  wire \result_reg[7]_i_156_n_2 ;
  wire \result_reg[7]_i_156_n_3 ;
  wire \result_reg[7]_i_173_n_2 ;
  wire \result_reg[7]_i_173_n_3 ;
  wire \result_reg[7]_i_174_n_0 ;
  wire \result_reg[7]_i_174_n_1 ;
  wire \result_reg[7]_i_174_n_2 ;
  wire \result_reg[7]_i_174_n_3 ;
  wire \result_reg[7]_i_175_n_0 ;
  wire \result_reg[7]_i_175_n_1 ;
  wire \result_reg[7]_i_175_n_2 ;
  wire \result_reg[7]_i_175_n_3 ;
  wire \result_reg[7]_i_176_n_0 ;
  wire \result_reg[7]_i_176_n_1 ;
  wire \result_reg[7]_i_176_n_2 ;
  wire \result_reg[7]_i_176_n_3 ;
  wire \result_reg[7]_i_177_n_0 ;
  wire \result_reg[7]_i_177_n_1 ;
  wire \result_reg[7]_i_177_n_2 ;
  wire \result_reg[7]_i_177_n_3 ;
  wire \result_reg[7]_i_178_n_0 ;
  wire \result_reg[7]_i_178_n_1 ;
  wire \result_reg[7]_i_178_n_2 ;
  wire \result_reg[7]_i_178_n_3 ;
  wire \result_reg[7]_i_179_n_0 ;
  wire \result_reg[7]_i_179_n_1 ;
  wire \result_reg[7]_i_179_n_2 ;
  wire \result_reg[7]_i_179_n_3 ;
  wire \result_reg[7]_i_184_n_0 ;
  wire \result_reg[7]_i_184_n_1 ;
  wire \result_reg[7]_i_184_n_2 ;
  wire \result_reg[7]_i_184_n_3 ;
  wire \result_reg[7]_i_193_n_0 ;
  wire \result_reg[7]_i_193_n_1 ;
  wire \result_reg[7]_i_193_n_2 ;
  wire \result_reg[7]_i_193_n_3 ;
  wire \result_reg[7]_i_202_n_0 ;
  wire \result_reg[7]_i_202_n_1 ;
  wire \result_reg[7]_i_202_n_2 ;
  wire \result_reg[7]_i_202_n_3 ;
  wire \result_reg[7]_i_203_n_0 ;
  wire \result_reg[7]_i_203_n_1 ;
  wire \result_reg[7]_i_203_n_2 ;
  wire \result_reg[7]_i_203_n_3 ;
  wire \result_reg[7]_i_204_n_0 ;
  wire \result_reg[7]_i_204_n_1 ;
  wire \result_reg[7]_i_204_n_2 ;
  wire \result_reg[7]_i_204_n_3 ;
  wire \result_reg[7]_i_205_n_0 ;
  wire \result_reg[7]_i_205_n_1 ;
  wire \result_reg[7]_i_205_n_2 ;
  wire \result_reg[7]_i_205_n_3 ;
  wire \result_reg[7]_i_222_n_0 ;
  wire \result_reg[7]_i_222_n_1 ;
  wire \result_reg[7]_i_222_n_2 ;
  wire \result_reg[7]_i_222_n_3 ;
  wire \result_reg[7]_i_223_n_0 ;
  wire \result_reg[7]_i_223_n_1 ;
  wire \result_reg[7]_i_223_n_2 ;
  wire \result_reg[7]_i_223_n_3 ;
  wire \result_reg[7]_i_22_n_0 ;
  wire \result_reg[7]_i_22_n_1 ;
  wire \result_reg[7]_i_22_n_2 ;
  wire \result_reg[7]_i_22_n_3 ;
  wire \result_reg[7]_i_251_n_0 ;
  wire \result_reg[7]_i_251_n_1 ;
  wire \result_reg[7]_i_251_n_2 ;
  wire \result_reg[7]_i_251_n_3 ;
  wire \result_reg[7]_i_260_n_0 ;
  wire \result_reg[7]_i_260_n_1 ;
  wire \result_reg[7]_i_260_n_2 ;
  wire \result_reg[7]_i_260_n_3 ;
  wire \result_reg[7]_i_269_n_0 ;
  wire \result_reg[7]_i_269_n_1 ;
  wire \result_reg[7]_i_269_n_2 ;
  wire \result_reg[7]_i_269_n_3 ;
  wire \result_reg[7]_i_270_n_0 ;
  wire \result_reg[7]_i_270_n_1 ;
  wire \result_reg[7]_i_270_n_2 ;
  wire \result_reg[7]_i_270_n_3 ;
  wire \result_reg[7]_i_271_n_0 ;
  wire \result_reg[7]_i_271_n_1 ;
  wire \result_reg[7]_i_271_n_2 ;
  wire \result_reg[7]_i_271_n_3 ;
  wire \result_reg[7]_i_272_n_0 ;
  wire \result_reg[7]_i_272_n_1 ;
  wire \result_reg[7]_i_272_n_2 ;
  wire \result_reg[7]_i_272_n_3 ;
  wire \result_reg[7]_i_297_n_0 ;
  wire \result_reg[7]_i_297_n_1 ;
  wire \result_reg[7]_i_297_n_2 ;
  wire \result_reg[7]_i_297_n_3 ;
  wire \result_reg[7]_i_306_n_0 ;
  wire \result_reg[7]_i_306_n_1 ;
  wire \result_reg[7]_i_306_n_2 ;
  wire \result_reg[7]_i_306_n_3 ;
  wire \result_reg[7]_i_315_n_0 ;
  wire \result_reg[7]_i_315_n_1 ;
  wire \result_reg[7]_i_315_n_2 ;
  wire \result_reg[7]_i_315_n_3 ;
  wire \result_reg[7]_i_316_n_0 ;
  wire \result_reg[7]_i_316_n_1 ;
  wire \result_reg[7]_i_316_n_2 ;
  wire \result_reg[7]_i_316_n_3 ;
  wire \result_reg[7]_i_317_n_0 ;
  wire \result_reg[7]_i_317_n_1 ;
  wire \result_reg[7]_i_317_n_2 ;
  wire \result_reg[7]_i_317_n_3 ;
  wire \result_reg[7]_i_318_n_0 ;
  wire \result_reg[7]_i_318_n_1 ;
  wire \result_reg[7]_i_318_n_2 ;
  wire \result_reg[7]_i_318_n_3 ;
  wire \result_reg[7]_i_31_n_0 ;
  wire \result_reg[7]_i_31_n_1 ;
  wire \result_reg[7]_i_31_n_2 ;
  wire \result_reg[7]_i_31_n_3 ;
  wire \result_reg[7]_i_335_n_0 ;
  wire \result_reg[7]_i_335_n_1 ;
  wire \result_reg[7]_i_335_n_2 ;
  wire \result_reg[7]_i_335_n_3 ;
  wire \result_reg[7]_i_34_n_0 ;
  wire \result_reg[7]_i_34_n_1 ;
  wire \result_reg[7]_i_34_n_2 ;
  wire \result_reg[7]_i_34_n_3 ;
  wire \result_reg[7]_i_350_n_0 ;
  wire \result_reg[7]_i_350_n_1 ;
  wire \result_reg[7]_i_350_n_2 ;
  wire \result_reg[7]_i_350_n_3 ;
  wire \result_reg[7]_i_351_n_0 ;
  wire \result_reg[7]_i_351_n_1 ;
  wire \result_reg[7]_i_351_n_2 ;
  wire \result_reg[7]_i_351_n_3 ;
  wire \result_reg[7]_i_43_n_2 ;
  wire \result_reg[7]_i_43_n_3 ;
  wire \result_reg[7]_i_44_n_1 ;
  wire \result_reg[7]_i_44_n_2 ;
  wire \result_reg[7]_i_44_n_3 ;
  wire \result_reg[7]_i_45_n_0 ;
  wire \result_reg[7]_i_45_n_1 ;
  wire \result_reg[7]_i_45_n_2 ;
  wire \result_reg[7]_i_45_n_3 ;
  wire \result_reg[7]_i_46_n_0 ;
  wire \result_reg[7]_i_46_n_1 ;
  wire \result_reg[7]_i_46_n_2 ;
  wire \result_reg[7]_i_46_n_3 ;
  wire \result_reg[7]_i_47_n_0 ;
  wire \result_reg[7]_i_47_n_1 ;
  wire \result_reg[7]_i_47_n_2 ;
  wire \result_reg[7]_i_47_n_3 ;
  wire \result_reg[7]_i_48_n_0 ;
  wire \result_reg[7]_i_48_n_1 ;
  wire \result_reg[7]_i_48_n_2 ;
  wire \result_reg[7]_i_48_n_3 ;
  wire \result_reg[7]_i_49_n_0 ;
  wire \result_reg[7]_i_49_n_1 ;
  wire \result_reg[7]_i_49_n_2 ;
  wire \result_reg[7]_i_49_n_3 ;
  wire \result_reg[7]_i_4_n_1 ;
  wire \result_reg[7]_i_4_n_2 ;
  wire \result_reg[7]_i_4_n_3 ;
  wire \result_reg[7]_i_54_n_0 ;
  wire \result_reg[7]_i_54_n_1 ;
  wire \result_reg[7]_i_54_n_2 ;
  wire \result_reg[7]_i_54_n_3 ;
  wire \result_reg[7]_i_55_n_0 ;
  wire \result_reg[7]_i_55_n_1 ;
  wire \result_reg[7]_i_55_n_2 ;
  wire \result_reg[7]_i_55_n_3 ;
  wire \result_reg[7]_i_56_n_0 ;
  wire \result_reg[7]_i_56_n_1 ;
  wire \result_reg[7]_i_56_n_2 ;
  wire \result_reg[7]_i_56_n_3 ;
  wire \result_reg[7]_i_57_n_0 ;
  wire \result_reg[7]_i_57_n_1 ;
  wire \result_reg[7]_i_57_n_2 ;
  wire \result_reg[7]_i_57_n_3 ;
  wire \result_reg[7]_i_58_n_0 ;
  wire \result_reg[7]_i_58_n_1 ;
  wire \result_reg[7]_i_58_n_2 ;
  wire \result_reg[7]_i_58_n_3 ;
  wire \result_reg[7]_i_59_n_0 ;
  wire \result_reg[7]_i_59_n_1 ;
  wire \result_reg[7]_i_59_n_2 ;
  wire \result_reg[7]_i_59_n_3 ;
  wire \result_reg[7]_i_5_n_0 ;
  wire \result_reg[7]_i_5_n_1 ;
  wire \result_reg[7]_i_5_n_2 ;
  wire \result_reg[7]_i_5_n_3 ;
  wire \result_reg[7]_i_60_n_0 ;
  wire \result_reg[7]_i_60_n_1 ;
  wire \result_reg[7]_i_60_n_2 ;
  wire \result_reg[7]_i_60_n_3 ;
  wire \result_reg[7]_i_69_n_0 ;
  wire \result_reg[7]_i_69_n_1 ;
  wire \result_reg[7]_i_69_n_2 ;
  wire \result_reg[7]_i_69_n_3 ;
  wire \result_reg[7]_i_6_n_1 ;
  wire \result_reg[7]_i_6_n_2 ;
  wire \result_reg[7]_i_6_n_3 ;
  wire \result_reg[7]_i_78_n_0 ;
  wire \result_reg[7]_i_78_n_1 ;
  wire \result_reg[7]_i_78_n_2 ;
  wire \result_reg[7]_i_78_n_3 ;
  wire \result_reg[7]_i_79_n_0 ;
  wire \result_reg[7]_i_79_n_1 ;
  wire \result_reg[7]_i_79_n_2 ;
  wire \result_reg[7]_i_79_n_3 ;
  wire \result_reg[7]_i_7_n_0 ;
  wire \result_reg[7]_i_7_n_1 ;
  wire \result_reg[7]_i_7_n_2 ;
  wire \result_reg[7]_i_7_n_3 ;
  wire \result_reg[7]_i_80_n_0 ;
  wire \result_reg[7]_i_80_n_1 ;
  wire \result_reg[7]_i_80_n_2 ;
  wire \result_reg[7]_i_80_n_3 ;
  wire \result_reg[7]_i_81_n_0 ;
  wire \result_reg[7]_i_81_n_1 ;
  wire \result_reg[7]_i_81_n_2 ;
  wire \result_reg[7]_i_81_n_3 ;
  wire \result_reg[7]_i_9_n_0 ;
  wire \result_reg[7]_i_9_n_1 ;
  wire \result_reg[7]_i_9_n_2 ;
  wire \result_reg[7]_i_9_n_3 ;
  wire [63:1]rounded0;
  wire [63:0]rounded_mag;
  wire rst;
  wire [5:0]shift_in;
  wire [0:0]shift_reg;
  wire \shift_reg[0]_i_1_n_0 ;
  wire start;
  wire [31:31]sum;
  wire [30:0]sum__0;
  wire valid_in;
  wire [7:0]weight_in;
  wire wide_product__0_n_100;
  wire wide_product__0_n_101;
  wire wide_product__0_n_102;
  wire wide_product__0_n_103;
  wire wide_product__0_n_104;
  wire wide_product__0_n_105;
  wire wide_product__0_n_76;
  wire wide_product__0_n_77;
  wire wide_product__0_n_78;
  wire wide_product__0_n_79;
  wire wide_product__0_n_80;
  wire wide_product__0_n_81;
  wire wide_product__0_n_82;
  wire wide_product__0_n_83;
  wire wide_product__0_n_84;
  wire wide_product__0_n_85;
  wire wide_product__0_n_86;
  wire wide_product__0_n_87;
  wire wide_product__0_n_88;
  wire wide_product__0_n_89;
  wire wide_product__0_n_90;
  wire wide_product__0_n_91;
  wire wide_product__0_n_92;
  wire wide_product__0_n_93;
  wire wide_product__0_n_94;
  wire wide_product__0_n_95;
  wire wide_product__0_n_96;
  wire wide_product__0_n_97;
  wire wide_product__0_n_98;
  wire wide_product__0_n_99;
  wire wide_product__1_i_10_n_0;
  wire wide_product__1_i_11_n_0;
  wire wide_product__1_i_12_n_0;
  wire wide_product__1_i_13_n_0;
  wire wide_product__1_i_14_n_0;
  wire wide_product__1_i_15_n_0;
  wire wide_product__1_i_16_n_0;
  wire wide_product__1_i_17_n_0;
  wire wide_product__1_i_18_n_0;
  wire wide_product__1_i_18_n_1;
  wire wide_product__1_i_18_n_2;
  wire wide_product__1_i_18_n_3;
  wire wide_product__1_i_19_n_0;
  wire wide_product__1_i_19_n_1;
  wire wide_product__1_i_19_n_2;
  wire wide_product__1_i_19_n_3;
  wire wide_product__1_i_1_n_0;
  wire wide_product__1_i_20_n_0;
  wire wide_product__1_i_20_n_1;
  wire wide_product__1_i_20_n_2;
  wire wide_product__1_i_20_n_3;
  wire wide_product__1_i_21_n_0;
  wire wide_product__1_i_21_n_1;
  wire wide_product__1_i_21_n_2;
  wire wide_product__1_i_21_n_3;
  wire wide_product__1_i_22_n_0;
  wire wide_product__1_i_23_n_0;
  wire wide_product__1_i_24_n_0;
  wire wide_product__1_i_25_n_0;
  wire wide_product__1_i_26_n_0;
  wire wide_product__1_i_27_n_0;
  wire wide_product__1_i_28_n_0;
  wire wide_product__1_i_29_n_0;
  wire wide_product__1_i_2_n_0;
  wire wide_product__1_i_30_n_0;
  wire wide_product__1_i_31_n_0;
  wire wide_product__1_i_32_n_0;
  wire wide_product__1_i_33_n_0;
  wire wide_product__1_i_34_n_0;
  wire wide_product__1_i_35_n_0;
  wire wide_product__1_i_36_n_0;
  wire wide_product__1_i_37_n_0;
  wire wide_product__1_i_3_n_0;
  wire wide_product__1_i_4_n_0;
  wire wide_product__1_i_5_n_0;
  wire wide_product__1_i_6_n_0;
  wire wide_product__1_i_7_n_0;
  wire wide_product__1_i_8_n_0;
  wire wide_product__1_i_9_n_0;
  wire wide_product__1_n_106;
  wire wide_product__1_n_107;
  wire wide_product__1_n_108;
  wire wide_product__1_n_109;
  wire wide_product__1_n_110;
  wire wide_product__1_n_111;
  wire wide_product__1_n_112;
  wire wide_product__1_n_113;
  wire wide_product__1_n_114;
  wire wide_product__1_n_115;
  wire wide_product__1_n_116;
  wire wide_product__1_n_117;
  wire wide_product__1_n_118;
  wire wide_product__1_n_119;
  wire wide_product__1_n_120;
  wire wide_product__1_n_121;
  wire wide_product__1_n_122;
  wire wide_product__1_n_123;
  wire wide_product__1_n_124;
  wire wide_product__1_n_125;
  wire wide_product__1_n_126;
  wire wide_product__1_n_127;
  wire wide_product__1_n_128;
  wire wide_product__1_n_129;
  wire wide_product__1_n_130;
  wire wide_product__1_n_131;
  wire wide_product__1_n_132;
  wire wide_product__1_n_133;
  wire wide_product__1_n_134;
  wire wide_product__1_n_135;
  wire wide_product__1_n_136;
  wire wide_product__1_n_137;
  wire wide_product__1_n_138;
  wire wide_product__1_n_139;
  wire wide_product__1_n_140;
  wire wide_product__1_n_141;
  wire wide_product__1_n_142;
  wire wide_product__1_n_143;
  wire wide_product__1_n_144;
  wire wide_product__1_n_145;
  wire wide_product__1_n_146;
  wire wide_product__1_n_147;
  wire wide_product__1_n_148;
  wire wide_product__1_n_149;
  wire wide_product__1_n_150;
  wire wide_product__1_n_151;
  wire wide_product__1_n_152;
  wire wide_product__1_n_153;
  wire wide_product__1_n_24;
  wire wide_product__1_n_25;
  wire wide_product__1_n_26;
  wire wide_product__1_n_27;
  wire wide_product__1_n_28;
  wire wide_product__1_n_29;
  wire wide_product__1_n_30;
  wire wide_product__1_n_31;
  wire wide_product__1_n_32;
  wire wide_product__1_n_33;
  wire wide_product__1_n_34;
  wire wide_product__1_n_35;
  wire wide_product__1_n_36;
  wire wide_product__1_n_37;
  wire wide_product__1_n_38;
  wire wide_product__1_n_39;
  wire wide_product__1_n_40;
  wire wide_product__1_n_41;
  wire wide_product__1_n_42;
  wire wide_product__1_n_43;
  wire wide_product__1_n_44;
  wire wide_product__1_n_45;
  wire wide_product__1_n_46;
  wire wide_product__1_n_47;
  wire wide_product__1_n_48;
  wire wide_product__1_n_49;
  wire wide_product__1_n_50;
  wire wide_product__1_n_51;
  wire wide_product__1_n_52;
  wire wide_product__1_n_53;
  wire wide_product__1_n_58;
  wire wide_product__1_n_59;
  wire wide_product__1_n_60;
  wire wide_product__1_n_61;
  wire wide_product__1_n_62;
  wire wide_product__1_n_63;
  wire wide_product__1_n_64;
  wire wide_product__1_n_65;
  wire wide_product__1_n_66;
  wire wide_product__1_n_67;
  wire wide_product__1_n_68;
  wire wide_product__1_n_69;
  wire wide_product__1_n_70;
  wire wide_product__1_n_71;
  wire wide_product__1_n_72;
  wire wide_product__1_n_73;
  wire wide_product__1_n_74;
  wire wide_product__1_n_75;
  wire wide_product__1_n_76;
  wire wide_product__1_n_77;
  wire wide_product__1_n_78;
  wire wide_product__1_n_79;
  wire wide_product__1_n_80;
  wire wide_product__1_n_81;
  wire wide_product__1_n_82;
  wire wide_product__1_n_83;
  wire wide_product__1_n_84;
  wire wide_product__1_n_85;
  wire wide_product__1_n_86;
  wire wide_product__1_n_87;
  wire wide_product__1_n_88;
  wire [63:16]wide_product__3;
  wire wide_product_i_10_n_0;
  wire wide_product_i_11_n_0;
  wire wide_product_i_12_n_0;
  wire wide_product_i_13_n_0;
  wire wide_product_i_14_n_0;
  wire wide_product_i_15_n_0;
  wire wide_product_i_16_n_0;
  wire wide_product_i_17_n_0;
  wire wide_product_i_18_n_0;
  wire wide_product_i_18_n_1;
  wire wide_product_i_18_n_2;
  wire wide_product_i_18_n_3;
  wire wide_product_i_19_n_0;
  wire wide_product_i_19_n_1;
  wire wide_product_i_19_n_2;
  wire wide_product_i_19_n_3;
  wire wide_product_i_20_n_0;
  wire wide_product_i_20_n_1;
  wire wide_product_i_20_n_2;
  wire wide_product_i_20_n_3;
  wire wide_product_i_21_n_0;
  wire wide_product_i_22_n_0;
  wire wide_product_i_23_n_0;
  wire wide_product_i_24_n_0;
  wire wide_product_i_25_n_0;
  wire wide_product_i_26_n_0;
  wire wide_product_i_27_n_0;
  wire wide_product_i_28_n_0;
  wire wide_product_i_29_n_0;
  wire wide_product_i_30_n_0;
  wire wide_product_i_31_n_0;
  wire wide_product_i_32_n_0;
  wire wide_product_i_33_n_0;
  wire wide_product_i_3_n_0;
  wire wide_product_i_4_n_0;
  wire wide_product_i_5_n_0;
  wire wide_product_i_6_n_0;
  wire wide_product_i_7_n_0;
  wire wide_product_i_8_n_0;
  wire wide_product_i_9_n_0;
  wire wide_product_n_100;
  wire wide_product_n_101;
  wire wide_product_n_102;
  wire wide_product_n_103;
  wire wide_product_n_104;
  wire wide_product_n_105;
  wire wide_product_n_106;
  wire wide_product_n_107;
  wire wide_product_n_108;
  wire wide_product_n_109;
  wire wide_product_n_110;
  wire wide_product_n_111;
  wire wide_product_n_112;
  wire wide_product_n_113;
  wire wide_product_n_114;
  wire wide_product_n_115;
  wire wide_product_n_116;
  wire wide_product_n_117;
  wire wide_product_n_118;
  wire wide_product_n_119;
  wire wide_product_n_120;
  wire wide_product_n_121;
  wire wide_product_n_122;
  wire wide_product_n_123;
  wire wide_product_n_124;
  wire wide_product_n_125;
  wire wide_product_n_126;
  wire wide_product_n_127;
  wire wide_product_n_128;
  wire wide_product_n_129;
  wire wide_product_n_130;
  wire wide_product_n_131;
  wire wide_product_n_132;
  wire wide_product_n_133;
  wire wide_product_n_134;
  wire wide_product_n_135;
  wire wide_product_n_136;
  wire wide_product_n_137;
  wire wide_product_n_138;
  wire wide_product_n_139;
  wire wide_product_n_140;
  wire wide_product_n_141;
  wire wide_product_n_142;
  wire wide_product_n_143;
  wire wide_product_n_144;
  wire wide_product_n_145;
  wire wide_product_n_146;
  wire wide_product_n_147;
  wire wide_product_n_148;
  wire wide_product_n_149;
  wire wide_product_n_150;
  wire wide_product_n_151;
  wire wide_product_n_152;
  wire wide_product_n_153;
  wire wide_product_n_58;
  wire wide_product_n_59;
  wire wide_product_n_60;
  wire wide_product_n_61;
  wire wide_product_n_62;
  wire wide_product_n_63;
  wire wide_product_n_64;
  wire wide_product_n_65;
  wire wide_product_n_66;
  wire wide_product_n_67;
  wire wide_product_n_68;
  wire wide_product_n_69;
  wire wide_product_n_70;
  wire wide_product_n_71;
  wire wide_product_n_72;
  wire wide_product_n_73;
  wire wide_product_n_74;
  wire wide_product_n_75;
  wire wide_product_n_76;
  wire wide_product_n_77;
  wire wide_product_n_78;
  wire wide_product_n_79;
  wire wide_product_n_80;
  wire wide_product_n_81;
  wire wide_product_n_82;
  wire wide_product_n_83;
  wire wide_product_n_84;
  wire wide_product_n_85;
  wire wide_product_n_86;
  wire wide_product_n_87;
  wire wide_product_n_88;
  wire wide_product_n_89;
  wire wide_product_n_90;
  wire wide_product_n_91;
  wire wide_product_n_92;
  wire wide_product_n_93;
  wire wide_product_n_94;
  wire wide_product_n_95;
  wire wide_product_n_96;
  wire wide_product_n_97;
  wire wide_product_n_98;
  wire wide_product_n_99;
  wire [3:0]NLW_overflow_reg_i_27_CO_UNCONNECTED;
  wire [3:0]NLW_overflow_reg_i_28_CO_UNCONNECTED;

  GND GND
       (.G(\<const0> ));
  GND GND_1
       (.G(GND_2));
  VCC VCC
       (.P(\<const1> ));
  VCC VCC_1
       (.P(VCC_2));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    \acc[0]_i_12 
       (.I0(feature_in[3]),
        .I1(weight_in[0]),
        .I2(weight_in[2]),
        .I3(feature_in[1]),
        .I4(weight_in[1]),
        .I5(feature_in[2]),
        .O(\acc[0]_i_12_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \acc[0]_i_13 
       (.I0(feature_in[1]),
        .I1(weight_in[1]),
        .I2(weight_in[2]),
        .I3(feature_in[0]),
        .O(\acc[0]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \acc[0]_i_14 
       (.I0(feature_in[0]),
        .I1(weight_in[1]),
        .O(\acc[0]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \acc[0]_i_15 
       (.I0(\acc[0]_i_12_n_0 ),
        .I1(feature_in[1]),
        .I2(weight_in[1]),
        .I3(feature_in[0]),
        .I4(weight_in[2]),
        .O(\acc[0]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    \acc[0]_i_16 
       (.I0(feature_in[0]),
        .I1(weight_in[2]),
        .I2(weight_in[1]),
        .I3(feature_in[1]),
        .I4(weight_in[0]),
        .I5(feature_in[2]),
        .O(\acc[0]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \acc[0]_i_17 
       (.I0(weight_in[0]),
        .I1(feature_in[1]),
        .I2(weight_in[1]),
        .I3(feature_in[0]),
        .O(\acc[0]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \acc[0]_i_18 
       (.I0(feature_in[0]),
        .I1(weight_in[0]),
        .O(\acc[0]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    \acc[0]_i_19 
       (.I0(feature_in[3]),
        .I1(weight_in[3]),
        .I2(weight_in[5]),
        .I3(feature_in[1]),
        .I4(weight_in[4]),
        .I5(feature_in[2]),
        .O(\acc[0]_i_19_n_0 ));
  LUT4 #(
    .INIT(16'h283C)) 
    \acc[0]_i_2 
       (.I0(busy_reg_n_0),
        .I1(\acc_reg[0]_i_10_n_4 ),
        .I2(\acc_reg[0]_i_11_n_7 ),
        .I3(start),
        .O(\acc[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \acc[0]_i_20 
       (.I0(feature_in[1]),
        .I1(weight_in[4]),
        .I2(weight_in[5]),
        .I3(feature_in[0]),
        .O(\acc[0]_i_20_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \acc[0]_i_21 
       (.I0(feature_in[0]),
        .I1(weight_in[4]),
        .O(\acc[0]_i_21_n_0 ));
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \acc[0]_i_22 
       (.I0(\acc[0]_i_19_n_0 ),
        .I1(feature_in[1]),
        .I2(weight_in[4]),
        .I3(feature_in[0]),
        .I4(weight_in[5]),
        .O(\acc[0]_i_22_n_0 ));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    \acc[0]_i_23 
       (.I0(feature_in[0]),
        .I1(weight_in[5]),
        .I2(weight_in[4]),
        .I3(feature_in[1]),
        .I4(weight_in[3]),
        .I5(feature_in[2]),
        .O(\acc[0]_i_23_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \acc[0]_i_24 
       (.I0(weight_in[3]),
        .I1(feature_in[1]),
        .I2(weight_in[4]),
        .I3(feature_in[0]),
        .O(\acc[0]_i_24_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \acc[0]_i_25 
       (.I0(feature_in[0]),
        .I1(weight_in[3]),
        .O(\acc[0]_i_25_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \acc[0]_i_3 
       (.I0(start),
        .I1(busy_reg_n_0),
        .I2(product32[2]),
        .O(\acc[0]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \acc[0]_i_4 
       (.I0(start),
        .I1(busy_reg_n_0),
        .I2(product32[1]),
        .O(\acc[0]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \acc[0]_i_5 
       (.I0(start),
        .I1(busy_reg_n_0),
        .I2(product32[0]),
        .O(\acc[0]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h96969696FF960096)) 
    \acc[0]_i_6 
       (.I0(\acc_reg[0]_i_11_n_7 ),
        .I1(\acc_reg[0]_i_10_n_4 ),
        .I2(acc_reg[3]),
        .I3(start),
        .I4(bias_in[3]),
        .I5(busy_reg_n_0),
        .O(\acc[0]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[0]_i_7 
       (.I0(product32[2]),
        .I1(acc_reg[2]),
        .I2(start),
        .I3(bias_in[2]),
        .I4(busy_reg_n_0),
        .O(\acc[0]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[0]_i_8 
       (.I0(product32[1]),
        .I1(acc_reg[1]),
        .I2(start),
        .I3(bias_in[1]),
        .I4(busy_reg_n_0),
        .O(\acc[0]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[0]_i_9 
       (.I0(product32[0]),
        .I1(acc_reg[0]),
        .I2(start),
        .I3(bias_in[0]),
        .I4(busy_reg_n_0),
        .O(\acc[0]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h8C)) 
    \acc[12]_i_2 
       (.I0(busy_reg_n_0),
        .I1(product16),
        .I2(start),
        .O(\acc[12]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \acc[12]_i_3 
       (.I0(start),
        .I1(busy_reg_n_0),
        .I2(product32[14]),
        .O(\acc[12]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \acc[12]_i_4 
       (.I0(start),
        .I1(busy_reg_n_0),
        .I2(product32[13]),
        .O(\acc[12]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \acc[12]_i_5 
       (.I0(start),
        .I1(busy_reg_n_0),
        .I2(product32[12]),
        .O(\acc[12]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[12]_i_6 
       (.I0(product16),
        .I1(acc_reg[15]),
        .I2(start),
        .I3(bias_in[31]),
        .I4(busy_reg_n_0),
        .O(\acc[12]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[12]_i_7 
       (.I0(product32[14]),
        .I1(acc_reg[14]),
        .I2(start),
        .I3(bias_in[14]),
        .I4(busy_reg_n_0),
        .O(\acc[12]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[12]_i_8 
       (.I0(product32[13]),
        .I1(acc_reg[13]),
        .I2(start),
        .I3(bias_in[13]),
        .I4(busy_reg_n_0),
        .O(\acc[12]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[12]_i_9 
       (.I0(product32[12]),
        .I1(acc_reg[12]),
        .I2(start),
        .I3(bias_in[12]),
        .I4(busy_reg_n_0),
        .O(\acc[12]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h8C)) 
    \acc[16]_i_2 
       (.I0(busy_reg_n_0),
        .I1(product16),
        .I2(start),
        .O(\acc[16]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h8C)) 
    \acc[16]_i_3 
       (.I0(busy_reg_n_0),
        .I1(product16),
        .I2(start),
        .O(\acc[16]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h8C)) 
    \acc[16]_i_4 
       (.I0(busy_reg_n_0),
        .I1(product16),
        .I2(start),
        .O(\acc[16]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h8C)) 
    \acc[16]_i_5 
       (.I0(busy_reg_n_0),
        .I1(product16),
        .I2(start),
        .O(\acc[16]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[16]_i_6 
       (.I0(product16),
        .I1(acc_reg[19]),
        .I2(start),
        .I3(bias_in[31]),
        .I4(busy_reg_n_0),
        .O(\acc[16]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[16]_i_7 
       (.I0(product16),
        .I1(acc_reg[18]),
        .I2(start),
        .I3(bias_in[31]),
        .I4(busy_reg_n_0),
        .O(\acc[16]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[16]_i_8 
       (.I0(product16),
        .I1(acc_reg[17]),
        .I2(start),
        .I3(bias_in[31]),
        .I4(busy_reg_n_0),
        .O(\acc[16]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[16]_i_9 
       (.I0(product16),
        .I1(acc_reg[16]),
        .I2(start),
        .I3(bias_in[31]),
        .I4(busy_reg_n_0),
        .O(\acc[16]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h8C)) 
    \acc[20]_i_2 
       (.I0(busy_reg_n_0),
        .I1(product16),
        .I2(start),
        .O(\acc[20]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h8C)) 
    \acc[20]_i_3 
       (.I0(busy_reg_n_0),
        .I1(product16),
        .I2(start),
        .O(\acc[20]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h8C)) 
    \acc[20]_i_4 
       (.I0(busy_reg_n_0),
        .I1(product16),
        .I2(start),
        .O(\acc[20]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h8C)) 
    \acc[20]_i_5 
       (.I0(busy_reg_n_0),
        .I1(product16),
        .I2(start),
        .O(\acc[20]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[20]_i_6 
       (.I0(product16),
        .I1(acc_reg[23]),
        .I2(start),
        .I3(bias_in[31]),
        .I4(busy_reg_n_0),
        .O(\acc[20]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[20]_i_7 
       (.I0(product16),
        .I1(acc_reg[22]),
        .I2(start),
        .I3(bias_in[31]),
        .I4(busy_reg_n_0),
        .O(\acc[20]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[20]_i_8 
       (.I0(product16),
        .I1(acc_reg[21]),
        .I2(start),
        .I3(bias_in[31]),
        .I4(busy_reg_n_0),
        .O(\acc[20]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[20]_i_9 
       (.I0(product16),
        .I1(acc_reg[20]),
        .I2(start),
        .I3(bias_in[31]),
        .I4(busy_reg_n_0),
        .O(\acc[20]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h8C)) 
    \acc[24]_i_2 
       (.I0(busy_reg_n_0),
        .I1(product16),
        .I2(start),
        .O(\acc[24]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h8C)) 
    \acc[24]_i_3 
       (.I0(busy_reg_n_0),
        .I1(product16),
        .I2(start),
        .O(\acc[24]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h8C)) 
    \acc[24]_i_4 
       (.I0(busy_reg_n_0),
        .I1(product16),
        .I2(start),
        .O(\acc[24]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'h8C)) 
    \acc[24]_i_5 
       (.I0(busy_reg_n_0),
        .I1(product16),
        .I2(start),
        .O(\acc[24]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[24]_i_6 
       (.I0(product16),
        .I1(acc_reg[27]),
        .I2(start),
        .I3(bias_in[31]),
        .I4(busy_reg_n_0),
        .O(\acc[24]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[24]_i_7 
       (.I0(product16),
        .I1(acc_reg[26]),
        .I2(start),
        .I3(bias_in[31]),
        .I4(busy_reg_n_0),
        .O(\acc[24]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[24]_i_8 
       (.I0(product16),
        .I1(acc_reg[25]),
        .I2(start),
        .I3(bias_in[31]),
        .I4(busy_reg_n_0),
        .O(\acc[24]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[24]_i_9 
       (.I0(product16),
        .I1(acc_reg[24]),
        .I2(start),
        .I3(bias_in[31]),
        .I4(busy_reg_n_0),
        .O(\acc[24]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'h8C)) 
    \acc[28]_i_2 
       (.I0(busy_reg_n_0),
        .I1(product16),
        .I2(start),
        .O(\acc[28]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h8C)) 
    \acc[28]_i_3 
       (.I0(busy_reg_n_0),
        .I1(product16),
        .I2(start),
        .O(\acc[28]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h8C)) 
    \acc[28]_i_4 
       (.I0(busy_reg_n_0),
        .I1(product16),
        .I2(start),
        .O(\acc[28]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h40EFEF40)) 
    \acc[28]_i_5 
       (.I0(busy_reg_n_0),
        .I1(bias_in[31]),
        .I2(start),
        .I3(p_1_in__0),
        .I4(product16),
        .O(\acc[28]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[28]_i_6 
       (.I0(product16),
        .I1(acc_reg[30]),
        .I2(start),
        .I3(bias_in[31]),
        .I4(busy_reg_n_0),
        .O(\acc[28]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[28]_i_7 
       (.I0(product16),
        .I1(acc_reg[29]),
        .I2(start),
        .I3(bias_in[31]),
        .I4(busy_reg_n_0),
        .O(\acc[28]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[28]_i_8 
       (.I0(product16),
        .I1(acc_reg[28]),
        .I2(start),
        .I3(bias_in[31]),
        .I4(busy_reg_n_0),
        .O(\acc[28]_i_8_n_0 ));
  LUT3 #(
    .INIT(8'hE8)) 
    \acc[4]_i_11 
       (.I0(overflow_reg_i_31_n_5),
        .I1(\acc_reg[0]_i_11_n_4 ),
        .I2(overflow_reg_i_30_n_7),
        .O(\acc[4]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \acc[4]_i_12 
       (.I0(overflow_reg_i_31_n_6),
        .I1(\acc_reg[0]_i_11_n_5 ),
        .O(\acc[4]_i_12_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \acc[4]_i_13 
       (.I0(overflow_reg_i_31_n_7),
        .I1(\acc_reg[0]_i_11_n_6 ),
        .O(\acc[4]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \acc[4]_i_14 
       (.I0(\acc_reg[0]_i_10_n_4 ),
        .I1(\acc_reg[0]_i_11_n_7 ),
        .O(\acc[4]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    \acc[4]_i_15 
       (.I0(overflow_reg_i_30_n_7),
        .I1(\acc_reg[0]_i_11_n_4 ),
        .I2(overflow_reg_i_31_n_5),
        .I3(overflow_reg_i_31_n_4),
        .I4(overflow_reg_i_29_n_7),
        .I5(overflow_reg_i_30_n_6),
        .O(\acc[4]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'h78878778)) 
    \acc[4]_i_16 
       (.I0(\acc_reg[0]_i_11_n_5 ),
        .I1(overflow_reg_i_31_n_6),
        .I2(overflow_reg_i_31_n_5),
        .I3(\acc_reg[0]_i_11_n_4 ),
        .I4(overflow_reg_i_30_n_7),
        .O(\acc[4]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \acc[4]_i_17 
       (.I0(\acc_reg[0]_i_11_n_6 ),
        .I1(overflow_reg_i_31_n_7),
        .I2(overflow_reg_i_31_n_6),
        .I3(\acc_reg[0]_i_11_n_5 ),
        .O(\acc[4]_i_17_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \acc[4]_i_18 
       (.I0(\acc_reg[0]_i_11_n_7 ),
        .I1(\acc_reg[0]_i_10_n_4 ),
        .I2(overflow_reg_i_31_n_7),
        .I3(\acc_reg[0]_i_11_n_6 ),
        .O(\acc[4]_i_18_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \acc[4]_i_2 
       (.I0(start),
        .I1(busy_reg_n_0),
        .I2(product32[7]),
        .O(\acc[4]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \acc[4]_i_3 
       (.I0(start),
        .I1(busy_reg_n_0),
        .I2(product32[6]),
        .O(\acc[4]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \acc[4]_i_4 
       (.I0(start),
        .I1(busy_reg_n_0),
        .I2(product32[5]),
        .O(\acc[4]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \acc[4]_i_5 
       (.I0(start),
        .I1(busy_reg_n_0),
        .I2(product32[4]),
        .O(\acc[4]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[4]_i_6 
       (.I0(product32[7]),
        .I1(acc_reg[7]),
        .I2(start),
        .I3(bias_in[7]),
        .I4(busy_reg_n_0),
        .O(\acc[4]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[4]_i_7 
       (.I0(product32[6]),
        .I1(acc_reg[6]),
        .I2(start),
        .I3(bias_in[6]),
        .I4(busy_reg_n_0),
        .O(\acc[4]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[4]_i_8 
       (.I0(product32[5]),
        .I1(acc_reg[5]),
        .I2(start),
        .I3(bias_in[5]),
        .I4(busy_reg_n_0),
        .O(\acc[4]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[4]_i_9 
       (.I0(product32[4]),
        .I1(acc_reg[4]),
        .I2(start),
        .I3(bias_in[4]),
        .I4(busy_reg_n_0),
        .O(\acc[4]_i_9_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \acc[8]_i_2 
       (.I0(start),
        .I1(busy_reg_n_0),
        .I2(product32[11]),
        .O(\acc[8]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \acc[8]_i_3 
       (.I0(start),
        .I1(busy_reg_n_0),
        .I2(product32[10]),
        .O(\acc[8]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \acc[8]_i_4 
       (.I0(start),
        .I1(busy_reg_n_0),
        .I2(product32[9]),
        .O(\acc[8]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hD0)) 
    \acc[8]_i_5 
       (.I0(start),
        .I1(busy_reg_n_0),
        .I2(product32[8]),
        .O(\acc[8]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[8]_i_6 
       (.I0(product32[11]),
        .I1(acc_reg[11]),
        .I2(start),
        .I3(bias_in[11]),
        .I4(busy_reg_n_0),
        .O(\acc[8]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[8]_i_7 
       (.I0(product32[10]),
        .I1(acc_reg[10]),
        .I2(start),
        .I3(bias_in[10]),
        .I4(busy_reg_n_0),
        .O(\acc[8]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[8]_i_8 
       (.I0(product32[9]),
        .I1(acc_reg[9]),
        .I2(start),
        .I3(bias_in[9]),
        .I4(busy_reg_n_0),
        .O(\acc[8]_i_8_n_0 ));
  LUT5 #(
    .INIT(32'h6666F606)) 
    \acc[8]_i_9 
       (.I0(product32[8]),
        .I1(acc_reg[8]),
        .I2(start),
        .I3(bias_in[8]),
        .I4(busy_reg_n_0),
        .O(\acc[8]_i_9_n_0 ));
  FDRE \acc_reg[0] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[0]_i_1_n_7 ),
        .Q(acc_reg[0]),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[0]_i_1 
       (.CI(\<const0> ),
        .CO({\acc_reg[0]_i_1_n_0 ,\acc_reg[0]_i_1_n_1 ,\acc_reg[0]_i_1_n_2 ,\acc_reg[0]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\acc[0]_i_2_n_0 ,\acc[0]_i_3_n_0 ,\acc[0]_i_4_n_0 ,\acc[0]_i_5_n_0 }),
        .O({\acc_reg[0]_i_1_n_4 ,\acc_reg[0]_i_1_n_5 ,\acc_reg[0]_i_1_n_6 ,\acc_reg[0]_i_1_n_7 }),
        .S({\acc[0]_i_6_n_0 ,\acc[0]_i_7_n_0 ,\acc[0]_i_8_n_0 ,\acc[0]_i_9_n_0 }));
  CARRY4 \acc_reg[0]_i_10 
       (.CI(\<const0> ),
        .CO({\acc_reg[0]_i_10_n_0 ,\acc_reg[0]_i_10_n_1 ,\acc_reg[0]_i_10_n_2 ,\acc_reg[0]_i_10_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\acc[0]_i_12_n_0 ,\acc[0]_i_13_n_0 ,\acc[0]_i_14_n_0 ,\<const0> }),
        .O({\acc_reg[0]_i_10_n_4 ,product32[2:0]}),
        .S({\acc[0]_i_15_n_0 ,\acc[0]_i_16_n_0 ,\acc[0]_i_17_n_0 ,\acc[0]_i_18_n_0 }));
  CARRY4 \acc_reg[0]_i_11 
       (.CI(\<const0> ),
        .CO({\acc_reg[0]_i_11_n_0 ,\acc_reg[0]_i_11_n_1 ,\acc_reg[0]_i_11_n_2 ,\acc_reg[0]_i_11_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\acc[0]_i_19_n_0 ,\acc[0]_i_20_n_0 ,\acc[0]_i_21_n_0 ,\<const0> }),
        .O({\acc_reg[0]_i_11_n_4 ,\acc_reg[0]_i_11_n_5 ,\acc_reg[0]_i_11_n_6 ,\acc_reg[0]_i_11_n_7 }),
        .S({\acc[0]_i_22_n_0 ,\acc[0]_i_23_n_0 ,\acc[0]_i_24_n_0 ,\acc[0]_i_25_n_0 }));
  FDRE \acc_reg[10] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[8]_i_1_n_5 ),
        .Q(acc_reg[10]),
        .R(rst));
  FDRE \acc_reg[11] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[8]_i_1_n_4 ),
        .Q(acc_reg[11]),
        .R(rst));
  FDRE \acc_reg[12] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[12]_i_1_n_7 ),
        .Q(acc_reg[12]),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[12]_i_1 
       (.CI(\acc_reg[8]_i_1_n_0 ),
        .CO({\acc_reg[12]_i_1_n_0 ,\acc_reg[12]_i_1_n_1 ,\acc_reg[12]_i_1_n_2 ,\acc_reg[12]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\acc[12]_i_2_n_0 ,\acc[12]_i_3_n_0 ,\acc[12]_i_4_n_0 ,\acc[12]_i_5_n_0 }),
        .O({\acc_reg[12]_i_1_n_4 ,\acc_reg[12]_i_1_n_5 ,\acc_reg[12]_i_1_n_6 ,\acc_reg[12]_i_1_n_7 }),
        .S({\acc[12]_i_6_n_0 ,\acc[12]_i_7_n_0 ,\acc[12]_i_8_n_0 ,\acc[12]_i_9_n_0 }));
  FDRE \acc_reg[13] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[12]_i_1_n_6 ),
        .Q(acc_reg[13]),
        .R(rst));
  FDRE \acc_reg[14] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[12]_i_1_n_5 ),
        .Q(acc_reg[14]),
        .R(rst));
  FDRE \acc_reg[15] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[12]_i_1_n_4 ),
        .Q(acc_reg[15]),
        .R(rst));
  FDRE \acc_reg[16] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[16]_i_1_n_7 ),
        .Q(acc_reg[16]),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[16]_i_1 
       (.CI(\acc_reg[12]_i_1_n_0 ),
        .CO({\acc_reg[16]_i_1_n_0 ,\acc_reg[16]_i_1_n_1 ,\acc_reg[16]_i_1_n_2 ,\acc_reg[16]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\acc[16]_i_2_n_0 ,\acc[16]_i_3_n_0 ,\acc[16]_i_4_n_0 ,\acc[16]_i_5_n_0 }),
        .O({\acc_reg[16]_i_1_n_4 ,\acc_reg[16]_i_1_n_5 ,\acc_reg[16]_i_1_n_6 ,\acc_reg[16]_i_1_n_7 }),
        .S({\acc[16]_i_6_n_0 ,\acc[16]_i_7_n_0 ,\acc[16]_i_8_n_0 ,\acc[16]_i_9_n_0 }));
  FDRE \acc_reg[17] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[16]_i_1_n_6 ),
        .Q(acc_reg[17]),
        .R(rst));
  FDRE \acc_reg[18] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[16]_i_1_n_5 ),
        .Q(acc_reg[18]),
        .R(rst));
  FDRE \acc_reg[19] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[16]_i_1_n_4 ),
        .Q(acc_reg[19]),
        .R(rst));
  FDRE \acc_reg[1] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[0]_i_1_n_6 ),
        .Q(acc_reg[1]),
        .R(rst));
  FDRE \acc_reg[20] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[20]_i_1_n_7 ),
        .Q(acc_reg[20]),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[20]_i_1 
       (.CI(\acc_reg[16]_i_1_n_0 ),
        .CO({\acc_reg[20]_i_1_n_0 ,\acc_reg[20]_i_1_n_1 ,\acc_reg[20]_i_1_n_2 ,\acc_reg[20]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\acc[20]_i_2_n_0 ,\acc[20]_i_3_n_0 ,\acc[20]_i_4_n_0 ,\acc[20]_i_5_n_0 }),
        .O({\acc_reg[20]_i_1_n_4 ,\acc_reg[20]_i_1_n_5 ,\acc_reg[20]_i_1_n_6 ,\acc_reg[20]_i_1_n_7 }),
        .S({\acc[20]_i_6_n_0 ,\acc[20]_i_7_n_0 ,\acc[20]_i_8_n_0 ,\acc[20]_i_9_n_0 }));
  FDRE \acc_reg[21] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[20]_i_1_n_6 ),
        .Q(acc_reg[21]),
        .R(rst));
  FDRE \acc_reg[22] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[20]_i_1_n_5 ),
        .Q(acc_reg[22]),
        .R(rst));
  FDRE \acc_reg[23] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[20]_i_1_n_4 ),
        .Q(acc_reg[23]),
        .R(rst));
  FDRE \acc_reg[24] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[24]_i_1_n_7 ),
        .Q(acc_reg[24]),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[24]_i_1 
       (.CI(\acc_reg[20]_i_1_n_0 ),
        .CO({\acc_reg[24]_i_1_n_0 ,\acc_reg[24]_i_1_n_1 ,\acc_reg[24]_i_1_n_2 ,\acc_reg[24]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\acc[24]_i_2_n_0 ,\acc[24]_i_3_n_0 ,\acc[24]_i_4_n_0 ,\acc[24]_i_5_n_0 }),
        .O({\acc_reg[24]_i_1_n_4 ,\acc_reg[24]_i_1_n_5 ,\acc_reg[24]_i_1_n_6 ,\acc_reg[24]_i_1_n_7 }),
        .S({\acc[24]_i_6_n_0 ,\acc[24]_i_7_n_0 ,\acc[24]_i_8_n_0 ,\acc[24]_i_9_n_0 }));
  FDRE \acc_reg[25] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[24]_i_1_n_6 ),
        .Q(acc_reg[25]),
        .R(rst));
  FDRE \acc_reg[26] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[24]_i_1_n_5 ),
        .Q(acc_reg[26]),
        .R(rst));
  FDRE \acc_reg[27] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[24]_i_1_n_4 ),
        .Q(acc_reg[27]),
        .R(rst));
  FDRE \acc_reg[28] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[28]_i_1_n_7 ),
        .Q(acc_reg[28]),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[28]_i_1 
       (.CI(\acc_reg[24]_i_1_n_0 ),
        .CO({\acc_reg[28]_i_1_n_1 ,\acc_reg[28]_i_1_n_2 ,\acc_reg[28]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\acc[28]_i_2_n_0 ,\acc[28]_i_3_n_0 ,\acc[28]_i_4_n_0 }),
        .O({\acc_reg[28]_i_1_n_4 ,\acc_reg[28]_i_1_n_5 ,\acc_reg[28]_i_1_n_6 ,\acc_reg[28]_i_1_n_7 }),
        .S({\acc[28]_i_5_n_0 ,\acc[28]_i_6_n_0 ,\acc[28]_i_7_n_0 ,\acc[28]_i_8_n_0 }));
  FDRE \acc_reg[29] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[28]_i_1_n_6 ),
        .Q(acc_reg[29]),
        .R(rst));
  FDRE \acc_reg[2] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[0]_i_1_n_5 ),
        .Q(acc_reg[2]),
        .R(rst));
  FDRE \acc_reg[30] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[28]_i_1_n_5 ),
        .Q(acc_reg[30]),
        .R(rst));
  FDRE \acc_reg[31] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[28]_i_1_n_4 ),
        .Q(p_1_in__0),
        .R(rst));
  FDRE \acc_reg[3] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[0]_i_1_n_4 ),
        .Q(acc_reg[3]),
        .R(rst));
  FDRE \acc_reg[4] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[4]_i_1_n_7 ),
        .Q(acc_reg[4]),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[4]_i_1 
       (.CI(\acc_reg[0]_i_1_n_0 ),
        .CO({\acc_reg[4]_i_1_n_0 ,\acc_reg[4]_i_1_n_1 ,\acc_reg[4]_i_1_n_2 ,\acc_reg[4]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\acc[4]_i_2_n_0 ,\acc[4]_i_3_n_0 ,\acc[4]_i_4_n_0 ,\acc[4]_i_5_n_0 }),
        .O({\acc_reg[4]_i_1_n_4 ,\acc_reg[4]_i_1_n_5 ,\acc_reg[4]_i_1_n_6 ,\acc_reg[4]_i_1_n_7 }),
        .S({\acc[4]_i_6_n_0 ,\acc[4]_i_7_n_0 ,\acc[4]_i_8_n_0 ,\acc[4]_i_9_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[4]_i_10 
       (.CI(\<const0> ),
        .CO({\acc_reg[4]_i_10_n_0 ,\acc_reg[4]_i_10_n_1 ,\acc_reg[4]_i_10_n_2 ,\acc_reg[4]_i_10_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\acc[4]_i_11_n_0 ,\acc[4]_i_12_n_0 ,\acc[4]_i_13_n_0 ,\acc[4]_i_14_n_0 }),
        .O(product32[7:4]),
        .S({\acc[4]_i_15_n_0 ,\acc[4]_i_16_n_0 ,\acc[4]_i_17_n_0 ,\acc[4]_i_18_n_0 }));
  FDRE \acc_reg[5] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[4]_i_1_n_6 ),
        .Q(acc_reg[5]),
        .R(rst));
  FDRE \acc_reg[6] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[4]_i_1_n_5 ),
        .Q(acc_reg[6]),
        .R(rst));
  FDRE \acc_reg[7] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[4]_i_1_n_4 ),
        .Q(acc_reg[7]),
        .R(rst));
  FDRE \acc_reg[8] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[8]_i_1_n_7 ),
        .Q(acc_reg[8]),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[8]_i_1 
       (.CI(\acc_reg[4]_i_1_n_0 ),
        .CO({\acc_reg[8]_i_1_n_0 ,\acc_reg[8]_i_1_n_1 ,\acc_reg[8]_i_1_n_2 ,\acc_reg[8]_i_1_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\acc[8]_i_2_n_0 ,\acc[8]_i_3_n_0 ,\acc[8]_i_4_n_0 ,\acc[8]_i_5_n_0 }),
        .O({\acc_reg[8]_i_1_n_4 ,\acc_reg[8]_i_1_n_5 ,\acc_reg[8]_i_1_n_6 ,\acc_reg[8]_i_1_n_7 }),
        .S({\acc[8]_i_6_n_0 ,\acc[8]_i_7_n_0 ,\acc[8]_i_8_n_0 ,\acc[8]_i_9_n_0 }));
  FDRE \acc_reg[9] 
       (.C(clk),
        .CE(CEA2),
        .D(\acc_reg[8]_i_1_n_6 ),
        .Q(acc_reg[9]),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT3 #(
    .INIT(8'h74)) 
    busy_i_1
       (.I0(finish_pending_reg_n_0),
        .I1(busy_reg_n_0),
        .I2(start),
        .O(busy_i_1_n_0));
  FDRE busy_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(busy_i_1_n_0),
        .Q(busy_reg_n_0),
        .R(rst));
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(count_reg[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \count[1]_i_1 
       (.I0(count_reg[1]),
        .I1(count_reg[0]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \count[2]_i_1 
       (.I0(count_reg[2]),
        .I1(count_reg[1]),
        .I2(count_reg[0]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \count[3]_i_1 
       (.I0(count_reg[3]),
        .I1(count_reg[1]),
        .I2(count_reg[0]),
        .I3(count_reg[2]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \count[4]_i_1 
       (.I0(count_reg[4]),
        .I1(count_reg[2]),
        .I2(count_reg[0]),
        .I3(count_reg[1]),
        .I4(count_reg[3]),
        .O(p_0_in__0[4]));
  LUT3 #(
    .INIT(8'hF4)) 
    \count[5]_i_1 
       (.I0(busy_reg_n_0),
        .I1(start),
        .I2(rst),
        .O(\count[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h51000000)) 
    \count[5]_i_2 
       (.I0(finish_pending_reg_n_0),
        .I1(count_reg[5]),
        .I2(\count[5]_i_4_n_0 ),
        .I3(valid_in),
        .I4(busy_reg_n_0),
        .O(count));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \count[5]_i_3 
       (.I0(count_reg[5]),
        .I1(count_reg[3]),
        .I2(count_reg[1]),
        .I3(count_reg[0]),
        .I4(count_reg[2]),
        .I5(count_reg[4]),
        .O(p_0_in__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \count[5]_i_4 
       (.I0(count_reg[3]),
        .I1(count_reg[0]),
        .I2(count_reg[1]),
        .I3(count_reg[2]),
        .I4(count_reg[4]),
        .O(\count[5]_i_4_n_0 ));
  FDRE \count_reg[0] 
       (.C(clk),
        .CE(count),
        .D(p_0_in__0[0]),
        .Q(count_reg[0]),
        .R(\count[5]_i_1_n_0 ));
  FDRE \count_reg[1] 
       (.C(clk),
        .CE(count),
        .D(p_0_in__0[1]),
        .Q(count_reg[1]),
        .R(\count[5]_i_1_n_0 ));
  FDRE \count_reg[2] 
       (.C(clk),
        .CE(count),
        .D(p_0_in__0[2]),
        .Q(count_reg[2]),
        .R(\count[5]_i_1_n_0 ));
  FDRE \count_reg[3] 
       (.C(clk),
        .CE(count),
        .D(p_0_in__0[3]),
        .Q(count_reg[3]),
        .R(\count[5]_i_1_n_0 ));
  FDRE \count_reg[4] 
       (.C(clk),
        .CE(count),
        .D(p_0_in__0[4]),
        .Q(count_reg[4]),
        .R(\count[5]_i_1_n_0 ));
  FDRE \count_reg[5] 
       (.C(clk),
        .CE(count),
        .D(p_0_in__0[5]),
        .Q(count_reg[5]),
        .R(\count[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT3 #(
    .INIT(8'h20)) 
    done_i_1
       (.I0(finish_pending_reg_n_0),
        .I1(rst),
        .I2(busy_reg_n_0),
        .O(done_i_1_n_0));
  FDRE done_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(done_i_1_n_0),
        .Q(done),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'h00470000)) 
    finish_pending_i_1
       (.I0(finish_pending_reg_n_0),
        .I1(busy_reg_n_0),
        .I2(start),
        .I3(rst),
        .I4(finish_pending_i_2_n_0),
        .O(finish_pending_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'hFFFF8000)) 
    finish_pending_i_2
       (.I0(busy_reg_n_0),
        .I1(count_reg[5]),
        .I2(finish_pending_i_3_n_0),
        .I3(valid_in),
        .I4(finish_pending_reg_n_0),
        .O(finish_pending_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    finish_pending_i_3
       (.I0(count_reg[3]),
        .I1(count_reg[1]),
        .I2(count_reg[0]),
        .I3(count_reg[2]),
        .I4(count_reg[4]),
        .O(finish_pending_i_3_n_0));
  FDRE finish_pending_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(finish_pending_i_1_n_0),
        .Q(finish_pending_reg_n_0),
        .R(\<const0> ));
  LUT6 #(
    .INIT(64'h00000000AAEAAEAA)) 
    overflow_i_1
       (.I0(overflow),
        .I1(overflow_i_2_n_0),
        .I2(p_1_in__0),
        .I3(sum),
        .I4(product16),
        .I5(\count[5]_i_1_n_0 ),
        .O(overflow_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_11
       (.I0(overflow_reg_i_27_n_6),
        .I1(overflow_reg_i_24_n_5),
        .O(overflow_i_11_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_12
       (.I0(overflow_reg_i_27_n_7),
        .I1(overflow_reg_i_24_n_6),
        .O(overflow_i_12_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    overflow_i_13
       (.I0(overflow_reg_i_24_n_4),
        .I1(overflow_reg_i_27_n_1),
        .I2(overflow_reg_i_10_n_7),
        .O(overflow_i_13_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    overflow_i_14
       (.I0(overflow_reg_i_24_n_5),
        .I1(overflow_reg_i_27_n_6),
        .I2(overflow_reg_i_27_n_1),
        .I3(overflow_reg_i_24_n_4),
        .O(overflow_i_14_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    overflow_i_15
       (.I0(overflow_reg_i_24_n_6),
        .I1(overflow_reg_i_27_n_7),
        .I2(overflow_reg_i_27_n_6),
        .I3(overflow_reg_i_24_n_5),
        .O(overflow_i_15_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    overflow_i_16
       (.I0(overflow_reg_i_28_n_1),
        .I1(overflow_reg_i_29_n_4),
        .I2(overflow_reg_i_24_n_7),
        .O(overflow_i_16_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    overflow_i_17
       (.I0(overflow_reg_i_28_n_6),
        .I1(overflow_reg_i_29_n_5),
        .I2(overflow_reg_i_30_n_4),
        .O(overflow_i_17_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    overflow_i_18
       (.I0(overflow_reg_i_28_n_7),
        .I1(overflow_reg_i_29_n_6),
        .I2(overflow_reg_i_30_n_5),
        .O(overflow_i_18_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    overflow_i_19
       (.I0(overflow_reg_i_31_n_4),
        .I1(overflow_reg_i_29_n_7),
        .I2(overflow_reg_i_30_n_6),
        .O(overflow_i_19_n_0));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT3 #(
    .INIT(8'h40)) 
    overflow_i_2
       (.I0(finish_pending_reg_n_0),
        .I1(valid_in),
        .I2(busy_reg_n_0),
        .O(overflow_i_2_n_0));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    overflow_i_20
       (.I0(overflow_reg_i_24_n_7),
        .I1(overflow_reg_i_29_n_4),
        .I2(overflow_reg_i_28_n_1),
        .I3(overflow_reg_i_27_n_7),
        .I4(overflow_reg_i_24_n_6),
        .O(overflow_i_20_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    overflow_i_21
       (.I0(overflow_reg_i_30_n_4),
        .I1(overflow_reg_i_29_n_5),
        .I2(overflow_reg_i_28_n_6),
        .I3(overflow_reg_i_28_n_1),
        .I4(overflow_reg_i_29_n_4),
        .I5(overflow_reg_i_24_n_7),
        .O(overflow_i_21_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    overflow_i_22
       (.I0(overflow_reg_i_30_n_5),
        .I1(overflow_reg_i_29_n_6),
        .I2(overflow_reg_i_28_n_7),
        .I3(overflow_reg_i_28_n_6),
        .I4(overflow_reg_i_29_n_5),
        .I5(overflow_reg_i_30_n_4),
        .O(overflow_i_22_n_0));
  LUT6 #(
    .INIT(64'h17E8E817E81717E8)) 
    overflow_i_23
       (.I0(overflow_reg_i_30_n_6),
        .I1(overflow_reg_i_29_n_7),
        .I2(overflow_reg_i_31_n_4),
        .I3(overflow_reg_i_28_n_7),
        .I4(overflow_reg_i_29_n_6),
        .I5(overflow_reg_i_30_n_5),
        .O(overflow_i_23_n_0));
  LUT4 #(
    .INIT(16'h0777)) 
    overflow_i_25
       (.I0(weight_in[6]),
        .I1(feature_in[7]),
        .I2(weight_in[7]),
        .I3(feature_in[6]),
        .O(overflow_i_25_n_0));
  LUT4 #(
    .INIT(16'hE53F)) 
    overflow_i_26
       (.I0(feature_in[6]),
        .I1(weight_in[6]),
        .I2(feature_in[7]),
        .I3(weight_in[7]),
        .O(overflow_i_26_n_0));
  LUT4 #(
    .INIT(16'h7000)) 
    overflow_i_32
       (.I0(weight_in[7]),
        .I1(feature_in[5]),
        .I2(feature_in[6]),
        .I3(weight_in[6]),
        .O(overflow_i_32_n_0));
  LUT4 #(
    .INIT(16'h2A00)) 
    overflow_i_33
       (.I0(weight_in[6]),
        .I1(feature_in[4]),
        .I2(weight_in[7]),
        .I3(feature_in[5]),
        .O(overflow_i_33_n_0));
  LUT4 #(
    .INIT(16'h2A00)) 
    overflow_i_34
       (.I0(weight_in[6]),
        .I1(feature_in[3]),
        .I2(weight_in[7]),
        .I3(feature_in[4]),
        .O(overflow_i_34_n_0));
  LUT4 #(
    .INIT(16'h2A00)) 
    overflow_i_35
       (.I0(weight_in[6]),
        .I1(feature_in[2]),
        .I2(weight_in[7]),
        .I3(feature_in[3]),
        .O(overflow_i_35_n_0));
  LUT5 #(
    .INIT(32'h4FB0C0C0)) 
    overflow_i_36
       (.I0(feature_in[5]),
        .I1(weight_in[7]),
        .I2(feature_in[6]),
        .I3(feature_in[7]),
        .I4(weight_in[6]),
        .O(overflow_i_36_n_0));
  LUT5 #(
    .INIT(32'h903FCF3F)) 
    overflow_i_37
       (.I0(feature_in[4]),
        .I1(feature_in[6]),
        .I2(weight_in[6]),
        .I3(feature_in[5]),
        .I4(weight_in[7]),
        .O(overflow_i_37_n_0));
  LUT5 #(
    .INIT(32'h8C733F3F)) 
    overflow_i_38
       (.I0(feature_in[3]),
        .I1(feature_in[4]),
        .I2(weight_in[7]),
        .I3(feature_in[5]),
        .I4(weight_in[6]),
        .O(overflow_i_38_n_0));
  LUT5 #(
    .INIT(32'h8C733F3F)) 
    overflow_i_39
       (.I0(feature_in[2]),
        .I1(feature_in[3]),
        .I2(weight_in[7]),
        .I3(feature_in[4]),
        .I4(weight_in[6]),
        .O(overflow_i_39_n_0));
  LUT4 #(
    .INIT(16'h7000)) 
    overflow_i_40
       (.I0(weight_in[4]),
        .I1(feature_in[7]),
        .I2(feature_in[6]),
        .I3(weight_in[5]),
        .O(overflow_i_40_n_0));
  LUT6 #(
    .INIT(64'hF777700070007000)) 
    overflow_i_41
       (.I0(feature_in[7]),
        .I1(weight_in[3]),
        .I2(weight_in[5]),
        .I3(feature_in[5]),
        .I4(feature_in[6]),
        .I5(weight_in[4]),
        .O(overflow_i_41_n_0));
  LUT4 #(
    .INIT(16'h25FF)) 
    overflow_i_42
       (.I0(feature_in[6]),
        .I1(weight_in[4]),
        .I2(feature_in[7]),
        .I3(weight_in[5]),
        .O(overflow_i_42_n_0));
  LUT6 #(
    .INIT(64'h4230F50F2DFFA5FF)) 
    overflow_i_43
       (.I0(feature_in[5]),
        .I1(weight_in[3]),
        .I2(feature_in[6]),
        .I3(weight_in[5]),
        .I4(feature_in[7]),
        .I5(weight_in[4]),
        .O(overflow_i_43_n_0));
  LUT4 #(
    .INIT(16'h7000)) 
    overflow_i_44
       (.I0(weight_in[1]),
        .I1(feature_in[7]),
        .I2(feature_in[6]),
        .I3(weight_in[2]),
        .O(overflow_i_44_n_0));
  LUT6 #(
    .INIT(64'hF777700070007000)) 
    overflow_i_45
       (.I0(feature_in[7]),
        .I1(weight_in[0]),
        .I2(weight_in[2]),
        .I3(feature_in[5]),
        .I4(feature_in[6]),
        .I5(weight_in[1]),
        .O(overflow_i_45_n_0));
  LUT4 #(
    .INIT(16'h25FF)) 
    overflow_i_46
       (.I0(feature_in[6]),
        .I1(weight_in[1]),
        .I2(feature_in[7]),
        .I3(weight_in[2]),
        .O(overflow_i_46_n_0));
  LUT6 #(
    .INIT(64'h4230F50F2DFFA5FF)) 
    overflow_i_47
       (.I0(feature_in[5]),
        .I1(weight_in[0]),
        .I2(feature_in[6]),
        .I3(weight_in[2]),
        .I4(feature_in[7]),
        .I5(weight_in[1]),
        .O(overflow_i_47_n_0));
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    overflow_i_48
       (.I0(feature_in[6]),
        .I1(weight_in[3]),
        .I2(feature_in[4]),
        .I3(weight_in[4]),
        .I4(weight_in[5]),
        .I5(feature_in[5]),
        .O(overflow_i_48_n_0));
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    overflow_i_49
       (.I0(feature_in[5]),
        .I1(weight_in[3]),
        .I2(feature_in[3]),
        .I3(weight_in[4]),
        .I4(weight_in[5]),
        .I5(feature_in[4]),
        .O(overflow_i_49_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    overflow_i_5
       (.I0(p_1_in__0),
        .I1(acc_reg[30]),
        .O(overflow_i_5_n_0));
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    overflow_i_50
       (.I0(feature_in[4]),
        .I1(weight_in[3]),
        .I2(feature_in[2]),
        .I3(weight_in[4]),
        .I4(weight_in[5]),
        .I5(feature_in[3]),
        .O(overflow_i_50_n_0));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    overflow_i_51
       (.I0(feature_in[3]),
        .I1(weight_in[3]),
        .I2(feature_in[2]),
        .I3(weight_in[4]),
        .I4(weight_in[5]),
        .I5(feature_in[1]),
        .O(overflow_i_51_n_0));
  LUT6 #(
    .INIT(64'h9666699969996999)) 
    overflow_i_52
       (.I0(overflow_i_48_n_0),
        .I1(overflow_i_71_n_0),
        .I2(feature_in[5]),
        .I3(weight_in[5]),
        .I4(weight_in[3]),
        .I5(feature_in[7]),
        .O(overflow_i_52_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    overflow_i_53
       (.I0(overflow_i_49_n_0),
        .I1(overflow_i_72_n_0),
        .O(overflow_i_53_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    overflow_i_54
       (.I0(overflow_i_50_n_0),
        .I1(overflow_i_73_n_0),
        .O(overflow_i_54_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    overflow_i_55
       (.I0(overflow_i_51_n_0),
        .I1(overflow_i_74_n_0),
        .O(overflow_i_55_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    overflow_i_56
       (.I0(weight_in[7]),
        .I1(feature_in[1]),
        .O(overflow_i_56_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_57
       (.I0(feature_in[1]),
        .I1(weight_in[7]),
        .O(overflow_i_57_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    overflow_i_58
       (.I0(feature_in[0]),
        .I1(weight_in[7]),
        .O(overflow_i_58_n_0));
  LUT5 #(
    .INIT(32'h9F606060)) 
    overflow_i_59
       (.I0(feature_in[1]),
        .I1(feature_in[2]),
        .I2(weight_in[7]),
        .I3(feature_in[3]),
        .I4(weight_in[6]),
        .O(overflow_i_59_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    overflow_i_6
       (.I0(acc_reg[29]),
        .I1(acc_reg[30]),
        .O(overflow_i_6_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    overflow_i_60
       (.I0(weight_in[7]),
        .I1(feature_in[1]),
        .I2(feature_in[2]),
        .I3(weight_in[6]),
        .O(overflow_i_60_n_0));
  LUT4 #(
    .INIT(16'h8777)) 
    overflow_i_61
       (.I0(weight_in[7]),
        .I1(feature_in[0]),
        .I2(feature_in[1]),
        .I3(weight_in[6]),
        .O(overflow_i_61_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_62
       (.I0(feature_in[0]),
        .I1(weight_in[6]),
        .O(overflow_i_62_n_0));
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    overflow_i_63
       (.I0(feature_in[6]),
        .I1(weight_in[0]),
        .I2(feature_in[4]),
        .I3(weight_in[1]),
        .I4(weight_in[2]),
        .I5(feature_in[5]),
        .O(overflow_i_63_n_0));
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    overflow_i_64
       (.I0(feature_in[5]),
        .I1(weight_in[0]),
        .I2(feature_in[3]),
        .I3(weight_in[1]),
        .I4(weight_in[2]),
        .I5(feature_in[4]),
        .O(overflow_i_64_n_0));
  LUT6 #(
    .INIT(64'hF880880080800000)) 
    overflow_i_65
       (.I0(feature_in[4]),
        .I1(weight_in[0]),
        .I2(feature_in[2]),
        .I3(weight_in[1]),
        .I4(weight_in[2]),
        .I5(feature_in[3]),
        .O(overflow_i_65_n_0));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    overflow_i_66
       (.I0(feature_in[3]),
        .I1(weight_in[0]),
        .I2(feature_in[2]),
        .I3(weight_in[1]),
        .I4(weight_in[2]),
        .I5(feature_in[1]),
        .O(overflow_i_66_n_0));
  LUT6 #(
    .INIT(64'h9666699969996999)) 
    overflow_i_67
       (.I0(overflow_i_63_n_0),
        .I1(overflow_i_75_n_0),
        .I2(feature_in[5]),
        .I3(weight_in[2]),
        .I4(weight_in[0]),
        .I5(feature_in[7]),
        .O(overflow_i_67_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    overflow_i_68
       (.I0(overflow_i_64_n_0),
        .I1(overflow_i_76_n_0),
        .O(overflow_i_68_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    overflow_i_69
       (.I0(overflow_i_65_n_0),
        .I1(overflow_i_77_n_0),
        .O(overflow_i_69_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    overflow_i_7
       (.I0(acc_reg[28]),
        .I1(acc_reg[29]),
        .O(overflow_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    overflow_i_70
       (.I0(overflow_i_66_n_0),
        .I1(overflow_i_78_n_0),
        .O(overflow_i_70_n_0));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_71
       (.I0(feature_in[6]),
        .I1(weight_in[4]),
        .O(overflow_i_71_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    overflow_i_72
       (.I0(feature_in[6]),
        .I1(weight_in[3]),
        .I2(weight_in[4]),
        .I3(feature_in[5]),
        .I4(weight_in[5]),
        .I5(feature_in[4]),
        .O(overflow_i_72_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    overflow_i_73
       (.I0(feature_in[5]),
        .I1(weight_in[3]),
        .I2(weight_in[4]),
        .I3(feature_in[4]),
        .I4(weight_in[5]),
        .I5(feature_in[3]),
        .O(overflow_i_73_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    overflow_i_74
       (.I0(feature_in[4]),
        .I1(weight_in[3]),
        .I2(weight_in[4]),
        .I3(feature_in[3]),
        .I4(weight_in[5]),
        .I5(feature_in[2]),
        .O(overflow_i_74_n_0));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_75
       (.I0(feature_in[6]),
        .I1(weight_in[1]),
        .O(overflow_i_75_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    overflow_i_76
       (.I0(feature_in[6]),
        .I1(weight_in[0]),
        .I2(weight_in[1]),
        .I3(feature_in[5]),
        .I4(weight_in[2]),
        .I5(feature_in[4]),
        .O(overflow_i_76_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    overflow_i_77
       (.I0(feature_in[5]),
        .I1(weight_in[0]),
        .I2(weight_in[1]),
        .I3(feature_in[4]),
        .I4(weight_in[2]),
        .I5(feature_in[3]),
        .O(overflow_i_77_n_0));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    overflow_i_78
       (.I0(feature_in[4]),
        .I1(weight_in[0]),
        .I2(weight_in[1]),
        .I3(feature_in[3]),
        .I4(weight_in[2]),
        .I5(feature_in[2]),
        .O(overflow_i_78_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    overflow_i_8
       (.I0(acc_reg[27]),
        .I1(acc_reg[28]),
        .O(overflow_i_8_n_0));
  FDRE overflow_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(overflow_i_1_n_0),
        .Q(overflow),
        .R(\<const0> ));
  CARRY4 overflow_reg_i_10
       (.CI(overflow_reg_i_24_n_0),
        .CO(overflow_reg_i_10_n_3),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,overflow_i_25_n_0}),
        .O({overflow_reg_i_10_n_6,overflow_reg_i_10_n_7}),
        .S({\<const0> ,\<const0> ,\<const1> ,overflow_i_26_n_0}));
  CARRY4 overflow_reg_i_24
       (.CI(overflow_reg_i_30_n_0),
        .CO({overflow_reg_i_24_n_0,overflow_reg_i_24_n_1,overflow_reg_i_24_n_2,overflow_reg_i_24_n_3}),
        .CYINIT(\<const0> ),
        .DI({overflow_i_32_n_0,overflow_i_33_n_0,overflow_i_34_n_0,overflow_i_35_n_0}),
        .O({overflow_reg_i_24_n_4,overflow_reg_i_24_n_5,overflow_reg_i_24_n_6,overflow_reg_i_24_n_7}),
        .S({overflow_i_36_n_0,overflow_i_37_n_0,overflow_i_38_n_0,overflow_i_39_n_0}));
  CARRY4 overflow_reg_i_27
       (.CI(overflow_reg_i_29_n_0),
        .CO({overflow_reg_i_27_n_1,NLW_overflow_reg_i_27_CO_UNCONNECTED[1],overflow_reg_i_27_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,overflow_i_40_n_0,overflow_i_41_n_0}),
        .O({overflow_reg_i_27_n_6,overflow_reg_i_27_n_7}),
        .S({\<const0> ,\<const1> ,overflow_i_42_n_0,overflow_i_43_n_0}));
  CARRY4 overflow_reg_i_28
       (.CI(overflow_reg_i_31_n_0),
        .CO({overflow_reg_i_28_n_1,NLW_overflow_reg_i_28_CO_UNCONNECTED[1],overflow_reg_i_28_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,overflow_i_44_n_0,overflow_i_45_n_0}),
        .O({overflow_reg_i_28_n_6,overflow_reg_i_28_n_7}),
        .S({\<const0> ,\<const1> ,overflow_i_46_n_0,overflow_i_47_n_0}));
  CARRY4 overflow_reg_i_29
       (.CI(\acc_reg[0]_i_11_n_0 ),
        .CO({overflow_reg_i_29_n_0,overflow_reg_i_29_n_1,overflow_reg_i_29_n_2,overflow_reg_i_29_n_3}),
        .CYINIT(\<const0> ),
        .DI({overflow_i_48_n_0,overflow_i_49_n_0,overflow_i_50_n_0,overflow_i_51_n_0}),
        .O({overflow_reg_i_29_n_4,overflow_reg_i_29_n_5,overflow_reg_i_29_n_6,overflow_reg_i_29_n_7}),
        .S({overflow_i_52_n_0,overflow_i_53_n_0,overflow_i_54_n_0,overflow_i_55_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_reg_i_3
       (.CI(wide_product_i_18_n_0),
        .CO({overflow_reg_i_3_n_1,overflow_reg_i_3_n_2,overflow_reg_i_3_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,acc_reg[29:27]}),
        .O({sum,sum__0[30:28]}),
        .S({overflow_i_5_n_0,overflow_i_6_n_0,overflow_i_7_n_0,overflow_i_8_n_0}));
  CARRY4 overflow_reg_i_30
       (.CI(\<const0> ),
        .CO({overflow_reg_i_30_n_0,overflow_reg_i_30_n_1,overflow_reg_i_30_n_2,overflow_reg_i_30_n_3}),
        .CYINIT(\<const0> ),
        .DI({overflow_i_56_n_0,overflow_i_57_n_0,overflow_i_58_n_0,\<const0> }),
        .O({overflow_reg_i_30_n_4,overflow_reg_i_30_n_5,overflow_reg_i_30_n_6,overflow_reg_i_30_n_7}),
        .S({overflow_i_59_n_0,overflow_i_60_n_0,overflow_i_61_n_0,overflow_i_62_n_0}));
  CARRY4 overflow_reg_i_31
       (.CI(\acc_reg[0]_i_10_n_0 ),
        .CO({overflow_reg_i_31_n_0,overflow_reg_i_31_n_1,overflow_reg_i_31_n_2,overflow_reg_i_31_n_3}),
        .CYINIT(\<const0> ),
        .DI({overflow_i_63_n_0,overflow_i_64_n_0,overflow_i_65_n_0,overflow_i_66_n_0}),
        .O({overflow_reg_i_31_n_4,overflow_reg_i_31_n_5,overflow_reg_i_31_n_6,overflow_reg_i_31_n_7}),
        .S({overflow_i_67_n_0,overflow_i_68_n_0,overflow_i_69_n_0,overflow_i_70_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_reg_i_4
       (.CI(overflow_reg_i_9_n_0),
        .CO({overflow_reg_i_4_n_1,overflow_reg_i_4_n_2,overflow_reg_i_4_n_3}),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,overflow_reg_i_10_n_7,overflow_i_11_n_0,overflow_i_12_n_0}),
        .O({product16,product32[14:12]}),
        .S({overflow_reg_i_10_n_6,overflow_i_13_n_0,overflow_i_14_n_0,overflow_i_15_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_reg_i_9
       (.CI(\acc_reg[4]_i_10_n_0 ),
        .CO({overflow_reg_i_9_n_0,overflow_reg_i_9_n_1,overflow_reg_i_9_n_2,overflow_reg_i_9_n_3}),
        .CYINIT(\<const0> ),
        .DI({overflow_i_16_n_0,overflow_i_17_n_0,overflow_i_18_n_0,overflow_i_19_n_0}),
        .O(product32[11:8]),
        .S({overflow_i_20_n_0,overflow_i_21_n_0,overflow_i_22_n_0,overflow_i_23_n_0}));
  LUT4 #(
    .INIT(16'hFB08)) 
    relu_reg_i_1
       (.I0(relu_in),
        .I1(start),
        .I2(busy_reg_n_0),
        .I3(relu_reg),
        .O(relu_reg_i_1_n_0));
  FDRE relu_reg_reg
       (.C(clk),
        .CE(\<const1> ),
        .D(relu_reg_i_1_n_0),
        .Q(relu_reg),
        .R(rst));
  LUT3 #(
    .INIT(8'hFE)) 
    \result[0]_i_1 
       (.I0(clipped1),
        .I1(clipped2),
        .I2(rounded_mag[0]),
        .O(clipped[0]));
  LUT5 #(
    .INIT(32'hFFFF4540)) 
    \result[1]_i_1 
       (.I0(clipped2),
        .I1(rounded0[1]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[1]),
        .I4(clipped1),
        .O(clipped[1]));
  LUT5 #(
    .INIT(32'hFFFF4540)) 
    \result[2]_i_1 
       (.I0(clipped2),
        .I1(rounded0[2]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[2]),
        .I4(clipped1),
        .O(clipped[2]));
  LUT5 #(
    .INIT(32'hFFFF4540)) 
    \result[3]_i_1 
       (.I0(clipped2),
        .I1(rounded0[3]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[3]),
        .I4(clipped1),
        .O(clipped[3]));
  LUT6 #(
    .INIT(64'h00000000010101F1)) 
    \result[3]_i_100 
       (.I0(p_1_in[2]),
        .I1(p_1_in[1]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[1]),
        .I4(magnitude0[2]),
        .I5(p_1_in[0]),
        .O(\result[3]_i_100_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_101 
       (.I0(wide_product__3[16]),
        .O(p_0_in[16]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_102 
       (.I0(p_1_in[15]),
        .O(p_0_in[15]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_103 
       (.I0(p_1_in[14]),
        .O(p_0_in[14]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_104 
       (.I0(p_1_in[13]),
        .O(p_0_in[13]));
  LUT6 #(
    .INIT(64'hFEFEFE0E00000000)) 
    \result[3]_i_105 
       (.I0(p_1_in[6]),
        .I1(p_1_in[7]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[6]),
        .I4(magnitude0[7]),
        .I5(shift_reg),
        .O(\result[3]_i_105_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFE0E00000000)) 
    \result[3]_i_106 
       (.I0(p_1_in[4]),
        .I1(p_1_in[5]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[5]),
        .I4(magnitude0[4]),
        .I5(shift_reg),
        .O(\result[3]_i_106_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFE0E00000000)) 
    \result[3]_i_107 
       (.I0(p_1_in[3]),
        .I1(p_1_in[2]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[2]),
        .I4(magnitude0[3]),
        .I5(shift_reg),
        .O(\result[3]_i_107_n_0 ));
  LUT5 #(
    .INIT(32'hEFEA0000)) 
    \result[3]_i_108 
       (.I0(p_1_in[0]),
        .I1(magnitude0[1]),
        .I2(wide_product__3[63]),
        .I3(p_1_in[1]),
        .I4(shift_reg),
        .O(\result[3]_i_108_n_0 ));
  LUT6 #(
    .INIT(64'h010101F1FFFFFFFF)) 
    \result[3]_i_109 
       (.I0(p_1_in[7]),
        .I1(p_1_in[6]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[7]),
        .I4(magnitude0[6]),
        .I5(shift_reg),
        .O(\result[3]_i_109_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \result[3]_i_11 
       (.I0(magnitude0[31]),
        .I1(wide_product__3[63]),
        .I2(wide_product__3[31]),
        .O(\result[3]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h010101F1FFFFFFFF)) 
    \result[3]_i_110 
       (.I0(p_1_in[5]),
        .I1(p_1_in[4]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[4]),
        .I4(magnitude0[5]),
        .I5(shift_reg),
        .O(\result[3]_i_110_n_0 ));
  LUT6 #(
    .INIT(64'h010101F1FFFFFFFF)) 
    \result[3]_i_111 
       (.I0(p_1_in[2]),
        .I1(p_1_in[3]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[3]),
        .I4(magnitude0[2]),
        .I5(shift_reg),
        .O(\result[3]_i_111_n_0 ));
  LUT5 #(
    .INIT(32'h1015FFFF)) 
    \result[3]_i_112 
       (.I0(p_1_in[0]),
        .I1(magnitude0[1]),
        .I2(wide_product__3[63]),
        .I3(p_1_in[1]),
        .I4(shift_reg),
        .O(\result[3]_i_112_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_14 
       (.I0(wide_product__3[32]),
        .O(p_0_in[32]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_15 
       (.I0(wide_product__3[31]),
        .O(p_0_in[31]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_16 
       (.I0(wide_product__3[30]),
        .O(p_0_in[30]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_17 
       (.I0(wide_product__3[29]),
        .O(p_0_in[29]));
  LUT2 #(
    .INIT(4'h6)) 
    \result[3]_i_19 
       (.I0(p_1_in[31]),
        .I1(wide_product_n_91),
        .O(\result[3]_i_19_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[3]_i_20 
       (.I0(p_1_in[30]),
        .I1(wide_product_n_92),
        .O(\result[3]_i_20_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[3]_i_21 
       (.I0(p_1_in[29]),
        .I1(wide_product_n_93),
        .O(\result[3]_i_21_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[3]_i_22 
       (.I0(p_1_in[28]),
        .I1(wide_product_n_94),
        .O(\result[3]_i_22_n_0 ));
  LUT4 #(
    .INIT(16'hDFD5)) 
    \result[3]_i_24 
       (.I0(shift_reg),
        .I1(magnitude0[30]),
        .I2(wide_product__3[63]),
        .I3(wide_product__3[30]),
        .O(\result[3]_i_24_n_0 ));
  LUT6 #(
    .INIT(64'h2222222EFFFFFFFF)) 
    \result[3]_i_25 
       (.I0(\result[3]_i_50_n_0 ),
        .I1(wide_product__3[63]),
        .I2(magnitude0[27]),
        .I3(magnitude0[28]),
        .I4(magnitude0[29]),
        .I5(shift_reg),
        .O(\result[3]_i_25_n_0 ));
  LUT6 #(
    .INIT(64'h2222222EFFFFFFFF)) 
    \result[3]_i_26 
       (.I0(\result[3]_i_51_n_0 ),
        .I1(wide_product__3[63]),
        .I2(magnitude0[24]),
        .I3(magnitude0[25]),
        .I4(magnitude0[26]),
        .I5(shift_reg),
        .O(\result[3]_i_26_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFE0E00000000)) 
    \result[3]_i_28 
       (.I0(wide_product__3[28]),
        .I1(wide_product__3[29]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[28]),
        .I4(magnitude0[29]),
        .I5(shift_reg),
        .O(\result[3]_i_28_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFE0E00000000)) 
    \result[3]_i_29 
       (.I0(wide_product__3[26]),
        .I1(wide_product__3[27]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[26]),
        .I4(magnitude0[27]),
        .I5(shift_reg),
        .O(\result[3]_i_29_n_0 ));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    \result[3]_i_3 
       (.I0(magnitude0[31]),
        .I1(wide_product__3[63]),
        .I2(wide_product__3[31]),
        .I3(shift_reg),
        .I4(p_1_in[0]),
        .O(\result[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFE0E00000000)) 
    \result[3]_i_30 
       (.I0(wide_product__3[24]),
        .I1(wide_product__3[25]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[24]),
        .I4(magnitude0[25]),
        .I5(shift_reg),
        .O(\result[3]_i_30_n_0 ));
  LUT4 #(
    .INIT(16'hDFD5)) 
    \result[3]_i_31 
       (.I0(shift_reg),
        .I1(magnitude0[30]),
        .I2(wide_product__3[63]),
        .I3(wide_product__3[30]),
        .O(\result[3]_i_31_n_0 ));
  LUT6 #(
    .INIT(64'h010101F1FFFFFFFF)) 
    \result[3]_i_32 
       (.I0(wide_product__3[29]),
        .I1(wide_product__3[28]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[29]),
        .I4(magnitude0[28]),
        .I5(shift_reg),
        .O(\result[3]_i_32_n_0 ));
  LUT6 #(
    .INIT(64'h010101F1FFFFFFFF)) 
    \result[3]_i_33 
       (.I0(wide_product__3[27]),
        .I1(wide_product__3[26]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[27]),
        .I4(magnitude0[26]),
        .I5(shift_reg),
        .O(\result[3]_i_33_n_0 ));
  LUT6 #(
    .INIT(64'h010101F1FFFFFFFF)) 
    \result[3]_i_34 
       (.I0(wide_product__3[25]),
        .I1(wide_product__3[24]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[25]),
        .I4(magnitude0[24]),
        .I5(shift_reg),
        .O(\result[3]_i_34_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_36 
       (.I0(wide_product__3[28]),
        .O(p_0_in[28]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_37 
       (.I0(wide_product__3[27]),
        .O(p_0_in[27]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_38 
       (.I0(wide_product__3[26]),
        .O(p_0_in[26]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_39 
       (.I0(wide_product__3[25]),
        .O(p_0_in[25]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[3]_i_4 
       (.I0(magnitude0[34]),
        .I1(wide_product__3[34]),
        .I2(shift_reg),
        .I3(magnitude0[3]),
        .I4(wide_product__3[63]),
        .I5(p_1_in[3]),
        .O(\result[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[3]_i_41 
       (.I0(p_1_in[27]),
        .I1(wide_product_n_95),
        .O(\result[3]_i_41_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[3]_i_42 
       (.I0(p_1_in[26]),
        .I1(wide_product_n_96),
        .O(\result[3]_i_42_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[3]_i_43 
       (.I0(p_1_in[25]),
        .I1(wide_product_n_97),
        .O(\result[3]_i_43_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[3]_i_44 
       (.I0(p_1_in[24]),
        .I1(wide_product_n_98),
        .O(\result[3]_i_44_n_0 ));
  LUT6 #(
    .INIT(64'h2222222EFFFFFFFF)) 
    \result[3]_i_46 
       (.I0(\result[3]_i_75_n_0 ),
        .I1(wide_product__3[63]),
        .I2(magnitude0[21]),
        .I3(magnitude0[22]),
        .I4(magnitude0[23]),
        .I5(shift_reg),
        .O(\result[3]_i_46_n_0 ));
  LUT6 #(
    .INIT(64'h2222222EFFFFFFFF)) 
    \result[3]_i_47 
       (.I0(\result[3]_i_76_n_0 ),
        .I1(wide_product__3[63]),
        .I2(magnitude0[18]),
        .I3(magnitude0[19]),
        .I4(magnitude0[20]),
        .I5(shift_reg),
        .O(\result[3]_i_47_n_0 ));
  LUT6 #(
    .INIT(64'h2222222EFFFFFFFF)) 
    \result[3]_i_48 
       (.I0(\result[3]_i_77_n_0 ),
        .I1(wide_product__3[63]),
        .I2(magnitude0[15]),
        .I3(magnitude0[16]),
        .I4(magnitude0[17]),
        .I5(shift_reg),
        .O(\result[3]_i_48_n_0 ));
  LUT6 #(
    .INIT(64'h2222222EFFFFFFFF)) 
    \result[3]_i_49 
       (.I0(\result[3]_i_79_n_0 ),
        .I1(wide_product__3[63]),
        .I2(magnitude0[12]),
        .I3(magnitude0[13]),
        .I4(magnitude0[14]),
        .I5(shift_reg),
        .O(\result[3]_i_49_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[3]_i_5 
       (.I0(magnitude0[33]),
        .I1(wide_product__3[33]),
        .I2(shift_reg),
        .I3(magnitude0[2]),
        .I4(wide_product__3[63]),
        .I5(p_1_in[2]),
        .O(\result[3]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \result[3]_i_50 
       (.I0(wide_product__3[29]),
        .I1(wide_product__3[28]),
        .I2(wide_product__3[27]),
        .O(\result[3]_i_50_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \result[3]_i_51 
       (.I0(wide_product__3[26]),
        .I1(wide_product__3[25]),
        .I2(wide_product__3[24]),
        .O(\result[3]_i_51_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFE0E00000000)) 
    \result[3]_i_53 
       (.I0(wide_product__3[22]),
        .I1(wide_product__3[23]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[22]),
        .I4(magnitude0[23]),
        .I5(shift_reg),
        .O(\result[3]_i_53_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFE0E00000000)) 
    \result[3]_i_54 
       (.I0(wide_product__3[20]),
        .I1(wide_product__3[21]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[20]),
        .I4(magnitude0[21]),
        .I5(shift_reg),
        .O(\result[3]_i_54_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFE0E00000000)) 
    \result[3]_i_55 
       (.I0(wide_product__3[18]),
        .I1(wide_product__3[19]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[18]),
        .I4(magnitude0[19]),
        .I5(shift_reg),
        .O(\result[3]_i_55_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFE0E00000000)) 
    \result[3]_i_56 
       (.I0(wide_product__3[16]),
        .I1(wide_product__3[17]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[16]),
        .I4(magnitude0[17]),
        .I5(shift_reg),
        .O(\result[3]_i_56_n_0 ));
  LUT6 #(
    .INIT(64'h010101F1FFFFFFFF)) 
    \result[3]_i_57 
       (.I0(wide_product__3[23]),
        .I1(wide_product__3[22]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[23]),
        .I4(magnitude0[22]),
        .I5(shift_reg),
        .O(\result[3]_i_57_n_0 ));
  LUT6 #(
    .INIT(64'h010101F1FFFFFFFF)) 
    \result[3]_i_58 
       (.I0(wide_product__3[21]),
        .I1(wide_product__3[20]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[21]),
        .I4(magnitude0[20]),
        .I5(shift_reg),
        .O(\result[3]_i_58_n_0 ));
  LUT6 #(
    .INIT(64'h010101F1FFFFFFFF)) 
    \result[3]_i_59 
       (.I0(wide_product__3[19]),
        .I1(wide_product__3[18]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[19]),
        .I4(magnitude0[18]),
        .I5(shift_reg),
        .O(\result[3]_i_59_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[3]_i_6 
       (.I0(magnitude0[32]),
        .I1(wide_product__3[32]),
        .I2(shift_reg),
        .I3(magnitude0[1]),
        .I4(wide_product__3[63]),
        .I5(p_1_in[1]),
        .O(\result[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h010101F1FFFFFFFF)) 
    \result[3]_i_60 
       (.I0(wide_product__3[17]),
        .I1(wide_product__3[16]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[17]),
        .I4(magnitude0[16]),
        .I5(shift_reg),
        .O(\result[3]_i_60_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_62 
       (.I0(wide_product__3[24]),
        .O(p_0_in[24]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_63 
       (.I0(wide_product__3[23]),
        .O(p_0_in[23]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_64 
       (.I0(wide_product__3[22]),
        .O(p_0_in[22]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_65 
       (.I0(wide_product__3[21]),
        .O(p_0_in[21]));
  LUT2 #(
    .INIT(4'h6)) 
    \result[3]_i_67 
       (.I0(p_1_in[23]),
        .I1(wide_product_n_99),
        .O(\result[3]_i_67_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[3]_i_68 
       (.I0(p_1_in[22]),
        .I1(wide_product_n_100),
        .O(\result[3]_i_68_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[3]_i_69 
       (.I0(p_1_in[21]),
        .I1(wide_product_n_101),
        .O(\result[3]_i_69_n_0 ));
  LUT5 #(
    .INIT(32'h0FAA30AA)) 
    \result[3]_i_7 
       (.I0(p_1_in[0]),
        .I1(increment2),
        .I2(\result[3]_i_11_n_0 ),
        .I3(shift_reg),
        .I4(increment10_in),
        .O(\result[3]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[3]_i_70 
       (.I0(p_1_in[20]),
        .I1(wide_product_n_102),
        .O(\result[3]_i_70_n_0 ));
  LUT6 #(
    .INIT(64'h2222222EFFFFFFFF)) 
    \result[3]_i_71 
       (.I0(\result[3]_i_96_n_0 ),
        .I1(wide_product__3[63]),
        .I2(magnitude0[9]),
        .I3(magnitude0[10]),
        .I4(magnitude0[11]),
        .I5(shift_reg),
        .O(\result[3]_i_71_n_0 ));
  LUT6 #(
    .INIT(64'h2222222EFFFFFFFF)) 
    \result[3]_i_72 
       (.I0(\result[3]_i_97_n_0 ),
        .I1(wide_product__3[63]),
        .I2(magnitude0[6]),
        .I3(magnitude0[7]),
        .I4(magnitude0[8]),
        .I5(shift_reg),
        .O(\result[3]_i_72_n_0 ));
  LUT6 #(
    .INIT(64'h04F40404FFFFFFFF)) 
    \result[3]_i_73 
       (.I0(p_1_in[3]),
        .I1(\result[3]_i_98_n_0 ),
        .I2(wide_product__3[63]),
        .I3(magnitude0[3]),
        .I4(\result[3]_i_99_n_0 ),
        .I5(shift_reg),
        .O(\result[3]_i_73_n_0 ));
  LUT2 #(
    .INIT(4'hB)) 
    \result[3]_i_74 
       (.I0(\result[3]_i_100_n_0 ),
        .I1(shift_reg),
        .O(\result[3]_i_74_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \result[3]_i_75 
       (.I0(wide_product__3[23]),
        .I1(wide_product__3[22]),
        .I2(wide_product__3[21]),
        .O(\result[3]_i_75_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \result[3]_i_76 
       (.I0(wide_product__3[20]),
        .I1(wide_product__3[19]),
        .I2(wide_product__3[18]),
        .O(\result[3]_i_76_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \result[3]_i_77 
       (.I0(wide_product__3[17]),
        .I1(wide_product__3[16]),
        .I2(p_1_in[15]),
        .O(\result[3]_i_77_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \result[3]_i_79 
       (.I0(p_1_in[13]),
        .I1(p_1_in[12]),
        .I2(p_1_in[14]),
        .O(\result[3]_i_79_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFE0E00000000)) 
    \result[3]_i_81 
       (.I0(p_1_in[14]),
        .I1(p_1_in[15]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[14]),
        .I4(magnitude0[15]),
        .I5(shift_reg),
        .O(\result[3]_i_81_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFE0E00000000)) 
    \result[3]_i_82 
       (.I0(p_1_in[12]),
        .I1(p_1_in[13]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[12]),
        .I4(magnitude0[13]),
        .I5(shift_reg),
        .O(\result[3]_i_82_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFE0E00000000)) 
    \result[3]_i_83 
       (.I0(p_1_in[11]),
        .I1(p_1_in[10]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[10]),
        .I4(magnitude0[11]),
        .I5(shift_reg),
        .O(\result[3]_i_83_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFE0E00000000)) 
    \result[3]_i_84 
       (.I0(p_1_in[8]),
        .I1(p_1_in[9]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[8]),
        .I4(magnitude0[9]),
        .I5(shift_reg),
        .O(\result[3]_i_84_n_0 ));
  LUT6 #(
    .INIT(64'h010101F1FFFFFFFF)) 
    \result[3]_i_85 
       (.I0(p_1_in[15]),
        .I1(p_1_in[14]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[15]),
        .I4(magnitude0[14]),
        .I5(shift_reg),
        .O(\result[3]_i_85_n_0 ));
  LUT6 #(
    .INIT(64'h010101F1FFFFFFFF)) 
    \result[3]_i_86 
       (.I0(p_1_in[13]),
        .I1(p_1_in[12]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[13]),
        .I4(magnitude0[12]),
        .I5(shift_reg),
        .O(\result[3]_i_86_n_0 ));
  LUT6 #(
    .INIT(64'h010101F1FFFFFFFF)) 
    \result[3]_i_87 
       (.I0(p_1_in[10]),
        .I1(p_1_in[11]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[11]),
        .I4(magnitude0[10]),
        .I5(shift_reg),
        .O(\result[3]_i_87_n_0 ));
  LUT6 #(
    .INIT(64'h010101F1FFFFFFFF)) 
    \result[3]_i_88 
       (.I0(p_1_in[9]),
        .I1(p_1_in[8]),
        .I2(wide_product__3[63]),
        .I3(magnitude0[9]),
        .I4(magnitude0[8]),
        .I5(shift_reg),
        .O(\result[3]_i_88_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_89 
       (.I0(wide_product__3[20]),
        .O(p_0_in[20]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_90 
       (.I0(wide_product__3[19]),
        .O(p_0_in[19]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_91 
       (.I0(wide_product__3[18]),
        .O(p_0_in[18]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[3]_i_92 
       (.I0(wide_product__3[17]),
        .O(p_0_in[17]));
  LUT2 #(
    .INIT(4'h6)) 
    \result[3]_i_93 
       (.I0(p_1_in[19]),
        .I1(wide_product_n_103),
        .O(\result[3]_i_93_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[3]_i_94 
       (.I0(p_1_in[18]),
        .I1(wide_product_n_104),
        .O(\result[3]_i_94_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[3]_i_95 
       (.I0(p_1_in[17]),
        .I1(wide_product_n_105),
        .O(\result[3]_i_95_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \result[3]_i_96 
       (.I0(p_1_in[10]),
        .I1(p_1_in[11]),
        .I2(p_1_in[9]),
        .O(\result[3]_i_96_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \result[3]_i_97 
       (.I0(p_1_in[7]),
        .I1(p_1_in[6]),
        .I2(p_1_in[8]),
        .O(\result[3]_i_97_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[3]_i_98 
       (.I0(p_1_in[4]),
        .I1(p_1_in[5]),
        .O(\result[3]_i_98_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[3]_i_99 
       (.I0(magnitude0[5]),
        .I1(magnitude0[4]),
        .O(\result[3]_i_99_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF4540)) 
    \result[4]_i_1 
       (.I0(clipped2),
        .I1(rounded0[4]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[4]),
        .I4(clipped1),
        .O(clipped[4]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[4]_i_3 
       (.I0(rounded_mag[0]),
        .O(\result[4]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[4]_i_4 
       (.I0(rounded_mag[4]),
        .O(\result[4]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[4]_i_5 
       (.I0(rounded_mag[3]),
        .O(\result[4]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[4]_i_6 
       (.I0(rounded_mag[2]),
        .O(\result[4]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[4]_i_7 
       (.I0(rounded_mag[1]),
        .O(\result[4]_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF4540)) 
    \result[5]_i_1 
       (.I0(clipped2),
        .I1(rounded0[5]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[5]),
        .I4(clipped1),
        .O(clipped[5]));
  LUT5 #(
    .INIT(32'hFFFF4540)) 
    \result[6]_i_1 
       (.I0(clipped2),
        .I1(rounded0[6]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[6]),
        .I4(clipped1),
        .O(clipped[6]));
  LUT5 #(
    .INIT(32'hFFFF8000)) 
    \result[7]_i_1 
       (.I0(finish_pending_reg_n_0),
        .I1(clipped[7]),
        .I2(relu_reg),
        .I3(busy_reg_n_0),
        .I4(rst),
        .O(\result[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h20202F20)) 
    \result[7]_i_10 
       (.I0(rounded0[63]),
        .I1(rounded0[62]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[63]),
        .I4(rounded_mag[62]),
        .O(\result[7]_i_10_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_100 
       (.I0(rounded_mag[53]),
        .O(\result[7]_i_100_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_101 
       (.I0(magnitude0[42]),
        .I1(wide_product__3[42]),
        .I2(shift_reg),
        .I3(magnitude0[11]),
        .I4(wide_product__3[63]),
        .I5(p_1_in[11]),
        .O(\result[7]_i_101_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_102 
       (.I0(magnitude0[41]),
        .I1(wide_product__3[41]),
        .I2(shift_reg),
        .I3(magnitude0[10]),
        .I4(wide_product__3[63]),
        .I5(p_1_in[10]),
        .O(\result[7]_i_102_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_103 
       (.I0(magnitude0[40]),
        .I1(wide_product__3[40]),
        .I2(shift_reg),
        .I3(magnitude0[9]),
        .I4(wide_product__3[63]),
        .I5(p_1_in[9]),
        .O(\result[7]_i_103_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_104 
       (.I0(magnitude0[39]),
        .I1(wide_product__3[39]),
        .I2(shift_reg),
        .I3(magnitude0[8]),
        .I4(wide_product__3[63]),
        .I5(p_1_in[8]),
        .O(\result[7]_i_104_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_106 
       (.I0(p_1_in[55]),
        .I1(wide_product__0_n_84),
        .O(\result[7]_i_106_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_107 
       (.I0(p_1_in[54]),
        .I1(wide_product__0_n_85),
        .O(\result[7]_i_107_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_108 
       (.I0(p_1_in[53]),
        .I1(wide_product__0_n_86),
        .O(\result[7]_i_108_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_109 
       (.I0(p_1_in[52]),
        .I1(wide_product__0_n_87),
        .O(\result[7]_i_109_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_11 
       (.I0(rounded0[61]),
        .I1(rounded0[60]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[60]),
        .I4(rounded_mag[61]),
        .O(\result[7]_i_11_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_110 
       (.I0(wide_product__3[40]),
        .O(p_0_in[40]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_111 
       (.I0(wide_product__3[39]),
        .O(p_0_in[39]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_112 
       (.I0(wide_product__3[38]),
        .O(p_0_in[38]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_113 
       (.I0(wide_product__3[37]),
        .O(p_0_in[37]));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_114 
       (.I0(p_1_in[39]),
        .I1(wide_product__0_n_100),
        .O(\result[7]_i_114_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_115 
       (.I0(p_1_in[38]),
        .I1(wide_product__0_n_101),
        .O(\result[7]_i_115_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_116 
       (.I0(p_1_in[37]),
        .I1(wide_product__0_n_102),
        .O(\result[7]_i_116_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_117 
       (.I0(p_1_in[36]),
        .I1(wide_product__0_n_103),
        .O(\result[7]_i_117_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_118 
       (.I0(p_1_in[8]),
        .O(p_0_in[8]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_119 
       (.I0(p_1_in[7]),
        .O(p_0_in[7]));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_12 
       (.I0(rounded0[59]),
        .I1(rounded0[58]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[58]),
        .I4(rounded_mag[59]),
        .O(\result[7]_i_12_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_120 
       (.I0(p_1_in[6]),
        .O(p_0_in[6]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_121 
       (.I0(p_1_in[5]),
        .O(p_0_in[5]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_122 
       (.I0(wide_product__3[36]),
        .O(p_0_in[36]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_123 
       (.I0(wide_product__3[35]),
        .O(p_0_in[35]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_124 
       (.I0(wide_product__3[34]),
        .O(p_0_in[34]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_125 
       (.I0(wide_product__3[33]),
        .O(p_0_in[33]));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_126 
       (.I0(p_1_in[35]),
        .I1(wide_product__0_n_104),
        .O(\result[7]_i_126_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_127 
       (.I0(p_1_in[34]),
        .I1(wide_product__0_n_105),
        .O(\result[7]_i_127_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_128 
       (.I0(p_1_in[33]),
        .I1(wide_product_n_89),
        .O(\result[7]_i_128_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_129 
       (.I0(p_1_in[32]),
        .I1(wide_product_n_90),
        .O(\result[7]_i_129_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_13 
       (.I0(rounded0[57]),
        .I1(rounded0[56]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[56]),
        .I4(rounded_mag[57]),
        .O(\result[7]_i_13_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_130 
       (.I0(p_1_in[0]),
        .O(p_0_in[0]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_131 
       (.I0(p_1_in[4]),
        .O(p_0_in[4]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_132 
       (.I0(p_1_in[3]),
        .O(p_0_in[3]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_133 
       (.I0(p_1_in[2]),
        .O(p_0_in[2]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_134 
       (.I0(p_1_in[1]),
        .O(p_0_in[1]));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_136 
       (.I0(rounded0[53]),
        .I1(rounded0[52]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[52]),
        .I4(rounded_mag[53]),
        .O(\result[7]_i_136_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_137 
       (.I0(rounded0[51]),
        .I1(rounded0[50]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[50]),
        .I4(rounded_mag[51]),
        .O(\result[7]_i_137_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_138 
       (.I0(rounded0[49]),
        .I1(rounded0[48]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[48]),
        .I4(rounded_mag[49]),
        .O(\result[7]_i_138_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_139 
       (.I0(rounded0[47]),
        .I1(rounded0[46]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[46]),
        .I4(rounded_mag[47]),
        .O(\result[7]_i_139_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_14 
       (.I0(rounded0[63]),
        .I1(rounded0[62]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[62]),
        .I4(rounded_mag[63]),
        .O(\result[7]_i_14_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_140 
       (.I0(rounded0[52]),
        .I1(rounded0[53]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[53]),
        .I4(rounded_mag[52]),
        .O(\result[7]_i_140_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_141 
       (.I0(rounded0[50]),
        .I1(rounded0[51]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[51]),
        .I4(rounded_mag[50]),
        .O(\result[7]_i_141_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_142 
       (.I0(rounded0[48]),
        .I1(rounded0[49]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[49]),
        .I4(rounded_mag[48]),
        .O(\result[7]_i_142_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_143 
       (.I0(rounded0[46]),
        .I1(rounded0[47]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[47]),
        .I4(rounded_mag[46]),
        .O(\result[7]_i_143_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_145 
       (.I0(rounded0[39]),
        .I1(rounded0[38]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[38]),
        .I4(rounded_mag[39]),
        .O(\result[7]_i_145_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_146 
       (.I0(rounded0[37]),
        .I1(rounded0[36]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[36]),
        .I4(rounded_mag[37]),
        .O(\result[7]_i_146_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_147 
       (.I0(rounded0[35]),
        .I1(rounded0[34]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[34]),
        .I4(rounded_mag[35]),
        .O(\result[7]_i_147_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_148 
       (.I0(rounded0[33]),
        .I1(rounded0[32]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[32]),
        .I4(rounded_mag[33]),
        .O(\result[7]_i_148_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_149 
       (.I0(rounded0[38]),
        .I1(rounded0[39]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[39]),
        .I4(rounded_mag[38]),
        .O(\result[7]_i_149_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_15 
       (.I0(rounded0[60]),
        .I1(rounded0[61]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[61]),
        .I4(rounded_mag[60]),
        .O(\result[7]_i_15_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_150 
       (.I0(rounded0[36]),
        .I1(rounded0[37]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[37]),
        .I4(rounded_mag[36]),
        .O(\result[7]_i_150_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_151 
       (.I0(rounded0[34]),
        .I1(rounded0[35]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[35]),
        .I4(rounded_mag[34]),
        .O(\result[7]_i_151_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_152 
       (.I0(rounded0[32]),
        .I1(rounded0[33]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[33]),
        .I4(rounded_mag[32]),
        .O(\result[7]_i_152_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_157 
       (.I0(wide_product__3[55]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[55]),
        .I3(shift_reg),
        .O(\result[7]_i_157_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_158 
       (.I0(wide_product__3[54]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[54]),
        .I3(shift_reg),
        .O(\result[7]_i_158_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_159 
       (.I0(wide_product__3[53]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[53]),
        .I3(shift_reg),
        .O(\result[7]_i_159_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_16 
       (.I0(rounded0[58]),
        .I1(rounded0[59]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[59]),
        .I4(rounded_mag[58]),
        .O(\result[7]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_160 
       (.I0(wide_product__3[52]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[52]),
        .I3(shift_reg),
        .O(\result[7]_i_160_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_161 
       (.I0(rounded_mag[52]),
        .O(\result[7]_i_161_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_162 
       (.I0(rounded_mag[51]),
        .O(\result[7]_i_162_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_163 
       (.I0(rounded_mag[50]),
        .O(\result[7]_i_163_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_164 
       (.I0(rounded_mag[49]),
        .O(\result[7]_i_164_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_165 
       (.I0(wide_product__3[51]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[51]),
        .I3(shift_reg),
        .O(\result[7]_i_165_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_166 
       (.I0(wide_product__3[50]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[50]),
        .I3(shift_reg),
        .O(\result[7]_i_166_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_167 
       (.I0(wide_product__3[49]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[49]),
        .I3(shift_reg),
        .O(\result[7]_i_167_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_168 
       (.I0(wide_product__3[48]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[48]),
        .I3(shift_reg),
        .O(\result[7]_i_168_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_169 
       (.I0(rounded_mag[48]),
        .O(\result[7]_i_169_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_17 
       (.I0(rounded0[56]),
        .I1(rounded0[57]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[57]),
        .I4(rounded_mag[56]),
        .O(\result[7]_i_17_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_170 
       (.I0(rounded_mag[47]),
        .O(\result[7]_i_170_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_171 
       (.I0(rounded_mag[46]),
        .O(\result[7]_i_171_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_172 
       (.I0(rounded_mag[45]),
        .O(\result[7]_i_172_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_18 
       (.I0(rounded_mag[8]),
        .O(\result[7]_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_180 
       (.I0(p_1_in[51]),
        .I1(wide_product__0_n_88),
        .O(\result[7]_i_180_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_181 
       (.I0(p_1_in[50]),
        .I1(wide_product__0_n_89),
        .O(\result[7]_i_181_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_182 
       (.I0(p_1_in[49]),
        .I1(wide_product__0_n_90),
        .O(\result[7]_i_182_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_183 
       (.I0(p_1_in[48]),
        .I1(wide_product__0_n_91),
        .O(\result[7]_i_183_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_185 
       (.I0(rounded0[45]),
        .I1(rounded0[44]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[44]),
        .I4(rounded_mag[45]),
        .O(\result[7]_i_185_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_186 
       (.I0(rounded0[43]),
        .I1(rounded0[42]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[42]),
        .I4(rounded_mag[43]),
        .O(\result[7]_i_186_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_187 
       (.I0(rounded0[41]),
        .I1(rounded0[40]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[40]),
        .I4(rounded_mag[41]),
        .O(\result[7]_i_187_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_188 
       (.I0(rounded0[39]),
        .I1(rounded0[38]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[38]),
        .I4(rounded_mag[39]),
        .O(\result[7]_i_188_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_189 
       (.I0(rounded0[44]),
        .I1(rounded0[45]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[45]),
        .I4(rounded_mag[44]),
        .O(\result[7]_i_189_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_19 
       (.I0(rounded_mag[7]),
        .O(\result[7]_i_19_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_190 
       (.I0(rounded0[42]),
        .I1(rounded0[43]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[43]),
        .I4(rounded_mag[42]),
        .O(\result[7]_i_190_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_191 
       (.I0(rounded0[40]),
        .I1(rounded0[41]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[41]),
        .I4(rounded_mag[40]),
        .O(\result[7]_i_191_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_192 
       (.I0(rounded0[38]),
        .I1(rounded0[39]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[39]),
        .I4(rounded_mag[38]),
        .O(\result[7]_i_192_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_194 
       (.I0(rounded0[31]),
        .I1(rounded0[30]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[30]),
        .I4(rounded_mag[31]),
        .O(\result[7]_i_194_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_195 
       (.I0(rounded0[29]),
        .I1(rounded0[28]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[28]),
        .I4(rounded_mag[29]),
        .O(\result[7]_i_195_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_196 
       (.I0(rounded0[27]),
        .I1(rounded0[26]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[26]),
        .I4(rounded_mag[27]),
        .O(\result[7]_i_196_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_197 
       (.I0(rounded0[25]),
        .I1(rounded0[24]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[24]),
        .I4(rounded_mag[25]),
        .O(\result[7]_i_197_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_198 
       (.I0(rounded0[30]),
        .I1(rounded0[31]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[31]),
        .I4(rounded_mag[30]),
        .O(\result[7]_i_198_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_199 
       (.I0(rounded0[28]),
        .I1(rounded0[29]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[29]),
        .I4(rounded_mag[28]),
        .O(\result[7]_i_199_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_2 
       (.I0(finish_pending_reg_n_0),
        .I1(busy_reg_n_0),
        .O(busy0));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_20 
       (.I0(rounded_mag[6]),
        .O(\result[7]_i_20_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_200 
       (.I0(rounded0[26]),
        .I1(rounded0[27]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[27]),
        .I4(rounded_mag[26]),
        .O(\result[7]_i_200_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_201 
       (.I0(rounded0[24]),
        .I1(rounded0[25]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[25]),
        .I4(rounded_mag[24]),
        .O(\result[7]_i_201_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_206 
       (.I0(wide_product__3[47]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[47]),
        .I3(shift_reg),
        .O(\result[7]_i_206_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_207 
       (.I0(wide_product__3[46]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[46]),
        .I3(shift_reg),
        .O(\result[7]_i_207_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_208 
       (.I0(wide_product__3[45]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[45]),
        .I3(shift_reg),
        .O(\result[7]_i_208_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_209 
       (.I0(wide_product__3[44]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[44]),
        .I3(shift_reg),
        .O(\result[7]_i_209_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_21 
       (.I0(rounded_mag[5]),
        .O(\result[7]_i_21_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_210 
       (.I0(rounded_mag[44]),
        .O(\result[7]_i_210_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_211 
       (.I0(rounded_mag[43]),
        .O(\result[7]_i_211_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_212 
       (.I0(rounded_mag[42]),
        .O(\result[7]_i_212_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_213 
       (.I0(rounded_mag[41]),
        .O(\result[7]_i_213_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_214 
       (.I0(wide_product__3[43]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[43]),
        .I3(shift_reg),
        .O(\result[7]_i_214_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_215 
       (.I0(wide_product__3[42]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[42]),
        .I3(shift_reg),
        .O(\result[7]_i_215_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_216 
       (.I0(wide_product__3[41]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[41]),
        .I3(shift_reg),
        .O(\result[7]_i_216_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_217 
       (.I0(wide_product__3[40]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[40]),
        .I3(shift_reg),
        .O(\result[7]_i_217_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_218 
       (.I0(rounded_mag[40]),
        .O(\result[7]_i_218_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_219 
       (.I0(rounded_mag[39]),
        .O(\result[7]_i_219_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_220 
       (.I0(rounded_mag[38]),
        .O(\result[7]_i_220_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_221 
       (.I0(rounded_mag[37]),
        .O(\result[7]_i_221_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_224 
       (.I0(wide_product__3[63]),
        .O(p_0_in[63]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_225 
       (.I0(wide_product__3[62]),
        .O(p_0_in[62]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_226 
       (.I0(wide_product__3[61]),
        .O(p_0_in[61]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_227 
       (.I0(wide_product__3[60]),
        .O(p_0_in[60]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_228 
       (.I0(wide_product__3[59]),
        .O(p_0_in[59]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_229 
       (.I0(wide_product__3[58]),
        .O(p_0_in[58]));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_23 
       (.I0(wide_product__0_n_76),
        .I1(p_1_in[63]),
        .O(\result[7]_i_23_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_230 
       (.I0(wide_product__3[57]),
        .O(p_0_in[57]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_231 
       (.I0(wide_product__3[56]),
        .O(p_0_in[56]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_232 
       (.I0(wide_product__3[55]),
        .O(p_0_in[55]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_233 
       (.I0(wide_product__3[54]),
        .O(p_0_in[54]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_234 
       (.I0(wide_product__3[53]),
        .O(p_0_in[53]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_235 
       (.I0(wide_product__3[44]),
        .O(p_0_in[44]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_236 
       (.I0(wide_product__3[43]),
        .O(p_0_in[43]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_237 
       (.I0(wide_product__3[42]),
        .O(p_0_in[42]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_238 
       (.I0(wide_product__3[41]),
        .O(p_0_in[41]));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_239 
       (.I0(p_1_in[43]),
        .I1(wide_product__0_n_96),
        .O(\result[7]_i_239_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_24 
       (.I0(p_1_in[62]),
        .I1(wide_product__0_n_77),
        .O(\result[7]_i_24_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_240 
       (.I0(p_1_in[42]),
        .I1(wide_product__0_n_97),
        .O(\result[7]_i_240_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_241 
       (.I0(p_1_in[41]),
        .I1(wide_product__0_n_98),
        .O(\result[7]_i_241_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_242 
       (.I0(p_1_in[40]),
        .I1(wide_product__0_n_99),
        .O(\result[7]_i_242_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_243 
       (.I0(p_1_in[12]),
        .O(p_0_in[12]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_244 
       (.I0(p_1_in[11]),
        .O(p_0_in[11]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_245 
       (.I0(p_1_in[10]),
        .O(p_0_in[10]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_246 
       (.I0(p_1_in[9]),
        .O(p_0_in[9]));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_247 
       (.I0(p_1_in[47]),
        .I1(wide_product__0_n_92),
        .O(\result[7]_i_247_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_248 
       (.I0(p_1_in[46]),
        .I1(wide_product__0_n_93),
        .O(\result[7]_i_248_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_249 
       (.I0(p_1_in[45]),
        .I1(wide_product__0_n_94),
        .O(\result[7]_i_249_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_25 
       (.I0(p_1_in[61]),
        .I1(wide_product__0_n_78),
        .O(\result[7]_i_25_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_250 
       (.I0(p_1_in[44]),
        .I1(wide_product__0_n_95),
        .O(\result[7]_i_250_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_252 
       (.I0(rounded0[37]),
        .I1(rounded0[36]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[36]),
        .I4(rounded_mag[37]),
        .O(\result[7]_i_252_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_253 
       (.I0(rounded0[35]),
        .I1(rounded0[34]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[34]),
        .I4(rounded_mag[35]),
        .O(\result[7]_i_253_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_254 
       (.I0(rounded0[33]),
        .I1(rounded0[32]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[32]),
        .I4(rounded_mag[33]),
        .O(\result[7]_i_254_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_255 
       (.I0(rounded0[31]),
        .I1(rounded0[30]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[30]),
        .I4(rounded_mag[31]),
        .O(\result[7]_i_255_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_256 
       (.I0(rounded0[36]),
        .I1(rounded0[37]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[37]),
        .I4(rounded_mag[36]),
        .O(\result[7]_i_256_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_257 
       (.I0(rounded0[34]),
        .I1(rounded0[35]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[35]),
        .I4(rounded_mag[34]),
        .O(\result[7]_i_257_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_258 
       (.I0(rounded0[32]),
        .I1(rounded0[33]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[33]),
        .I4(rounded_mag[32]),
        .O(\result[7]_i_258_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_259 
       (.I0(rounded0[30]),
        .I1(rounded0[31]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[31]),
        .I4(rounded_mag[30]),
        .O(\result[7]_i_259_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_26 
       (.I0(p_1_in[60]),
        .I1(wide_product__0_n_79),
        .O(\result[7]_i_26_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_261 
       (.I0(rounded0[23]),
        .I1(rounded0[22]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[22]),
        .I4(rounded_mag[23]),
        .O(\result[7]_i_261_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_262 
       (.I0(rounded0[21]),
        .I1(rounded0[20]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[20]),
        .I4(rounded_mag[21]),
        .O(\result[7]_i_262_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_263 
       (.I0(rounded0[19]),
        .I1(rounded0[18]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[18]),
        .I4(rounded_mag[19]),
        .O(\result[7]_i_263_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_264 
       (.I0(rounded0[17]),
        .I1(rounded0[16]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[16]),
        .I4(rounded_mag[17]),
        .O(\result[7]_i_264_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_265 
       (.I0(rounded0[22]),
        .I1(rounded0[23]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[23]),
        .I4(rounded_mag[22]),
        .O(\result[7]_i_265_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_266 
       (.I0(rounded0[20]),
        .I1(rounded0[21]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[21]),
        .I4(rounded_mag[20]),
        .O(\result[7]_i_266_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_267 
       (.I0(rounded0[18]),
        .I1(rounded0[19]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[19]),
        .I4(rounded_mag[18]),
        .O(\result[7]_i_267_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_268 
       (.I0(rounded0[16]),
        .I1(rounded0[17]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[17]),
        .I4(rounded_mag[16]),
        .O(\result[7]_i_268_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_27 
       (.I0(magnitude0[38]),
        .I1(wide_product__3[38]),
        .I2(shift_reg),
        .I3(magnitude0[7]),
        .I4(wide_product__3[63]),
        .I5(p_1_in[7]),
        .O(\result[7]_i_27_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_273 
       (.I0(wide_product__3[39]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[39]),
        .I3(shift_reg),
        .O(\result[7]_i_273_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_274 
       (.I0(wide_product__3[38]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[38]),
        .I3(shift_reg),
        .O(\result[7]_i_274_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_275 
       (.I0(wide_product__3[37]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[37]),
        .I3(shift_reg),
        .O(\result[7]_i_275_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_276 
       (.I0(wide_product__3[36]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[36]),
        .I3(shift_reg),
        .O(\result[7]_i_276_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_277 
       (.I0(rounded_mag[36]),
        .O(\result[7]_i_277_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_278 
       (.I0(rounded_mag[35]),
        .O(\result[7]_i_278_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_279 
       (.I0(rounded_mag[34]),
        .O(\result[7]_i_279_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_28 
       (.I0(magnitude0[37]),
        .I1(wide_product__3[37]),
        .I2(shift_reg),
        .I3(magnitude0[6]),
        .I4(wide_product__3[63]),
        .I5(p_1_in[6]),
        .O(\result[7]_i_28_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_280 
       (.I0(rounded_mag[33]),
        .O(\result[7]_i_280_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_281 
       (.I0(wide_product__3[35]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[35]),
        .I3(shift_reg),
        .O(\result[7]_i_281_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_282 
       (.I0(wide_product__3[34]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[34]),
        .I3(shift_reg),
        .O(\result[7]_i_282_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_283 
       (.I0(wide_product__3[33]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[33]),
        .I3(shift_reg),
        .O(\result[7]_i_283_n_0 ));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \result[7]_i_284 
       (.I0(magnitude0[63]),
        .I1(shift_reg),
        .I2(magnitude0[32]),
        .I3(wide_product__3[63]),
        .I4(wide_product__3[32]),
        .O(\result[7]_i_284_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_285 
       (.I0(rounded_mag[32]),
        .O(\result[7]_i_285_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_286 
       (.I0(rounded_mag[31]),
        .O(\result[7]_i_286_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_287 
       (.I0(rounded_mag[30]),
        .O(\result[7]_i_287_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_288 
       (.I0(rounded_mag[29]),
        .O(\result[7]_i_288_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_289 
       (.I0(wide_product__3[52]),
        .O(p_0_in[52]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_29 
       (.I0(magnitude0[36]),
        .I1(wide_product__3[36]),
        .I2(shift_reg),
        .I3(magnitude0[5]),
        .I4(wide_product__3[63]),
        .I5(p_1_in[5]),
        .O(\result[7]_i_29_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_290 
       (.I0(wide_product__3[51]),
        .O(p_0_in[51]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_291 
       (.I0(wide_product__3[50]),
        .O(p_0_in[50]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_292 
       (.I0(wide_product__3[49]),
        .O(p_0_in[49]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_293 
       (.I0(wide_product__3[48]),
        .O(p_0_in[48]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_294 
       (.I0(wide_product__3[47]),
        .O(p_0_in[47]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_295 
       (.I0(wide_product__3[46]),
        .O(p_0_in[46]));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_296 
       (.I0(wide_product__3[45]),
        .O(p_0_in[45]));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_298 
       (.I0(rounded0[29]),
        .I1(rounded0[28]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[28]),
        .I4(rounded_mag[29]),
        .O(\result[7]_i_298_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_299 
       (.I0(rounded0[27]),
        .I1(rounded0[26]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[26]),
        .I4(rounded_mag[27]),
        .O(\result[7]_i_299_n_0 ));
  LUT5 #(
    .INIT(32'h0000EFEA)) 
    \result[7]_i_3 
       (.I0(clipped2),
        .I1(rounded0[7]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[7]),
        .I4(clipped1),
        .O(clipped[7]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_30 
       (.I0(magnitude0[35]),
        .I1(wide_product__3[35]),
        .I2(shift_reg),
        .I3(magnitude0[4]),
        .I4(wide_product__3[63]),
        .I5(p_1_in[4]),
        .O(\result[7]_i_30_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_300 
       (.I0(rounded0[25]),
        .I1(rounded0[24]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[24]),
        .I4(rounded_mag[25]),
        .O(\result[7]_i_300_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_301 
       (.I0(rounded0[23]),
        .I1(rounded0[22]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[22]),
        .I4(rounded_mag[23]),
        .O(\result[7]_i_301_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_302 
       (.I0(rounded0[28]),
        .I1(rounded0[29]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[29]),
        .I4(rounded_mag[28]),
        .O(\result[7]_i_302_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_303 
       (.I0(rounded0[26]),
        .I1(rounded0[27]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[27]),
        .I4(rounded_mag[26]),
        .O(\result[7]_i_303_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_304 
       (.I0(rounded0[24]),
        .I1(rounded0[25]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[25]),
        .I4(rounded_mag[24]),
        .O(\result[7]_i_304_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_305 
       (.I0(rounded0[22]),
        .I1(rounded0[23]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[23]),
        .I4(rounded_mag[22]),
        .O(\result[7]_i_305_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_307 
       (.I0(rounded0[15]),
        .I1(rounded0[14]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[14]),
        .I4(rounded_mag[15]),
        .O(\result[7]_i_307_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_308 
       (.I0(rounded0[13]),
        .I1(rounded0[12]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[12]),
        .I4(rounded_mag[13]),
        .O(\result[7]_i_308_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_309 
       (.I0(rounded0[11]),
        .I1(rounded0[10]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[10]),
        .I4(rounded_mag[11]),
        .O(\result[7]_i_309_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_310 
       (.I0(rounded0[9]),
        .I1(rounded0[8]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[8]),
        .I4(rounded_mag[9]),
        .O(\result[7]_i_310_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_311 
       (.I0(rounded0[14]),
        .I1(rounded0[15]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[15]),
        .I4(rounded_mag[14]),
        .O(\result[7]_i_311_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_312 
       (.I0(rounded0[12]),
        .I1(rounded0[13]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[13]),
        .I4(rounded_mag[12]),
        .O(\result[7]_i_312_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_313 
       (.I0(rounded0[10]),
        .I1(rounded0[11]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[11]),
        .I4(rounded_mag[10]),
        .O(\result[7]_i_313_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_314 
       (.I0(rounded0[8]),
        .I1(rounded0[9]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[9]),
        .I4(rounded_mag[8]),
        .O(\result[7]_i_314_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_319 
       (.I0(magnitude0[62]),
        .I1(wide_product__3[62]),
        .I2(shift_reg),
        .I3(magnitude0[31]),
        .I4(wide_product__3[63]),
        .I5(wide_product__3[31]),
        .O(\result[7]_i_319_n_0 ));
  LUT5 #(
    .INIT(32'h20202F20)) 
    \result[7]_i_32 
       (.I0(rounded0[62]),
        .I1(rounded0[63]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[62]),
        .I4(rounded_mag[63]),
        .O(\result[7]_i_32_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_320 
       (.I0(magnitude0[61]),
        .I1(wide_product__3[61]),
        .I2(shift_reg),
        .I3(magnitude0[30]),
        .I4(wide_product__3[63]),
        .I5(wide_product__3[30]),
        .O(\result[7]_i_320_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_321 
       (.I0(magnitude0[60]),
        .I1(wide_product__3[60]),
        .I2(shift_reg),
        .I3(magnitude0[29]),
        .I4(wide_product__3[63]),
        .I5(wide_product__3[29]),
        .O(\result[7]_i_321_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_322 
       (.I0(magnitude0[59]),
        .I1(wide_product__3[59]),
        .I2(shift_reg),
        .I3(magnitude0[28]),
        .I4(wide_product__3[63]),
        .I5(wide_product__3[28]),
        .O(\result[7]_i_322_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_323 
       (.I0(rounded_mag[28]),
        .O(\result[7]_i_323_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_324 
       (.I0(rounded_mag[27]),
        .O(\result[7]_i_324_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_325 
       (.I0(rounded_mag[26]),
        .O(\result[7]_i_325_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_326 
       (.I0(rounded_mag[25]),
        .O(\result[7]_i_326_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_327 
       (.I0(magnitude0[58]),
        .I1(wide_product__3[58]),
        .I2(shift_reg),
        .I3(magnitude0[27]),
        .I4(wide_product__3[63]),
        .I5(wide_product__3[27]),
        .O(\result[7]_i_327_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_328 
       (.I0(magnitude0[57]),
        .I1(wide_product__3[57]),
        .I2(shift_reg),
        .I3(magnitude0[26]),
        .I4(wide_product__3[63]),
        .I5(wide_product__3[26]),
        .O(\result[7]_i_328_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_329 
       (.I0(magnitude0[56]),
        .I1(wide_product__3[56]),
        .I2(shift_reg),
        .I3(magnitude0[25]),
        .I4(wide_product__3[63]),
        .I5(wide_product__3[25]),
        .O(\result[7]_i_329_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_33 
       (.I0(rounded0[63]),
        .I1(rounded0[62]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[62]),
        .I4(rounded_mag[63]),
        .O(\result[7]_i_33_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_330 
       (.I0(magnitude0[55]),
        .I1(wide_product__3[55]),
        .I2(shift_reg),
        .I3(magnitude0[24]),
        .I4(wide_product__3[63]),
        .I5(wide_product__3[24]),
        .O(\result[7]_i_330_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_331 
       (.I0(rounded_mag[24]),
        .O(\result[7]_i_331_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_332 
       (.I0(rounded_mag[23]),
        .O(\result[7]_i_332_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_333 
       (.I0(rounded_mag[22]),
        .O(\result[7]_i_333_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_334 
       (.I0(rounded_mag[21]),
        .O(\result[7]_i_334_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_336 
       (.I0(rounded0[21]),
        .I1(rounded0[20]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[20]),
        .I4(rounded_mag[21]),
        .O(\result[7]_i_336_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_337 
       (.I0(rounded0[19]),
        .I1(rounded0[18]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[18]),
        .I4(rounded_mag[19]),
        .O(\result[7]_i_337_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_338 
       (.I0(rounded0[17]),
        .I1(rounded0[16]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[16]),
        .I4(rounded_mag[17]),
        .O(\result[7]_i_338_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_339 
       (.I0(rounded0[15]),
        .I1(rounded0[14]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[14]),
        .I4(rounded_mag[15]),
        .O(\result[7]_i_339_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_340 
       (.I0(rounded0[20]),
        .I1(rounded0[21]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[21]),
        .I4(rounded_mag[20]),
        .O(\result[7]_i_340_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_341 
       (.I0(rounded0[18]),
        .I1(rounded0[19]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[19]),
        .I4(rounded_mag[18]),
        .O(\result[7]_i_341_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_342 
       (.I0(rounded0[16]),
        .I1(rounded0[17]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[17]),
        .I4(rounded_mag[16]),
        .O(\result[7]_i_342_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_343 
       (.I0(rounded0[14]),
        .I1(rounded0[15]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[15]),
        .I4(rounded_mag[14]),
        .O(\result[7]_i_343_n_0 ));
  LUT3 #(
    .INIT(8'h47)) 
    \result[7]_i_344 
       (.I0(rounded0[7]),
        .I1(wide_product__3[63]),
        .I2(rounded_mag[7]),
        .O(\result[7]_i_344_n_0 ));
  LUT4 #(
    .INIT(16'h001D)) 
    \result[7]_i_345 
       (.I0(rounded_mag[1]),
        .I1(wide_product__3[63]),
        .I2(rounded0[1]),
        .I3(rounded_mag[0]),
        .O(\result[7]_i_345_n_0 ));
  LUT5 #(
    .INIT(32'h20202F20)) 
    \result[7]_i_346 
       (.I0(rounded0[7]),
        .I1(rounded0[6]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[7]),
        .I4(rounded_mag[6]),
        .O(\result[7]_i_346_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_347 
       (.I0(rounded0[5]),
        .I1(rounded0[4]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[4]),
        .I4(rounded_mag[5]),
        .O(\result[7]_i_347_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_348 
       (.I0(rounded0[3]),
        .I1(rounded0[2]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[2]),
        .I4(rounded_mag[3]),
        .O(\result[7]_i_348_n_0 ));
  LUT4 #(
    .INIT(16'h1D00)) 
    \result[7]_i_349 
       (.I0(rounded_mag[1]),
        .I1(wide_product__3[63]),
        .I2(rounded0[1]),
        .I3(rounded_mag[0]),
        .O(\result[7]_i_349_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_35 
       (.I0(rounded0[55]),
        .I1(rounded0[54]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[54]),
        .I4(rounded_mag[55]),
        .O(\result[7]_i_35_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_352 
       (.I0(magnitude0[54]),
        .I1(wide_product__3[54]),
        .I2(shift_reg),
        .I3(magnitude0[23]),
        .I4(wide_product__3[63]),
        .I5(wide_product__3[23]),
        .O(\result[7]_i_352_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_353 
       (.I0(magnitude0[53]),
        .I1(wide_product__3[53]),
        .I2(shift_reg),
        .I3(magnitude0[22]),
        .I4(wide_product__3[63]),
        .I5(wide_product__3[22]),
        .O(\result[7]_i_353_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_354 
       (.I0(magnitude0[52]),
        .I1(wide_product__3[52]),
        .I2(shift_reg),
        .I3(magnitude0[21]),
        .I4(wide_product__3[63]),
        .I5(wide_product__3[21]),
        .O(\result[7]_i_354_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_355 
       (.I0(magnitude0[51]),
        .I1(wide_product__3[51]),
        .I2(shift_reg),
        .I3(magnitude0[20]),
        .I4(wide_product__3[63]),
        .I5(wide_product__3[20]),
        .O(\result[7]_i_355_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_356 
       (.I0(rounded_mag[20]),
        .O(\result[7]_i_356_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_357 
       (.I0(rounded_mag[19]),
        .O(\result[7]_i_357_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_358 
       (.I0(rounded_mag[18]),
        .O(\result[7]_i_358_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_359 
       (.I0(rounded_mag[17]),
        .O(\result[7]_i_359_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_36 
       (.I0(rounded0[53]),
        .I1(rounded0[52]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[52]),
        .I4(rounded_mag[53]),
        .O(\result[7]_i_36_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_360 
       (.I0(magnitude0[50]),
        .I1(wide_product__3[50]),
        .I2(shift_reg),
        .I3(magnitude0[19]),
        .I4(wide_product__3[63]),
        .I5(wide_product__3[19]),
        .O(\result[7]_i_360_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_361 
       (.I0(magnitude0[49]),
        .I1(wide_product__3[49]),
        .I2(shift_reg),
        .I3(magnitude0[18]),
        .I4(wide_product__3[63]),
        .I5(wide_product__3[18]),
        .O(\result[7]_i_361_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_362 
       (.I0(magnitude0[48]),
        .I1(wide_product__3[48]),
        .I2(shift_reg),
        .I3(magnitude0[17]),
        .I4(wide_product__3[63]),
        .I5(wide_product__3[17]),
        .O(\result[7]_i_362_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_363 
       (.I0(magnitude0[47]),
        .I1(wide_product__3[47]),
        .I2(shift_reg),
        .I3(magnitude0[16]),
        .I4(wide_product__3[63]),
        .I5(wide_product__3[16]),
        .O(\result[7]_i_363_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_364 
       (.I0(rounded_mag[16]),
        .O(\result[7]_i_364_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_365 
       (.I0(rounded_mag[15]),
        .O(\result[7]_i_365_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_366 
       (.I0(rounded_mag[14]),
        .O(\result[7]_i_366_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_367 
       (.I0(rounded_mag[13]),
        .O(\result[7]_i_367_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_368 
       (.I0(rounded0[13]),
        .I1(rounded0[12]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[12]),
        .I4(rounded_mag[13]),
        .O(\result[7]_i_368_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_369 
       (.I0(rounded0[11]),
        .I1(rounded0[10]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[10]),
        .I4(rounded_mag[11]),
        .O(\result[7]_i_369_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_37 
       (.I0(rounded0[51]),
        .I1(rounded0[50]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[50]),
        .I4(rounded_mag[51]),
        .O(\result[7]_i_37_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_370 
       (.I0(rounded0[9]),
        .I1(rounded0[8]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[8]),
        .I4(rounded_mag[9]),
        .O(\result[7]_i_370_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \result[7]_i_371 
       (.I0(rounded0[7]),
        .I1(wide_product__3[63]),
        .I2(rounded_mag[7]),
        .O(\result[7]_i_371_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_372 
       (.I0(rounded0[12]),
        .I1(rounded0[13]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[13]),
        .I4(rounded_mag[12]),
        .O(\result[7]_i_372_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_373 
       (.I0(rounded0[10]),
        .I1(rounded0[11]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[11]),
        .I4(rounded_mag[10]),
        .O(\result[7]_i_373_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_374 
       (.I0(rounded0[8]),
        .I1(rounded0[9]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[9]),
        .I4(rounded_mag[8]),
        .O(\result[7]_i_374_n_0 ));
  LUT5 #(
    .INIT(32'h20202F20)) 
    \result[7]_i_375 
       (.I0(rounded0[6]),
        .I1(rounded0[7]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[6]),
        .I4(rounded_mag[7]),
        .O(\result[7]_i_375_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_376 
       (.I0(magnitude0[46]),
        .I1(wide_product__3[46]),
        .I2(shift_reg),
        .I3(magnitude0[15]),
        .I4(wide_product__3[63]),
        .I5(p_1_in[15]),
        .O(\result[7]_i_376_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_377 
       (.I0(magnitude0[45]),
        .I1(wide_product__3[45]),
        .I2(shift_reg),
        .I3(magnitude0[14]),
        .I4(wide_product__3[63]),
        .I5(p_1_in[14]),
        .O(\result[7]_i_377_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_378 
       (.I0(magnitude0[44]),
        .I1(wide_product__3[44]),
        .I2(shift_reg),
        .I3(magnitude0[13]),
        .I4(wide_product__3[63]),
        .I5(p_1_in[13]),
        .O(\result[7]_i_378_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \result[7]_i_379 
       (.I0(magnitude0[43]),
        .I1(wide_product__3[43]),
        .I2(shift_reg),
        .I3(magnitude0[12]),
        .I4(wide_product__3[63]),
        .I5(p_1_in[12]),
        .O(\result[7]_i_379_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_38 
       (.I0(rounded0[49]),
        .I1(rounded0[48]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[48]),
        .I4(rounded_mag[49]),
        .O(\result[7]_i_38_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_380 
       (.I0(rounded_mag[12]),
        .O(\result[7]_i_380_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_381 
       (.I0(rounded_mag[11]),
        .O(\result[7]_i_381_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_382 
       (.I0(rounded_mag[10]),
        .O(\result[7]_i_382_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_383 
       (.I0(rounded_mag[9]),
        .O(\result[7]_i_383_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_39 
       (.I0(rounded0[54]),
        .I1(rounded0[55]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[55]),
        .I4(rounded_mag[54]),
        .O(\result[7]_i_39_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_40 
       (.I0(rounded0[52]),
        .I1(rounded0[53]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[53]),
        .I4(rounded_mag[52]),
        .O(\result[7]_i_40_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_41 
       (.I0(rounded0[50]),
        .I1(rounded0[51]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[51]),
        .I4(rounded_mag[50]),
        .O(\result[7]_i_41_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_42 
       (.I0(rounded0[48]),
        .I1(rounded0[49]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[49]),
        .I4(rounded_mag[48]),
        .O(\result[7]_i_42_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_50 
       (.I0(p_1_in[59]),
        .I1(wide_product__0_n_80),
        .O(\result[7]_i_50_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_51 
       (.I0(p_1_in[58]),
        .I1(wide_product__0_n_81),
        .O(\result[7]_i_51_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_52 
       (.I0(p_1_in[57]),
        .I1(wide_product__0_n_82),
        .O(\result[7]_i_52_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \result[7]_i_53 
       (.I0(p_1_in[56]),
        .I1(wide_product__0_n_83),
        .O(\result[7]_i_53_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_61 
       (.I0(rounded0[61]),
        .I1(rounded0[60]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[60]),
        .I4(rounded_mag[61]),
        .O(\result[7]_i_61_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_62 
       (.I0(rounded0[59]),
        .I1(rounded0[58]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[58]),
        .I4(rounded_mag[59]),
        .O(\result[7]_i_62_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_63 
       (.I0(rounded0[57]),
        .I1(rounded0[56]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[56]),
        .I4(rounded_mag[57]),
        .O(\result[7]_i_63_n_0 ));
  LUT5 #(
    .INIT(32'hEFEFEFE0)) 
    \result[7]_i_64 
       (.I0(rounded0[55]),
        .I1(rounded0[54]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[54]),
        .I4(rounded_mag[55]),
        .O(\result[7]_i_64_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_65 
       (.I0(rounded0[60]),
        .I1(rounded0[61]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[61]),
        .I4(rounded_mag[60]),
        .O(\result[7]_i_65_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_66 
       (.I0(rounded0[58]),
        .I1(rounded0[59]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[59]),
        .I4(rounded_mag[58]),
        .O(\result[7]_i_66_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_67 
       (.I0(rounded0[56]),
        .I1(rounded0[57]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[57]),
        .I4(rounded_mag[56]),
        .O(\result[7]_i_67_n_0 ));
  LUT5 #(
    .INIT(32'h1010101F)) 
    \result[7]_i_68 
       (.I0(rounded0[54]),
        .I1(rounded0[55]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[55]),
        .I4(rounded_mag[54]),
        .O(\result[7]_i_68_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_70 
       (.I0(rounded0[47]),
        .I1(rounded0[46]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[46]),
        .I4(rounded_mag[47]),
        .O(\result[7]_i_70_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_71 
       (.I0(rounded0[45]),
        .I1(rounded0[44]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[44]),
        .I4(rounded_mag[45]),
        .O(\result[7]_i_71_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_72 
       (.I0(rounded0[43]),
        .I1(rounded0[42]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[42]),
        .I4(rounded_mag[43]),
        .O(\result[7]_i_72_n_0 ));
  LUT5 #(
    .INIT(32'h707F7F7F)) 
    \result[7]_i_73 
       (.I0(rounded0[41]),
        .I1(rounded0[40]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[40]),
        .I4(rounded_mag[41]),
        .O(\result[7]_i_73_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_74 
       (.I0(rounded0[46]),
        .I1(rounded0[47]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[47]),
        .I4(rounded_mag[46]),
        .O(\result[7]_i_74_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_75 
       (.I0(rounded0[44]),
        .I1(rounded0[45]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[45]),
        .I4(rounded_mag[44]),
        .O(\result[7]_i_75_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_76 
       (.I0(rounded0[42]),
        .I1(rounded0[43]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[43]),
        .I4(rounded_mag[42]),
        .O(\result[7]_i_76_n_0 ));
  LUT5 #(
    .INIT(32'h8F808080)) 
    \result[7]_i_77 
       (.I0(rounded0[40]),
        .I1(rounded0[41]),
        .I2(wide_product__3[63]),
        .I3(rounded_mag[41]),
        .I4(rounded_mag[40]),
        .O(\result[7]_i_77_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_82 
       (.I0(rounded_mag[63]),
        .O(\result[7]_i_82_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_83 
       (.I0(rounded_mag[62]),
        .O(\result[7]_i_83_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_84 
       (.I0(rounded_mag[61]),
        .O(\result[7]_i_84_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \result[7]_i_85 
       (.I0(magnitude0[63]),
        .I1(wide_product__3[63]),
        .I2(shift_reg),
        .O(\result[7]_i_85_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_86 
       (.I0(wide_product__3[62]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[62]),
        .I3(shift_reg),
        .O(\result[7]_i_86_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_87 
       (.I0(wide_product__3[61]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[61]),
        .I3(shift_reg),
        .O(\result[7]_i_87_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_88 
       (.I0(wide_product__3[60]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[60]),
        .I3(shift_reg),
        .O(\result[7]_i_88_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_89 
       (.I0(rounded_mag[60]),
        .O(\result[7]_i_89_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_90 
       (.I0(rounded_mag[59]),
        .O(\result[7]_i_90_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_91 
       (.I0(rounded_mag[58]),
        .O(\result[7]_i_91_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_92 
       (.I0(rounded_mag[57]),
        .O(\result[7]_i_92_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_93 
       (.I0(wide_product__3[59]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[59]),
        .I3(shift_reg),
        .O(\result[7]_i_93_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_94 
       (.I0(wide_product__3[58]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[58]),
        .I3(shift_reg),
        .O(\result[7]_i_94_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_95 
       (.I0(wide_product__3[57]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[57]),
        .I3(shift_reg),
        .O(\result[7]_i_95_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \result[7]_i_96 
       (.I0(wide_product__3[56]),
        .I1(wide_product__3[63]),
        .I2(magnitude0[56]),
        .I3(shift_reg),
        .O(\result[7]_i_96_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_97 
       (.I0(rounded_mag[56]),
        .O(\result[7]_i_97_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_98 
       (.I0(rounded_mag[55]),
        .O(\result[7]_i_98_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_99 
       (.I0(rounded_mag[54]),
        .O(\result[7]_i_99_n_0 ));
  FDRE \result_reg[0] 
       (.C(clk),
        .CE(busy0),
        .D(clipped[0]),
        .Q(result[0]),
        .R(\result[7]_i_1_n_0 ));
  FDRE \result_reg[1] 
       (.C(clk),
        .CE(busy0),
        .D(clipped[1]),
        .Q(result[1]),
        .R(\result[7]_i_1_n_0 ));
  FDRE \result_reg[2] 
       (.C(clk),
        .CE(busy0),
        .D(clipped[2]),
        .Q(result[2]),
        .R(\result[7]_i_1_n_0 ));
  FDRE \result_reg[3] 
       (.C(clk),
        .CE(busy0),
        .D(clipped[3]),
        .Q(result[3]),
        .R(\result[7]_i_1_n_0 ));
  CARRY4 \result_reg[3]_i_10 
       (.CI(\result_reg[3]_i_23_n_0 ),
        .CO({increment2,\result_reg[3]_i_10_n_2 ,\result_reg[3]_i_10_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({\<const0> ,\result[3]_i_24_n_0 ,\result[3]_i_25_n_0 ,\result[3]_i_26_n_0 }));
  CARRY4 \result_reg[3]_i_12 
       (.CI(\result_reg[3]_i_27_n_0 ),
        .CO({increment10_in,\result_reg[3]_i_12_n_1 ,\result_reg[3]_i_12_n_2 ,\result_reg[3]_i_12_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\result[3]_i_28_n_0 ,\result[3]_i_29_n_0 ,\result[3]_i_30_n_0 }),
        .S({\result[3]_i_31_n_0 ,\result[3]_i_32_n_0 ,\result[3]_i_33_n_0 ,\result[3]_i_34_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[3]_i_13 
       (.CI(\result_reg[3]_i_35_n_0 ),
        .CO({\result_reg[3]_i_13_n_0 ,\result_reg[3]_i_13_n_1 ,\result_reg[3]_i_13_n_2 ,\result_reg[3]_i_13_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(magnitude0[28:25]),
        .S(p_0_in[28:25]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[3]_i_18 
       (.CI(\result_reg[3]_i_40_n_0 ),
        .CO({\result_reg[3]_i_18_n_0 ,\result_reg[3]_i_18_n_1 ,\result_reg[3]_i_18_n_2 ,\result_reg[3]_i_18_n_3 }),
        .CYINIT(\<const0> ),
        .DI(p_1_in[27:24]),
        .O(wide_product__3[27:24]),
        .S({\result[3]_i_41_n_0 ,\result[3]_i_42_n_0 ,\result[3]_i_43_n_0 ,\result[3]_i_44_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[3]_i_2 
       (.CI(\<const0> ),
        .CO({\result_reg[3]_i_2_n_0 ,\result_reg[3]_i_2_n_1 ,\result_reg[3]_i_2_n_2 ,\result_reg[3]_i_2_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\result[3]_i_3_n_0 }),
        .O(rounded_mag[3:0]),
        .S({\result[3]_i_4_n_0 ,\result[3]_i_5_n_0 ,\result[3]_i_6_n_0 ,\result[3]_i_7_n_0 }));
  CARRY4 \result_reg[3]_i_23 
       (.CI(\result_reg[3]_i_45_n_0 ),
        .CO({\result_reg[3]_i_23_n_0 ,\result_reg[3]_i_23_n_1 ,\result_reg[3]_i_23_n_2 ,\result_reg[3]_i_23_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({\result[3]_i_46_n_0 ,\result[3]_i_47_n_0 ,\result[3]_i_48_n_0 ,\result[3]_i_49_n_0 }));
  CARRY4 \result_reg[3]_i_27 
       (.CI(\result_reg[3]_i_52_n_0 ),
        .CO({\result_reg[3]_i_27_n_0 ,\result_reg[3]_i_27_n_1 ,\result_reg[3]_i_27_n_2 ,\result_reg[3]_i_27_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\result[3]_i_53_n_0 ,\result[3]_i_54_n_0 ,\result[3]_i_55_n_0 ,\result[3]_i_56_n_0 }),
        .S({\result[3]_i_57_n_0 ,\result[3]_i_58_n_0 ,\result[3]_i_59_n_0 ,\result[3]_i_60_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[3]_i_35 
       (.CI(\result_reg[3]_i_61_n_0 ),
        .CO({\result_reg[3]_i_35_n_0 ,\result_reg[3]_i_35_n_1 ,\result_reg[3]_i_35_n_2 ,\result_reg[3]_i_35_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(magnitude0[24:21]),
        .S(p_0_in[24:21]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[3]_i_40 
       (.CI(\result_reg[3]_i_66_n_0 ),
        .CO({\result_reg[3]_i_40_n_0 ,\result_reg[3]_i_40_n_1 ,\result_reg[3]_i_40_n_2 ,\result_reg[3]_i_40_n_3 }),
        .CYINIT(\<const0> ),
        .DI(p_1_in[23:20]),
        .O(wide_product__3[23:20]),
        .S({\result[3]_i_67_n_0 ,\result[3]_i_68_n_0 ,\result[3]_i_69_n_0 ,\result[3]_i_70_n_0 }));
  CARRY4 \result_reg[3]_i_45 
       (.CI(\<const0> ),
        .CO({\result_reg[3]_i_45_n_0 ,\result_reg[3]_i_45_n_1 ,\result_reg[3]_i_45_n_2 ,\result_reg[3]_i_45_n_3 }),
        .CYINIT(\<const1> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .S({\result[3]_i_71_n_0 ,\result[3]_i_72_n_0 ,\result[3]_i_73_n_0 ,\result[3]_i_74_n_0 }));
  CARRY4 \result_reg[3]_i_52 
       (.CI(\result_reg[3]_i_80_n_0 ),
        .CO({\result_reg[3]_i_52_n_0 ,\result_reg[3]_i_52_n_1 ,\result_reg[3]_i_52_n_2 ,\result_reg[3]_i_52_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\result[3]_i_81_n_0 ,\result[3]_i_82_n_0 ,\result[3]_i_83_n_0 ,\result[3]_i_84_n_0 }),
        .S({\result[3]_i_85_n_0 ,\result[3]_i_86_n_0 ,\result[3]_i_87_n_0 ,\result[3]_i_88_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[3]_i_61 
       (.CI(\result_reg[3]_i_78_n_0 ),
        .CO({\result_reg[3]_i_61_n_0 ,\result_reg[3]_i_61_n_1 ,\result_reg[3]_i_61_n_2 ,\result_reg[3]_i_61_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(magnitude0[20:17]),
        .S(p_0_in[20:17]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[3]_i_66 
       (.CI(\<const0> ),
        .CO({\result_reg[3]_i_66_n_0 ,\result_reg[3]_i_66_n_1 ,\result_reg[3]_i_66_n_2 ,\result_reg[3]_i_66_n_3 }),
        .CYINIT(\<const0> ),
        .DI({p_1_in[19:17],\<const0> }),
        .O(wide_product__3[19:16]),
        .S({\result[3]_i_93_n_0 ,\result[3]_i_94_n_0 ,\result[3]_i_95_n_0 ,p_1_in[16]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[3]_i_78 
       (.CI(\result_reg[7]_i_178_n_0 ),
        .CO({\result_reg[3]_i_78_n_0 ,\result_reg[3]_i_78_n_1 ,\result_reg[3]_i_78_n_2 ,\result_reg[3]_i_78_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(magnitude0[16:13]),
        .S(p_0_in[16:13]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[3]_i_8 
       (.CI(\result_reg[3]_i_13_n_0 ),
        .CO({\result_reg[3]_i_8_n_0 ,\result_reg[3]_i_8_n_1 ,\result_reg[3]_i_8_n_2 ,\result_reg[3]_i_8_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(magnitude0[32:29]),
        .S(p_0_in[32:29]));
  CARRY4 \result_reg[3]_i_80 
       (.CI(\<const0> ),
        .CO({\result_reg[3]_i_80_n_0 ,\result_reg[3]_i_80_n_1 ,\result_reg[3]_i_80_n_2 ,\result_reg[3]_i_80_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\result[3]_i_105_n_0 ,\result[3]_i_106_n_0 ,\result[3]_i_107_n_0 ,\result[3]_i_108_n_0 }),
        .S({\result[3]_i_109_n_0 ,\result[3]_i_110_n_0 ,\result[3]_i_111_n_0 ,\result[3]_i_112_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[3]_i_9 
       (.CI(\result_reg[3]_i_18_n_0 ),
        .CO({\result_reg[3]_i_9_n_0 ,\result_reg[3]_i_9_n_1 ,\result_reg[3]_i_9_n_2 ,\result_reg[3]_i_9_n_3 }),
        .CYINIT(\<const0> ),
        .DI(p_1_in[31:28]),
        .O(wide_product__3[31:28]),
        .S({\result[3]_i_19_n_0 ,\result[3]_i_20_n_0 ,\result[3]_i_21_n_0 ,\result[3]_i_22_n_0 }));
  FDRE \result_reg[4] 
       (.C(clk),
        .CE(busy0),
        .D(clipped[4]),
        .Q(result[4]),
        .R(\result[7]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[4]_i_2 
       (.CI(\<const0> ),
        .CO({\result_reg[4]_i_2_n_0 ,\result_reg[4]_i_2_n_1 ,\result_reg[4]_i_2_n_2 ,\result_reg[4]_i_2_n_3 }),
        .CYINIT(\result[4]_i_3_n_0 ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded0[4:1]),
        .S({\result[4]_i_4_n_0 ,\result[4]_i_5_n_0 ,\result[4]_i_6_n_0 ,\result[4]_i_7_n_0 }));
  FDRE \result_reg[5] 
       (.C(clk),
        .CE(busy0),
        .D(clipped[5]),
        .Q(result[5]),
        .R(\result[7]_i_1_n_0 ));
  FDRE \result_reg[6] 
       (.C(clk),
        .CE(busy0),
        .D(clipped[6]),
        .Q(result[6]),
        .R(\result[7]_i_1_n_0 ));
  FDRE \result_reg[7] 
       (.C(clk),
        .CE(busy0),
        .D(clipped[7]),
        .Q(result[7]),
        .R(\result[7]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_105 
       (.CI(\result_reg[7]_i_179_n_0 ),
        .CO({\result_reg[7]_i_105_n_0 ,\result_reg[7]_i_105_n_1 ,\result_reg[7]_i_105_n_2 ,\result_reg[7]_i_105_n_3 }),
        .CYINIT(\<const0> ),
        .DI(p_1_in[51:48]),
        .O(wide_product__3[51:48]),
        .S({\result[7]_i_180_n_0 ,\result[7]_i_181_n_0 ,\result[7]_i_182_n_0 ,\result[7]_i_183_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_135 
       (.CI(\result_reg[7]_i_184_n_0 ),
        .CO({\result_reg[7]_i_135_n_0 ,\result_reg[7]_i_135_n_1 ,\result_reg[7]_i_135_n_2 ,\result_reg[7]_i_135_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\result[7]_i_185_n_0 ,\result[7]_i_186_n_0 ,\result[7]_i_187_n_0 ,\result[7]_i_188_n_0 }),
        .S({\result[7]_i_189_n_0 ,\result[7]_i_190_n_0 ,\result[7]_i_191_n_0 ,\result[7]_i_192_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_144 
       (.CI(\result_reg[7]_i_193_n_0 ),
        .CO({\result_reg[7]_i_144_n_0 ,\result_reg[7]_i_144_n_1 ,\result_reg[7]_i_144_n_2 ,\result_reg[7]_i_144_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\result[7]_i_194_n_0 ,\result[7]_i_195_n_0 ,\result[7]_i_196_n_0 ,\result[7]_i_197_n_0 }),
        .S({\result[7]_i_198_n_0 ,\result[7]_i_199_n_0 ,\result[7]_i_200_n_0 ,\result[7]_i_201_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_153 
       (.CI(\result_reg[7]_i_155_n_0 ),
        .CO({\result_reg[7]_i_153_n_0 ,\result_reg[7]_i_153_n_1 ,\result_reg[7]_i_153_n_2 ,\result_reg[7]_i_153_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded_mag[47:44]),
        .S({\result[7]_i_206_n_0 ,\result[7]_i_207_n_0 ,\result[7]_i_208_n_0 ,\result[7]_i_209_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_154 
       (.CI(\result_reg[7]_i_156_n_0 ),
        .CO({\result_reg[7]_i_154_n_0 ,\result_reg[7]_i_154_n_1 ,\result_reg[7]_i_154_n_2 ,\result_reg[7]_i_154_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded0[44:41]),
        .S({\result[7]_i_210_n_0 ,\result[7]_i_211_n_0 ,\result[7]_i_212_n_0 ,\result[7]_i_213_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_155 
       (.CI(\result_reg[7]_i_202_n_0 ),
        .CO({\result_reg[7]_i_155_n_0 ,\result_reg[7]_i_155_n_1 ,\result_reg[7]_i_155_n_2 ,\result_reg[7]_i_155_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded_mag[43:40]),
        .S({\result[7]_i_214_n_0 ,\result[7]_i_215_n_0 ,\result[7]_i_216_n_0 ,\result[7]_i_217_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_156 
       (.CI(\result_reg[7]_i_203_n_0 ),
        .CO({\result_reg[7]_i_156_n_0 ,\result_reg[7]_i_156_n_1 ,\result_reg[7]_i_156_n_2 ,\result_reg[7]_i_156_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded0[40:37]),
        .S({\result[7]_i_218_n_0 ,\result[7]_i_219_n_0 ,\result[7]_i_220_n_0 ,\result[7]_i_221_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_173 
       (.CI(\result_reg[7]_i_174_n_0 ),
        .CO({\result_reg[7]_i_173_n_2 ,\result_reg[7]_i_173_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(magnitude0[63:61]),
        .S({\<const0> ,p_0_in[63:61]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_174 
       (.CI(\result_reg[7]_i_175_n_0 ),
        .CO({\result_reg[7]_i_174_n_0 ,\result_reg[7]_i_174_n_1 ,\result_reg[7]_i_174_n_2 ,\result_reg[7]_i_174_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(magnitude0[60:57]),
        .S(p_0_in[60:57]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_175 
       (.CI(\result_reg[7]_i_222_n_0 ),
        .CO({\result_reg[7]_i_175_n_0 ,\result_reg[7]_i_175_n_1 ,\result_reg[7]_i_175_n_2 ,\result_reg[7]_i_175_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(magnitude0[56:53]),
        .S(p_0_in[56:53]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_176 
       (.CI(\result_reg[7]_i_54_n_0 ),
        .CO({\result_reg[7]_i_176_n_0 ,\result_reg[7]_i_176_n_1 ,\result_reg[7]_i_176_n_2 ,\result_reg[7]_i_176_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(magnitude0[44:41]),
        .S(p_0_in[44:41]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_177 
       (.CI(\result_reg[7]_i_55_n_0 ),
        .CO({\result_reg[7]_i_177_n_0 ,\result_reg[7]_i_177_n_1 ,\result_reg[7]_i_177_n_2 ,\result_reg[7]_i_177_n_3 }),
        .CYINIT(\<const0> ),
        .DI(p_1_in[43:40]),
        .O(wide_product__3[43:40]),
        .S({\result[7]_i_239_n_0 ,\result[7]_i_240_n_0 ,\result[7]_i_241_n_0 ,\result[7]_i_242_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_178 
       (.CI(\result_reg[7]_i_56_n_0 ),
        .CO({\result_reg[7]_i_178_n_0 ,\result_reg[7]_i_178_n_1 ,\result_reg[7]_i_178_n_2 ,\result_reg[7]_i_178_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(magnitude0[12:9]),
        .S(p_0_in[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_179 
       (.CI(\result_reg[7]_i_177_n_0 ),
        .CO({\result_reg[7]_i_179_n_0 ,\result_reg[7]_i_179_n_1 ,\result_reg[7]_i_179_n_2 ,\result_reg[7]_i_179_n_3 }),
        .CYINIT(\<const0> ),
        .DI(p_1_in[47:44]),
        .O(wide_product__3[47:44]),
        .S({\result[7]_i_247_n_0 ,\result[7]_i_248_n_0 ,\result[7]_i_249_n_0 ,\result[7]_i_250_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_184 
       (.CI(\result_reg[7]_i_251_n_0 ),
        .CO({\result_reg[7]_i_184_n_0 ,\result_reg[7]_i_184_n_1 ,\result_reg[7]_i_184_n_2 ,\result_reg[7]_i_184_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\result[7]_i_252_n_0 ,\result[7]_i_253_n_0 ,\result[7]_i_254_n_0 ,\result[7]_i_255_n_0 }),
        .S({\result[7]_i_256_n_0 ,\result[7]_i_257_n_0 ,\result[7]_i_258_n_0 ,\result[7]_i_259_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_193 
       (.CI(\result_reg[7]_i_260_n_0 ),
        .CO({\result_reg[7]_i_193_n_0 ,\result_reg[7]_i_193_n_1 ,\result_reg[7]_i_193_n_2 ,\result_reg[7]_i_193_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\result[7]_i_261_n_0 ,\result[7]_i_262_n_0 ,\result[7]_i_263_n_0 ,\result[7]_i_264_n_0 }),
        .S({\result[7]_i_265_n_0 ,\result[7]_i_266_n_0 ,\result[7]_i_267_n_0 ,\result[7]_i_268_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_202 
       (.CI(\result_reg[7]_i_204_n_0 ),
        .CO({\result_reg[7]_i_202_n_0 ,\result_reg[7]_i_202_n_1 ,\result_reg[7]_i_202_n_2 ,\result_reg[7]_i_202_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded_mag[39:36]),
        .S({\result[7]_i_273_n_0 ,\result[7]_i_274_n_0 ,\result[7]_i_275_n_0 ,\result[7]_i_276_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_203 
       (.CI(\result_reg[7]_i_205_n_0 ),
        .CO({\result_reg[7]_i_203_n_0 ,\result_reg[7]_i_203_n_1 ,\result_reg[7]_i_203_n_2 ,\result_reg[7]_i_203_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded0[36:33]),
        .S({\result[7]_i_277_n_0 ,\result[7]_i_278_n_0 ,\result[7]_i_279_n_0 ,\result[7]_i_280_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_204 
       (.CI(\result_reg[7]_i_269_n_0 ),
        .CO({\result_reg[7]_i_204_n_0 ,\result_reg[7]_i_204_n_1 ,\result_reg[7]_i_204_n_2 ,\result_reg[7]_i_204_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded_mag[35:32]),
        .S({\result[7]_i_281_n_0 ,\result[7]_i_282_n_0 ,\result[7]_i_283_n_0 ,\result[7]_i_284_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_205 
       (.CI(\result_reg[7]_i_270_n_0 ),
        .CO({\result_reg[7]_i_205_n_0 ,\result_reg[7]_i_205_n_1 ,\result_reg[7]_i_205_n_2 ,\result_reg[7]_i_205_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded0[32:29]),
        .S({\result[7]_i_285_n_0 ,\result[7]_i_286_n_0 ,\result[7]_i_287_n_0 ,\result[7]_i_288_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_22 
       (.CI(\result_reg[7]_i_49_n_0 ),
        .CO({\result_reg[7]_i_22_n_0 ,\result_reg[7]_i_22_n_1 ,\result_reg[7]_i_22_n_2 ,\result_reg[7]_i_22_n_3 }),
        .CYINIT(\<const0> ),
        .DI(p_1_in[59:56]),
        .O(wide_product__3[59:56]),
        .S({\result[7]_i_50_n_0 ,\result[7]_i_51_n_0 ,\result[7]_i_52_n_0 ,\result[7]_i_53_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_222 
       (.CI(\result_reg[7]_i_223_n_0 ),
        .CO({\result_reg[7]_i_222_n_0 ,\result_reg[7]_i_222_n_1 ,\result_reg[7]_i_222_n_2 ,\result_reg[7]_i_222_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(magnitude0[52:49]),
        .S(p_0_in[52:49]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_223 
       (.CI(\result_reg[7]_i_176_n_0 ),
        .CO({\result_reg[7]_i_223_n_0 ,\result_reg[7]_i_223_n_1 ,\result_reg[7]_i_223_n_2 ,\result_reg[7]_i_223_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(magnitude0[48:45]),
        .S(p_0_in[48:45]));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_251 
       (.CI(\result_reg[7]_i_297_n_0 ),
        .CO({\result_reg[7]_i_251_n_0 ,\result_reg[7]_i_251_n_1 ,\result_reg[7]_i_251_n_2 ,\result_reg[7]_i_251_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\result[7]_i_298_n_0 ,\result[7]_i_299_n_0 ,\result[7]_i_300_n_0 ,\result[7]_i_301_n_0 }),
        .S({\result[7]_i_302_n_0 ,\result[7]_i_303_n_0 ,\result[7]_i_304_n_0 ,\result[7]_i_305_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_260 
       (.CI(\result_reg[7]_i_306_n_0 ),
        .CO({\result_reg[7]_i_260_n_0 ,\result_reg[7]_i_260_n_1 ,\result_reg[7]_i_260_n_2 ,\result_reg[7]_i_260_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\result[7]_i_307_n_0 ,\result[7]_i_308_n_0 ,\result[7]_i_309_n_0 ,\result[7]_i_310_n_0 }),
        .S({\result[7]_i_311_n_0 ,\result[7]_i_312_n_0 ,\result[7]_i_313_n_0 ,\result[7]_i_314_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_269 
       (.CI(\result_reg[7]_i_271_n_0 ),
        .CO({\result_reg[7]_i_269_n_0 ,\result_reg[7]_i_269_n_1 ,\result_reg[7]_i_269_n_2 ,\result_reg[7]_i_269_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded_mag[31:28]),
        .S({\result[7]_i_319_n_0 ,\result[7]_i_320_n_0 ,\result[7]_i_321_n_0 ,\result[7]_i_322_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_270 
       (.CI(\result_reg[7]_i_272_n_0 ),
        .CO({\result_reg[7]_i_270_n_0 ,\result_reg[7]_i_270_n_1 ,\result_reg[7]_i_270_n_2 ,\result_reg[7]_i_270_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded0[28:25]),
        .S({\result[7]_i_323_n_0 ,\result[7]_i_324_n_0 ,\result[7]_i_325_n_0 ,\result[7]_i_326_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_271 
       (.CI(\result_reg[7]_i_315_n_0 ),
        .CO({\result_reg[7]_i_271_n_0 ,\result_reg[7]_i_271_n_1 ,\result_reg[7]_i_271_n_2 ,\result_reg[7]_i_271_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded_mag[27:24]),
        .S({\result[7]_i_327_n_0 ,\result[7]_i_328_n_0 ,\result[7]_i_329_n_0 ,\result[7]_i_330_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_272 
       (.CI(\result_reg[7]_i_316_n_0 ),
        .CO({\result_reg[7]_i_272_n_0 ,\result_reg[7]_i_272_n_1 ,\result_reg[7]_i_272_n_2 ,\result_reg[7]_i_272_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded0[24:21]),
        .S({\result[7]_i_331_n_0 ,\result[7]_i_332_n_0 ,\result[7]_i_333_n_0 ,\result[7]_i_334_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_297 
       (.CI(\result_reg[7]_i_335_n_0 ),
        .CO({\result_reg[7]_i_297_n_0 ,\result_reg[7]_i_297_n_1 ,\result_reg[7]_i_297_n_2 ,\result_reg[7]_i_297_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\result[7]_i_336_n_0 ,\result[7]_i_337_n_0 ,\result[7]_i_338_n_0 ,\result[7]_i_339_n_0 }),
        .S({\result[7]_i_340_n_0 ,\result[7]_i_341_n_0 ,\result[7]_i_342_n_0 ,\result[7]_i_343_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_306 
       (.CI(\<const0> ),
        .CO({\result_reg[7]_i_306_n_0 ,\result_reg[7]_i_306_n_1 ,\result_reg[7]_i_306_n_2 ,\result_reg[7]_i_306_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\result[7]_i_344_n_0 ,\<const0> ,\<const0> ,\result[7]_i_345_n_0 }),
        .S({\result[7]_i_346_n_0 ,\result[7]_i_347_n_0 ,\result[7]_i_348_n_0 ,\result[7]_i_349_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_31 
       (.CI(\result_reg[7]_i_60_n_0 ),
        .CO({\result_reg[7]_i_31_n_0 ,\result_reg[7]_i_31_n_1 ,\result_reg[7]_i_31_n_2 ,\result_reg[7]_i_31_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\result[7]_i_61_n_0 ,\result[7]_i_62_n_0 ,\result[7]_i_63_n_0 ,\result[7]_i_64_n_0 }),
        .S({\result[7]_i_65_n_0 ,\result[7]_i_66_n_0 ,\result[7]_i_67_n_0 ,\result[7]_i_68_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_315 
       (.CI(\result_reg[7]_i_317_n_0 ),
        .CO({\result_reg[7]_i_315_n_0 ,\result_reg[7]_i_315_n_1 ,\result_reg[7]_i_315_n_2 ,\result_reg[7]_i_315_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded_mag[23:20]),
        .S({\result[7]_i_352_n_0 ,\result[7]_i_353_n_0 ,\result[7]_i_354_n_0 ,\result[7]_i_355_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_316 
       (.CI(\result_reg[7]_i_318_n_0 ),
        .CO({\result_reg[7]_i_316_n_0 ,\result_reg[7]_i_316_n_1 ,\result_reg[7]_i_316_n_2 ,\result_reg[7]_i_316_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded0[20:17]),
        .S({\result[7]_i_356_n_0 ,\result[7]_i_357_n_0 ,\result[7]_i_358_n_0 ,\result[7]_i_359_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_317 
       (.CI(\result_reg[7]_i_350_n_0 ),
        .CO({\result_reg[7]_i_317_n_0 ,\result_reg[7]_i_317_n_1 ,\result_reg[7]_i_317_n_2 ,\result_reg[7]_i_317_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded_mag[19:16]),
        .S({\result[7]_i_360_n_0 ,\result[7]_i_361_n_0 ,\result[7]_i_362_n_0 ,\result[7]_i_363_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_318 
       (.CI(\result_reg[7]_i_351_n_0 ),
        .CO({\result_reg[7]_i_318_n_0 ,\result_reg[7]_i_318_n_1 ,\result_reg[7]_i_318_n_2 ,\result_reg[7]_i_318_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded0[16:13]),
        .S({\result[7]_i_364_n_0 ,\result[7]_i_365_n_0 ,\result[7]_i_366_n_0 ,\result[7]_i_367_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_335 
       (.CI(\<const0> ),
        .CO({\result_reg[7]_i_335_n_0 ,\result_reg[7]_i_335_n_1 ,\result_reg[7]_i_335_n_2 ,\result_reg[7]_i_335_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\result[7]_i_368_n_0 ,\result[7]_i_369_n_0 ,\result[7]_i_370_n_0 ,\result[7]_i_371_n_0 }),
        .S({\result[7]_i_372_n_0 ,\result[7]_i_373_n_0 ,\result[7]_i_374_n_0 ,\result[7]_i_375_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_34 
       (.CI(\result_reg[7]_i_69_n_0 ),
        .CO({\result_reg[7]_i_34_n_0 ,\result_reg[7]_i_34_n_1 ,\result_reg[7]_i_34_n_2 ,\result_reg[7]_i_34_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\result[7]_i_70_n_0 ,\result[7]_i_71_n_0 ,\result[7]_i_72_n_0 ,\result[7]_i_73_n_0 }),
        .S({\result[7]_i_74_n_0 ,\result[7]_i_75_n_0 ,\result[7]_i_76_n_0 ,\result[7]_i_77_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_350 
       (.CI(\result_reg[7]_i_48_n_0 ),
        .CO({\result_reg[7]_i_350_n_0 ,\result_reg[7]_i_350_n_1 ,\result_reg[7]_i_350_n_2 ,\result_reg[7]_i_350_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded_mag[15:12]),
        .S({\result[7]_i_376_n_0 ,\result[7]_i_377_n_0 ,\result[7]_i_378_n_0 ,\result[7]_i_379_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_351 
       (.CI(\result_reg[7]_i_5_n_0 ),
        .CO({\result_reg[7]_i_351_n_0 ,\result_reg[7]_i_351_n_1 ,\result_reg[7]_i_351_n_2 ,\result_reg[7]_i_351_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded0[12:9]),
        .S({\result[7]_i_380_n_0 ,\result[7]_i_381_n_0 ,\result[7]_i_382_n_0 ,\result[7]_i_383_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_4 
       (.CI(\result_reg[7]_i_9_n_0 ),
        .CO({clipped2,\result_reg[7]_i_4_n_1 ,\result_reg[7]_i_4_n_2 ,\result_reg[7]_i_4_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\result[7]_i_10_n_0 ,\result[7]_i_11_n_0 ,\result[7]_i_12_n_0 ,\result[7]_i_13_n_0 }),
        .S({\result[7]_i_14_n_0 ,\result[7]_i_15_n_0 ,\result[7]_i_16_n_0 ,\result[7]_i_17_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_43 
       (.CI(\result_reg[7]_i_45_n_0 ),
        .CO({\result_reg[7]_i_43_n_2 ,\result_reg[7]_i_43_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded0[63:61]),
        .S({\<const0> ,\result[7]_i_82_n_0 ,\result[7]_i_83_n_0 ,\result[7]_i_84_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_44 
       (.CI(\result_reg[7]_i_46_n_0 ),
        .CO({\result_reg[7]_i_44_n_1 ,\result_reg[7]_i_44_n_2 ,\result_reg[7]_i_44_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded_mag[63:60]),
        .S({\result[7]_i_85_n_0 ,\result[7]_i_86_n_0 ,\result[7]_i_87_n_0 ,\result[7]_i_88_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_45 
       (.CI(\result_reg[7]_i_47_n_0 ),
        .CO({\result_reg[7]_i_45_n_0 ,\result_reg[7]_i_45_n_1 ,\result_reg[7]_i_45_n_2 ,\result_reg[7]_i_45_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded0[60:57]),
        .S({\result[7]_i_89_n_0 ,\result[7]_i_90_n_0 ,\result[7]_i_91_n_0 ,\result[7]_i_92_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_46 
       (.CI(\result_reg[7]_i_78_n_0 ),
        .CO({\result_reg[7]_i_46_n_0 ,\result_reg[7]_i_46_n_1 ,\result_reg[7]_i_46_n_2 ,\result_reg[7]_i_46_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded_mag[59:56]),
        .S({\result[7]_i_93_n_0 ,\result[7]_i_94_n_0 ,\result[7]_i_95_n_0 ,\result[7]_i_96_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_47 
       (.CI(\result_reg[7]_i_79_n_0 ),
        .CO({\result_reg[7]_i_47_n_0 ,\result_reg[7]_i_47_n_1 ,\result_reg[7]_i_47_n_2 ,\result_reg[7]_i_47_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded0[56:53]),
        .S({\result[7]_i_97_n_0 ,\result[7]_i_98_n_0 ,\result[7]_i_99_n_0 ,\result[7]_i_100_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_48 
       (.CI(\result_reg[7]_i_7_n_0 ),
        .CO({\result_reg[7]_i_48_n_0 ,\result_reg[7]_i_48_n_1 ,\result_reg[7]_i_48_n_2 ,\result_reg[7]_i_48_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded_mag[11:8]),
        .S({\result[7]_i_101_n_0 ,\result[7]_i_102_n_0 ,\result[7]_i_103_n_0 ,\result[7]_i_104_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_49 
       (.CI(\result_reg[7]_i_105_n_0 ),
        .CO({\result_reg[7]_i_49_n_0 ,\result_reg[7]_i_49_n_1 ,\result_reg[7]_i_49_n_2 ,\result_reg[7]_i_49_n_3 }),
        .CYINIT(\<const0> ),
        .DI(p_1_in[55:52]),
        .O(wide_product__3[55:52]),
        .S({\result[7]_i_106_n_0 ,\result[7]_i_107_n_0 ,\result[7]_i_108_n_0 ,\result[7]_i_109_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_5 
       (.CI(\result_reg[4]_i_2_n_0 ),
        .CO({\result_reg[7]_i_5_n_0 ,\result_reg[7]_i_5_n_1 ,\result_reg[7]_i_5_n_2 ,\result_reg[7]_i_5_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded0[8:5]),
        .S({\result[7]_i_18_n_0 ,\result[7]_i_19_n_0 ,\result[7]_i_20_n_0 ,\result[7]_i_21_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_54 
       (.CI(\result_reg[7]_i_57_n_0 ),
        .CO({\result_reg[7]_i_54_n_0 ,\result_reg[7]_i_54_n_1 ,\result_reg[7]_i_54_n_2 ,\result_reg[7]_i_54_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(magnitude0[40:37]),
        .S(p_0_in[40:37]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_55 
       (.CI(\result_reg[7]_i_58_n_0 ),
        .CO({\result_reg[7]_i_55_n_0 ,\result_reg[7]_i_55_n_1 ,\result_reg[7]_i_55_n_2 ,\result_reg[7]_i_55_n_3 }),
        .CYINIT(\<const0> ),
        .DI(p_1_in[39:36]),
        .O(wide_product__3[39:36]),
        .S({\result[7]_i_114_n_0 ,\result[7]_i_115_n_0 ,\result[7]_i_116_n_0 ,\result[7]_i_117_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_56 
       (.CI(\result_reg[7]_i_59_n_0 ),
        .CO({\result_reg[7]_i_56_n_0 ,\result_reg[7]_i_56_n_1 ,\result_reg[7]_i_56_n_2 ,\result_reg[7]_i_56_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(magnitude0[8:5]),
        .S(p_0_in[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_57 
       (.CI(\result_reg[3]_i_8_n_0 ),
        .CO({\result_reg[7]_i_57_n_0 ,\result_reg[7]_i_57_n_1 ,\result_reg[7]_i_57_n_2 ,\result_reg[7]_i_57_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(magnitude0[36:33]),
        .S(p_0_in[36:33]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_58 
       (.CI(\result_reg[3]_i_9_n_0 ),
        .CO({\result_reg[7]_i_58_n_0 ,\result_reg[7]_i_58_n_1 ,\result_reg[7]_i_58_n_2 ,\result_reg[7]_i_58_n_3 }),
        .CYINIT(\<const0> ),
        .DI(p_1_in[35:32]),
        .O(wide_product__3[35:32]),
        .S({\result[7]_i_126_n_0 ,\result[7]_i_127_n_0 ,\result[7]_i_128_n_0 ,\result[7]_i_129_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_59 
       (.CI(\<const0> ),
        .CO({\result_reg[7]_i_59_n_0 ,\result_reg[7]_i_59_n_1 ,\result_reg[7]_i_59_n_2 ,\result_reg[7]_i_59_n_3 }),
        .CYINIT(p_0_in[0]),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(magnitude0[4:1]),
        .S(p_0_in[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_6 
       (.CI(\result_reg[7]_i_22_n_0 ),
        .CO({\result_reg[7]_i_6_n_1 ,\result_reg[7]_i_6_n_2 ,\result_reg[7]_i_6_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,p_1_in[62:60]}),
        .O(wide_product__3[63:60]),
        .S({\result[7]_i_23_n_0 ,\result[7]_i_24_n_0 ,\result[7]_i_25_n_0 ,\result[7]_i_26_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_60 
       (.CI(\result_reg[7]_i_135_n_0 ),
        .CO({\result_reg[7]_i_60_n_0 ,\result_reg[7]_i_60_n_1 ,\result_reg[7]_i_60_n_2 ,\result_reg[7]_i_60_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\result[7]_i_136_n_0 ,\result[7]_i_137_n_0 ,\result[7]_i_138_n_0 ,\result[7]_i_139_n_0 }),
        .S({\result[7]_i_140_n_0 ,\result[7]_i_141_n_0 ,\result[7]_i_142_n_0 ,\result[7]_i_143_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_69 
       (.CI(\result_reg[7]_i_144_n_0 ),
        .CO({\result_reg[7]_i_69_n_0 ,\result_reg[7]_i_69_n_1 ,\result_reg[7]_i_69_n_2 ,\result_reg[7]_i_69_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\result[7]_i_145_n_0 ,\result[7]_i_146_n_0 ,\result[7]_i_147_n_0 ,\result[7]_i_148_n_0 }),
        .S({\result[7]_i_149_n_0 ,\result[7]_i_150_n_0 ,\result[7]_i_151_n_0 ,\result[7]_i_152_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_7 
       (.CI(\result_reg[3]_i_2_n_0 ),
        .CO({\result_reg[7]_i_7_n_0 ,\result_reg[7]_i_7_n_1 ,\result_reg[7]_i_7_n_2 ,\result_reg[7]_i_7_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded_mag[7:4]),
        .S({\result[7]_i_27_n_0 ,\result[7]_i_28_n_0 ,\result[7]_i_29_n_0 ,\result[7]_i_30_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_78 
       (.CI(\result_reg[7]_i_80_n_0 ),
        .CO({\result_reg[7]_i_78_n_0 ,\result_reg[7]_i_78_n_1 ,\result_reg[7]_i_78_n_2 ,\result_reg[7]_i_78_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded_mag[55:52]),
        .S({\result[7]_i_157_n_0 ,\result[7]_i_158_n_0 ,\result[7]_i_159_n_0 ,\result[7]_i_160_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_79 
       (.CI(\result_reg[7]_i_81_n_0 ),
        .CO({\result_reg[7]_i_79_n_0 ,\result_reg[7]_i_79_n_1 ,\result_reg[7]_i_79_n_2 ,\result_reg[7]_i_79_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded0[52:49]),
        .S({\result[7]_i_161_n_0 ,\result[7]_i_162_n_0 ,\result[7]_i_163_n_0 ,\result[7]_i_164_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_8 
       (.CI(\result_reg[7]_i_31_n_0 ),
        .CO(clipped1),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\result[7]_i_32_n_0 }),
        .S({\<const0> ,\<const0> ,\<const0> ,\result[7]_i_33_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_80 
       (.CI(\result_reg[7]_i_153_n_0 ),
        .CO({\result_reg[7]_i_80_n_0 ,\result_reg[7]_i_80_n_1 ,\result_reg[7]_i_80_n_2 ,\result_reg[7]_i_80_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded_mag[51:48]),
        .S({\result[7]_i_165_n_0 ,\result[7]_i_166_n_0 ,\result[7]_i_167_n_0 ,\result[7]_i_168_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \result_reg[7]_i_81 
       (.CI(\result_reg[7]_i_154_n_0 ),
        .CO({\result_reg[7]_i_81_n_0 ,\result_reg[7]_i_81_n_1 ,\result_reg[7]_i_81_n_2 ,\result_reg[7]_i_81_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(rounded0[48:45]),
        .S({\result[7]_i_169_n_0 ,\result[7]_i_170_n_0 ,\result[7]_i_171_n_0 ,\result[7]_i_172_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_9 
       (.CI(\result_reg[7]_i_34_n_0 ),
        .CO({\result_reg[7]_i_9_n_0 ,\result_reg[7]_i_9_n_1 ,\result_reg[7]_i_9_n_2 ,\result_reg[7]_i_9_n_3 }),
        .CYINIT(\<const0> ),
        .DI({\result[7]_i_35_n_0 ,\result[7]_i_36_n_0 ,\result[7]_i_37_n_0 ,\result[7]_i_38_n_0 }),
        .S({\result[7]_i_39_n_0 ,\result[7]_i_40_n_0 ,\result[7]_i_41_n_0 ,\result[7]_i_42_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \shift_reg[0]_i_1 
       (.I0(shift_in[0]),
        .I1(start),
        .I2(busy_reg_n_0),
        .I3(shift_reg),
        .O(\shift_reg[0]_i_1_n_0 ));
  FDRE \shift_reg_reg[0] 
       (.C(clk),
        .CE(\<const1> ),
        .D(\shift_reg[0]_i_1_n_0 ),
        .Q(shift_reg),
        .R(rst));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 15x18 4}}" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    wide_product
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,multiplier_in[16:0]}),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({wide_product_i_3_n_0,wide_product_i_3_n_0,wide_product_i_3_n_0,wide_product_i_3_n_0,wide_product_i_4_n_0,wide_product_i_5_n_0,wide_product_i_6_n_0,wide_product_i_7_n_0,wide_product_i_8_n_0,wide_product_i_9_n_0,wide_product_i_10_n_0,wide_product_i_11_n_0,wide_product_i_12_n_0,wide_product_i_13_n_0,wide_product_i_14_n_0,wide_product_i_15_n_0,wide_product_i_16_n_0,wide_product_i_17_n_0}),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(busy010_out),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(CEA2),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(\<const0> ),
        .CLK(clk),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({wide_product_n_58,wide_product_n_59,wide_product_n_60,wide_product_n_61,wide_product_n_62,wide_product_n_63,wide_product_n_64,wide_product_n_65,wide_product_n_66,wide_product_n_67,wide_product_n_68,wide_product_n_69,wide_product_n_70,wide_product_n_71,wide_product_n_72,wide_product_n_73,wide_product_n_74,wide_product_n_75,wide_product_n_76,wide_product_n_77,wide_product_n_78,wide_product_n_79,wide_product_n_80,wide_product_n_81,wide_product_n_82,wide_product_n_83,wide_product_n_84,wide_product_n_85,wide_product_n_86,wide_product_n_87,wide_product_n_88,wide_product_n_89,wide_product_n_90,wide_product_n_91,wide_product_n_92,wide_product_n_93,wide_product_n_94,wide_product_n_95,wide_product_n_96,wide_product_n_97,wide_product_n_98,wide_product_n_99,wide_product_n_100,wide_product_n_101,wide_product_n_102,wide_product_n_103,wide_product_n_104,wide_product_n_105}),
        .PCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .PCOUT({wide_product_n_106,wide_product_n_107,wide_product_n_108,wide_product_n_109,wide_product_n_110,wide_product_n_111,wide_product_n_112,wide_product_n_113,wide_product_n_114,wide_product_n_115,wide_product_n_116,wide_product_n_117,wide_product_n_118,wide_product_n_119,wide_product_n_120,wide_product_n_121,wide_product_n_122,wide_product_n_123,wide_product_n_124,wide_product_n_125,wide_product_n_126,wide_product_n_127,wide_product_n_128,wide_product_n_129,wide_product_n_130,wide_product_n_131,wide_product_n_132,wide_product_n_133,wide_product_n_134,wide_product_n_135,wide_product_n_136,wide_product_n_137,wide_product_n_138,wide_product_n_139,wide_product_n_140,wide_product_n_141,wide_product_n_142,wide_product_n_143,wide_product_n_144,wide_product_n_145,wide_product_n_146,wide_product_n_147,wide_product_n_148,wide_product_n_149,wide_product_n_150,wide_product_n_151,wide_product_n_152,wide_product_n_153}),
        .RSTA(rst),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(rst),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(\<const0> ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 15x15 4}}" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    wide_product__0
       (.A({wide_product_i_3_n_0,wide_product_i_3_n_0,wide_product_i_3_n_0,wide_product_i_3_n_0,wide_product_i_3_n_0,wide_product_i_3_n_0,wide_product_i_3_n_0,wide_product_i_3_n_0,wide_product_i_3_n_0,wide_product_i_3_n_0,wide_product_i_3_n_0,wide_product_i_3_n_0,wide_product_i_3_n_0,wide_product_i_3_n_0,wide_product_i_3_n_0,wide_product_i_3_n_0,wide_product_i_4_n_0,wide_product_i_5_n_0,wide_product_i_6_n_0,wide_product_i_7_n_0,wide_product_i_8_n_0,wide_product_i_9_n_0,wide_product_i_10_n_0,wide_product_i_11_n_0,wide_product_i_12_n_0,wide_product_i_13_n_0,wide_product_i_14_n_0,wide_product_i_15_n_0,wide_product_i_16_n_0,wide_product_i_17_n_0}),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({multiplier_in[31],multiplier_in[31],multiplier_in[31],multiplier_in[31],multiplier_in[31],multiplier_in[31],multiplier_in[31],multiplier_in[31],multiplier_in[31],multiplier_in[31],multiplier_in[24:17]}),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(CEA2),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(busy010_out),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(\<const0> ),
        .CLK(clk),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const1> ,\<const0> ,\<const1> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({wide_product__0_n_76,wide_product__0_n_77,wide_product__0_n_78,wide_product__0_n_79,wide_product__0_n_80,wide_product__0_n_81,wide_product__0_n_82,wide_product__0_n_83,wide_product__0_n_84,wide_product__0_n_85,wide_product__0_n_86,wide_product__0_n_87,wide_product__0_n_88,wide_product__0_n_89,wide_product__0_n_90,wide_product__0_n_91,wide_product__0_n_92,wide_product__0_n_93,wide_product__0_n_94,wide_product__0_n_95,wide_product__0_n_96,wide_product__0_n_97,wide_product__0_n_98,wide_product__0_n_99,wide_product__0_n_100,wide_product__0_n_101,wide_product__0_n_102,wide_product__0_n_103,wide_product__0_n_104,wide_product__0_n_105}),
        .PCIN({wide_product_n_106,wide_product_n_107,wide_product_n_108,wide_product_n_109,wide_product_n_110,wide_product_n_111,wide_product_n_112,wide_product_n_113,wide_product_n_114,wide_product_n_115,wide_product_n_116,wide_product_n_117,wide_product_n_118,wide_product_n_119,wide_product_n_120,wide_product_n_121,wide_product_n_122,wide_product_n_123,wide_product_n_124,wide_product_n_125,wide_product_n_126,wide_product_n_127,wide_product_n_128,wide_product_n_129,wide_product_n_130,wide_product_n_131,wide_product_n_132,wide_product_n_133,wide_product_n_134,wide_product_n_135,wide_product_n_136,wide_product_n_137,wide_product_n_138,wide_product_n_139,wide_product_n_140,wide_product_n_141,wide_product_n_142,wide_product_n_143,wide_product_n_144,wide_product_n_145,wide_product_n_146,wide_product_n_147,wide_product_n_148,wide_product_n_149,wide_product_n_150,wide_product_n_151,wide_product_n_152,wide_product_n_153}),
        .RSTA(rst),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(rst),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(\<const0> ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x18 4}}" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    wide_product__1
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,wide_product__1_i_1_n_0,wide_product__1_i_2_n_0,wide_product__1_i_3_n_0,wide_product__1_i_4_n_0,wide_product__1_i_5_n_0,wide_product__1_i_6_n_0,wide_product__1_i_7_n_0,wide_product__1_i_8_n_0,wide_product__1_i_9_n_0,wide_product__1_i_10_n_0,wide_product__1_i_11_n_0,wide_product__1_i_12_n_0,wide_product__1_i_13_n_0,wide_product__1_i_14_n_0,wide_product__1_i_15_n_0,wide_product__1_i_16_n_0,wide_product__1_i_17_n_0}),
        .ACIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ACOUT({wide_product__1_n_24,wide_product__1_n_25,wide_product__1_n_26,wide_product__1_n_27,wide_product__1_n_28,wide_product__1_n_29,wide_product__1_n_30,wide_product__1_n_31,wide_product__1_n_32,wide_product__1_n_33,wide_product__1_n_34,wide_product__1_n_35,wide_product__1_n_36,wide_product__1_n_37,wide_product__1_n_38,wide_product__1_n_39,wide_product__1_n_40,wide_product__1_n_41,wide_product__1_n_42,wide_product__1_n_43,wide_product__1_n_44,wide_product__1_n_45,wide_product__1_n_46,wide_product__1_n_47,wide_product__1_n_48,wide_product__1_n_49,wide_product__1_n_50,wide_product__1_n_51,wide_product__1_n_52,wide_product__1_n_53}),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({\<const0> ,multiplier_in[16:0]}),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(CEA2),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(busy010_out),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(\<const0> ),
        .CLK(clk),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P({wide_product__1_n_58,wide_product__1_n_59,wide_product__1_n_60,wide_product__1_n_61,wide_product__1_n_62,wide_product__1_n_63,wide_product__1_n_64,wide_product__1_n_65,wide_product__1_n_66,wide_product__1_n_67,wide_product__1_n_68,wide_product__1_n_69,wide_product__1_n_70,wide_product__1_n_71,wide_product__1_n_72,wide_product__1_n_73,wide_product__1_n_74,wide_product__1_n_75,wide_product__1_n_76,wide_product__1_n_77,wide_product__1_n_78,wide_product__1_n_79,wide_product__1_n_80,wide_product__1_n_81,wide_product__1_n_82,wide_product__1_n_83,wide_product__1_n_84,wide_product__1_n_85,wide_product__1_n_86,wide_product__1_n_87,wide_product__1_n_88,p_1_in[16:0]}),
        .PCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .PCOUT({wide_product__1_n_106,wide_product__1_n_107,wide_product__1_n_108,wide_product__1_n_109,wide_product__1_n_110,wide_product__1_n_111,wide_product__1_n_112,wide_product__1_n_113,wide_product__1_n_114,wide_product__1_n_115,wide_product__1_n_116,wide_product__1_n_117,wide_product__1_n_118,wide_product__1_n_119,wide_product__1_n_120,wide_product__1_n_121,wide_product__1_n_122,wide_product__1_n_123,wide_product__1_n_124,wide_product__1_n_125,wide_product__1_n_126,wide_product__1_n_127,wide_product__1_n_128,wide_product__1_n_129,wide_product__1_n_130,wide_product__1_n_131,wide_product__1_n_132,wide_product__1_n_133,wide_product__1_n_134,wide_product__1_n_135,wide_product__1_n_136,wide_product__1_n_137,wide_product__1_n_138,wide_product__1_n_139,wide_product__1_n_140,wide_product__1_n_141,wide_product__1_n_142,wide_product__1_n_143,wide_product__1_n_144,wide_product__1_n_145,wide_product__1_n_146,wide_product__1_n_147,wide_product__1_n_148,wide_product__1_n_149,wide_product__1_n_150,wide_product__1_n_151,wide_product__1_n_152,wide_product__1_n_153}),
        .RSTA(rst),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(rst),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(\<const0> ));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product__1_i_1
       (.I0(busy_reg_n_0),
        .I1(bias_in[31]),
        .I2(start),
        .I3(sum__0[16]),
        .O(wide_product__1_i_1_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product__1_i_10
       (.I0(busy_reg_n_0),
        .I1(bias_in[7]),
        .I2(start),
        .I3(sum__0[7]),
        .O(wide_product__1_i_10_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product__1_i_11
       (.I0(busy_reg_n_0),
        .I1(bias_in[6]),
        .I2(start),
        .I3(sum__0[6]),
        .O(wide_product__1_i_11_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product__1_i_12
       (.I0(busy_reg_n_0),
        .I1(bias_in[5]),
        .I2(start),
        .I3(sum__0[5]),
        .O(wide_product__1_i_12_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product__1_i_13
       (.I0(busy_reg_n_0),
        .I1(bias_in[4]),
        .I2(start),
        .I3(sum__0[4]),
        .O(wide_product__1_i_13_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product__1_i_14
       (.I0(busy_reg_n_0),
        .I1(bias_in[3]),
        .I2(start),
        .I3(sum__0[3]),
        .O(wide_product__1_i_14_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product__1_i_15
       (.I0(busy_reg_n_0),
        .I1(bias_in[2]),
        .I2(start),
        .I3(sum__0[2]),
        .O(wide_product__1_i_15_n_0));
  LUT4 #(
    .INIT(16'hAAE2)) 
    wide_product__1_i_16
       (.I0(sum__0[1]),
        .I1(start),
        .I2(bias_in[1]),
        .I3(busy_reg_n_0),
        .O(wide_product__1_i_16_n_0));
  LUT4 #(
    .INIT(16'hAAE2)) 
    wide_product__1_i_17
       (.I0(sum__0[0]),
        .I1(start),
        .I2(bias_in[0]),
        .I3(busy_reg_n_0),
        .O(wide_product__1_i_17_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wide_product__1_i_18
       (.CI(wide_product__1_i_19_n_0),
        .CO({wide_product__1_i_18_n_0,wide_product__1_i_18_n_1,wide_product__1_i_18_n_2,wide_product__1_i_18_n_3}),
        .CYINIT(\<const0> ),
        .DI({product16,acc_reg[14:12]}),
        .O(sum__0[15:12]),
        .S({wide_product__1_i_22_n_0,wide_product__1_i_23_n_0,wide_product__1_i_24_n_0,wide_product__1_i_25_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wide_product__1_i_19
       (.CI(wide_product__1_i_20_n_0),
        .CO({wide_product__1_i_19_n_0,wide_product__1_i_19_n_1,wide_product__1_i_19_n_2,wide_product__1_i_19_n_3}),
        .CYINIT(\<const0> ),
        .DI(acc_reg[11:8]),
        .O(sum__0[11:8]),
        .S({wide_product__1_i_26_n_0,wide_product__1_i_27_n_0,wide_product__1_i_28_n_0,wide_product__1_i_29_n_0}));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product__1_i_2
       (.I0(busy_reg_n_0),
        .I1(bias_in[31]),
        .I2(start),
        .I3(sum__0[15]),
        .O(wide_product__1_i_2_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wide_product__1_i_20
       (.CI(wide_product__1_i_21_n_0),
        .CO({wide_product__1_i_20_n_0,wide_product__1_i_20_n_1,wide_product__1_i_20_n_2,wide_product__1_i_20_n_3}),
        .CYINIT(\<const0> ),
        .DI(acc_reg[7:4]),
        .O(sum__0[7:4]),
        .S({wide_product__1_i_30_n_0,wide_product__1_i_31_n_0,wide_product__1_i_32_n_0,wide_product__1_i_33_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wide_product__1_i_21
       (.CI(\<const0> ),
        .CO({wide_product__1_i_21_n_0,wide_product__1_i_21_n_1,wide_product__1_i_21_n_2,wide_product__1_i_21_n_3}),
        .CYINIT(\<const0> ),
        .DI(acc_reg[3:0]),
        .O(sum__0[3:0]),
        .S({wide_product__1_i_34_n_0,wide_product__1_i_35_n_0,wide_product__1_i_36_n_0,wide_product__1_i_37_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    wide_product__1_i_22
       (.I0(product16),
        .I1(acc_reg[15]),
        .O(wide_product__1_i_22_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    wide_product__1_i_23
       (.I0(acc_reg[14]),
        .I1(product32[14]),
        .O(wide_product__1_i_23_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    wide_product__1_i_24
       (.I0(acc_reg[13]),
        .I1(product32[13]),
        .O(wide_product__1_i_24_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    wide_product__1_i_25
       (.I0(acc_reg[12]),
        .I1(product32[12]),
        .O(wide_product__1_i_25_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    wide_product__1_i_26
       (.I0(acc_reg[11]),
        .I1(product32[11]),
        .O(wide_product__1_i_26_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    wide_product__1_i_27
       (.I0(acc_reg[10]),
        .I1(product32[10]),
        .O(wide_product__1_i_27_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    wide_product__1_i_28
       (.I0(acc_reg[9]),
        .I1(product32[9]),
        .O(wide_product__1_i_28_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    wide_product__1_i_29
       (.I0(acc_reg[8]),
        .I1(product32[8]),
        .O(wide_product__1_i_29_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product__1_i_3
       (.I0(busy_reg_n_0),
        .I1(bias_in[14]),
        .I2(start),
        .I3(sum__0[14]),
        .O(wide_product__1_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    wide_product__1_i_30
       (.I0(acc_reg[7]),
        .I1(product32[7]),
        .O(wide_product__1_i_30_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    wide_product__1_i_31
       (.I0(acc_reg[6]),
        .I1(product32[6]),
        .O(wide_product__1_i_31_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    wide_product__1_i_32
       (.I0(acc_reg[5]),
        .I1(product32[5]),
        .O(wide_product__1_i_32_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    wide_product__1_i_33
       (.I0(acc_reg[4]),
        .I1(product32[4]),
        .O(wide_product__1_i_33_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    wide_product__1_i_34
       (.I0(acc_reg[3]),
        .I1(\acc_reg[0]_i_10_n_4 ),
        .I2(\acc_reg[0]_i_11_n_7 ),
        .O(wide_product__1_i_34_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    wide_product__1_i_35
       (.I0(acc_reg[2]),
        .I1(product32[2]),
        .O(wide_product__1_i_35_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    wide_product__1_i_36
       (.I0(acc_reg[1]),
        .I1(product32[1]),
        .O(wide_product__1_i_36_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    wide_product__1_i_37
       (.I0(acc_reg[0]),
        .I1(product32[0]),
        .O(wide_product__1_i_37_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product__1_i_4
       (.I0(busy_reg_n_0),
        .I1(bias_in[13]),
        .I2(start),
        .I3(sum__0[13]),
        .O(wide_product__1_i_4_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product__1_i_5
       (.I0(busy_reg_n_0),
        .I1(bias_in[12]),
        .I2(start),
        .I3(sum__0[12]),
        .O(wide_product__1_i_5_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product__1_i_6
       (.I0(busy_reg_n_0),
        .I1(bias_in[11]),
        .I2(start),
        .I3(sum__0[11]),
        .O(wide_product__1_i_6_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product__1_i_7
       (.I0(busy_reg_n_0),
        .I1(bias_in[10]),
        .I2(start),
        .I3(sum__0[10]),
        .O(wide_product__1_i_7_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product__1_i_8
       (.I0(busy_reg_n_0),
        .I1(bias_in[9]),
        .I2(start),
        .I3(sum__0[9]),
        .O(wide_product__1_i_8_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product__1_i_9
       (.I0(busy_reg_n_0),
        .I1(bias_in[8]),
        .I2(start),
        .I3(sum__0[8]),
        .O(wide_product__1_i_9_n_0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x15 4}}" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("CASCADE"),
    .BCASCREG(1),
    .BREG(1),
    .B_INPUT("DIRECT"),
    .CARRYINREG(0),
    .CARRYINSELREG(0),
    .CREG(1),
    .DREG(1),
    .INMODEREG(0),
    .MASK(48'h3FFFFFFFFFFF),
    .MREG(0),
    .OPMODEREG(0),
    .PATTERN(48'h000000000000),
    .PREG(0),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    wide_product__2
       (.A({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ACIN({wide_product__1_n_24,wide_product__1_n_25,wide_product__1_n_26,wide_product__1_n_27,wide_product__1_n_28,wide_product__1_n_29,wide_product__1_n_30,wide_product__1_n_31,wide_product__1_n_32,wide_product__1_n_33,wide_product__1_n_34,wide_product__1_n_35,wide_product__1_n_36,wide_product__1_n_37,wide_product__1_n_38,wide_product__1_n_39,wide_product__1_n_40,wide_product__1_n_41,wide_product__1_n_42,wide_product__1_n_43,wide_product__1_n_44,wide_product__1_n_45,wide_product__1_n_46,wide_product__1_n_47,wide_product__1_n_48,wide_product__1_n_49,wide_product__1_n_50,wide_product__1_n_51,wide_product__1_n_52,wide_product__1_n_53}),
        .ALUMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .B({multiplier_in[31],multiplier_in[31],multiplier_in[31],multiplier_in[31],multiplier_in[31],multiplier_in[31],multiplier_in[31],multiplier_in[31],multiplier_in[31],multiplier_in[31],multiplier_in[24:17]}),
        .BCIN({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .C({VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2,VCC_2}),
        .CARRYCASCIN(\<const0> ),
        .CARRYIN(\<const0> ),
        .CARRYINSEL({\<const0> ,\<const0> ,\<const0> }),
        .CEA1(\<const0> ),
        .CEA2(\<const0> ),
        .CEAD(\<const0> ),
        .CEALUMODE(\<const0> ),
        .CEB1(\<const0> ),
        .CEB2(busy010_out),
        .CEC(\<const0> ),
        .CECARRYIN(\<const0> ),
        .CECTRL(\<const0> ),
        .CED(\<const0> ),
        .CEINMODE(\<const0> ),
        .CEM(\<const0> ),
        .CEP(\<const0> ),
        .CLK(clk),
        .D({GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2,GND_2}),
        .INMODE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .MULTSIGNIN(\<const0> ),
        .OPMODE({\<const1> ,\<const0> ,\<const1> ,\<const0> ,\<const1> ,\<const0> ,\<const1> }),
        .P(p_1_in[63:17]),
        .PCIN({wide_product__1_n_106,wide_product__1_n_107,wide_product__1_n_108,wide_product__1_n_109,wide_product__1_n_110,wide_product__1_n_111,wide_product__1_n_112,wide_product__1_n_113,wide_product__1_n_114,wide_product__1_n_115,wide_product__1_n_116,wide_product__1_n_117,wide_product__1_n_118,wide_product__1_n_119,wide_product__1_n_120,wide_product__1_n_121,wide_product__1_n_122,wide_product__1_n_123,wide_product__1_n_124,wide_product__1_n_125,wide_product__1_n_126,wide_product__1_n_127,wide_product__1_n_128,wide_product__1_n_129,wide_product__1_n_130,wide_product__1_n_131,wide_product__1_n_132,wide_product__1_n_133,wide_product__1_n_134,wide_product__1_n_135,wide_product__1_n_136,wide_product__1_n_137,wide_product__1_n_138,wide_product__1_n_139,wide_product__1_n_140,wide_product__1_n_141,wide_product__1_n_142,wide_product__1_n_143,wide_product__1_n_144,wide_product__1_n_145,wide_product__1_n_146,wide_product__1_n_147,wide_product__1_n_148,wide_product__1_n_149,wide_product__1_n_150,wide_product__1_n_151,wide_product__1_n_152,wide_product__1_n_153}),
        .RSTA(\<const0> ),
        .RSTALLCARRYIN(\<const0> ),
        .RSTALUMODE(\<const0> ),
        .RSTB(rst),
        .RSTC(\<const0> ),
        .RSTCTRL(\<const0> ),
        .RSTD(\<const0> ),
        .RSTINMODE(\<const0> ),
        .RSTM(\<const0> ),
        .RSTP(\<const0> ));
  LUT2 #(
    .INIT(4'h2)) 
    wide_product_i_1
       (.I0(start),
        .I1(busy_reg_n_0),
        .O(busy010_out));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product_i_10
       (.I0(busy_reg_n_0),
        .I1(bias_in[31]),
        .I2(start),
        .I3(sum__0[24]),
        .O(wide_product_i_10_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product_i_11
       (.I0(busy_reg_n_0),
        .I1(bias_in[31]),
        .I2(start),
        .I3(sum__0[23]),
        .O(wide_product_i_11_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product_i_12
       (.I0(busy_reg_n_0),
        .I1(bias_in[31]),
        .I2(start),
        .I3(sum__0[22]),
        .O(wide_product_i_12_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product_i_13
       (.I0(busy_reg_n_0),
        .I1(bias_in[31]),
        .I2(start),
        .I3(sum__0[21]),
        .O(wide_product_i_13_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product_i_14
       (.I0(busy_reg_n_0),
        .I1(bias_in[31]),
        .I2(start),
        .I3(sum__0[20]),
        .O(wide_product_i_14_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product_i_15
       (.I0(busy_reg_n_0),
        .I1(bias_in[31]),
        .I2(start),
        .I3(sum__0[19]),
        .O(wide_product_i_15_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product_i_16
       (.I0(busy_reg_n_0),
        .I1(bias_in[31]),
        .I2(start),
        .I3(sum__0[18]),
        .O(wide_product_i_16_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product_i_17
       (.I0(busy_reg_n_0),
        .I1(bias_in[31]),
        .I2(start),
        .I3(sum__0[17]),
        .O(wide_product_i_17_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wide_product_i_18
       (.CI(wide_product_i_19_n_0),
        .CO({wide_product_i_18_n_0,wide_product_i_18_n_1,wide_product_i_18_n_2,wide_product_i_18_n_3}),
        .CYINIT(\<const0> ),
        .DI(acc_reg[26:23]),
        .O(sum__0[27:24]),
        .S({wide_product_i_21_n_0,wide_product_i_22_n_0,wide_product_i_23_n_0,wide_product_i_24_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wide_product_i_19
       (.CI(wide_product_i_20_n_0),
        .CO({wide_product_i_19_n_0,wide_product_i_19_n_1,wide_product_i_19_n_2,wide_product_i_19_n_3}),
        .CYINIT(\<const0> ),
        .DI(acc_reg[22:19]),
        .O(sum__0[23:20]),
        .S({wide_product_i_25_n_0,wide_product_i_26_n_0,wide_product_i_27_n_0,wide_product_i_28_n_0}));
  LUT4 #(
    .INIT(16'h2F20)) 
    wide_product_i_2
       (.I0(valid_in),
        .I1(finish_pending_reg_n_0),
        .I2(busy_reg_n_0),
        .I3(start),
        .O(CEA2));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 wide_product_i_20
       (.CI(wide_product__1_i_18_n_0),
        .CO({wide_product_i_20_n_0,wide_product_i_20_n_1,wide_product_i_20_n_2,wide_product_i_20_n_3}),
        .CYINIT(\<const0> ),
        .DI({acc_reg[18:16],wide_product_i_29_n_0}),
        .O(sum__0[19:16]),
        .S({wide_product_i_30_n_0,wide_product_i_31_n_0,wide_product_i_32_n_0,wide_product_i_33_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    wide_product_i_21
       (.I0(acc_reg[26]),
        .I1(acc_reg[27]),
        .O(wide_product_i_21_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wide_product_i_22
       (.I0(acc_reg[25]),
        .I1(acc_reg[26]),
        .O(wide_product_i_22_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wide_product_i_23
       (.I0(acc_reg[24]),
        .I1(acc_reg[25]),
        .O(wide_product_i_23_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wide_product_i_24
       (.I0(acc_reg[23]),
        .I1(acc_reg[24]),
        .O(wide_product_i_24_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wide_product_i_25
       (.I0(acc_reg[22]),
        .I1(acc_reg[23]),
        .O(wide_product_i_25_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wide_product_i_26
       (.I0(acc_reg[21]),
        .I1(acc_reg[22]),
        .O(wide_product_i_26_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wide_product_i_27
       (.I0(acc_reg[20]),
        .I1(acc_reg[21]),
        .O(wide_product_i_27_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wide_product_i_28
       (.I0(acc_reg[19]),
        .I1(acc_reg[20]),
        .O(wide_product_i_28_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    wide_product_i_29
       (.I0(product16),
        .O(wide_product_i_29_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product_i_3
       (.I0(busy_reg_n_0),
        .I1(bias_in[31]),
        .I2(start),
        .I3(sum),
        .O(wide_product_i_3_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wide_product_i_30
       (.I0(acc_reg[18]),
        .I1(acc_reg[19]),
        .O(wide_product_i_30_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wide_product_i_31
       (.I0(acc_reg[17]),
        .I1(acc_reg[18]),
        .O(wide_product_i_31_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    wide_product_i_32
       (.I0(acc_reg[16]),
        .I1(acc_reg[17]),
        .O(wide_product_i_32_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    wide_product_i_33
       (.I0(product16),
        .I1(acc_reg[16]),
        .O(wide_product_i_33_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product_i_4
       (.I0(busy_reg_n_0),
        .I1(bias_in[31]),
        .I2(start),
        .I3(sum__0[30]),
        .O(wide_product_i_4_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product_i_5
       (.I0(busy_reg_n_0),
        .I1(bias_in[31]),
        .I2(start),
        .I3(sum__0[29]),
        .O(wide_product_i_5_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product_i_6
       (.I0(busy_reg_n_0),
        .I1(bias_in[31]),
        .I2(start),
        .I3(sum__0[28]),
        .O(wide_product_i_6_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product_i_7
       (.I0(busy_reg_n_0),
        .I1(bias_in[31]),
        .I2(start),
        .I3(sum__0[27]),
        .O(wide_product_i_7_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product_i_8
       (.I0(busy_reg_n_0),
        .I1(bias_in[31]),
        .I2(start),
        .I3(sum__0[26]),
        .O(wide_product_i_8_n_0));
  LUT4 #(
    .INIT(16'hEF40)) 
    wide_product_i_9
       (.I0(busy_reg_n_0),
        .I1(bias_in[31]),
        .I2(start),
        .I3(sum__0[25]),
        .O(wide_product_i_9_n_0));
endmodule

(* ADDR_WIDTH = "12" *) (* DEPTH = "2560" *) (* INIT_FILE = "440'b01110010011001010111001101110101011011000111010001110011001011110111000000110011010111110110110100110000001101000010111101101101011011000111000001011111011001100110111101101100011001000011000101011111011100000110000101110010011000010110110101100101011101000110010101110010010111110111001001101111011011010010111101100110011000110011000101011111011101110110010101101001011001110110100001110100011100110010111001101101011001010110110101101000" *) 
(* WIDTH = "8" *) 
module parameter_rom_sync
   (clk,
    en,
    addr,
    data);
  input clk;
  input en;
  input [11:0]addr;
  output [7:0]data;

  wire \<const0> ;
  wire \<const1> ;
  wire [11:0]addr;
  wire clk;
  wire [7:0]data;
  wire en;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "32768" *) 
  (* RTL_RAM_NAME = "parameter_rom_sync/data_reg" *) 
  (* RTL_RAM_STYLE = "NONE" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "4095" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "7" *) 
  RAMB36E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .EN_ECC_READ("FALSE"),
    .EN_ECC_WRITE("FALSE"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hD0319DEFDACFCDA636DBE7C011E6F514D824E333E44E814509D9D5EF1EE71D7B),
    .INIT_01(256'hF1F0B504E930D1FF3001FCD5E2AA811CE221955110F9C96BE31D41F544F3082E),
    .INIT_02(256'h17D415322206EEF4F51CB857FB0081041C1431D6D2C2D0593023DBF5E109EC0F),
    .INIT_03(256'hC4C89AC0D7E2BCF8E1EF0A1403DAF30A265DF3B7F9D5DBC0FC180DE1F4F2D429),
    .INIT_04(256'hD8DE2D57E226BDFDF4F4B775600A18F7CC1DA23B0DFC81C7F1CF25CF2F3DC132),
    .INIT_05(256'h0FEA02EA18002823EBF22712D63316C4F8CFDB3F01E1BD204DEDE55ECF11187F),
    .INIT_06(256'hDBE842ADCD0BFBE533E3E4CA110C2BCABBBBDAF00850D68110FDED0EF2FD4239),
    .INIT_07(256'hC8CFD0F2DDFE4FC557E0A9F3ED11C27FBED1DB021E1B4FFE2DC9BDAD04383CBB),
    .INIT_08(256'h2BE8F4C0F40EC501EF040CA1293B5047D0F496FD21C7733AC239AC43472BB868),
    .INIT_09(256'h0AEB163FF01604810918002C0DF031E3F4F3062EFDF815E0F316EBBEF30E0E3F),
    .INIT_0A(256'h0B0508E70114F6EFF6EF101309F23A21F50B0E0C150E1722DFDDD71D1012A681),
    .INIT_0B(256'h3211D81BBF2A3101EFBE0CB5433A1AF9EC112551F1CFE482080AEC0AEFE80B1C),
    .INIT_0C(256'hEE7F357AF90E32BDE9A9A004290370FE010BFDA0F20B197F07EAEDC3F8D43CDA),
    .INIT_0D(256'h31DDD87F1609520309120DCE4AB251C8F8562BC8990E1F4E53C1DCE7DCC837CE),
    .INIT_0E(256'hF402D9DF13E2FB3E25393A37E5CCD40AE31B02F10B022A042A0BF3E7C304B43E),
    .INIT_0F(256'hC025EB21D0CD2F5B4A21BF03EAEC56380B07E93C232C566CF140B2F418C8F865),
    .INIT_10(256'hE6F8E1CE35D1E9B8F7363C21DB0902140812C05E0CE7670107319A7FC7BAAD24),
    .INIT_11(256'h0719CAF8F3EE81EC04EE84DF0111D83E3F17F733BADC15070DE4CE591936F27F),
    .INIT_12(256'h01EFEDD105FA3AE1050D080CEEF021F8190B1F13ECEB11FA130DD101F3FAECFE),
    .INIT_13(256'hFDF0E48108122AA1F1FF17B4170AEDD2E7EE0DE129F9EAE8FA0D41EEEB1647E2),
    .INIT_14(256'hFE01EDFCFA0D090502F417E903020C010B001C1FF507FF03FBF9D4EE07018105),
    .INIT_15(256'hADD6B14137E30A11202913134133B6EFD4E8321FEAE8237FFD02F5F407FA080D),
    .INIT_16(256'h4BEE1588B1F1A0C3CDF1DB814523C6FCDDD4B6253B45A91212F100F5FC0BA21A),
    .INIT_17(256'hEE041B8E0A00D88132C328DCB82EF0AA130931C3A624B9C13C18F31E34F49BD0),
    .INIT_18(256'h25E51C0EC828E92125EF54F10218D305110FF402F5F40EBDF3F3E9B826063EB4),
    .INIT_19(256'hF51DDB6CE91D06D7E9C9624630F7553DE63A2F0DFFC5BC6FFD2B93DA01F5E1AF),
    .INIT_1A(256'hD60BD4EE1D19110C0FD808C7E6171C29060BBE35EADC8174EC29019F2FBDC981),
    .INIT_1B(256'h1226F7F3EDDF1AC5F7237F281DF36BFA071A021CE3F007C92FE8D0F9020C31D3),
    .INIT_1C(256'h35E4CDD1F001EC810EFA1CE8D84721602FBFB6BFEFD10A2A0C581851E0C9BDC3),
    .INIT_1D(256'h1425EB06F4001A230EE807D0F1E4F3BA0607CB9EFC12FBB8E7EDBB9CEB23DCA9),
    .INIT_1E(256'h28DAFE00FE90F6813D09D002491B29E7CB1EBB2105FCC920DF2C4D370DDE03F1),
    .INIT_1F(256'hCCB9ECDE272423EE380907F4D513E4E0E7E3B6BBE2CD81E7A9F839E0E536CBB9),
    .INIT_20(256'h171AF1C4FD2AF12414FAE917E1E92DCCFB01FE1846E7DAD9E51EE5B4D81D026D),
    .INIT_21(256'h2C29540CE5DB0DDBF2F3DEBF03F90CEF08362B7F09D0238B33242EEBCCC7F013),
    .INIT_22(256'h0C1A23CC1CF429F6DCFB19090A1F2DD51AD836BAFD035097E2143F8112FAF4E1),
    .INIT_23(256'h3AFA0131D513C817F026D124F7D00FFEE240811A22AEDD362A128E55D0F9B8BB),
    .INIT_24(256'hDDCC12D3051226011A1F22CFF7F425DBFFDF7F8A07267FDA17F23538F5FF0927),
    .INIT_25(256'h3FC82E3DD5232729EC11DCED1DF604E7FF08EDEFE5E7D512361127EEFB1AEBE0),
    .INIT_26(256'h12B80D6FFC2510BA16EB16E8DC18180605FFD8182F15C61AD4F20A81ED08F760),
    .INIT_27(256'hE11F1E5E12BA09D8F63381CE23F83871D3DC3B02CA312ADA72FDE410BD14FFFF),
    .INIT_28(256'h64F5D7F99C3C1DAA01CDEDCF22F488A24B20CB4838342E7FB3085294E0BFDCA1),
    .INIT_29(256'h1AFBD806DB22FC290BE33155E5EF22F81725CE1505FEE78112C8E4D7BD54BD0B),
    .INIT_2A(256'hF40487DC3D114D5BADE38F451AE6F89C07F71B050717F420E508E6DE16F2D003),
    .INIT_2B(256'hF008F5C702F29881E8DC17FF0F40D946F6F091E720B6E95EB1328144170CEC69),
    .INIT_2C(256'h0001F761EFCD1A561E3CC754FEDEC369E4FB44531E0224F500FF04E10E0A2FCC),
    .INIT_2D(256'h1407454AFF29D0E1FCE52BCFF2262B1CEFFB5A3ADAE6E0B44A09AFA6D8DEBA81),
    .INIT_2E(256'h85010239705122819CCD98A2BAEF5DDC5C40A203B7B50856EA1518C01EBC2ED2),
    .INIT_2F(256'hB2E0DCD0201ED904F8DEEF202935597FBD39596821EF6F6A70A145460A15941D),
    .INIT_30(256'h20E581E6FD2AC50DD1DE9FD61B59091503CFAAC0000DF512451139D8DBD0C119),
    .INIT_31(256'h22DDEC68CB30DA5922EB471AF11A32F8FFE6E99AE41601D3EC0296C918EBAEE4),
    .INIT_32(256'h02140907F1FFF12715F9F1EEFA03FBFFE508ECE40BF8220E0A002EFAF4FF2B81),
    .INIT_33(256'h0A33C7E2E70F9258F51AA80E24E08C02E144AFBC07C8F6DA0A0FFFF4F1E004EC),
    .INIT_34(256'hE3D24E57F5DD1EB308CD32402859FFCCD12590070D1610C101CAC21F29C7E281),
    .INIT_35(256'hC67F42D9C6BA6D49FDEFC814C7E905CF59F326CBF2251229DF391081F6FD12CD),
    .INIT_36(256'h3B08B35FBBE864D8333F1206291D416CE7D2242130BFBE49E524BF584BF6A01F),
    .INIT_37(256'hDAFCE6D1210A10FA07D11436D9DFF9D70D3A23F6E20F3917310CEFD2E9D4BB81),
    .INIT_38(256'h050924D802F0070A110845ECE20801260AF0E315050A81B20821E4B0FFEF46B1),
    .INIT_39(256'h220F355AB911B13C2E082AADE9F9761DFE00F9FF03FFDD0F06F916E8F508FA31),
    .INIT_3A(256'hC2BDBF6A2E1CB4D6FA1B02C3F5B5F031231A3669D80622812533933C02AB87C9),
    .INIT_3B(256'hB35E0C411FABAF7BF0C621F61FBB545F0DD39E58ED7FEB3DCCF9ECCC2F42AB71),
    .INIT_3C(256'h05FAD516EBE214F4191FD0180A1CB834F3E906C602EA1B2BFF1BD838FFF881A6),
    .INIT_3D(256'h0D30274E19FE1081F6C1E207DC29190732EAB0D7ED0EBB15FC1B0DF8FFE8F9EE),
    .INIT_3E(256'hB6ECA8BA102CD8FC38E4B1C6CF1EC93F130640C4D5E2F955151B1AD5E6EC001A),
    .INIT_3F(256'h08170A7FE6E9ED2B472FD0D781C3F9945921400AD7951E04CF4A0AED2FD4CF73),
    .INIT_40(256'hFDFBEDDBFC0912C419F0F9F3F114FBF40511F8F4F3F2181F09F7DF330304114D),
    .INIT_41(256'hE50BDBFF250506FAF0FDE937EAFCF63EFDE62F17171DF61CF1EC6220F3017FD3),
    .INIT_42(256'h3E16B073FEDD8A712DB858D1D93440618127FE4E571B283D02F9020B0202F4E2),
    .INIT_43(256'hEF2481D8F00DCD3FDEBB9A7A1D2DA238ECBB42567379B6FEC0EC057DB7EC785E),
    .INIT_44(256'h2D0B16FFEFCDE0362EFB120CCD32F9F2ECDFB1D634E207E6C3FDD8DF4DFCDAE3),
    .INIT_45(256'hECD6547FEE1FC61CE705C2564A0BFEFDD106154B1508A5E900DC361BDB20DB55),
    .INIT_46(256'h6EEB627FCCD5E04F0B3D04EEF7EFDE144A20AC04E0C80D3100EFD53B01273BE7),
    .INIT_47(256'hFE0513E3EBDCFC4B2CFDF9B3001B3909F118E548FFDAD981DCFCAEEBE0192F6B),
    .INIT_48(256'hFE2130BCFCF5F8A8FDE3FD7F001CB5DAEDF1EDE2F0FA251421253FCF03FBE5F9),
    .INIT_49(256'h190056F2F5FB19220F0AFBF5E5F617E807EADC8E0B211157FCE4121A0BF90C27),
    .INIT_4A(256'hF60B28FC00F6DCBF13ECEEBFF22F3094FFE2FE8AFCFD138101F0F984FA184197),
    .INIT_4B(256'hD809E40DFC0B2E3B0711DBF305F04A970AEF00610BF530A5D93A034E12E1DE81),
    .INIT_4C(256'h3D12F666DF08407FE8CC1D383FFA16FF39FDF613BC0B43E9F81FF71B40D618B7),
    .INIT_4D(256'hF9FA0CFE05FEFF0E00FCC10D000481EAFE0DF907EED8FDE0E9E89B3CEC34D22B),
    .INIT_4E(256'hCD1B783543CEED7A06FF0200F50304FC08FEFD0500FEFEF700FF0A0500071DFF),
    .INIT_4F(256'h1EFDFDE3D900B647F1451681F0B7CE1748CB224CEE1F280E223FC60CD2015753),
    .INIT_50(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_51(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_52(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_53(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_54(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_55(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_56(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_57(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_58(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_59(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_5F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_60(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_61(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_62(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_63(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_64(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_65(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_66(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_67(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_68(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_69(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_6F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_70(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_71(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_72(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_73(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_74(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_75(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_76(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_77(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_78(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_79(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_7F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(36'h000000000),
    .INIT_B(36'h000000000),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(0)) 
    data_reg
       (.ADDRARDADDR({\<const1> ,addr,\<const0> ,\<const0> ,\<const0> }),
        .ADDRBWRADDR({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .CASCADEINA(\<const1> ),
        .CASCADEINB(\<const0> ),
        .CLKARDCLK(clk),
        .CLKBWRCLK(\<const0> ),
        .DIADI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DIBDI({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DIPADIP({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .DIPBDIP({\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DOADO(data),
        .ENARDEN(en),
        .ENBWREN(\<const0> ),
        .REGCEAREGCE(\<const0> ),
        .REGCEB(\<const0> ),
        .RSTRAMARSTRAM(\<const0> ),
        .RSTRAMB(\<const0> ),
        .RSTREGARSTREG(\<const0> ),
        .RSTREGB(\<const0> ),
        .WEA({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .WEBWE({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }));
endmodule

(* ADDR_WIDTH = "6" *) (* DEPTH = "64" *) (* INIT_FILE = "416'b01110010011001010111001101110101011011000111010001110011001011110111000000110011010111110110110100110000001101000010111101101101011011000111000001011111011001100110111101101100011001000011000101011111011100000110000101110010011000010110110101100101011101000110010101110010010111110111001001101111011011010010111101100110011000110011000101011111011000100110100101100001011100110010111001101101011001010110110101101000" *) 
(* ORIG_REF_NAME = "parameter_rom_sync" *) (* WIDTH = "32" *) 
module parameter_rom_sync__parameterized0
   (clk,
    en,
    addr,
    data);
  input clk;
  input en;
  input [5:0]addr;
  output [31:0]data;

  wire \<const0> ;
  wire \<const1> ;
  wire [5:0]addr;
  wire clk;
  wire [31:0]\^data ;
  wire en;

  assign data[31] = \^data [31];
  assign data[30] = \<const0> ;
  assign data[29] = \<const0> ;
  assign data[28] = \<const0> ;
  assign data[27] = \<const0> ;
  assign data[26] = \<const0> ;
  assign data[25] = \<const0> ;
  assign data[24] = \<const0> ;
  assign data[23] = \<const0> ;
  assign data[22] = \<const0> ;
  assign data[21] = \<const0> ;
  assign data[20] = \<const0> ;
  assign data[19] = \<const0> ;
  assign data[18] = \<const0> ;
  assign data[17] = \<const0> ;
  assign data[16] = \<const0> ;
  assign data[15] = \<const0> ;
  assign data[14:0] = \^data [14:0];
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "1024" *) 
  (* RTL_RAM_NAME = "parameter_rom_sync/data_reg" *) 
  (* RTL_RAM_STYLE = "NONE" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "15" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hE57EED12127A050E0EC1016D0B67FBF80584E9C5F8F9F30E0019003E01C9EAAE),
    .INIT_01(256'h0027FE47ED610CB1FAF9FC86F11FEBAAFB1C162BF307F3D9F8C0FAFBF24AF803),
    .INIT_02(256'hFE06FEA801C8FC3F152A0961EBFAF84BFA9A0F11F56308B5E3E808620555367F),
    .INIT_03(256'hFE63F7CFF5A107E0D92704CA07DE1CB506D1E96AE7121571F399521DFC3EFA5D),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    data_reg
       (.ADDRARDADDR({\<const0> ,\<const0> ,\<const0> ,\<const0> ,addr,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ADDRBWRADDR({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .CLKARDCLK(clk),
        .CLKBWRCLK(\<const0> ),
        .DIADI({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DIBDI({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DIPADIP({\<const0> ,\<const0> }),
        .DIPBDIP({\<const1> ,\<const1> }),
        .DOADO({\^data [31],\^data [14:0]}),
        .ENARDEN(en),
        .ENBWREN(\<const0> ),
        .REGCEAREGCE(\<const0> ),
        .REGCEB(\<const0> ),
        .RSTRAMARSTRAM(\<const0> ),
        .RSTRAMB(\<const0> ),
        .RSTREGARSTREG(\<const0> ),
        .RSTREGB(\<const0> ),
        .WEA({\<const0> ,\<const0> }),
        .WEBWE({\<const0> ,\<const0> ,\<const0> ,\<const0> }));
endmodule

(* ADDR_WIDTH = "6" *) (* DEPTH = "64" *) (* INIT_FILE = "464'b01110010011001010111001101110101011011000111010001110011001011110111000000110011010111110110110100110000001101000010111101101101011011000111000001011111011001100110111101101100011001000011000101011111011100000110000101110010011000010110110101100101011101000110010101110010010111110111001001101111011011010010111101100110011000110011000101011111011011010111010101101100011101000110100101110000011011000110100101100101011100100010111001101101011001010110110101101000" *) 
(* ORIG_REF_NAME = "parameter_rom_sync" *) (* WIDTH = "32" *) 
module parameter_rom_sync__parameterized1
   (clk,
    en,
    addr,
    data);
  input clk;
  input en;
  input [5:0]addr;
  output [31:0]data;

  wire \<const0> ;
  wire \<const1> ;
  wire [5:0]addr;
  wire clk;
  wire [31:0]\^data ;
  wire en;

  assign data[31] = \^data [31];
  assign data[30] = \<const0> ;
  assign data[29] = \<const0> ;
  assign data[28] = \<const0> ;
  assign data[27] = \<const0> ;
  assign data[26] = \<const0> ;
  assign data[25] = \<const0> ;
  assign data[24] = \<const0> ;
  assign data[23:0] = \^data [23:0];
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p2_d16" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d7" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "1600" *) 
  (* RTL_RAM_NAME = "parameter_rom_sync/data_reg" *) 
  (* RTL_RAM_STYLE = "NONE" *) 
  (* RTL_RAM_TYPE = "RAM_TDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "63" *) 
  (* ram_ext_slice_begin = "18" *) 
  (* ram_ext_slice_end = "24" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "17" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h00000000000000000000000000000000A20271F86D8433A60963AE6E6DDEAA0B),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h7C992E66876815F4761448FB871264C356105E6F01E4E1F40A7431A5681B2906),
    .INIT_01(256'hCD6243D0BD237F3CB9E2DDB21C32DCDC737A4C621C1AD296B5125A1334166AAB),
    .INIT_02(256'h8DEA264B9AC3BEE04AF6D24FFE1E498B36DAB51709399C84187895D05C3BA1F6),
    .INIT_03(256'h6569626387E79E55A8AD641CD25ED579DED40431DC8FE2B29190717BC8A56DC3),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0014001B000B0009000E0008000F001A00140008000D000B000A000E000D000A),
    .INIT_21(256'h000A00100011000E0011000E000D0009000F000A001100090010000A000D002B),
    .INIT_22(256'h0008000A001A00110008000B000A001D000D000A0008000B000D000900120008),
    .INIT_23(256'h000A003D000D0010001300110013000A000B000C0008001000170007000E0013),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    data_reg
       (.ADDRARDADDR({\<const0> ,\<const0> ,\<const0> ,\<const0> ,addr,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .ADDRBWRADDR({\<const1> ,\<const0> ,\<const0> ,\<const0> ,addr,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DIADI({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DIBDI({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DIPADIP({\<const1> ,\<const1> }),
        .DIPBDIP({\<const1> ,\<const1> }),
        .DOADO(\^data [15:0]),
        .DOBDO({\^data [31],\^data [23:18]}),
        .DOPADOP(\^data [17:16]),
        .ENARDEN(en),
        .ENBWREN(en),
        .REGCEAREGCE(\<const0> ),
        .REGCEB(\<const0> ),
        .RSTRAMARSTRAM(\<const0> ),
        .RSTRAMB(\<const0> ),
        .RSTREGARSTREG(\<const0> ),
        .RSTREGB(\<const0> ),
        .WEA({\<const0> ,\<const0> }),
        .WEBWE({\<const0> ,\<const0> ,\<const0> ,\<const0> }));
endmodule

(* ADDR_WIDTH = "11" *) (* DEPTH = "2048" *) (* INIT_FILE = "440'b01110010011001010111001101110101011011000111010001110011001011110111000000110011010111110110110100110000001101000010111101101101011011000111000001011111011001100110111101101100011001000011000101011111011100000110000101110010011000010110110101100101011101000110010101110010010111110111001001101111011011010010111101100110011000110011001001011111011101110110010101101001011001110110100001110100011100110010111001101101011001010110110101101000" *) 
(* ORIG_REF_NAME = "parameter_rom_sync" *) (* WIDTH = "8" *) 
module parameter_rom_sync__parameterized3
   (clk,
    en,
    addr,
    data);
  input clk;
  input en;
  input [10:0]addr;
  output [7:0]data;

  wire \<const0> ;
  wire \<const1> ;
  wire [10:0]addr;
  wire clk;
  wire [7:0]data;
  wire en;

  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "16384" *) 
  (* RTL_RAM_NAME = "parameter_rom_sync/data_reg" *) 
  (* RTL_RAM_STYLE = "NONE" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "2047" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "7" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'hF0F6D805EAEB0201FCF5F3FD11FD03D821210811FCF60BB8EB04FC090CF70CF3),
    .INIT_01(256'hFE8115DA1CF6FC14F508F308FEF0E4F50BF9C7060EF3F8DD0AEEFDEE0708F4FC),
    .INIT_02(256'h05E67F6225FAF8DC8917CCCECBE425E404081436DDC9AD20BD10890437282C00),
    .INIT_03(256'hFD2136AD468FD6242B27DB0FED1E1C3FDC04D8841B00DBC8BF05F9E7DA6D34D0),
    .INIT_04(256'hA4FB082B819F0DF3FDCA11EA14DCC8FB25E9C9E820DA1E2AF1181522F620305B),
    .INIT_05(256'hC12101B1A6DE0F351029CAD3D5212F150FF0242C02E5C4DB02F8E5BC1A061EFA),
    .INIT_06(256'h243EE8330F25E038F5B4BE2BE7C755BFD960D35B0DF6E1B82909BF2A49E2E14E),
    .INIT_07(256'h07C91E0839EE15456029CB36DA3EFABD1C3E81DD08C9E1FD0F2704E1ECD337F0),
    .INIT_08(256'h00F0120307EEF0FE0CF8FCF3FF0C07E607BAF7F9F6FD00F7F0010DEFEDE9F4F9),
    .INIT_09(256'h0A810DF800F70305F8E907F7F3FFF30003F5E5FF05070306FE1307FC14F9F602),
    .INIT_0A(256'hFBC3D2FBEB21FCC5DDFF02F63529E518FF23D5D204EA282F1A3A33FF3D041028),
    .INIT_0B(256'h1004D538ED233210FDE905CF81411722D5F3FF13D4201FDF45260D24201E021D),
    .INIT_0C(256'hFAFB00FCFD05F1030E10F9FBFE0503F1F413F7F4060A0DFAF003060206F0F0FB),
    .INIT_0D(256'h08810803F10BF8F905DF0C080AFA02010907FA130D08F4FA0C0C0AF006FE00FB),
    .INIT_0E(256'hE8BF60183CD114DB1168FFE1EF2CB1EC6017190A05EA1A0EC3CE30C9CDE6F3F0),
    .INIT_0F(256'hE0DAE83E4DEE3C1006C2D17FDBF5FEBFE2EC2BAEEEF42711EAD7EF02702D480F),
    .INIT_10(256'hE5811FFE1BE407FE020004D025011ED325DEC3E39F14F900EFDAFFC0F202C1FB),
    .INIT_11(256'hCE21F01622CC14E100D2EFF7C914F417F1F1E7FFE604F114F4FFFA194719DD17),
    .INIT_12(256'hCBA5F61EEBB5CEFECFA8F9F5F5DCF6483948F0EB2CFF9B0EFE122EB31D252AFB),
    .INIT_13(256'h8E71DA0281A9D22B2D0820BACD15E840E0B80D1013A9F9CFF4DE080238163AFB),
    .INIT_14(256'h4238425AE7D73D255BDAD10C7F270BCA4B962605DFCBBEEEE5AB59BD0205BDA2),
    .INIT_15(256'hBB3F5EBE2C86DA28EE09464A49B2D655021421130BA922F2C2DC19E04C1340C2),
    .INIT_16(256'hE73DB7ED2016191B0528DBD4CAEC09DDE3730EFE28DDFBC15827E900F95DDB39),
    .INIT_17(256'hE2B3CB0D9304F3F43F22E207D92A45CBFF26C7D3D41F0D25E1FB0F81E80FAC00),
    .INIT_18(256'h010A1610FAF9ED06FFFBF2F318F2F3DB080C0B0AFB02F4EE03FE070402010203),
    .INIT_19(256'h0481F301100BEDF6020A0E0804F2F0FE06FAE112F21100110409F40AF507F911),
    .INIT_1A(256'h0208E614EE01F00203F5FAF503FFFAD7040607FEFEF1F106F806020103FCFCF7),
    .INIT_1B(256'hFE81F6FBF108060501CF0807FA0510F006F8EDF100FBF6F1FEF0F901080109FC),
    .INIT_1C(256'hEF3013F7B02104CCB8241530A90BD7F38167092DC4D5EAEB6D3BAAD1FDE01CE6),
    .INIT_1D(256'h360CCD00DF2110A816D3C727DEF922100AE61795321900E0FBDAF5D9DDC0D6EF),
    .INIT_1E(256'h0DFD04F6F2F2F9F9110EF500FC0AFDEEFCFF12F7FCF903F9ED040F07F5F2F7F3),
    .INIT_1F(256'h08810BF40EF004040CF40B10FB07F6FEEF05FBF0F5F9080C050308F208F800F8),
    .INIT_20(256'hF607E10ADBFACB10EDEB201D1CDC0CEDEF26F3150012E28CC816E90E020F0F19),
    .INIT_21(256'h10D6FADD2208D503F03A19EFF8EFE3EF140681DC0A0BB5F23C0F04F92C0DF1EA),
    .INIT_22(256'hF101F0F901FA05FFFEFBF5EEF7090FD011FD0FFB0A0EF7F904F8FC02FB05FEF8),
    .INIT_23(256'h0C8107FB21F2EE0BF0FBFF0C05FAF1F700FCDBFA05F703E8E6080E08FCF8F6F9),
    .INIT_24(256'hF6FDCE13D2E0FC0A2A05E72FF602DB19FFECDAD40FF2DD33EC0906E9E716FE1D),
    .INIT_25(256'h03441CEA1F2EFD12F904113127F216E811DE2303EED913FCEBBBDE0C7F183A1A),
    .INIT_26(256'hCF8113F5180303053307FDAC1F171B0322E9F9EBF617F0B3DCE524EC061404E9),
    .INIT_27(256'hB40CE9F4FBBAF0CEF51AF214B800E326F4C5DC2F0F05EC34EE02280439F603E2),
    .INIT_28(256'h0B0911F310FCFA03FDFEED0D060D09C50BFAF609FE08FEF2FF090C04F002F8F7),
    .INIT_29(256'h08810DFC09FEF603F7F9FF020908F9F9FA07EB040E081216DE0F0EF5EC09FA01),
    .INIT_2A(256'hE3D8F918E800DC1111D1F611C7F419CE1D441F3F3402181B2DCCF4F11B1C20E6),
    .INIT_2B(256'h07811DD62B112BD31ED52F11FD26D6181310C2D523EABF0D0A3F06CDE2E6E80B),
    .INIT_2C(256'h01F20B0405F4E40C10EB07D90F0713CA20A80A0A09F8FAF3F4080701F0EAE00E),
    .INIT_2D(256'hF48103FF17EBF1F0F3DDE80DF902DE0005DCD50AEF090201020709FF0A10DE00),
    .INIT_2E(256'hEF06CCF2F2CA100D06DA06F92E0E07CD5616F0E901F8C5D7D5FB0C32010F2A02),
    .INIT_2F(256'h2CDD1DAA77B6D2EEFD390CE677E8D5D427E8B218EEEF12BEFAF8CBE881C5D6D2),
    .INIT_30(256'h402FBE30B8EF0EA1813B4FF035D239E43C1AEDBC03ED9033C6170D2CD0210F5B),
    .INIT_31(256'hFEF0C894740FBA6135734EFBB4D2FABE48A9F8D1DAF008A4E2F107C0391E1B18),
    .INIT_32(256'hE41C0207052D0B31121A89344EFBF303EAABE8F82400D91CAA27E9060615C2D0),
    .INIT_33(256'h393D12FA1EE9811536E8F73B0EC9B2FE31140A020CB2440610C5030A5BFA200C),
    .INIT_34(256'hE80124FCD3E318E620E9B503181519BA02810319E9C6EA01C400120714D80CF6),
    .INIT_35(256'h040827C92ACCDF0F0ECB320917D1C7D102D60E04DAF34608F1D33DF37B1BFAF5),
    .INIT_36(256'h0A028DFFB8F1FAFD17F201EF1505F6A42327FA0102F8D8C4E9F1180FF4F90404),
    .INIT_37(256'hF8810CE32CDAF8000E0B0DF610EBFAEC04F8DD1606F5F6E219F60FFD0BFAF1FC),
    .INIT_38(256'h06F4221D0C0B04060C18E5E900F9F6EDDDCD01E502F1011718E2E3C00A01F8F5),
    .INIT_39(256'hE9E7D70781F80605F1F7DA2ABF0517FD0FFF22D31D132506C4FDE2F7D82F25FF),
    .INIT_3A(256'h0101F7F2FDED0DF4040DF0EC12FEF6D4101E07FB0900F9D8D60103F60E08ECFD),
    .INIT_3B(256'hFF8110E926E8E8050B03110615F8FAFB02FCD6F7FDF702C819F1FBF103FB0AFF),
    .INIT_3C(256'hE908F60AE9FCEC060E07080AFA0D03D8FF96E6F4070908F2EA0C0BFCF014F80D),
    .INIT_3D(256'hF98104EE1DF9F3F7FC080F03F102ECF2080BF80BFCF5F417F20A00EEFAF20CF6),
    .INIT_3E(256'h28A426503FB4DAE55B00BF8E1A3540CC4BF7A439B7E19881DD4262CBBEF69DFA),
    .INIT_3F(256'h2DF5D5DA0D05BEE4D6B0DA4B1688D63D29CAFCFCC2F93F672D8D1508B52F0EF2),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(9),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(9),
    .WRITE_WIDTH_B(0)) 
    data_reg
       (.ADDRARDADDR({addr,\<const0> ,\<const0> ,\<const0> }),
        .ADDRBWRADDR({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .CLKARDCLK(clk),
        .CLKBWRCLK(\<const0> ),
        .DIADI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DIBDI({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DIPADIP({\<const0> ,\<const0> }),
        .DIPBDIP({\<const1> ,\<const1> }),
        .DOADO(data),
        .ENARDEN(en),
        .ENBWREN(\<const0> ),
        .REGCEAREGCE(\<const0> ),
        .REGCEB(\<const0> ),
        .RSTRAMARSTRAM(\<const0> ),
        .RSTRAMB(\<const0> ),
        .RSTREGARSTREG(\<const0> ),
        .RSTREGB(\<const0> ),
        .WEA({\<const0> ,\<const0> }),
        .WEBWE({\<const0> ,\<const0> ,\<const0> ,\<const0> }));
endmodule

(* ADDR_WIDTH = "5" *) (* DEPTH = "32" *) (* INIT_FILE = "416'b01110010011001010111001101110101011011000111010001110011001011110111000000110011010111110110110100110000001101000010111101101101011011000111000001011111011001100110111101101100011001000011000101011111011100000110000101110010011000010110110101100101011101000110010101110010010111110111001001101111011011010010111101100110011000110011001001011111011000100110100101100001011100110010111001101101011001010110110101101000" *) 
(* ORIG_REF_NAME = "parameter_rom_sync" *) (* WIDTH = "32" *) 
module parameter_rom_sync__parameterized4
   (clk,
    en,
    addr,
    data);
  input clk;
  input en;
  input [4:0]addr;
  output [31:0]data;

  wire \<const0> ;
  wire [4:0]addr;
  wire clk;
  wire [31:0]\^data ;
  wire en;
  wire [13:0]p_0_out;

  assign data[31] = \^data [31];
  assign data[30] = \<const0> ;
  assign data[29] = \<const0> ;
  assign data[28] = \<const0> ;
  assign data[27] = \<const0> ;
  assign data[26] = \<const0> ;
  assign data[25] = \<const0> ;
  assign data[24] = \<const0> ;
  assign data[23] = \<const0> ;
  assign data[22] = \<const0> ;
  assign data[21] = \<const0> ;
  assign data[20] = \<const0> ;
  assign data[19] = \<const0> ;
  assign data[18] = \<const0> ;
  assign data[17] = \<const0> ;
  assign data[16] = \<const0> ;
  assign data[15] = \<const0> ;
  assign data[14] = \<const0> ;
  assign data[13] = \<const0> ;
  assign data[12:0] = \^data [12:0];
  GND GND
       (.G(\<const0> ));
  FDRE \data_reg[0] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[0]),
        .Q(\^data [0]),
        .R(\<const0> ));
  FDRE \data_reg[10] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[10]),
        .Q(\^data [10]),
        .R(\<const0> ));
  FDRE \data_reg[11] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[11]),
        .Q(\^data [11]),
        .R(\<const0> ));
  FDRE \data_reg[12] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[12]),
        .Q(\^data [12]),
        .R(\<const0> ));
  FDRE \data_reg[13] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[13]),
        .Q(\^data [31]),
        .R(\<const0> ));
  FDRE \data_reg[1] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[1]),
        .Q(\^data [1]),
        .R(\<const0> ));
  FDRE \data_reg[2] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[2]),
        .Q(\^data [2]),
        .R(\<const0> ));
  FDRE \data_reg[3] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[3]),
        .Q(\^data [3]),
        .R(\<const0> ));
  FDRE \data_reg[4] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[4]),
        .Q(\^data [4]),
        .R(\<const0> ));
  FDRE \data_reg[5] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[5]),
        .Q(\^data [5]),
        .R(\<const0> ));
  FDRE \data_reg[6] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[6]),
        .Q(\^data [6]),
        .R(\<const0> ));
  FDRE \data_reg[7] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[7]),
        .Q(\^data [7]),
        .R(\<const0> ));
  FDRE \data_reg[8] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[8]),
        .Q(\^data [8]),
        .R(\<const0> ));
  FDRE \data_reg[9] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[9]),
        .Q(\^data [9]),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h90D360B2)) 
    g0_b0
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hA948C1BD)) 
    g0_b1
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h2C4C2CC2)) 
    g0_b10
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[10]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hAC4129C8)) 
    g0_b11
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[11]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hBFCD2940)) 
    g0_b12
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[12]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'hAECD2D40)) 
    g0_b13
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[13]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h09667610)) 
    g0_b2
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hBF0F71DF)) 
    g0_b3
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h47877F49)) 
    g0_b4
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hE473804E)) 
    g0_b5
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hF915F605)) 
    g0_b6
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h57C4E1BF)) 
    g0_b7
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[7]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hEBFE4165)) 
    g0_b8
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[8]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hB269E2F6)) 
    g0_b9
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[9]));
endmodule

(* ADDR_WIDTH = "5" *) (* DEPTH = "32" *) (* INIT_FILE = "464'b01110010011001010111001101110101011011000111010001110011001011110111000000110011010111110110110100110000001101000010111101101101011011000111000001011111011001100110111101101100011001000011000101011111011100000110000101110010011000010110110101100101011101000110010101110010010111110111001001101111011011010010111101100110011000110011001001011111011011010111010101101100011101000110100101110000011011000110100101100101011100100010111001101101011001010110110101101000" *) 
(* ORIG_REF_NAME = "parameter_rom_sync" *) (* WIDTH = "32" *) 
module parameter_rom_sync__parameterized5
   (clk,
    en,
    addr,
    data);
  input clk;
  input en;
  input [4:0]addr;
  output [31:0]data;

  wire \<const0> ;
  wire [4:0]addr;
  wire clk;
  wire [24:0]\^data ;
  wire en;
  wire [24:0]p_0_out;

  assign data[31] = \<const0> ;
  assign data[30] = \<const0> ;
  assign data[29] = \<const0> ;
  assign data[28] = \<const0> ;
  assign data[27] = \<const0> ;
  assign data[26] = \<const0> ;
  assign data[25] = \<const0> ;
  assign data[24:0] = \^data [24:0];
  GND GND
       (.G(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'hD66136F8)) 
    \data[0]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[1]),
        .I3(addr[2]),
        .I4(addr[0]),
        .O(p_0_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hBCFD838C)) 
    \data[10]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[2]),
        .I3(addr[1]),
        .I4(addr[0]),
        .O(p_0_out[10]));
  LUT5 #(
    .INIT(32'hDDDF9D87)) 
    \data[11]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[2]),
        .I4(addr[1]),
        .O(p_0_out[11]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h7D8DBDDB)) 
    \data[12]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[2]),
        .I4(addr[1]),
        .O(p_0_out[12]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h833FBB33)) 
    \data[13]_i_1 
       (.I0(addr[2]),
        .I1(addr[4]),
        .I2(addr[1]),
        .I3(addr[0]),
        .I4(addr[3]),
        .O(p_0_out[13]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h3058C9CC)) 
    \data[14]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[1]),
        .I3(addr[2]),
        .I4(addr[0]),
        .O(p_0_out[14]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hE8B2A8A8)) 
    \data[15]_i_1 
       (.I0(addr[4]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .I4(addr[3]),
        .O(p_0_out[15]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'hFD4805FD)) 
    \data[16]_i_1 
       (.I0(addr[4]),
        .I1(addr[2]),
        .I2(addr[3]),
        .I3(addr[0]),
        .I4(addr[1]),
        .O(p_0_out[16]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h5982AD99)) 
    \data[17]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[1]),
        .I3(addr[2]),
        .I4(addr[0]),
        .O(p_0_out[17]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hBAD99BA4)) 
    \data[18]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[1]),
        .I4(addr[2]),
        .O(p_0_out[18]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h8ADFD7C2)) 
    \data[19]_i_1 
       (.I0(addr[4]),
        .I1(addr[1]),
        .I2(addr[3]),
        .I3(addr[0]),
        .I4(addr[2]),
        .O(p_0_out[19]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h142B4723)) 
    \data[1]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[1]),
        .I3(addr[2]),
        .I4(addr[0]),
        .O(p_0_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'hC63D55E5)) 
    \data[20]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[1]),
        .I3(addr[0]),
        .I4(addr[2]),
        .O(p_0_out[20]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'hFA153780)) 
    \data[21]_i_1 
       (.I0(addr[4]),
        .I1(addr[0]),
        .I2(addr[3]),
        .I3(addr[1]),
        .I4(addr[2]),
        .O(p_0_out[21]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h1B4FF1BA)) 
    \data[22]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[1]),
        .I3(addr[2]),
        .I4(addr[0]),
        .O(p_0_out[22]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h1A018A82)) 
    \data[23]_i_1 
       (.I0(addr[4]),
        .I1(addr[1]),
        .I2(addr[0]),
        .I3(addr[2]),
        .I4(addr[3]),
        .O(p_0_out[23]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h48C21071)) 
    \data[24]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[2]),
        .I3(addr[1]),
        .I4(addr[0]),
        .O(p_0_out[24]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'hBFB20F99)) 
    \data[2]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[1]),
        .I3(addr[0]),
        .I4(addr[2]),
        .O(p_0_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h2D208051)) 
    \data[3]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[1]),
        .I3(addr[0]),
        .I4(addr[2]),
        .O(p_0_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h0174168E)) 
    \data[4]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[1]),
        .I3(addr[2]),
        .I4(addr[0]),
        .O(p_0_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h53FD6338)) 
    \data[5]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[1]),
        .I3(addr[2]),
        .I4(addr[0]),
        .O(p_0_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h85ACD153)) 
    \data[6]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[1]),
        .I3(addr[0]),
        .I4(addr[2]),
        .O(p_0_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h3DD23222)) 
    \data[7]_i_1 
       (.I0(addr[4]),
        .I1(addr[1]),
        .I2(addr[3]),
        .I3(addr[2]),
        .I4(addr[0]),
        .O(p_0_out[7]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h4888FC1F)) 
    \data[8]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[1]),
        .I3(addr[0]),
        .I4(addr[2]),
        .O(p_0_out[8]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'hCE023527)) 
    \data[9]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[2]),
        .I4(addr[1]),
        .O(p_0_out[9]));
  FDRE \data_reg[0] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[0]),
        .Q(\^data [0]),
        .R(\<const0> ));
  FDRE \data_reg[10] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[10]),
        .Q(\^data [10]),
        .R(\<const0> ));
  FDRE \data_reg[11] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[11]),
        .Q(\^data [11]),
        .R(\<const0> ));
  FDRE \data_reg[12] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[12]),
        .Q(\^data [12]),
        .R(\<const0> ));
  FDRE \data_reg[13] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[13]),
        .Q(\^data [13]),
        .R(\<const0> ));
  FDRE \data_reg[14] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[14]),
        .Q(\^data [14]),
        .R(\<const0> ));
  FDRE \data_reg[15] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[15]),
        .Q(\^data [15]),
        .R(\<const0> ));
  FDRE \data_reg[16] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[16]),
        .Q(\^data [16]),
        .R(\<const0> ));
  FDRE \data_reg[17] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[17]),
        .Q(\^data [17]),
        .R(\<const0> ));
  FDRE \data_reg[18] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[18]),
        .Q(\^data [18]),
        .R(\<const0> ));
  FDRE \data_reg[19] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[19]),
        .Q(\^data [19]),
        .R(\<const0> ));
  FDRE \data_reg[1] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[1]),
        .Q(\^data [1]),
        .R(\<const0> ));
  FDRE \data_reg[20] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[20]),
        .Q(\^data [20]),
        .R(\<const0> ));
  FDRE \data_reg[21] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[21]),
        .Q(\^data [21]),
        .R(\<const0> ));
  FDRE \data_reg[22] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[22]),
        .Q(\^data [22]),
        .R(\<const0> ));
  FDRE \data_reg[23] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[23]),
        .Q(\^data [23]),
        .R(\<const0> ));
  FDRE \data_reg[24] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[24]),
        .Q(\^data [24]),
        .R(\<const0> ));
  FDRE \data_reg[2] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[2]),
        .Q(\^data [2]),
        .R(\<const0> ));
  FDRE \data_reg[3] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[3]),
        .Q(\^data [3]),
        .R(\<const0> ));
  FDRE \data_reg[4] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[4]),
        .Q(\^data [4]),
        .R(\<const0> ));
  FDRE \data_reg[5] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[5]),
        .Q(\^data [5]),
        .R(\<const0> ));
  FDRE \data_reg[6] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[6]),
        .Q(\^data [6]),
        .R(\<const0> ));
  FDRE \data_reg[7] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[7]),
        .Q(\^data [7]),
        .R(\<const0> ));
  FDRE \data_reg[8] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[8]),
        .Q(\^data [8]),
        .R(\<const0> ));
  FDRE \data_reg[9] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[9]),
        .Q(\^data [9]),
        .R(\<const0> ));
endmodule

(* ADDR_WIDTH = "5" *) (* DEPTH = "32" *) (* INIT_FILE = "464'b01110010011001010111001101110101011011000111010001110011001011110111000000110011010111110110110100110000001101000010111101101101011011000111000001011111011001100110111101101100011001000011000101011111011100000110000101110010011000010110110101100101011101000110010101110010010111110111001001101111011011010010111101101111011101010111010001110000011101010111010001011111011101110110010101101001011001110110100001110100011100110010111001101101011001010110110101101000" *) 
(* ORIG_REF_NAME = "parameter_rom_sync" *) (* WIDTH = "8" *) 
module parameter_rom_sync__parameterized7
   (clk,
    en,
    addr,
    data);
  input clk;
  input en;
  input [4:0]addr;
  output [7:0]data;

  wire \<const0> ;
  wire [4:0]addr;
  wire clk;
  wire [7:0]data;
  wire en;
  wire [7:0]p_0_out;

  GND GND
       (.G(\<const0> ));
  FDRE \data_reg[0] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[0]),
        .Q(data[0]),
        .R(\<const0> ));
  FDRE \data_reg[1] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[1]),
        .Q(data[1]),
        .R(\<const0> ));
  FDRE \data_reg[2] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[2]),
        .Q(data[2]),
        .R(\<const0> ));
  FDRE \data_reg[3] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[3]),
        .Q(data[3]),
        .R(\<const0> ));
  FDRE \data_reg[4] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[4]),
        .Q(data[4]),
        .R(\<const0> ));
  FDRE \data_reg[5] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[5]),
        .Q(data[5]),
        .R(\<const0> ));
  FDRE \data_reg[6] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[6]),
        .Q(data[6]),
        .R(\<const0> ));
  FDRE \data_reg[7] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[7]),
        .Q(data[7]),
        .R(\<const0> ));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h44DD595C)) 
    g0_b0
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h31F0D559)) 
    g0_b1
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'hA98BE6FE)) 
    g0_b2
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h26E5787F)) 
    g0_b3
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'hE7B533D8)) 
    g0_b4
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'hB8CBE821)) 
    g0_b5
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'hCECC4D30)) 
    g0_b6
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'hC64C4D30)) 
    g0_b7
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[7]));
endmodule
