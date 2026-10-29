// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.2 (lin64) Build 6299465 Fri Nov 14 12:34:56 MST 2025
// Date        : Thu Oct 29 08:51:56 2026
// Host        : localhost.localdomain running 64-bit Rocky Linux 9.5 (Blue Onyx)
// Command     : write_verilog -force -mode timesim -sdf_anno true
//               /hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/synthesis/cnn_v3_artix7_ooc/reports/p3_m06_05/cnn_v3_post_route_timesim.v
// Design      : cnn_int8_pipelined_v3
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ADDR_WIDTH = "8" *) (* DEPTH = "160" *) 
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
  input [7:0]waddr;
  input [7:0]raddr;
  input [7:0]wdata;
  output [7:0]rdata;

  wire clk;
  wire [7:0]raddr;
  wire [7:0]rdata;
  wire re;
  wire [7:0]waddr;
  wire [7:0]wdata;
  wire we;
  wire [15:0]NLW_mem_reg_DOADO_UNCONNECTED;
  wire [15:8]NLW_mem_reg_DOBDO_UNCONNECTED;
  wire [1:0]NLW_mem_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_mem_reg_DOPBDOP_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "1280" *) 
  (* RTL_RAM_NAME = "activation_ram_sync/mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "768" *) 
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
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
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
    .INIT_FILE("NONE"),
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
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    mem_reg
       (.ADDRARDADDR({1'b1,1'b1,waddr,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,raddr,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,wdata}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(NLW_mem_reg_DOADO_UNCONNECTED[15:0]),
        .DOBDO({NLW_mem_reg_DOBDO_UNCONNECTED[15:8],rdata}),
        .DOPADOP(NLW_mem_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_mem_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(we),
        .ENBWREN(re),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ADDR_WIDTH = "8" *) (* DEPTH = "160" *) (* ORIG_REF_NAME = "activation_ram_sync" *) 
module activation_ram_sync__1
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
  input [7:0]waddr;
  input [7:0]raddr;
  input [7:0]wdata;
  output [7:0]rdata;

  wire clk;
  wire [7:0]raddr;
  wire [7:0]rdata;
  wire re;
  wire [7:0]waddr;
  wire [7:0]wdata;
  wire we;
  wire [15:0]NLW_mem_reg_DOADO_UNCONNECTED;
  wire [15:8]NLW_mem_reg_DOBDO_UNCONNECTED;
  wire [1:0]NLW_mem_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_mem_reg_DOPBDOP_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "1280" *) 
  (* RTL_RAM_NAME = "activation_ram_sync/mem_reg" *) 
  (* RTL_RAM_STYLE = "auto" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "768" *) 
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
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
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
    .INIT_FILE("NONE"),
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
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    mem_reg
       (.ADDRARDADDR({1'b1,1'b1,waddr,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({1'b1,1'b1,raddr,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk),
        .CLKBWRCLK(clk),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,wdata}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(NLW_mem_reg_DOADO_UNCONNECTED[15:0]),
        .DOBDO({NLW_mem_reg_DOBDO_UNCONNECTED[15:8],rdata}),
        .DOPADOP(NLW_mem_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_mem_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(we),
        .ENBWREN(re),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* B2_ROM = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv2_bias.memh" *) (* B3_ROM = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/fc1_bias.memh" *) (* B4_ROM = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/output_bias.memh" *) 
(* B_ROM = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv1_bias.memh" *) (* COMPLETE = "4'b1100" *) (* ECO_CHECKSUM = "e66a7f62" *) 
(* IDLE = "4'b0000" *) (* LOAD = "4'b0001" *) (* M2_ROM = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv2_multiplier.memh" *) 
(* M3_ROM = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/fc1_multiplier.memh" *) (* M4_ROM = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/output_multiplier.memh" *) (* M_ROM = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv1_multiplier.memh" *) 
(* NEXT = "4'b1011" *) (* NSTART = "4'b0100" *) (* NWAIT = "4'b1001" *) 
(* OP_ADV = "4'b1000" *) (* OP_FEED = "4'b0111" *) (* OP_REQ = "4'b0101" *) 
(* OP_WAIT = "4'b0110" *) (* PARAM_REQ = "4'b0010" *) (* PARAM_WAIT = "4'b0011" *) 
(* POWER_OPT_BRAM_CDC = "0" *) (* POWER_OPT_BRAM_SR_ADDR = "0" *) (* POWER_OPT_LOOPED_NET_PERCENTAGE = "0" *) 
(* S2_ROM = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv2_shift.memh" *) (* S3_ROM = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/fc1_shift.memh" *) (* S4_ROM = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/output_shift.memh" *) 
(* S_ROM = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv1_shift.memh" *) (* W2_ROM = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv2_weights.memh" *) (* W3_ROM = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/fc1_weights.memh" *) 
(* W4_ROM = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/output_weights.memh" *) (* WRITE = "4'b1010" *) (* W_ROM = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv1_weights.memh" *) 
(* NotValidForBitStream *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
module cnn_int8_pipelined_v3
   (clk,
    rst,
    start,
    input_valid,
    input_data,
    input_ready,
    busy,
    done,
    conv1_valid,
    conv1_index,
    conv1_data,
    conv2_valid,
    conv2_index,
    conv2_data,
    fc1_valid,
    fc1_index,
    fc1_data,
    output_valid,
    output_data,
    accumulator_overflow,
    config_error);
  input clk;
  input rst;
  input start;
  input input_valid;
  input [7:0]input_data;
  output input_ready;
  output busy;
  output done;
  output conv1_valid;
  output [7:0]conv1_index;
  output [7:0]conv1_data;
  output conv2_valid;
  output [7:0]conv2_index;
  output [7:0]conv2_data;
  output fc1_valid;
  output [5:0]fc1_index;
  output [7:0]fc1_data;
  output output_valid;
  output [7:0]output_data;
  output accumulator_overflow;
  output config_error;

  wire \FSM_onehot_state[11]_i_1_n_0 ;
  wire \FSM_onehot_state[11]_i_2_n_0 ;
  wire \FSM_onehot_state[11]_i_3_n_0 ;
  wire \FSM_onehot_state[11]_i_4_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[3]_i_1_n_0 ;
  wire \FSM_onehot_state[3]_i_2_n_0 ;
  wire \FSM_onehot_state[3]_i_3_n_0 ;
  wire \FSM_onehot_state[5]_i_1_n_0 ;
  wire \FSM_onehot_state[5]_i_2_n_0 ;
  wire \FSM_onehot_state[5]_i_4_n_0 ;
  wire \FSM_onehot_state[5]_i_5_n_0 ;
  wire \FSM_onehot_state[8]_i_1_n_0 ;
  wire \FSM_onehot_state[8]_i_2_n_0 ;
  wire \FSM_onehot_state[8]_i_3_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[10] ;
  wire \FSM_onehot_state_reg_n_0_[11] ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire \FSM_onehot_state_reg_n_0_[4] ;
  wire \FSM_onehot_state_reg_n_0_[5] ;
  wire \FSM_onehot_state_reg_n_0_[6] ;
  wire \FSM_onehot_state_reg_n_0_[9] ;
  wire accumulator_overflow;
  wire accumulator_overflow_i_1_n_0;
  wire accumulator_overflow_i_2_n_0;
  wire accumulator_overflow_i_3_n_0;
  wire accumulator_overflow_i_4_n_0;
  wire [7:0]act2_data;
  wire [7:0]act_data;
  wire [31:0]b2_data;
  wire [31:0]b3_data;
  wire [31:0]b_data;
  wire [0:0]bias_reg;
  wire \bias_reg[0]_i_1_n_0 ;
  wire \bias_reg[10]_i_1_n_0 ;
  wire \bias_reg[11]_i_1_n_0 ;
  wire \bias_reg[12]_i_1_n_0 ;
  wire \bias_reg[1]_i_1_n_0 ;
  wire \bias_reg[2]_i_1_n_0 ;
  wire \bias_reg[31]_i_1_n_0 ;
  wire \bias_reg[3]_i_1_n_0 ;
  wire \bias_reg[4]_i_1_n_0 ;
  wire \bias_reg[5]_i_1_n_0 ;
  wire \bias_reg[6]_i_1_n_0 ;
  wire \bias_reg[7]_i_1_n_0 ;
  wire \bias_reg[8]_i_1_n_0 ;
  wire \bias_reg[9]_i_1_n_0 ;
  wire \bias_reg_reg_n_0_[0] ;
  wire \bias_reg_reg_n_0_[10] ;
  wire \bias_reg_reg_n_0_[11] ;
  wire \bias_reg_reg_n_0_[12] ;
  wire \bias_reg_reg_n_0_[1] ;
  wire \bias_reg_reg_n_0_[2] ;
  wire \bias_reg_reg_n_0_[31] ;
  wire \bias_reg_reg_n_0_[3] ;
  wire \bias_reg_reg_n_0_[4] ;
  wire \bias_reg_reg_n_0_[5] ;
  wire \bias_reg_reg_n_0_[6] ;
  wire \bias_reg_reg_n_0_[7] ;
  wire \bias_reg_reg_n_0_[8] ;
  wire \bias_reg_reg_n_0_[9] ;
  wire busy;
  wire clk;
  wire config_error;
  wire config_error_i_1_n_0;
  wire config_error_i_2_n_0;
  wire conv1_bank_i_1_n_0;
  wire [7:0]conv1_data;
  wire [7:0]conv1_index;
  wire conv1_valid;
  wire conv1_valid_i_1_n_0;
  wire [7:0]conv2_data;
  wire [7:0]conv2_index;
  wire conv2_valid;
  wire conv2_valid_i_1_n_0;
  wire done;
  wire en0;
  wire en012_out;
  wire en013_out;
  wire en014_out;
  wire en02_out;
  wire en04_out;
  wire en06_out;
  wire [7:0]fc1_data;
  wire [5:0]fc1_index;
  wire fc1_valid;
  wire fc1_valid_i_1_n_0;
  wire [0:0]feature_reg;
  wire \feature_reg[0]_i_1_n_0 ;
  wire \feature_reg[1]_i_1_n_0 ;
  wire \feature_reg[2]_i_1_n_0 ;
  wire \feature_reg[3]_i_1_n_0 ;
  wire \feature_reg[4]_i_1_n_0 ;
  wire \feature_reg[5]_i_1_n_0 ;
  wire \feature_reg[6]_i_1_n_0 ;
  wire \feature_reg[7]_i_1_n_0 ;
  wire \feature_reg_reg_n_0_[0] ;
  wire \feature_reg_reg_n_0_[1] ;
  wire \feature_reg_reg_n_0_[2] ;
  wire \feature_reg_reg_n_0_[3] ;
  wire \feature_reg_reg_n_0_[4] ;
  wire \feature_reg_reg_n_0_[5] ;
  wire \feature_reg_reg_n_0_[6] ;
  wire \feature_reg_reg_n_0_[7] ;
  wire [7:4]in_addr2;
  wire input_bank_i_10_n_0;
  wire input_bank_i_11_n_0;
  wire input_bank_i_12_n_0;
  wire input_bank_i_13_n_0;
  wire input_bank_i_14_n_0;
  wire input_bank_i_15_n_0;
  wire input_bank_i_16_n_0;
  wire input_bank_i_17_n_0;
  wire input_bank_i_18_n_0;
  wire input_bank_i_19_n_0;
  wire input_bank_i_20_n_0;
  wire input_bank_i_21_n_0;
  wire input_bank_i_22_n_0;
  wire input_bank_i_23_n_0;
  wire input_bank_i_24_n_0;
  wire input_bank_i_25_n_0;
  wire input_bank_i_26_n_0;
  wire input_bank_i_30_n_0;
  wire input_bank_i_31_n_0;
  wire input_bank_i_32_n_0;
  wire input_bank_i_34_n_0;
  wire input_bank_i_35_n_0;
  wire input_bank_i_37_n_0;
  wire input_bank_i_38_n_0;
  wire input_bank_i_39_n_0;
  wire input_bank_i_3_n_0;
  wire input_bank_i_40_n_0;
  wire input_bank_i_41_n_0;
  wire input_bank_i_42_n_0;
  wire input_bank_i_43_n_0;
  wire input_bank_i_44_n_0;
  wire input_bank_i_45_n_0;
  wire input_bank_i_46_n_0;
  wire input_bank_i_47_n_0;
  wire input_bank_i_48_n_0;
  wire input_bank_i_49_n_0;
  wire input_bank_i_4_n_0;
  wire input_bank_i_50_n_0;
  wire input_bank_i_51_n_0;
  wire input_bank_i_52_n_0;
  wire input_bank_i_53_n_0;
  wire input_bank_i_54_n_0;
  wire input_bank_i_55_n_0;
  wire input_bank_i_57_n_0;
  wire input_bank_i_58_n_0;
  wire input_bank_i_59_n_0;
  wire input_bank_i_5_n_0;
  wire input_bank_i_6_n_0;
  wire input_bank_i_7_n_0;
  wire input_bank_i_8_n_0;
  wire input_bank_i_9_n_0;
  wire [7:0]input_data;
  wire input_ready;
  wire input_valid;
  wire \layer[0]_i_1_n_0 ;
  wire \layer[1]_i_1_n_0 ;
  wire \layer[1]_i_2_n_0 ;
  wire \layer_reg_n_0_[0] ;
  wire \layer_reg_n_0_[1] ;
  wire [5:0]load_idx;
  wire \load_idx[5]_i_1_n_0 ;
  wire \load_idx[5]_i_3_n_0 ;
  wire \load_idx[5]_i_4_n_0 ;
  wire \load_idx_reg_n_0_[0] ;
  wire \load_idx_reg_n_0_[1] ;
  wire \load_idx_reg_n_0_[2] ;
  wire \load_idx_reg_n_0_[3] ;
  wire \load_idx_reg_n_0_[4] ;
  wire \load_idx_reg_n_0_[5] ;
  wire [24:0]m2_data;
  wire [25:0]m3_data;
  wire [23:0]m_data;
  wire [25:0]mult_reg;
  wire \mult_reg[0]_i_1_n_0 ;
  wire \mult_reg[10]_i_1_n_0 ;
  wire \mult_reg[11]_i_1_n_0 ;
  wire \mult_reg[12]_i_1_n_0 ;
  wire \mult_reg[13]_i_1_n_0 ;
  wire \mult_reg[14]_i_1_n_0 ;
  wire \mult_reg[15]_i_1_n_0 ;
  wire \mult_reg[16]_i_1_n_0 ;
  wire \mult_reg[17]_i_1_n_0 ;
  wire \mult_reg[18]_i_1_n_0 ;
  wire \mult_reg[19]_i_1_n_0 ;
  wire \mult_reg[1]_i_1_n_0 ;
  wire \mult_reg[20]_i_1_n_0 ;
  wire \mult_reg[21]_i_1_n_0 ;
  wire \mult_reg[22]_i_1_n_0 ;
  wire \mult_reg[23]_i_1_n_0 ;
  wire \mult_reg[24]_i_1_n_0 ;
  wire \mult_reg[25]_i_1_n_0 ;
  wire \mult_reg[2]_i_1_n_0 ;
  wire \mult_reg[3]_i_1_n_0 ;
  wire \mult_reg[4]_i_1_n_0 ;
  wire \mult_reg[5]_i_1_n_0 ;
  wire \mult_reg[6]_i_1_n_0 ;
  wire \mult_reg[7]_i_1_n_0 ;
  wire \mult_reg[8]_i_1_n_0 ;
  wire \mult_reg[9]_i_1_n_0 ;
  wire neuron_config_error;
  wire neuron_done;
  wire neuron_i_1_n_0;
  wire neuron_i_2_n_0;
  wire neuron_i_3_n_0;
  wire neuron_i_4_n_0;
  wire neuron_i_5_n_0;
  wire neuron_overflow;
  wire [7:0]neuron_result;
  wire \oc[0]_i_1_n_0 ;
  wire \oc[1]_i_1_n_0 ;
  wire \oc[2]_i_1_n_0 ;
  wire \oc[3]_i_1_n_0 ;
  wire \oc[4]_i_1_n_0 ;
  wire \oc[5]_i_1_n_0 ;
  wire \oc[5]_i_2_n_0 ;
  wire \oc[5]_i_3_n_0 ;
  wire \oc[5]_i_4_n_0 ;
  wire \oc_reg_n_0_[0] ;
  wire \oc_reg_n_0_[1] ;
  wire \oc_reg_n_0_[2] ;
  wire \oc_reg_n_0_[3] ;
  wire \oc_reg_n_0_[4] ;
  wire \oc_reg_n_0_[5] ;
  wire [7:5]operand;
  wire \operand[0]_i_1_n_0 ;
  wire \operand[1]_i_1_n_0 ;
  wire \operand[2]_i_1_n_0 ;
  wire \operand[3]_i_1_n_0 ;
  wire \operand[4]_i_1_n_0 ;
  wire \operand[5]_i_1_n_0 ;
  wire \operand[5]_i_2_n_0 ;
  wire \operand[6]_i_1_n_0 ;
  wire \operand[7]_i_1_n_0 ;
  wire \operand[7]_i_2_n_0 ;
  wire \operand_reg_n_0_[0] ;
  wire \operand_reg_n_0_[1] ;
  wire \operand_reg_n_0_[2] ;
  wire \operand_reg_n_0_[3] ;
  wire \operand_reg_n_0_[4] ;
  wire operand_req;
  wire [7:0]out_addr;
  wire [7:1]out_addr0;
  wire [7:2]out_addr1;
  wire [0:0]output_addr;
  wire \output_addr[4]_i_3_n_0 ;
  wire \output_addr[4]_i_4_n_0 ;
  wire \output_addr[4]_i_5_n_0 ;
  wire \output_addr[7]_i_6_n_0 ;
  wire \output_addr[7]_i_7_n_0 ;
  wire \output_addr[7]_i_8_n_0 ;
  wire \output_addr[7]_i_9_n_0 ;
  wire \output_addr_reg[4]_i_2_n_0 ;
  wire \output_addr_reg[7]_i_5_n_0 ;
  wire \output_addr_reg_n_0_[0] ;
  wire \output_addr_reg_n_0_[1] ;
  wire \output_addr_reg_n_0_[2] ;
  wire \output_addr_reg_n_0_[3] ;
  wire \output_addr_reg_n_0_[4] ;
  wire \output_addr_reg_n_0_[5] ;
  wire \output_addr_reg_n_0_[6] ;
  wire \output_addr_reg_n_0_[7] ;
  wire [7:0]output_data;
  wire \output_reg_reg_n_0_[0] ;
  wire \output_reg_reg_n_0_[1] ;
  wire \output_reg_reg_n_0_[2] ;
  wire \output_reg_reg_n_0_[3] ;
  wire \output_reg_reg_n_0_[4] ;
  wire \output_reg_reg_n_0_[5] ;
  wire \output_reg_reg_n_0_[6] ;
  wire \output_reg_reg_n_0_[7] ;
  wire output_valid;
  wire output_valid_i_1_n_0;
  wire [1:1]p_0_in__0;
  wire p_1_in;
  wire pad_active;
  wire re0;
  wire re09_out;
  wire rst;
  wire \shift_reg_reg_n_0_[0] ;
  wire start;
  wire state1;
  wire \t[0]_i_1_n_0 ;
  wire \t[1]_i_1_n_0 ;
  wire \t[2]_i_1_n_0 ;
  wire \t[3]_i_1_n_0 ;
  wire \t[3]_i_2_n_0 ;
  wire \t_reg_n_0_[0] ;
  wire \t_reg_n_0_[1] ;
  wire \t_reg_n_0_[2] ;
  wire \t_reg_n_0_[3] ;
  wire [7:0]w2_data;
  wire [7:0]w3_data;
  wire [7:0]w4_data;
  wire [7:0]w_data;
  wire [9:4]waddr20;
  wire [12:7]waddr30;
  wire we0;
  wire [7:0]weight_reg;
  wire \weight_reg[0]_i_1_n_0 ;
  wire \weight_reg[1]_i_1_n_0 ;
  wire \weight_reg[2]_i_1_n_0 ;
  wire \weight_reg[3]_i_1_n_0 ;
  wire \weight_reg[4]_i_1_n_0 ;
  wire \weight_reg[5]_i_1_n_0 ;
  wire \weight_reg[6]_i_1_n_0 ;
  wire \weight_reg[7]_i_1_n_0 ;
  wire weights2_rom_i_10_n_0;
  wire weights2_rom_i_11_n_0;
  wire weights2_rom_i_12_n_0;
  wire weights2_rom_i_13_n_0;
  wire weights2_rom_i_14_n_0;
  wire weights2_rom_i_2_n_6;
  wire weights2_rom_i_2_n_7;
  wire weights2_rom_i_3_n_0;
  wire weights2_rom_i_3_n_4;
  wire weights2_rom_i_3_n_5;
  wire weights2_rom_i_3_n_6;
  wire weights2_rom_i_3_n_7;
  wire weights2_rom_i_5_n_0;
  wire weights2_rom_i_6_n_0;
  wire weights2_rom_i_7_n_0;
  wire weights2_rom_i_8_n_0;
  wire weights2_rom_i_9_n_0;
  wire weights3_rom_i_10_n_0;
  wire weights3_rom_i_11_n_0;
  wire weights3_rom_i_12_n_0;
  wire weights3_rom_i_2_n_4;
  wire weights3_rom_i_2_n_5;
  wire weights3_rom_i_2_n_6;
  wire weights3_rom_i_2_n_7;
  wire weights3_rom_i_3_n_0;
  wire weights3_rom_i_3_n_4;
  wire weights3_rom_i_3_n_5;
  wire weights3_rom_i_3_n_6;
  wire weights3_rom_i_3_n_7;
  wire weights3_rom_i_5_n_0;
  wire weights3_rom_i_6_n_0;
  wire weights3_rom_i_7_n_0;
  wire weights3_rom_i_8_n_0;
  wire weights3_rom_i_9_n_0;
  wire weights_rom_i_10_n_0;
  wire weights_rom_i_11_n_0;
  wire weights_rom_i_12_n_0;
  wire weights_rom_i_13_n_0;
  wire weights_rom_i_14_n_0;
  wire weights_rom_i_15_n_0;
  wire weights_rom_i_16_n_0;
  wire weights_rom_i_2_n_6;
  wire weights_rom_i_2_n_7;
  wire weights_rom_i_3_n_0;
  wire weights_rom_i_3_n_4;
  wire weights_rom_i_3_n_5;
  wire weights_rom_i_3_n_6;
  wire weights_rom_i_3_n_7;
  wire weights_rom_i_4_n_6;
  wire weights_rom_i_4_n_7;
  wire weights_rom_i_5_n_0;
  wire weights_rom_i_6_n_0;
  wire weights_rom_i_7_n_0;
  wire weights_rom_i_7_n_4;
  wire weights_rom_i_7_n_5;
  wire weights_rom_i_7_n_6;
  wire weights_rom_i_8_n_0;
  wire weights_rom_i_9_n_0;
  wire [30:13]NLW_bias2_rom_data_UNCONNECTED;
  wire [30:13]NLW_bias3_rom_data_UNCONNECTED;
  wire [30:13]NLW_bias_rom_data_UNCONNECTED;
  wire [31:25]NLW_multiplier2_rom_data_UNCONNECTED;
  wire [31:26]NLW_multiplier3_rom_data_UNCONNECTED;
  wire [31:24]NLW_multiplier_rom_data_UNCONNECTED;
  wire NLW_neuron_busy_UNCONNECTED;
  wire [30:13]NLW_neuron_bias_in_UNCONNECTED;
  wire [6:0]NLW_neuron_feature_count_in_UNCONNECTED;
  wire [31:26]NLW_neuron_multiplier_in_UNCONNECTED;
  wire [5:1]NLW_neuron_shift_in_UNCONNECTED;
  wire [2:0]\NLW_output_addr_reg[4]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_output_addr_reg[7]_i_3_CO_UNCONNECTED ;
  wire [3:3]\NLW_output_addr_reg[7]_i_3_O_UNCONNECTED ;
  wire [3:0]\NLW_output_addr_reg[7]_i_4_CO_UNCONNECTED ;
  wire [3:2]\NLW_output_addr_reg[7]_i_4_O_UNCONNECTED ;
  wire [2:0]\NLW_output_addr_reg[7]_i_5_CO_UNCONNECTED ;
  wire [3:0]NLW_weights2_rom_i_2_CO_UNCONNECTED;
  wire [3:2]NLW_weights2_rom_i_2_O_UNCONNECTED;
  wire [2:0]NLW_weights2_rom_i_3_CO_UNCONNECTED;
  wire [3:0]NLW_weights2_rom_i_4_CO_UNCONNECTED;
  wire [3:2]NLW_weights2_rom_i_4_O_UNCONNECTED;
  wire [2:0]NLW_weights2_rom_i_5_CO_UNCONNECTED;
  wire [3:0]NLW_weights3_rom_i_2_CO_UNCONNECTED;
  wire [2:0]NLW_weights3_rom_i_3_CO_UNCONNECTED;
  wire [3:0]NLW_weights3_rom_i_4_CO_UNCONNECTED;
  wire [3:3]NLW_weights3_rom_i_4_O_UNCONNECTED;
  wire [2:0]NLW_weights3_rom_i_5_CO_UNCONNECTED;
  wire [0:0]NLW_weights3_rom_i_5_O_UNCONNECTED;
  wire [3:0]NLW_weights_rom_i_2_CO_UNCONNECTED;
  wire [3:2]NLW_weights_rom_i_2_O_UNCONNECTED;
  wire [2:0]NLW_weights_rom_i_3_CO_UNCONNECTED;
  wire [3:0]NLW_weights_rom_i_4_CO_UNCONNECTED;
  wire [3:2]NLW_weights_rom_i_4_O_UNCONNECTED;
  wire [2:0]NLW_weights_rom_i_7_CO_UNCONNECTED;
  wire [0:0]NLW_weights_rom_i_7_O_UNCONNECTED;


  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_state[11]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[10] ),
        .I1(\FSM_onehot_state[11]_i_2_n_0 ),
        .O(\FSM_onehot_state[11]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEFFFEFEFFFE)) 
    \FSM_onehot_state[11]_i_2 
       (.I0(operand[6]),
        .I1(\FSM_onehot_state[11]_i_3_n_0 ),
        .I2(\FSM_onehot_state[11]_i_4_n_0 ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(\layer_reg_n_0_[0] ),
        .I5(operand[7]),
        .O(\FSM_onehot_state[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF7FFF7F7FFF7F)) 
    \FSM_onehot_state[11]_i_3 
       (.I0(\operand_reg_n_0_[3] ),
        .I1(\operand_reg_n_0_[0] ),
        .I2(\operand_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(\layer_reg_n_0_[1] ),
        .I5(operand[5]),
        .O(\FSM_onehot_state[11]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h5FF6)) 
    \FSM_onehot_state[11]_i_4 
       (.I0(\operand_reg_n_0_[2] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\operand_reg_n_0_[4] ),
        .O(\FSM_onehot_state[11]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hF8)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[10] ),
        .I1(\FSM_onehot_state[11]_i_2_n_0 ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEFEFFFEFFFEFFFE)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(input_ready),
        .I1(\FSM_onehot_state[3]_i_2_n_0 ),
        .I2(\FSM_onehot_state[3]_i_3_n_0 ),
        .I3(\FSM_onehot_state_reg_n_0_[6] ),
        .I4(\layer_reg_n_0_[1] ),
        .I5(\layer_reg_n_0_[0] ),
        .O(\FSM_onehot_state[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0202020202020222)) 
    \FSM_onehot_state[3]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[6] ),
        .I1(\layer_reg_n_0_[1] ),
        .I2(\t_reg_n_0_[3] ),
        .I3(\t_reg_n_0_[0] ),
        .I4(\t_reg_n_0_[2] ),
        .I5(\t_reg_n_0_[1] ),
        .O(\FSM_onehot_state[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_state[3]_i_3 
       (.I0(\FSM_onehot_state_reg_n_0_[6] ),
        .I1(state1),
        .O(\FSM_onehot_state[3]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h40000000)) 
    \FSM_onehot_state[5]_i_1 
       (.I0(\FSM_onehot_state[5]_i_2_n_0 ),
        .I1(\layer_reg_n_0_[1] ),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\FSM_onehot_state_reg_n_0_[6] ),
        .I4(state1),
        .O(\FSM_onehot_state[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h000001FF)) 
    \FSM_onehot_state[5]_i_2 
       (.I0(\t_reg_n_0_[1] ),
        .I1(\t_reg_n_0_[2] ),
        .I2(\t_reg_n_0_[0] ),
        .I3(\t_reg_n_0_[3] ),
        .I4(\layer_reg_n_0_[1] ),
        .O(\FSM_onehot_state[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h00A00A0A00A0CA0A)) 
    \FSM_onehot_state[5]_i_3 
       (.I0(\FSM_onehot_state[5]_i_4_n_0 ),
        .I1(\FSM_onehot_state[5]_i_5_n_0 ),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(\oc_reg_n_0_[4] ),
        .I5(\oc_reg_n_0_[1] ),
        .O(state1));
  LUT5 #(
    .INIT(32'h08000000)) 
    \FSM_onehot_state[5]_i_4 
       (.I0(\oc_reg_n_0_[2] ),
        .I1(\oc_reg_n_0_[3] ),
        .I2(\oc_reg_n_0_[5] ),
        .I3(\oc_reg_n_0_[0] ),
        .I4(\oc_reg_n_0_[1] ),
        .O(\FSM_onehot_state[5]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h0001)) 
    \FSM_onehot_state[5]_i_5 
       (.I0(\oc_reg_n_0_[3] ),
        .I1(\oc_reg_n_0_[2] ),
        .I2(\oc_reg_n_0_[0] ),
        .I3(\oc_reg_n_0_[5] ),
        .O(\FSM_onehot_state[5]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFEA)) 
    \FSM_onehot_state[8]_i_1 
       (.I0(\FSM_onehot_state[8]_i_2_n_0 ),
        .I1(\FSM_onehot_state_reg_n_0_[11] ),
        .I2(neuron_done),
        .I3(bias_reg),
        .I4(\FSM_onehot_state_reg_n_0_[3] ),
        .I5(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\FSM_onehot_state[8]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEAFFEAEAEAEAEAEA)) 
    \FSM_onehot_state[8]_i_2 
       (.I0(\FSM_onehot_state[8]_i_3_n_0 ),
        .I1(\FSM_onehot_state_reg_n_0_[4] ),
        .I2(start),
        .I3(\load_idx[5]_i_3_n_0 ),
        .I4(input_valid),
        .I5(input_ready),
        .O(\FSM_onehot_state[8]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \FSM_onehot_state[8]_i_3 
       (.I0(accumulator_overflow_i_4_n_0),
        .I1(\FSM_onehot_state_reg_n_0_[5] ),
        .I2(operand_req),
        .I3(p_1_in),
        .O(\FSM_onehot_state[8]_i_3_n_0 ));
  (* FSM_ENCODED_STATES = "NSTART:0000000000010,PARAM_WAIT:0000000000001,PARAM_REQ:0000000001000,COMPLETE:0000000100000,NEXT:0000001000000,WRITE:0000010000000,LOAD:0000100000000,IDLE:0000000010000,OP_FEED:0001000000000,NWAIT:0100000000000,OP_ADV:0010000000000,OP_WAIT:1000000000000,OP_REQ:0000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk),
        .CE(\FSM_onehot_state[8]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[3] ),
        .Q(bias_reg),
        .R(rst));
  (* FSM_ENCODED_STATES = "NSTART:0000000000010,PARAM_WAIT:0000000000001,PARAM_REQ:0000000001000,COMPLETE:0000000100000,NEXT:0000001000000,WRITE:0000010000000,LOAD:0000100000000,IDLE:0000000010000,OP_FEED:0001000000000,NWAIT:0100000000000,OP_ADV:0010000000000,OP_WAIT:1000000000000,OP_REQ:0000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[10] 
       (.C(clk),
        .CE(\FSM_onehot_state[8]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[9] ),
        .Q(\FSM_onehot_state_reg_n_0_[10] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "NSTART:0000000000010,PARAM_WAIT:0000000000001,PARAM_REQ:0000000001000,COMPLETE:0000000100000,NEXT:0000001000000,WRITE:0000010000000,LOAD:0000100000000,IDLE:0000000010000,OP_FEED:0001000000000,NWAIT:0100000000000,OP_ADV:0010000000000,OP_WAIT:1000000000000,OP_REQ:0000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[11] 
       (.C(clk),
        .CE(\FSM_onehot_state[8]_i_1_n_0 ),
        .D(\FSM_onehot_state[11]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[11] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "NSTART:0000000000010,PARAM_WAIT:0000000000001,PARAM_REQ:0000000001000,COMPLETE:0000000100000,NEXT:0000001000000,WRITE:0000010000000,LOAD:0000100000000,IDLE:0000000010000,OP_FEED:0001000000000,NWAIT:0100000000000,OP_ADV:0010000000000,OP_WAIT:1000000000000,OP_REQ:0000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[12] 
       (.C(clk),
        .CE(\FSM_onehot_state[8]_i_1_n_0 ),
        .D(operand_req),
        .Q(feature_reg),
        .R(rst));
  (* FSM_ENCODED_STATES = "NSTART:0000000000010,PARAM_WAIT:0000000000001,PARAM_REQ:0000000001000,COMPLETE:0000000100000,NEXT:0000001000000,WRITE:0000010000000,LOAD:0000100000000,IDLE:0000000010000,OP_FEED:0001000000000,NWAIT:0100000000000,OP_ADV:0010000000000,OP_WAIT:1000000000000,OP_REQ:0000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk),
        .CE(\FSM_onehot_state[8]_i_1_n_0 ),
        .D(bias_reg),
        .Q(\FSM_onehot_state_reg_n_0_[1] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "NSTART:0000000000010,PARAM_WAIT:0000000000001,PARAM_REQ:0000000001000,COMPLETE:0000000100000,NEXT:0000001000000,WRITE:0000010000000,LOAD:0000100000000,IDLE:0000000010000,OP_FEED:0001000000000,NWAIT:0100000000000,OP_ADV:0010000000000,OP_WAIT:1000000000000,OP_REQ:0000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk),
        .CE(\FSM_onehot_state[8]_i_1_n_0 ),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(operand_req),
        .R(rst));
  (* FSM_ENCODED_STATES = "NSTART:0000000000010,PARAM_WAIT:0000000000001,PARAM_REQ:0000000001000,COMPLETE:0000000100000,NEXT:0000001000000,WRITE:0000010000000,LOAD:0000100000000,IDLE:0000000010000,OP_FEED:0001000000000,NWAIT:0100000000000,OP_ADV:0010000000000,OP_WAIT:1000000000000,OP_REQ:0000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(clk),
        .CE(\FSM_onehot_state[8]_i_1_n_0 ),
        .D(\FSM_onehot_state[3]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[3] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "NSTART:0000000000010,PARAM_WAIT:0000000000001,PARAM_REQ:0000000001000,COMPLETE:0000000100000,NEXT:0000001000000,WRITE:0000010000000,LOAD:0000100000000,IDLE:0000000010000,OP_FEED:0001000000000,NWAIT:0100000000000,OP_ADV:0010000000000,OP_WAIT:1000000000000,OP_REQ:0000000000100" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[4] 
       (.C(clk),
        .CE(\FSM_onehot_state[8]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[5] ),
        .Q(\FSM_onehot_state_reg_n_0_[4] ),
        .S(rst));
  (* FSM_ENCODED_STATES = "NSTART:0000000000010,PARAM_WAIT:0000000000001,PARAM_REQ:0000000001000,COMPLETE:0000000100000,NEXT:0000001000000,WRITE:0000010000000,LOAD:0000100000000,IDLE:0000000010000,OP_FEED:0001000000000,NWAIT:0100000000000,OP_ADV:0010000000000,OP_WAIT:1000000000000,OP_REQ:0000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[5] 
       (.C(clk),
        .CE(\FSM_onehot_state[8]_i_1_n_0 ),
        .D(\FSM_onehot_state[5]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[5] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "NSTART:0000000000010,PARAM_WAIT:0000000000001,PARAM_REQ:0000000001000,COMPLETE:0000000100000,NEXT:0000001000000,WRITE:0000010000000,LOAD:0000100000000,IDLE:0000000010000,OP_FEED:0001000000000,NWAIT:0100000000000,OP_ADV:0010000000000,OP_WAIT:1000000000000,OP_REQ:0000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[6] 
       (.C(clk),
        .CE(\FSM_onehot_state[8]_i_1_n_0 ),
        .D(p_1_in),
        .Q(\FSM_onehot_state_reg_n_0_[6] ),
        .R(rst));
  (* FSM_ENCODED_STATES = "NSTART:0000000000010,PARAM_WAIT:0000000000001,PARAM_REQ:0000000001000,COMPLETE:0000000100000,NEXT:0000001000000,WRITE:0000010000000,LOAD:0000100000000,IDLE:0000000010000,OP_FEED:0001000000000,NWAIT:0100000000000,OP_ADV:0010000000000,OP_WAIT:1000000000000,OP_REQ:0000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[7] 
       (.C(clk),
        .CE(\FSM_onehot_state[8]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[11] ),
        .Q(p_1_in),
        .R(rst));
  (* FSM_ENCODED_STATES = "NSTART:0000000000010,PARAM_WAIT:0000000000001,PARAM_REQ:0000000001000,COMPLETE:0000000100000,NEXT:0000001000000,WRITE:0000010000000,LOAD:0000100000000,IDLE:0000000010000,OP_FEED:0001000000000,NWAIT:0100000000000,OP_ADV:0010000000000,OP_WAIT:1000000000000,OP_REQ:0000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[8] 
       (.C(clk),
        .CE(\FSM_onehot_state[8]_i_1_n_0 ),
        .D(\FSM_onehot_state_reg_n_0_[4] ),
        .Q(input_ready),
        .R(rst));
  (* FSM_ENCODED_STATES = "NSTART:0000000000010,PARAM_WAIT:0000000000001,PARAM_REQ:0000000001000,COMPLETE:0000000100000,NEXT:0000001000000,WRITE:0000010000000,LOAD:0000100000000,IDLE:0000000010000,OP_FEED:0001000000000,NWAIT:0100000000000,OP_ADV:0010000000000,OP_WAIT:1000000000000,OP_REQ:0000000000100" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[9] 
       (.C(clk),
        .CE(\FSM_onehot_state[8]_i_1_n_0 ),
        .D(feature_reg),
        .Q(\FSM_onehot_state_reg_n_0_[9] ),
        .R(rst));
  LUT6 #(
    .INIT(64'hFBBBFFFFFABAFAAA)) 
    accumulator_overflow_i_1
       (.I0(accumulator_overflow_i_2_n_0),
        .I1(start),
        .I2(neuron_overflow),
        .I3(accumulator_overflow_i_3_n_0),
        .I4(\FSM_onehot_state_reg_n_0_[4] ),
        .I5(accumulator_overflow),
        .O(accumulator_overflow_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    accumulator_overflow_i_2
       (.I0(bias_reg),
        .I1(\FSM_onehot_state_reg_n_0_[3] ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(input_ready),
        .I4(neuron_overflow),
        .O(accumulator_overflow_i_2_n_0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    accumulator_overflow_i_3
       (.I0(p_1_in),
        .I1(operand_req),
        .I2(\FSM_onehot_state_reg_n_0_[5] ),
        .I3(accumulator_overflow_i_4_n_0),
        .I4(\FSM_onehot_state_reg_n_0_[11] ),
        .O(accumulator_overflow_i_3_n_0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    accumulator_overflow_i_4
       (.I0(\FSM_onehot_state_reg_n_0_[9] ),
        .I1(feature_reg),
        .I2(\FSM_onehot_state_reg_n_0_[10] ),
        .I3(\FSM_onehot_state_reg_n_0_[6] ),
        .O(accumulator_overflow_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    accumulator_overflow_reg
       (.C(clk),
        .CE(1'b1),
        .D(accumulator_overflow_i_1_n_0),
        .Q(accumulator_overflow),
        .R(rst));
  (* ADDR_WIDTH = "4" *) 
  (* DEPTH = "16" *) 
  (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv2_bias.memh" *) 
  (* WIDTH = "32" *) 
  parameter_rom_sync__parameterized9 bias2_rom
       (.addr({\oc_reg_n_0_[3] ,\oc_reg_n_0_[2] ,\oc_reg_n_0_[1] ,\oc_reg_n_0_[0] }),
        .clk(clk),
        .data(b2_data),
        .en(en013_out));
  LUT3 #(
    .INIT(8'h20)) 
    bias2_rom_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\layer_reg_n_0_[1] ),
        .I2(\layer_reg_n_0_[0] ),
        .O(en013_out));
  (* ADDR_WIDTH = "5" *) 
  (* DEPTH = "32" *) 
  (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/fc1_bias.memh" *) 
  (* WIDTH = "32" *) 
  parameter_rom_sync__parameterized1 bias3_rom
       (.addr({\oc_reg_n_0_[4] ,\oc_reg_n_0_[3] ,\oc_reg_n_0_[2] ,\oc_reg_n_0_[1] ,\oc_reg_n_0_[0] }),
        .clk(clk),
        .data(b3_data),
        .en(en012_out));
  LUT3 #(
    .INIT(8'h20)) 
    bias3_rom_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\layer_reg_n_0_[1] ),
        .O(en012_out));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \bias_reg[0]_i_1 
       (.I0(b_data[0]),
        .I1(b2_data[0]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(b3_data[0]),
        .O(\bias_reg[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \bias_reg[10]_i_1 
       (.I0(b_data[10]),
        .I1(b2_data[10]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(b3_data[10]),
        .O(\bias_reg[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \bias_reg[11]_i_1 
       (.I0(b_data[11]),
        .I1(b2_data[11]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(b3_data[11]),
        .O(\bias_reg[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \bias_reg[12]_i_1 
       (.I0(b_data[12]),
        .I1(b2_data[12]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(b3_data[12]),
        .O(\bias_reg[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \bias_reg[1]_i_1 
       (.I0(b_data[1]),
        .I1(b2_data[1]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(b3_data[1]),
        .O(\bias_reg[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \bias_reg[2]_i_1 
       (.I0(b_data[2]),
        .I1(b2_data[2]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(b3_data[2]),
        .O(\bias_reg[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \bias_reg[31]_i_1 
       (.I0(b_data[31]),
        .I1(b2_data[31]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(b3_data[31]),
        .O(\bias_reg[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \bias_reg[3]_i_1 
       (.I0(b_data[3]),
        .I1(b2_data[3]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(b3_data[3]),
        .O(\bias_reg[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \bias_reg[4]_i_1 
       (.I0(b_data[4]),
        .I1(b2_data[4]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(b3_data[4]),
        .O(\bias_reg[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \bias_reg[5]_i_1 
       (.I0(b_data[5]),
        .I1(b2_data[5]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(b3_data[5]),
        .O(\bias_reg[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \bias_reg[6]_i_1 
       (.I0(b_data[6]),
        .I1(b2_data[6]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(b3_data[6]),
        .O(\bias_reg[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \bias_reg[7]_i_1 
       (.I0(b_data[7]),
        .I1(b2_data[7]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(b3_data[7]),
        .O(\bias_reg[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \bias_reg[8]_i_1 
       (.I0(b_data[8]),
        .I1(b2_data[8]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(b3_data[8]),
        .O(\bias_reg[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \bias_reg[9]_i_1 
       (.I0(b_data[9]),
        .I1(b2_data[9]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(b3_data[9]),
        .O(\bias_reg[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bias_reg_reg[0] 
       (.C(clk),
        .CE(bias_reg),
        .D(\bias_reg[0]_i_1_n_0 ),
        .Q(\bias_reg_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \bias_reg_reg[10] 
       (.C(clk),
        .CE(bias_reg),
        .D(\bias_reg[10]_i_1_n_0 ),
        .Q(\bias_reg_reg_n_0_[10] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \bias_reg_reg[11] 
       (.C(clk),
        .CE(bias_reg),
        .D(\bias_reg[11]_i_1_n_0 ),
        .Q(\bias_reg_reg_n_0_[11] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \bias_reg_reg[12] 
       (.C(clk),
        .CE(bias_reg),
        .D(\bias_reg[12]_i_1_n_0 ),
        .Q(\bias_reg_reg_n_0_[12] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \bias_reg_reg[1] 
       (.C(clk),
        .CE(bias_reg),
        .D(\bias_reg[1]_i_1_n_0 ),
        .Q(\bias_reg_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \bias_reg_reg[2] 
       (.C(clk),
        .CE(bias_reg),
        .D(\bias_reg[2]_i_1_n_0 ),
        .Q(\bias_reg_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \bias_reg_reg[31] 
       (.C(clk),
        .CE(bias_reg),
        .D(\bias_reg[31]_i_1_n_0 ),
        .Q(\bias_reg_reg_n_0_[31] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \bias_reg_reg[3] 
       (.C(clk),
        .CE(bias_reg),
        .D(\bias_reg[3]_i_1_n_0 ),
        .Q(\bias_reg_reg_n_0_[3] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \bias_reg_reg[4] 
       (.C(clk),
        .CE(bias_reg),
        .D(\bias_reg[4]_i_1_n_0 ),
        .Q(\bias_reg_reg_n_0_[4] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \bias_reg_reg[5] 
       (.C(clk),
        .CE(bias_reg),
        .D(\bias_reg[5]_i_1_n_0 ),
        .Q(\bias_reg_reg_n_0_[5] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \bias_reg_reg[6] 
       (.C(clk),
        .CE(bias_reg),
        .D(\bias_reg[6]_i_1_n_0 ),
        .Q(\bias_reg_reg_n_0_[6] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \bias_reg_reg[7] 
       (.C(clk),
        .CE(bias_reg),
        .D(\bias_reg[7]_i_1_n_0 ),
        .Q(\bias_reg_reg_n_0_[7] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \bias_reg_reg[8] 
       (.C(clk),
        .CE(bias_reg),
        .D(\bias_reg[8]_i_1_n_0 ),
        .Q(\bias_reg_reg_n_0_[8] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \bias_reg_reg[9] 
       (.C(clk),
        .CE(bias_reg),
        .D(\bias_reg[9]_i_1_n_0 ),
        .Q(\bias_reg_reg_n_0_[9] ),
        .R(rst));
  (* ADDR_WIDTH = "4" *) 
  (* DEPTH = "16" *) 
  (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv1_bias.memh" *) 
  (* WIDTH = "32" *) 
  parameter_rom_sync__parameterized12 bias_rom
       (.addr({\oc_reg_n_0_[3] ,\oc_reg_n_0_[2] ,\oc_reg_n_0_[1] ,\oc_reg_n_0_[0] }),
        .clk(clk),
        .data(b_data),
        .en(en014_out));
  LUT3 #(
    .INIT(8'h02)) 
    bias_rom_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\layer_reg_n_0_[1] ),
        .I2(\layer_reg_n_0_[0] ),
        .O(en014_out));
  LUT1 #(
    .INIT(2'h1)) 
    busy_INST_0
       (.I0(\FSM_onehot_state_reg_n_0_[4] ),
        .O(busy));
  LUT6 #(
    .INIT(64'hEAFFFFFFEAEAFAEA)) 
    config_error_i_1
       (.I0(config_error_i_2_n_0),
        .I1(accumulator_overflow_i_3_n_0),
        .I2(neuron_config_error),
        .I3(\FSM_onehot_state_reg_n_0_[4] ),
        .I4(start),
        .I5(config_error),
        .O(config_error_i_1_n_0));
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    config_error_i_2
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(\FSM_onehot_state_reg_n_0_[1] ),
        .I2(input_ready),
        .I3(bias_reg),
        .I4(neuron_config_error),
        .O(config_error_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    config_error_reg
       (.C(clk),
        .CE(1'b1),
        .D(config_error_i_1_n_0),
        .Q(config_error),
        .R(rst));
  (* ADDR_WIDTH = "8" *) 
  (* DEPTH = "160" *) 
  activation_ram_sync conv1_bank
       (.clk(clk),
        .raddr({input_bank_i_11_n_0,input_bank_i_12_n_0,input_bank_i_13_n_0,input_bank_i_14_n_0,input_bank_i_15_n_0,input_bank_i_16_n_0,input_bank_i_17_n_0,input_bank_i_18_n_0}),
        .rdata(act2_data),
        .re(re0),
        .waddr({\output_addr_reg_n_0_[7] ,\output_addr_reg_n_0_[6] ,\output_addr_reg_n_0_[5] ,\output_addr_reg_n_0_[4] ,\output_addr_reg_n_0_[3] ,\output_addr_reg_n_0_[2] ,\output_addr_reg_n_0_[1] ,\output_addr_reg_n_0_[0] }),
        .wdata({\output_reg_reg_n_0_[7] ,\output_reg_reg_n_0_[6] ,\output_reg_reg_n_0_[5] ,\output_reg_reg_n_0_[4] ,\output_reg_reg_n_0_[3] ,\output_reg_reg_n_0_[2] ,\output_reg_reg_n_0_[1] ,\output_reg_reg_n_0_[0] }),
        .we(conv1_bank_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    conv1_bank_i_1
       (.I0(p_1_in),
        .I1(\layer_reg_n_0_[0] ),
        .O(conv1_bank_i_1_n_0));
  LUT3 #(
    .INIT(8'h08)) 
    conv1_bank_i_2
       (.I0(operand_req),
        .I1(\layer_reg_n_0_[0] ),
        .I2(pad_active),
        .O(re0));
  FDRE #(
    .INIT(1'b0)) 
    \conv1_data_reg[0] 
       (.C(clk),
        .CE(conv1_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[0] ),
        .Q(conv1_data[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv1_data_reg[1] 
       (.C(clk),
        .CE(conv1_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[1] ),
        .Q(conv1_data[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv1_data_reg[2] 
       (.C(clk),
        .CE(conv1_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[2] ),
        .Q(conv1_data[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv1_data_reg[3] 
       (.C(clk),
        .CE(conv1_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[3] ),
        .Q(conv1_data[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv1_data_reg[4] 
       (.C(clk),
        .CE(conv1_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[4] ),
        .Q(conv1_data[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv1_data_reg[5] 
       (.C(clk),
        .CE(conv1_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[5] ),
        .Q(conv1_data[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv1_data_reg[6] 
       (.C(clk),
        .CE(conv1_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[6] ),
        .Q(conv1_data[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv1_data_reg[7] 
       (.C(clk),
        .CE(conv1_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[7] ),
        .Q(conv1_data[7]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv1_index_reg[0] 
       (.C(clk),
        .CE(conv1_valid_i_1_n_0),
        .D(\output_addr_reg_n_0_[0] ),
        .Q(conv1_index[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv1_index_reg[1] 
       (.C(clk),
        .CE(conv1_valid_i_1_n_0),
        .D(\output_addr_reg_n_0_[1] ),
        .Q(conv1_index[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv1_index_reg[2] 
       (.C(clk),
        .CE(conv1_valid_i_1_n_0),
        .D(\output_addr_reg_n_0_[2] ),
        .Q(conv1_index[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv1_index_reg[3] 
       (.C(clk),
        .CE(conv1_valid_i_1_n_0),
        .D(\output_addr_reg_n_0_[3] ),
        .Q(conv1_index[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv1_index_reg[4] 
       (.C(clk),
        .CE(conv1_valid_i_1_n_0),
        .D(\output_addr_reg_n_0_[4] ),
        .Q(conv1_index[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv1_index_reg[5] 
       (.C(clk),
        .CE(conv1_valid_i_1_n_0),
        .D(\output_addr_reg_n_0_[5] ),
        .Q(conv1_index[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv1_index_reg[6] 
       (.C(clk),
        .CE(conv1_valid_i_1_n_0),
        .D(\output_addr_reg_n_0_[6] ),
        .Q(conv1_index[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv1_index_reg[7] 
       (.C(clk),
        .CE(conv1_valid_i_1_n_0),
        .D(\output_addr_reg_n_0_[7] ),
        .Q(conv1_index[7]),
        .R(rst));
  LUT3 #(
    .INIT(8'h02)) 
    conv1_valid_i_1
       (.I0(p_1_in),
        .I1(\layer_reg_n_0_[1] ),
        .I2(\layer_reg_n_0_[0] ),
        .O(conv1_valid_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    conv1_valid_reg
       (.C(clk),
        .CE(1'b1),
        .D(conv1_valid_i_1_n_0),
        .Q(conv1_valid),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv2_data_reg[0] 
       (.C(clk),
        .CE(conv2_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[0] ),
        .Q(conv2_data[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv2_data_reg[1] 
       (.C(clk),
        .CE(conv2_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[1] ),
        .Q(conv2_data[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv2_data_reg[2] 
       (.C(clk),
        .CE(conv2_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[2] ),
        .Q(conv2_data[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv2_data_reg[3] 
       (.C(clk),
        .CE(conv2_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[3] ),
        .Q(conv2_data[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv2_data_reg[4] 
       (.C(clk),
        .CE(conv2_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[4] ),
        .Q(conv2_data[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv2_data_reg[5] 
       (.C(clk),
        .CE(conv2_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[5] ),
        .Q(conv2_data[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv2_data_reg[6] 
       (.C(clk),
        .CE(conv2_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[6] ),
        .Q(conv2_data[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv2_data_reg[7] 
       (.C(clk),
        .CE(conv2_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[7] ),
        .Q(conv2_data[7]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv2_index_reg[0] 
       (.C(clk),
        .CE(conv2_valid_i_1_n_0),
        .D(\output_addr_reg_n_0_[0] ),
        .Q(conv2_index[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv2_index_reg[1] 
       (.C(clk),
        .CE(conv2_valid_i_1_n_0),
        .D(\output_addr_reg_n_0_[1] ),
        .Q(conv2_index[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv2_index_reg[2] 
       (.C(clk),
        .CE(conv2_valid_i_1_n_0),
        .D(\output_addr_reg_n_0_[2] ),
        .Q(conv2_index[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv2_index_reg[3] 
       (.C(clk),
        .CE(conv2_valid_i_1_n_0),
        .D(\output_addr_reg_n_0_[3] ),
        .Q(conv2_index[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv2_index_reg[4] 
       (.C(clk),
        .CE(conv2_valid_i_1_n_0),
        .D(\output_addr_reg_n_0_[4] ),
        .Q(conv2_index[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv2_index_reg[5] 
       (.C(clk),
        .CE(conv2_valid_i_1_n_0),
        .D(\output_addr_reg_n_0_[5] ),
        .Q(conv2_index[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv2_index_reg[6] 
       (.C(clk),
        .CE(conv2_valid_i_1_n_0),
        .D(\output_addr_reg_n_0_[6] ),
        .Q(conv2_index[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \conv2_index_reg[7] 
       (.C(clk),
        .CE(conv2_valid_i_1_n_0),
        .D(\output_addr_reg_n_0_[7] ),
        .Q(conv2_index[7]),
        .R(rst));
  LUT3 #(
    .INIT(8'h20)) 
    conv2_valid_i_1
       (.I0(p_1_in),
        .I1(\layer_reg_n_0_[1] ),
        .I2(\layer_reg_n_0_[0] ),
        .O(conv2_valid_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    conv2_valid_reg
       (.C(clk),
        .CE(1'b1),
        .D(conv2_valid_i_1_n_0),
        .Q(conv2_valid),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    done_reg
       (.C(clk),
        .CE(1'b1),
        .D(\FSM_onehot_state_reg_n_0_[5] ),
        .Q(done),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \fc1_data_reg[0] 
       (.C(clk),
        .CE(fc1_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[0] ),
        .Q(fc1_data[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \fc1_data_reg[1] 
       (.C(clk),
        .CE(fc1_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[1] ),
        .Q(fc1_data[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \fc1_data_reg[2] 
       (.C(clk),
        .CE(fc1_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[2] ),
        .Q(fc1_data[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \fc1_data_reg[3] 
       (.C(clk),
        .CE(fc1_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[3] ),
        .Q(fc1_data[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \fc1_data_reg[4] 
       (.C(clk),
        .CE(fc1_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[4] ),
        .Q(fc1_data[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \fc1_data_reg[5] 
       (.C(clk),
        .CE(fc1_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[5] ),
        .Q(fc1_data[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \fc1_data_reg[6] 
       (.C(clk),
        .CE(fc1_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[6] ),
        .Q(fc1_data[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \fc1_data_reg[7] 
       (.C(clk),
        .CE(fc1_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[7] ),
        .Q(fc1_data[7]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \fc1_index_reg[0] 
       (.C(clk),
        .CE(fc1_valid_i_1_n_0),
        .D(\oc_reg_n_0_[0] ),
        .Q(fc1_index[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \fc1_index_reg[1] 
       (.C(clk),
        .CE(fc1_valid_i_1_n_0),
        .D(\oc_reg_n_0_[1] ),
        .Q(fc1_index[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \fc1_index_reg[2] 
       (.C(clk),
        .CE(fc1_valid_i_1_n_0),
        .D(\oc_reg_n_0_[2] ),
        .Q(fc1_index[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \fc1_index_reg[3] 
       (.C(clk),
        .CE(fc1_valid_i_1_n_0),
        .D(\oc_reg_n_0_[3] ),
        .Q(fc1_index[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \fc1_index_reg[4] 
       (.C(clk),
        .CE(fc1_valid_i_1_n_0),
        .D(\oc_reg_n_0_[4] ),
        .Q(fc1_index[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \fc1_index_reg[5] 
       (.C(clk),
        .CE(fc1_valid_i_1_n_0),
        .D(\oc_reg_n_0_[5] ),
        .Q(fc1_index[5]),
        .R(rst));
  LUT3 #(
    .INIT(8'h20)) 
    fc1_valid_i_1
       (.I0(p_1_in),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\layer_reg_n_0_[1] ),
        .O(fc1_valid_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    fc1_valid_reg
       (.C(clk),
        .CE(1'b1),
        .D(fc1_valid_i_1_n_0),
        .Q(fc1_valid),
        .R(rst));
  LUT4 #(
    .INIT(16'h0C0A)) 
    \feature_reg[0]_i_1 
       (.I0(act_data[0]),
        .I1(act2_data[0]),
        .I2(pad_active),
        .I3(\layer_reg_n_0_[0] ),
        .O(\feature_reg[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0C0A)) 
    \feature_reg[1]_i_1 
       (.I0(act_data[1]),
        .I1(act2_data[1]),
        .I2(pad_active),
        .I3(\layer_reg_n_0_[0] ),
        .O(\feature_reg[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0C0A)) 
    \feature_reg[2]_i_1 
       (.I0(act_data[2]),
        .I1(act2_data[2]),
        .I2(pad_active),
        .I3(\layer_reg_n_0_[0] ),
        .O(\feature_reg[2]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0C0A)) 
    \feature_reg[3]_i_1 
       (.I0(act_data[3]),
        .I1(act2_data[3]),
        .I2(pad_active),
        .I3(\layer_reg_n_0_[0] ),
        .O(\feature_reg[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0C0A)) 
    \feature_reg[4]_i_1 
       (.I0(act_data[4]),
        .I1(act2_data[4]),
        .I2(pad_active),
        .I3(\layer_reg_n_0_[0] ),
        .O(\feature_reg[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0C0A)) 
    \feature_reg[5]_i_1 
       (.I0(act_data[5]),
        .I1(act2_data[5]),
        .I2(pad_active),
        .I3(\layer_reg_n_0_[0] ),
        .O(\feature_reg[5]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0C0A)) 
    \feature_reg[6]_i_1 
       (.I0(act_data[6]),
        .I1(act2_data[6]),
        .I2(pad_active),
        .I3(\layer_reg_n_0_[0] ),
        .O(\feature_reg[6]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0C0A)) 
    \feature_reg[7]_i_1 
       (.I0(act_data[7]),
        .I1(act2_data[7]),
        .I2(pad_active),
        .I3(\layer_reg_n_0_[0] ),
        .O(\feature_reg[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \feature_reg_reg[0] 
       (.C(clk),
        .CE(feature_reg),
        .D(\feature_reg[0]_i_1_n_0 ),
        .Q(\feature_reg_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \feature_reg_reg[1] 
       (.C(clk),
        .CE(feature_reg),
        .D(\feature_reg[1]_i_1_n_0 ),
        .Q(\feature_reg_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \feature_reg_reg[2] 
       (.C(clk),
        .CE(feature_reg),
        .D(\feature_reg[2]_i_1_n_0 ),
        .Q(\feature_reg_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \feature_reg_reg[3] 
       (.C(clk),
        .CE(feature_reg),
        .D(\feature_reg[3]_i_1_n_0 ),
        .Q(\feature_reg_reg_n_0_[3] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \feature_reg_reg[4] 
       (.C(clk),
        .CE(feature_reg),
        .D(\feature_reg[4]_i_1_n_0 ),
        .Q(\feature_reg_reg_n_0_[4] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \feature_reg_reg[5] 
       (.C(clk),
        .CE(feature_reg),
        .D(\feature_reg[5]_i_1_n_0 ),
        .Q(\feature_reg_reg_n_0_[5] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \feature_reg_reg[6] 
       (.C(clk),
        .CE(feature_reg),
        .D(\feature_reg[6]_i_1_n_0 ),
        .Q(\feature_reg_reg_n_0_[6] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \feature_reg_reg[7] 
       (.C(clk),
        .CE(feature_reg),
        .D(\feature_reg[7]_i_1_n_0 ),
        .Q(\feature_reg_reg_n_0_[7] ),
        .R(rst));
  (* ADDR_WIDTH = "8" *) 
  (* DEPTH = "160" *) 
  activation_ram_sync__1 input_bank
       (.clk(clk),
        .raddr({input_bank_i_11_n_0,input_bank_i_12_n_0,input_bank_i_13_n_0,input_bank_i_14_n_0,input_bank_i_15_n_0,input_bank_i_16_n_0,input_bank_i_17_n_0,input_bank_i_18_n_0}),
        .rdata(act_data),
        .re(re09_out),
        .waddr({input_bank_i_3_n_0,input_bank_i_4_n_0,input_bank_i_5_n_0,input_bank_i_6_n_0,input_bank_i_7_n_0,input_bank_i_8_n_0,input_bank_i_9_n_0,input_bank_i_10_n_0}),
        .wdata({input_bank_i_19_n_0,input_bank_i_20_n_0,input_bank_i_21_n_0,input_bank_i_22_n_0,input_bank_i_23_n_0,input_bank_i_24_n_0,input_bank_i_25_n_0,input_bank_i_26_n_0}),
        .we(we0));
  LUT4 #(
    .INIT(16'hF888)) 
    input_bank_i_1
       (.I0(p_1_in),
        .I1(\layer_reg_n_0_[0] ),
        .I2(input_ready),
        .I3(input_valid),
        .O(we0));
  LUT3 #(
    .INIT(8'hB8)) 
    input_bank_i_10
       (.I0(\output_addr_reg_n_0_[0] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\load_idx_reg_n_0_[0] ),
        .O(input_bank_i_10_n_0));
  LUT6 #(
    .INIT(64'hFFFF884800008848)) 
    input_bank_i_11
       (.I0(in_addr2[7]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(in_addr2[6]),
        .I3(input_bank_i_30_n_0),
        .I4(\layer_reg_n_0_[1] ),
        .I5(operand[7]),
        .O(input_bank_i_11_n_0));
  LUT6 #(
    .INIT(64'hEEEEFCCCEEEECFCC)) 
    input_bank_i_12
       (.I0(operand[6]),
        .I1(input_bank_i_31_n_0),
        .I2(in_addr2[6]),
        .I3(\layer_reg_n_0_[0] ),
        .I4(\layer_reg_n_0_[1] ),
        .I5(input_bank_i_30_n_0),
        .O(input_bank_i_12_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFB8888B88)) 
    input_bank_i_13
       (.I0(operand[5]),
        .I1(\layer_reg_n_0_[1] ),
        .I2(input_bank_i_32_n_0),
        .I3(\layer_reg_n_0_[0] ),
        .I4(in_addr2[5]),
        .I5(input_bank_i_34_n_0),
        .O(input_bank_i_13_n_0));
  LUT5 #(
    .INIT(32'hAABAAAEA)) 
    input_bank_i_14
       (.I0(input_bank_i_35_n_0),
        .I1(in_addr2[4]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(input_bank_i_37_n_0),
        .O(input_bank_i_14_n_0));
  LUT6 #(
    .INIT(64'hAAAAEBAAAAAABEAA)) 
    input_bank_i_15
       (.I0(input_bank_i_38_n_0),
        .I1(input_bank_i_39_n_0),
        .I2(input_bank_i_40_n_0),
        .I3(\layer_reg_n_0_[0] ),
        .I4(\layer_reg_n_0_[1] ),
        .I5(input_bank_i_41_n_0),
        .O(input_bank_i_15_n_0));
  LUT6 #(
    .INIT(64'hBAABABBAABBABAAB)) 
    input_bank_i_16
       (.I0(input_bank_i_42_n_0),
        .I1(neuron_i_2_n_0),
        .I2(input_bank_i_39_n_0),
        .I3(\t_reg_n_0_[0] ),
        .I4(input_bank_i_40_n_0),
        .I5(\operand_reg_n_0_[0] ),
        .O(input_bank_i_16_n_0));
  LUT6 #(
    .INIT(64'hFF66FFF0006600F0)) 
    input_bank_i_17
       (.I0(input_bank_i_43_n_0),
        .I1(input_bank_i_40_n_0),
        .I2(input_bank_i_44_n_0),
        .I3(\layer_reg_n_0_[1] ),
        .I4(\layer_reg_n_0_[0] ),
        .I5(\operand_reg_n_0_[1] ),
        .O(input_bank_i_17_n_0));
  LUT5 #(
    .INIT(32'hAAAA69CC)) 
    input_bank_i_18
       (.I0(\operand_reg_n_0_[0] ),
        .I1(input_bank_i_40_n_0),
        .I2(\t_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(\layer_reg_n_0_[1] ),
        .O(input_bank_i_18_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    input_bank_i_19
       (.I0(\output_reg_reg_n_0_[7] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(input_data[7]),
        .O(input_bank_i_19_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    input_bank_i_2
       (.I0(pad_active),
        .I1(\layer_reg_n_0_[0] ),
        .I2(operand_req),
        .O(re09_out));
  LUT3 #(
    .INIT(8'hB8)) 
    input_bank_i_20
       (.I0(\output_reg_reg_n_0_[6] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(input_data[6]),
        .O(input_bank_i_20_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    input_bank_i_21
       (.I0(\output_reg_reg_n_0_[5] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(input_data[5]),
        .O(input_bank_i_21_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    input_bank_i_22
       (.I0(\output_reg_reg_n_0_[4] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(input_data[4]),
        .O(input_bank_i_22_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    input_bank_i_23
       (.I0(\output_reg_reg_n_0_[3] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(input_data[3]),
        .O(input_bank_i_23_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    input_bank_i_24
       (.I0(\output_reg_reg_n_0_[2] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(input_data[2]),
        .O(input_bank_i_24_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    input_bank_i_25
       (.I0(\output_reg_reg_n_0_[1] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(input_data[1]),
        .O(input_bank_i_25_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    input_bank_i_26
       (.I0(\output_reg_reg_n_0_[0] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(input_data[0]),
        .O(input_bank_i_26_n_0));
  LUT6 #(
    .INIT(64'h00000000EF8E0830)) 
    input_bank_i_27
       (.I0(input_bank_i_43_n_0),
        .I1(\t_reg_n_0_[2] ),
        .I2(input_bank_i_45_n_0),
        .I3(input_bank_i_46_n_0),
        .I4(\t_reg_n_0_[3] ),
        .I5(\layer_reg_n_0_[1] ),
        .O(pad_active));
  LUT5 #(
    .INIT(32'h555FA800)) 
    input_bank_i_28
       (.I0(input_bank_i_47_n_0),
        .I1(input_bank_i_40_n_0),
        .I2(input_bank_i_44_n_0),
        .I3(input_bank_i_39_n_0),
        .I4(input_bank_i_48_n_0),
        .O(in_addr2[7]));
  LUT5 #(
    .INIT(32'h1317C888)) 
    input_bank_i_29
       (.I0(input_bank_i_48_n_0),
        .I1(input_bank_i_39_n_0),
        .I2(input_bank_i_44_n_0),
        .I3(input_bank_i_40_n_0),
        .I4(input_bank_i_47_n_0),
        .O(in_addr2[6]));
  LUT2 #(
    .INIT(4'h8)) 
    input_bank_i_3
       (.I0(\layer_reg_n_0_[0] ),
        .I1(\output_addr_reg_n_0_[7] ),
        .O(input_bank_i_3_n_0));
  LUT6 #(
    .INIT(64'h7117FFFFFFFFFFFF)) 
    input_bank_i_30
       (.I0(input_bank_i_49_n_0),
        .I1(input_bank_i_50_n_0),
        .I2(input_bank_i_39_n_0),
        .I3(input_bank_i_40_n_0),
        .I4(in_addr2[4]),
        .I5(in_addr2[5]),
        .O(input_bank_i_30_n_0));
  LUT6 #(
    .INIT(64'h1010100010000000)) 
    input_bank_i_31
       (.I0(\layer_reg_n_0_[0] ),
        .I1(\layer_reg_n_0_[1] ),
        .I2(input_bank_i_50_n_0),
        .I3(input_bank_i_51_n_0),
        .I4(input_bank_i_48_n_0),
        .I5(input_bank_i_52_n_0),
        .O(input_bank_i_31_n_0));
  LUT6 #(
    .INIT(64'h6999F99FF99FFFFF)) 
    input_bank_i_32
       (.I0(input_bank_i_44_n_0),
        .I1(input_bank_i_47_n_0),
        .I2(input_bank_i_40_n_0),
        .I3(input_bank_i_39_n_0),
        .I4(input_bank_i_50_n_0),
        .I5(input_bank_i_49_n_0),
        .O(input_bank_i_32_n_0));
  LUT6 #(
    .INIT(64'hB62449DB49DBB624)) 
    input_bank_i_33
       (.I0(operand[5]),
        .I1(operand[6]),
        .I2(operand[7]),
        .I3(\operand_reg_n_0_[4] ),
        .I4(input_bank_i_39_n_0),
        .I5(input_bank_i_53_n_0),
        .O(in_addr2[5]));
  LUT6 #(
    .INIT(64'h00000000000017E8)) 
    input_bank_i_34
       (.I0(input_bank_i_52_n_0),
        .I1(input_bank_i_48_n_0),
        .I2(input_bank_i_51_n_0),
        .I3(input_bank_i_50_n_0),
        .I4(\layer_reg_n_0_[1] ),
        .I5(\layer_reg_n_0_[0] ),
        .O(input_bank_i_34_n_0));
  LUT6 #(
    .INIT(64'hFFFF411400004114)) 
    input_bank_i_35
       (.I0(\layer_reg_n_0_[0] ),
        .I1(input_bank_i_51_n_0),
        .I2(input_bank_i_48_n_0),
        .I3(input_bank_i_52_n_0),
        .I4(\layer_reg_n_0_[1] ),
        .I5(\operand_reg_n_0_[4] ),
        .O(input_bank_i_35_n_0));
  LUT6 #(
    .INIT(64'hE04F3F308CDC0FF0)) 
    input_bank_i_36
       (.I0(\operand_reg_n_0_[0] ),
        .I1(input_bank_i_47_n_0),
        .I2(input_bank_i_39_n_0),
        .I3(\operand_reg_n_0_[3] ),
        .I4(\operand_reg_n_0_[2] ),
        .I5(\operand_reg_n_0_[1] ),
        .O(in_addr2[4]));
  LUT6 #(
    .INIT(64'hE800FFE8FFA0A000)) 
    input_bank_i_37
       (.I0(input_bank_i_44_n_0),
        .I1(input_bank_i_43_n_0),
        .I2(input_bank_i_51_n_0),
        .I3(input_bank_i_50_n_0),
        .I4(input_bank_i_39_n_0),
        .I5(input_bank_i_40_n_0),
        .O(input_bank_i_37_n_0));
  LUT6 #(
    .INIT(64'hFFFF144100001441)) 
    input_bank_i_38
       (.I0(\layer_reg_n_0_[0] ),
        .I1(input_bank_i_54_n_0),
        .I2(input_bank_i_47_n_0),
        .I3(input_bank_i_43_n_0),
        .I4(\layer_reg_n_0_[1] ),
        .I5(\operand_reg_n_0_[3] ),
        .O(input_bank_i_38_n_0));
  LUT6 #(
    .INIT(64'hB6DB6DB624924924)) 
    input_bank_i_39
       (.I0(operand[5]),
        .I1(operand[6]),
        .I2(operand[7]),
        .I3(\operand_reg_n_0_[4] ),
        .I4(\operand_reg_n_0_[3] ),
        .I5(\operand_reg_n_0_[2] ),
        .O(input_bank_i_39_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    input_bank_i_4
       (.I0(\layer_reg_n_0_[0] ),
        .I1(\output_addr_reg_n_0_[6] ),
        .O(input_bank_i_4_n_0));
  LUT6 #(
    .INIT(64'hF00F9FF690060FF0)) 
    input_bank_i_40
       (.I0(\operand_reg_n_0_[3] ),
        .I1(input_bank_i_47_n_0),
        .I2(input_bank_i_39_n_0),
        .I3(\operand_reg_n_0_[2] ),
        .I4(\operand_reg_n_0_[1] ),
        .I5(\operand_reg_n_0_[0] ),
        .O(input_bank_i_40_n_0));
  LUT4 #(
    .INIT(16'h4DB2)) 
    input_bank_i_41
       (.I0(input_bank_i_44_n_0),
        .I1(input_bank_i_55_n_0),
        .I2(input_bank_i_51_n_0),
        .I3(input_bank_i_50_n_0),
        .O(input_bank_i_41_n_0));
  LUT6 #(
    .INIT(64'hFFFF288200002882)) 
    input_bank_i_42
       (.I0(\layer_reg_n_0_[0] ),
        .I1(input_bank_i_55_n_0),
        .I2(input_bank_i_44_n_0),
        .I3(input_bank_i_51_n_0),
        .I4(\layer_reg_n_0_[1] ),
        .I5(\operand_reg_n_0_[2] ),
        .O(input_bank_i_42_n_0));
  LUT6 #(
    .INIT(64'h7887E11E87781EE1)) 
    input_bank_i_43
       (.I0(\t_reg_n_0_[0] ),
        .I1(input_bank_i_40_n_0),
        .I2(input_bank_i_44_n_0),
        .I3(\operand_reg_n_0_[1] ),
        .I4(\operand_reg_n_0_[0] ),
        .I5(\t_reg_n_0_[1] ),
        .O(input_bank_i_43_n_0));
  LUT5 #(
    .INIT(32'hC3BE823C)) 
    input_bank_i_44
       (.I0(input_bank_i_39_n_0),
        .I1(input_bank_i_47_n_0),
        .I2(\operand_reg_n_0_[3] ),
        .I3(\operand_reg_n_0_[2] ),
        .I4(\operand_reg_n_0_[1] ),
        .O(input_bank_i_44_n_0));
  LUT6 #(
    .INIT(64'h7DDFFD57FD577DDF)) 
    input_bank_i_45
       (.I0(\t_reg_n_0_[1] ),
        .I1(\operand_reg_n_0_[0] ),
        .I2(\operand_reg_n_0_[1] ),
        .I3(input_bank_i_44_n_0),
        .I4(\operand_reg_n_0_[2] ),
        .I5(input_bank_i_39_n_0),
        .O(input_bank_i_45_n_0));
  LUT6 #(
    .INIT(64'hBFFBFEEFFBBFEFFE)) 
    input_bank_i_46
       (.I0(\t_reg_n_0_[0] ),
        .I1(input_bank_i_40_n_0),
        .I2(input_bank_i_44_n_0),
        .I3(\operand_reg_n_0_[1] ),
        .I4(\operand_reg_n_0_[0] ),
        .I5(\t_reg_n_0_[1] ),
        .O(input_bank_i_46_n_0));
  LUT5 #(
    .INIT(32'h6DB62492)) 
    input_bank_i_47
       (.I0(operand[7]),
        .I1(operand[6]),
        .I2(operand[5]),
        .I3(\operand_reg_n_0_[4] ),
        .I4(\operand_reg_n_0_[3] ),
        .O(input_bank_i_47_n_0));
  LUT4 #(
    .INIT(16'hB624)) 
    input_bank_i_48
       (.I0(operand[5]),
        .I1(operand[6]),
        .I2(operand[7]),
        .I3(\operand_reg_n_0_[4] ),
        .O(input_bank_i_48_n_0));
  LUT6 #(
    .INIT(64'h7EEB6AA928810000)) 
    input_bank_i_49
       (.I0(\t_reg_n_0_[2] ),
        .I1(\t_reg_n_0_[1] ),
        .I2(p_0_in__0),
        .I3(input_bank_i_57_n_0),
        .I4(input_bank_i_40_n_0),
        .I5(input_bank_i_44_n_0),
        .O(input_bank_i_49_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    input_bank_i_5
       (.I0(\output_addr_reg_n_0_[5] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\load_idx_reg_n_0_[5] ),
        .O(input_bank_i_5_n_0));
  LUT5 #(
    .INIT(32'h6AAAAAA9)) 
    input_bank_i_50
       (.I0(\t_reg_n_0_[3] ),
        .I1(input_bank_i_57_n_0),
        .I2(p_0_in__0),
        .I3(\t_reg_n_0_[1] ),
        .I4(\t_reg_n_0_[2] ),
        .O(input_bank_i_50_n_0));
  LUT6 #(
    .INIT(64'h5596AAAAAAAAAA69)) 
    input_bank_i_51
       (.I0(\t_reg_n_0_[2] ),
        .I1(\operand_reg_n_0_[0] ),
        .I2(input_bank_i_40_n_0),
        .I3(\t_reg_n_0_[0] ),
        .I4(p_0_in__0),
        .I5(\t_reg_n_0_[1] ),
        .O(input_bank_i_51_n_0));
  LUT6 #(
    .INIT(64'hAEEA8AA838832002)) 
    input_bank_i_52
       (.I0(input_bank_i_47_n_0),
        .I1(\t_reg_n_0_[0] ),
        .I2(input_bank_i_40_n_0),
        .I3(\operand_reg_n_0_[0] ),
        .I4(input_bank_i_39_n_0),
        .I5(input_bank_i_58_n_0),
        .O(input_bank_i_52_n_0));
  LUT6 #(
    .INIT(64'hFF038FE0C0000F00)) 
    input_bank_i_53
       (.I0(\operand_reg_n_0_[0] ),
        .I1(\operand_reg_n_0_[1] ),
        .I2(\operand_reg_n_0_[2] ),
        .I3(input_bank_i_47_n_0),
        .I4(\operand_reg_n_0_[3] ),
        .I5(input_bank_i_39_n_0),
        .O(input_bank_i_53_n_0));
  LUT6 #(
    .INIT(64'hA69669A9FFFFFFFF)) 
    input_bank_i_54
       (.I0(\t_reg_n_0_[0] ),
        .I1(\operand_reg_n_0_[1] ),
        .I2(\operand_reg_n_0_[2] ),
        .I3(input_bank_i_44_n_0),
        .I4(\operand_reg_n_0_[0] ),
        .I5(input_bank_i_39_n_0),
        .O(input_bank_i_54_n_0));
  LUT6 #(
    .INIT(64'h96695AA5FFFFFFFF)) 
    input_bank_i_55
       (.I0(\t_reg_n_0_[1] ),
        .I1(\operand_reg_n_0_[0] ),
        .I2(\operand_reg_n_0_[1] ),
        .I3(input_bank_i_44_n_0),
        .I4(\t_reg_n_0_[0] ),
        .I5(input_bank_i_40_n_0),
        .O(input_bank_i_55_n_0));
  LUT6 #(
    .INIT(64'h823C41AA28699614)) 
    input_bank_i_56
       (.I0(\operand_reg_n_0_[2] ),
        .I1(\operand_reg_n_0_[3] ),
        .I2(input_bank_i_47_n_0),
        .I3(input_bank_i_39_n_0),
        .I4(\operand_reg_n_0_[1] ),
        .I5(\operand_reg_n_0_[0] ),
        .O(p_0_in__0));
  LUT6 #(
    .INIT(64'hAEEABEEBEBBEABBA)) 
    input_bank_i_57
       (.I0(\t_reg_n_0_[0] ),
        .I1(\operand_reg_n_0_[1] ),
        .I2(\operand_reg_n_0_[2] ),
        .I3(input_bank_i_39_n_0),
        .I4(input_bank_i_59_n_0),
        .I5(\operand_reg_n_0_[0] ),
        .O(input_bank_i_57_n_0));
  LUT6 #(
    .INIT(64'h69A69A56A969A69A)) 
    input_bank_i_58
       (.I0(\t_reg_n_0_[1] ),
        .I1(\operand_reg_n_0_[0] ),
        .I2(\operand_reg_n_0_[1] ),
        .I3(input_bank_i_39_n_0),
        .I4(input_bank_i_59_n_0),
        .I5(\operand_reg_n_0_[2] ),
        .O(input_bank_i_58_n_0));
  LUT6 #(
    .INIT(64'h69A69A69A69A69A6)) 
    input_bank_i_59
       (.I0(\operand_reg_n_0_[2] ),
        .I1(\operand_reg_n_0_[3] ),
        .I2(\operand_reg_n_0_[4] ),
        .I3(operand[5]),
        .I4(operand[6]),
        .I5(operand[7]),
        .O(input_bank_i_59_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    input_bank_i_6
       (.I0(\output_addr_reg_n_0_[4] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\load_idx_reg_n_0_[4] ),
        .O(input_bank_i_6_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    input_bank_i_7
       (.I0(\output_addr_reg_n_0_[3] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\load_idx_reg_n_0_[3] ),
        .O(input_bank_i_7_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    input_bank_i_8
       (.I0(\output_addr_reg_n_0_[2] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\load_idx_reg_n_0_[2] ),
        .O(input_bank_i_8_n_0));
  LUT3 #(
    .INIT(8'hB8)) 
    input_bank_i_9
       (.I0(\output_addr_reg_n_0_[1] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\load_idx_reg_n_0_[1] ),
        .O(input_bank_i_9_n_0));
  (* SOFT_HLUTNM = "soft_lutpair153" *) 
  LUT3 #(
    .INIT(8'h38)) 
    \layer[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[6] ),
        .I1(\layer[1]_i_2_n_0 ),
        .I2(\layer_reg_n_0_[0] ),
        .O(\layer[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair153" *) 
  LUT4 #(
    .INIT(16'h2F80)) 
    \layer[1]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[6] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\layer[1]_i_2_n_0 ),
        .I3(\layer_reg_n_0_[1] ),
        .O(\layer[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF002000200020)) 
    \layer[1]_i_2 
       (.I0(state1),
        .I1(\oc[5]_i_3_n_0 ),
        .I2(\FSM_onehot_state_reg_n_0_[6] ),
        .I3(\FSM_onehot_state[5]_i_2_n_0 ),
        .I4(start),
        .I5(\FSM_onehot_state_reg_n_0_[4] ),
        .O(\layer[1]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \layer_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\layer[0]_i_1_n_0 ),
        .Q(\layer_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \layer_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\layer[1]_i_1_n_0 ),
        .Q(\layer_reg_n_0_[1] ),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair155" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \load_idx[0]_i_1 
       (.I0(input_ready),
        .I1(\load_idx_reg_n_0_[0] ),
        .O(load_idx[0]));
  LUT3 #(
    .INIT(8'h48)) 
    \load_idx[1]_i_1 
       (.I0(\load_idx_reg_n_0_[0] ),
        .I1(input_ready),
        .I2(\load_idx_reg_n_0_[1] ),
        .O(load_idx[1]));
  (* SOFT_HLUTNM = "soft_lutpair150" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \load_idx[2]_i_1 
       (.I0(\load_idx_reg_n_0_[0] ),
        .I1(\load_idx_reg_n_0_[1] ),
        .I2(input_ready),
        .I3(\load_idx_reg_n_0_[2] ),
        .O(load_idx[2]));
  (* SOFT_HLUTNM = "soft_lutpair150" *) 
  LUT5 #(
    .INIT(32'h7F008000)) 
    \load_idx[3]_i_1 
       (.I0(\load_idx_reg_n_0_[1] ),
        .I1(\load_idx_reg_n_0_[0] ),
        .I2(\load_idx_reg_n_0_[2] ),
        .I3(input_ready),
        .I4(\load_idx_reg_n_0_[3] ),
        .O(load_idx[3]));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \load_idx[4]_i_1 
       (.I0(\load_idx_reg_n_0_[2] ),
        .I1(\load_idx_reg_n_0_[0] ),
        .I2(\load_idx_reg_n_0_[1] ),
        .I3(\load_idx_reg_n_0_[3] ),
        .I4(input_ready),
        .I5(\load_idx_reg_n_0_[4] ),
        .O(load_idx[4]));
  LUT5 #(
    .INIT(32'hFF808080)) 
    \load_idx[5]_i_1 
       (.I0(input_valid),
        .I1(input_ready),
        .I2(\load_idx[5]_i_3_n_0 ),
        .I3(start),
        .I4(\FSM_onehot_state_reg_n_0_[4] ),
        .O(\load_idx[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair155" *) 
  LUT4 #(
    .INIT(16'hB400)) 
    \load_idx[5]_i_2 
       (.I0(\load_idx[5]_i_4_n_0 ),
        .I1(\load_idx_reg_n_0_[4] ),
        .I2(\load_idx_reg_n_0_[5] ),
        .I3(input_ready),
        .O(load_idx[5]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFF7FFFFF)) 
    \load_idx[5]_i_3 
       (.I0(\load_idx_reg_n_0_[1] ),
        .I1(\load_idx_reg_n_0_[0] ),
        .I2(\load_idx_reg_n_0_[2] ),
        .I3(\load_idx_reg_n_0_[3] ),
        .I4(\load_idx_reg_n_0_[5] ),
        .I5(\load_idx_reg_n_0_[4] ),
        .O(\load_idx[5]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \load_idx[5]_i_4 
       (.I0(\load_idx_reg_n_0_[2] ),
        .I1(\load_idx_reg_n_0_[0] ),
        .I2(\load_idx_reg_n_0_[1] ),
        .I3(\load_idx_reg_n_0_[3] ),
        .O(\load_idx[5]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \load_idx_reg[0] 
       (.C(clk),
        .CE(\load_idx[5]_i_1_n_0 ),
        .D(load_idx[0]),
        .Q(\load_idx_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \load_idx_reg[1] 
       (.C(clk),
        .CE(\load_idx[5]_i_1_n_0 ),
        .D(load_idx[1]),
        .Q(\load_idx_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \load_idx_reg[2] 
       (.C(clk),
        .CE(\load_idx[5]_i_1_n_0 ),
        .D(load_idx[2]),
        .Q(\load_idx_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \load_idx_reg[3] 
       (.C(clk),
        .CE(\load_idx[5]_i_1_n_0 ),
        .D(load_idx[3]),
        .Q(\load_idx_reg_n_0_[3] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \load_idx_reg[4] 
       (.C(clk),
        .CE(\load_idx[5]_i_1_n_0 ),
        .D(load_idx[4]),
        .Q(\load_idx_reg_n_0_[4] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \load_idx_reg[5] 
       (.C(clk),
        .CE(\load_idx[5]_i_1_n_0 ),
        .D(load_idx[5]),
        .Q(\load_idx_reg_n_0_[5] ),
        .R(rst));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \mult_reg[0]_i_1 
       (.I0(m_data[0]),
        .I1(m2_data[0]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(m3_data[0]),
        .O(\mult_reg[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \mult_reg[10]_i_1 
       (.I0(m_data[10]),
        .I1(m2_data[10]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(m3_data[10]),
        .O(\mult_reg[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \mult_reg[11]_i_1 
       (.I0(m_data[11]),
        .I1(m2_data[11]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(m3_data[11]),
        .O(\mult_reg[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \mult_reg[12]_i_1 
       (.I0(m_data[12]),
        .I1(m2_data[12]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(m3_data[12]),
        .O(\mult_reg[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \mult_reg[13]_i_1 
       (.I0(m_data[13]),
        .I1(m2_data[13]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(m3_data[13]),
        .O(\mult_reg[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \mult_reg[14]_i_1 
       (.I0(m_data[14]),
        .I1(m2_data[14]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(m3_data[14]),
        .O(\mult_reg[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \mult_reg[15]_i_1 
       (.I0(m_data[15]),
        .I1(m2_data[15]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(m3_data[15]),
        .O(\mult_reg[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \mult_reg[16]_i_1 
       (.I0(m_data[16]),
        .I1(m2_data[16]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(m3_data[16]),
        .O(\mult_reg[16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \mult_reg[17]_i_1 
       (.I0(m_data[17]),
        .I1(m2_data[17]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(m3_data[17]),
        .O(\mult_reg[17]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \mult_reg[18]_i_1 
       (.I0(m_data[18]),
        .I1(m2_data[18]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(m3_data[18]),
        .O(\mult_reg[18]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \mult_reg[19]_i_1 
       (.I0(m_data[19]),
        .I1(m2_data[19]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(m3_data[19]),
        .O(\mult_reg[19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \mult_reg[1]_i_1 
       (.I0(m_data[1]),
        .I1(m2_data[1]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(m3_data[1]),
        .O(\mult_reg[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \mult_reg[20]_i_1 
       (.I0(m_data[20]),
        .I1(m2_data[20]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(m3_data[20]),
        .O(\mult_reg[20]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \mult_reg[21]_i_1 
       (.I0(m_data[21]),
        .I1(m2_data[21]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(m3_data[21]),
        .O(\mult_reg[21]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \mult_reg[22]_i_1 
       (.I0(m_data[22]),
        .I1(m2_data[22]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(m3_data[22]),
        .O(\mult_reg[22]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \mult_reg[23]_i_1 
       (.I0(m_data[23]),
        .I1(m2_data[23]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(m3_data[23]),
        .O(\mult_reg[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2C20)) 
    \mult_reg[24]_i_1 
       (.I0(m3_data[24]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\layer_reg_n_0_[1] ),
        .I3(m2_data[24]),
        .O(\mult_reg[24]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \mult_reg[25]_i_1 
       (.I0(m3_data[25]),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\layer_reg_n_0_[1] ),
        .O(\mult_reg[25]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \mult_reg[2]_i_1 
       (.I0(m_data[2]),
        .I1(m2_data[2]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(m3_data[2]),
        .O(\mult_reg[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \mult_reg[3]_i_1 
       (.I0(m_data[3]),
        .I1(m2_data[3]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(m3_data[3]),
        .O(\mult_reg[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \mult_reg[4]_i_1 
       (.I0(m_data[4]),
        .I1(m2_data[4]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(m3_data[4]),
        .O(\mult_reg[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair148" *) 
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \mult_reg[5]_i_1 
       (.I0(m_data[5]),
        .I1(m2_data[5]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(m3_data[5]),
        .O(\mult_reg[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFCAF0CA)) 
    \mult_reg[6]_i_1 
       (.I0(m_data[6]),
        .I1(m2_data[6]),
        .I2(\layer_reg_n_0_[0] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(m3_data[6]),
        .O(\mult_reg[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \mult_reg[7]_i_1 
       (.I0(m_data[7]),
        .I1(m2_data[7]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(m3_data[7]),
        .O(\mult_reg[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \mult_reg[8]_i_1 
       (.I0(m_data[8]),
        .I1(m2_data[8]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(m3_data[8]),
        .O(\mult_reg[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0CFA0C0A)) 
    \mult_reg[9]_i_1 
       (.I0(m_data[9]),
        .I1(m2_data[9]),
        .I2(\layer_reg_n_0_[1] ),
        .I3(\layer_reg_n_0_[0] ),
        .I4(m3_data[9]),
        .O(\mult_reg[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[0] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[0]_i_1_n_0 ),
        .Q(mult_reg[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[10] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[10]_i_1_n_0 ),
        .Q(mult_reg[10]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[11] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[11]_i_1_n_0 ),
        .Q(mult_reg[11]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[12] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[12]_i_1_n_0 ),
        .Q(mult_reg[12]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[13] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[13]_i_1_n_0 ),
        .Q(mult_reg[13]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[14] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[14]_i_1_n_0 ),
        .Q(mult_reg[14]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[15] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[15]_i_1_n_0 ),
        .Q(mult_reg[15]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[16] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[16]_i_1_n_0 ),
        .Q(mult_reg[16]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[17] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[17]_i_1_n_0 ),
        .Q(mult_reg[17]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[18] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[18]_i_1_n_0 ),
        .Q(mult_reg[18]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[19] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[19]_i_1_n_0 ),
        .Q(mult_reg[19]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[1] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[1]_i_1_n_0 ),
        .Q(mult_reg[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[20] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[20]_i_1_n_0 ),
        .Q(mult_reg[20]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[21] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[21]_i_1_n_0 ),
        .Q(mult_reg[21]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[22] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[22]_i_1_n_0 ),
        .Q(mult_reg[22]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[23] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[23]_i_1_n_0 ),
        .Q(mult_reg[23]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[24] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[24]_i_1_n_0 ),
        .Q(mult_reg[24]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[25] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[25]_i_1_n_0 ),
        .Q(mult_reg[25]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[2] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[2]_i_1_n_0 ),
        .Q(mult_reg[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[3] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[3]_i_1_n_0 ),
        .Q(mult_reg[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[4] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[4]_i_1_n_0 ),
        .Q(mult_reg[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[5] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[5]_i_1_n_0 ),
        .Q(mult_reg[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[6] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[6]_i_1_n_0 ),
        .Q(mult_reg[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[7] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[7]_i_1_n_0 ),
        .Q(mult_reg[7]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[8] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[8]_i_1_n_0 ),
        .Q(mult_reg[8]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \mult_reg_reg[9] 
       (.C(clk),
        .CE(bias_reg),
        .D(\mult_reg[9]_i_1_n_0 ),
        .Q(mult_reg[9]),
        .R(rst));
  (* ADDR_WIDTH = "4" *) 
  (* DEPTH = "16" *) 
  (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv2_multiplier.memh" *) 
  (* WIDTH = "32" *) 
  parameter_rom_sync__parameterized10 multiplier2_rom
       (.addr({\oc_reg_n_0_[3] ,\oc_reg_n_0_[2] ,\oc_reg_n_0_[1] ,\oc_reg_n_0_[0] }),
        .clk(clk),
        .data({NLW_multiplier2_rom_data_UNCONNECTED[31:25],m2_data}),
        .en(en013_out));
  (* ADDR_WIDTH = "5" *) 
  (* DEPTH = "32" *) 
  (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/fc1_multiplier.memh" *) 
  (* WIDTH = "32" *) 
  parameter_rom_sync__parameterized2 multiplier3_rom
       (.addr({\oc_reg_n_0_[4] ,\oc_reg_n_0_[3] ,\oc_reg_n_0_[2] ,\oc_reg_n_0_[1] ,\oc_reg_n_0_[0] }),
        .clk(clk),
        .data({NLW_multiplier3_rom_data_UNCONNECTED[31:26],m3_data}),
        .en(en012_out));
  (* ADDR_WIDTH = "4" *) 
  (* DEPTH = "16" *) 
  (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv1_multiplier.memh" *) 
  (* WIDTH = "32" *) 
  parameter_rom_sync__parameterized13 multiplier_rom
       (.addr({\oc_reg_n_0_[3] ,\oc_reg_n_0_[2] ,\oc_reg_n_0_[1] ,\oc_reg_n_0_[0] }),
        .clk(clk),
        .data({NLW_multiplier_rom_data_UNCONNECTED[31:24],m_data}),
        .en(en014_out));
  (* CW = "8" *) 
  (* MAX_FEATURES = "160" *) 
  (* ST_ACC = "3'b001" *) 
  (* ST_IDLE = "3'b000" *) 
  (* ST_MAG = "3'b011" *) 
  (* ST_MUL = "3'b010" *) 
  (* ST_OUT = "3'b110" *) 
  (* ST_RND = "3'b101" *) 
  (* ST_SHIFT = "3'b100" *) 
  neuron_int8_configurable neuron
       (.bias_in({\bias_reg_reg_n_0_[31] ,NLW_neuron_bias_in_UNCONNECTED[30:13],\bias_reg_reg_n_0_[12] ,\bias_reg_reg_n_0_[11] ,\bias_reg_reg_n_0_[10] ,\bias_reg_reg_n_0_[9] ,\bias_reg_reg_n_0_[8] ,\bias_reg_reg_n_0_[7] ,\bias_reg_reg_n_0_[6] ,\bias_reg_reg_n_0_[5] ,\bias_reg_reg_n_0_[4] ,\bias_reg_reg_n_0_[3] ,\bias_reg_reg_n_0_[2] ,\bias_reg_reg_n_0_[1] ,\bias_reg_reg_n_0_[0] }),
        .busy(NLW_neuron_busy_UNCONNECTED),
        .clk(clk),
        .config_error(neuron_config_error),
        .done(neuron_done),
        .feature_count_in({neuron_i_1_n_0,NLW_neuron_feature_count_in_UNCONNECTED[6],neuron_i_2_n_0,neuron_i_3_n_0,neuron_i_4_n_0,NLW_neuron_feature_count_in_UNCONNECTED[2:0]}),
        .feature_in({\feature_reg_reg_n_0_[7] ,\feature_reg_reg_n_0_[6] ,\feature_reg_reg_n_0_[5] ,\feature_reg_reg_n_0_[4] ,\feature_reg_reg_n_0_[3] ,\feature_reg_reg_n_0_[2] ,\feature_reg_reg_n_0_[1] ,\feature_reg_reg_n_0_[0] }),
        .multiplier_in({NLW_neuron_multiplier_in_UNCONNECTED[31:26],mult_reg}),
        .overflow(neuron_overflow),
        .relu_in(neuron_i_5_n_0),
        .result(neuron_result),
        .rst(rst),
        .shift_in({NLW_neuron_shift_in_UNCONNECTED[5:1],\shift_reg_reg_n_0_[0] }),
        .start(\FSM_onehot_state_reg_n_0_[1] ),
        .valid_in(\FSM_onehot_state_reg_n_0_[9] ),
        .weight_in(weight_reg));
  LUT2 #(
    .INIT(4'h2)) 
    neuron_i_1
       (.I0(\layer_reg_n_0_[1] ),
        .I1(\layer_reg_n_0_[0] ),
        .O(neuron_i_1_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    neuron_i_2
       (.I0(\layer_reg_n_0_[0] ),
        .I1(\layer_reg_n_0_[1] ),
        .O(neuron_i_2_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    neuron_i_3
       (.I0(\layer_reg_n_0_[0] ),
        .I1(\layer_reg_n_0_[1] ),
        .O(neuron_i_3_n_0));
  LUT2 #(
    .INIT(4'h1)) 
    neuron_i_4
       (.I0(\layer_reg_n_0_[1] ),
        .I1(\layer_reg_n_0_[0] ),
        .O(neuron_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair148" *) 
  LUT2 #(
    .INIT(4'h7)) 
    neuron_i_5
       (.I0(\layer_reg_n_0_[1] ),
        .I1(\layer_reg_n_0_[0] ),
        .O(neuron_i_5_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    \oc[0]_i_1 
       (.I0(\FSM_onehot_state[3]_i_3_n_0 ),
        .I1(\oc_reg_n_0_[0] ),
        .O(\oc[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h28)) 
    \oc[1]_i_1 
       (.I0(\FSM_onehot_state[3]_i_3_n_0 ),
        .I1(\oc_reg_n_0_[0] ),
        .I2(\oc_reg_n_0_[1] ),
        .O(\oc[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h2A80)) 
    \oc[2]_i_1 
       (.I0(\FSM_onehot_state[3]_i_3_n_0 ),
        .I1(\oc_reg_n_0_[0] ),
        .I2(\oc_reg_n_0_[1] ),
        .I3(\oc_reg_n_0_[2] ),
        .O(\oc[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h2AAA8000)) 
    \oc[3]_i_1 
       (.I0(\FSM_onehot_state[3]_i_3_n_0 ),
        .I1(\oc_reg_n_0_[1] ),
        .I2(\oc_reg_n_0_[0] ),
        .I3(\oc_reg_n_0_[2] ),
        .I4(\oc_reg_n_0_[3] ),
        .O(\oc[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2AAAAAAA80000000)) 
    \oc[4]_i_1 
       (.I0(\FSM_onehot_state[3]_i_3_n_0 ),
        .I1(\oc_reg_n_0_[3] ),
        .I2(\oc_reg_n_0_[2] ),
        .I3(\oc_reg_n_0_[0] ),
        .I4(\oc_reg_n_0_[1] ),
        .I5(\oc_reg_n_0_[4] ),
        .O(\oc[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF551055105510)) 
    \oc[5]_i_1 
       (.I0(\FSM_onehot_state[5]_i_2_n_0 ),
        .I1(\oc[5]_i_3_n_0 ),
        .I2(\FSM_onehot_state_reg_n_0_[6] ),
        .I3(\FSM_onehot_state[3]_i_3_n_0 ),
        .I4(start),
        .I5(\FSM_onehot_state_reg_n_0_[4] ),
        .O(\oc[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7FF000008000000)) 
    \oc[5]_i_2 
       (.I0(\oc_reg_n_0_[3] ),
        .I1(\oc_reg_n_0_[2] ),
        .I2(\oc[5]_i_4_n_0 ),
        .I3(\oc_reg_n_0_[4] ),
        .I4(\FSM_onehot_state[3]_i_3_n_0 ),
        .I5(\oc_reg_n_0_[5] ),
        .O(\oc[5]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \oc[5]_i_3 
       (.I0(\layer_reg_n_0_[0] ),
        .I1(\layer_reg_n_0_[1] ),
        .O(\oc[5]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \oc[5]_i_4 
       (.I0(\oc_reg_n_0_[1] ),
        .I1(\oc_reg_n_0_[0] ),
        .O(\oc[5]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \oc_reg[0] 
       (.C(clk),
        .CE(\oc[5]_i_1_n_0 ),
        .D(\oc[0]_i_1_n_0 ),
        .Q(\oc_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \oc_reg[1] 
       (.C(clk),
        .CE(\oc[5]_i_1_n_0 ),
        .D(\oc[1]_i_1_n_0 ),
        .Q(\oc_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \oc_reg[2] 
       (.C(clk),
        .CE(\oc[5]_i_1_n_0 ),
        .D(\oc[2]_i_1_n_0 ),
        .Q(\oc_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \oc_reg[3] 
       (.C(clk),
        .CE(\oc[5]_i_1_n_0 ),
        .D(\oc[3]_i_1_n_0 ),
        .Q(\oc_reg_n_0_[3] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \oc_reg[4] 
       (.C(clk),
        .CE(\oc[5]_i_1_n_0 ),
        .D(\oc[4]_i_1_n_0 ),
        .Q(\oc_reg_n_0_[4] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \oc_reg[5] 
       (.C(clk),
        .CE(\oc[5]_i_1_n_0 ),
        .D(\oc[5]_i_2_n_0 ),
        .Q(\oc_reg_n_0_[5] ),
        .R(rst));
  LUT2 #(
    .INIT(4'h2)) 
    \operand[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[10] ),
        .I1(\operand_reg_n_0_[0] ),
        .O(\operand[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h60)) 
    \operand[1]_i_1 
       (.I0(\operand_reg_n_0_[1] ),
        .I1(\operand_reg_n_0_[0] ),
        .I2(\FSM_onehot_state_reg_n_0_[10] ),
        .O(\operand[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair149" *) 
  LUT4 #(
    .INIT(16'h7080)) 
    \operand[2]_i_1 
       (.I0(\operand_reg_n_0_[0] ),
        .I1(\operand_reg_n_0_[1] ),
        .I2(\FSM_onehot_state_reg_n_0_[10] ),
        .I3(\operand_reg_n_0_[2] ),
        .O(\operand[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair149" *) 
  LUT5 #(
    .INIT(32'h7F008000)) 
    \operand[3]_i_1 
       (.I0(\operand_reg_n_0_[1] ),
        .I1(\operand_reg_n_0_[0] ),
        .I2(\operand_reg_n_0_[2] ),
        .I3(\FSM_onehot_state_reg_n_0_[10] ),
        .I4(\operand_reg_n_0_[3] ),
        .O(\operand[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \operand[4]_i_1 
       (.I0(\operand_reg_n_0_[2] ),
        .I1(\operand_reg_n_0_[0] ),
        .I2(\operand_reg_n_0_[1] ),
        .I3(\operand_reg_n_0_[3] ),
        .I4(\FSM_onehot_state_reg_n_0_[10] ),
        .I5(\operand_reg_n_0_[4] ),
        .O(\operand[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF7FF000008000000)) 
    \operand[5]_i_1 
       (.I0(\operand_reg_n_0_[4] ),
        .I1(\operand_reg_n_0_[3] ),
        .I2(\operand[5]_i_2_n_0 ),
        .I3(\operand_reg_n_0_[2] ),
        .I4(\FSM_onehot_state_reg_n_0_[10] ),
        .I5(operand[5]),
        .O(\operand[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \operand[5]_i_2 
       (.I0(\operand_reg_n_0_[0] ),
        .I1(\operand_reg_n_0_[1] ),
        .O(\operand[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair154" *) 
  LUT3 #(
    .INIT(8'h84)) 
    \operand[6]_i_1 
       (.I0(\operand[7]_i_2_n_0 ),
        .I1(\FSM_onehot_state_reg_n_0_[10] ),
        .I2(operand[6]),
        .O(\operand[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair154" *) 
  LUT4 #(
    .INIT(16'h8C40)) 
    \operand[7]_i_1 
       (.I0(\operand[7]_i_2_n_0 ),
        .I1(\FSM_onehot_state_reg_n_0_[10] ),
        .I2(operand[6]),
        .I3(operand[7]),
        .O(\operand[7]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \operand[7]_i_2 
       (.I0(\operand_reg_n_0_[2] ),
        .I1(\operand_reg_n_0_[0] ),
        .I2(\operand_reg_n_0_[1] ),
        .I3(\operand_reg_n_0_[3] ),
        .I4(\operand_reg_n_0_[4] ),
        .I5(operand[5]),
        .O(\operand[7]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \operand_reg[0] 
       (.C(clk),
        .CE(\FSM_onehot_state[2]_i_1_n_0 ),
        .D(\operand[0]_i_1_n_0 ),
        .Q(\operand_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \operand_reg[1] 
       (.C(clk),
        .CE(\FSM_onehot_state[2]_i_1_n_0 ),
        .D(\operand[1]_i_1_n_0 ),
        .Q(\operand_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \operand_reg[2] 
       (.C(clk),
        .CE(\FSM_onehot_state[2]_i_1_n_0 ),
        .D(\operand[2]_i_1_n_0 ),
        .Q(\operand_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \operand_reg[3] 
       (.C(clk),
        .CE(\FSM_onehot_state[2]_i_1_n_0 ),
        .D(\operand[3]_i_1_n_0 ),
        .Q(\operand_reg_n_0_[3] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \operand_reg[4] 
       (.C(clk),
        .CE(\FSM_onehot_state[2]_i_1_n_0 ),
        .D(\operand[4]_i_1_n_0 ),
        .Q(\operand_reg_n_0_[4] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \operand_reg[5] 
       (.C(clk),
        .CE(\FSM_onehot_state[2]_i_1_n_0 ),
        .D(\operand[5]_i_1_n_0 ),
        .Q(operand[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \operand_reg[6] 
       (.C(clk),
        .CE(\FSM_onehot_state[2]_i_1_n_0 ),
        .D(\operand[6]_i_1_n_0 ),
        .Q(operand[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \operand_reg[7] 
       (.C(clk),
        .CE(\FSM_onehot_state[2]_i_1_n_0 ),
        .D(\operand[7]_i_1_n_0 ),
        .Q(operand[7]),
        .R(rst));
  LUT3 #(
    .INIT(8'hB8)) 
    \output_addr[0]_i_1 
       (.I0(\oc_reg_n_0_[0] ),
        .I1(\layer_reg_n_0_[1] ),
        .I2(\t_reg_n_0_[0] ),
        .O(out_addr[0]));
  LUT3 #(
    .INIT(8'hB8)) 
    \output_addr[1]_i_1 
       (.I0(\oc_reg_n_0_[1] ),
        .I1(\layer_reg_n_0_[1] ),
        .I2(out_addr0[1]),
        .O(out_addr[1]));
  (* SOFT_HLUTNM = "soft_lutpair160" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_addr[2]_i_1 
       (.I0(\oc_reg_n_0_[2] ),
        .I1(\layer_reg_n_0_[1] ),
        .I2(out_addr0[2]),
        .O(out_addr[2]));
  (* SOFT_HLUTNM = "soft_lutpair160" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_addr[3]_i_1 
       (.I0(\oc_reg_n_0_[3] ),
        .I1(\layer_reg_n_0_[1] ),
        .I2(out_addr0[3]),
        .O(out_addr[3]));
  (* SOFT_HLUTNM = "soft_lutpair159" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_addr[4]_i_1 
       (.I0(\oc_reg_n_0_[4] ),
        .I1(\layer_reg_n_0_[1] ),
        .I2(out_addr0[4]),
        .O(out_addr[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \output_addr[4]_i_3 
       (.I0(out_addr1[3]),
        .I1(\t_reg_n_0_[3] ),
        .O(\output_addr[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \output_addr[4]_i_4 
       (.I0(out_addr1[2]),
        .I1(\t_reg_n_0_[2] ),
        .O(\output_addr[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \output_addr[4]_i_5 
       (.I0(\oc_reg_n_0_[0] ),
        .I1(\t_reg_n_0_[1] ),
        .O(\output_addr[4]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair158" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \output_addr[5]_i_1 
       (.I0(\oc_reg_n_0_[5] ),
        .I1(\layer_reg_n_0_[1] ),
        .I2(out_addr0[5]),
        .O(out_addr[5]));
  (* SOFT_HLUTNM = "soft_lutpair159" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \output_addr[6]_i_1 
       (.I0(out_addr0[6]),
        .I1(\layer_reg_n_0_[1] ),
        .O(out_addr[6]));
  LUT2 #(
    .INIT(4'h8)) 
    \output_addr[7]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[11] ),
        .I1(neuron_done),
        .O(output_addr));
  (* SOFT_HLUTNM = "soft_lutpair158" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \output_addr[7]_i_2 
       (.I0(out_addr0[7]),
        .I1(\layer_reg_n_0_[1] ),
        .O(out_addr[7]));
  LUT2 #(
    .INIT(4'h6)) 
    \output_addr[7]_i_6 
       (.I0(\oc_reg_n_0_[5] ),
        .I1(\oc_reg_n_0_[3] ),
        .O(\output_addr[7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \output_addr[7]_i_7 
       (.I0(\oc_reg_n_0_[4] ),
        .I1(\oc_reg_n_0_[2] ),
        .O(\output_addr[7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \output_addr[7]_i_8 
       (.I0(\oc_reg_n_0_[3] ),
        .I1(\oc_reg_n_0_[1] ),
        .O(\output_addr[7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \output_addr[7]_i_9 
       (.I0(\oc_reg_n_0_[2] ),
        .I1(\oc_reg_n_0_[0] ),
        .O(\output_addr[7]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \output_addr_reg[0] 
       (.C(clk),
        .CE(output_addr),
        .D(out_addr[0]),
        .Q(\output_addr_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_addr_reg[1] 
       (.C(clk),
        .CE(output_addr),
        .D(out_addr[1]),
        .Q(\output_addr_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_addr_reg[2] 
       (.C(clk),
        .CE(output_addr),
        .D(out_addr[2]),
        .Q(\output_addr_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_addr_reg[3] 
       (.C(clk),
        .CE(output_addr),
        .D(out_addr[3]),
        .Q(\output_addr_reg_n_0_[3] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_addr_reg[4] 
       (.C(clk),
        .CE(output_addr),
        .D(out_addr[4]),
        .Q(\output_addr_reg_n_0_[4] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \output_addr_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\output_addr_reg[4]_i_2_n_0 ,\NLW_output_addr_reg[4]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,out_addr1[3:2],\oc_reg_n_0_[0] }),
        .O(out_addr0[4:1]),
        .S({out_addr1[4],\output_addr[4]_i_3_n_0 ,\output_addr[4]_i_4_n_0 ,\output_addr[4]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \output_addr_reg[5] 
       (.C(clk),
        .CE(output_addr),
        .D(out_addr[5]),
        .Q(\output_addr_reg_n_0_[5] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_addr_reg[6] 
       (.C(clk),
        .CE(output_addr),
        .D(out_addr[6]),
        .Q(\output_addr_reg_n_0_[6] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_addr_reg[7] 
       (.C(clk),
        .CE(output_addr),
        .D(out_addr[7]),
        .Q(\output_addr_reg_n_0_[7] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \output_addr_reg[7]_i_3 
       (.CI(\output_addr_reg[4]_i_2_n_0 ),
        .CO(\NLW_output_addr_reg[7]_i_3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_output_addr_reg[7]_i_3_O_UNCONNECTED [3],out_addr0[7:5]}),
        .S({1'b0,out_addr1[7:5]}));
  CARRY4 \output_addr_reg[7]_i_4 
       (.CI(\output_addr_reg[7]_i_5_n_0 ),
        .CO(\NLW_output_addr_reg[7]_i_4_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\oc_reg_n_0_[5] }),
        .O({\NLW_output_addr_reg[7]_i_4_O_UNCONNECTED [3:2],out_addr1[7:6]}),
        .S({1'b0,1'b0,\oc_reg_n_0_[4] ,\output_addr[7]_i_6_n_0 }));
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 \output_addr_reg[7]_i_5 
       (.CI(1'b0),
        .CO({\output_addr_reg[7]_i_5_n_0 ,\NLW_output_addr_reg[7]_i_5_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\oc_reg_n_0_[4] ,\oc_reg_n_0_[3] ,\oc_reg_n_0_[2] ,1'b0}),
        .O(out_addr1[5:2]),
        .S({\output_addr[7]_i_7_n_0 ,\output_addr[7]_i_8_n_0 ,\output_addr[7]_i_9_n_0 ,\oc_reg_n_0_[1] }));
  FDRE #(
    .INIT(1'b0)) 
    \output_data_reg[0] 
       (.C(clk),
        .CE(output_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[0] ),
        .Q(output_data[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_data_reg[1] 
       (.C(clk),
        .CE(output_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[1] ),
        .Q(output_data[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_data_reg[2] 
       (.C(clk),
        .CE(output_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[2] ),
        .Q(output_data[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_data_reg[3] 
       (.C(clk),
        .CE(output_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[3] ),
        .Q(output_data[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_data_reg[4] 
       (.C(clk),
        .CE(output_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[4] ),
        .Q(output_data[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_data_reg[5] 
       (.C(clk),
        .CE(output_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[5] ),
        .Q(output_data[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_data_reg[6] 
       (.C(clk),
        .CE(output_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[6] ),
        .Q(output_data[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_data_reg[7] 
       (.C(clk),
        .CE(output_valid_i_1_n_0),
        .D(\output_reg_reg_n_0_[7] ),
        .Q(output_data[7]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_reg_reg[0] 
       (.C(clk),
        .CE(output_addr),
        .D(neuron_result[0]),
        .Q(\output_reg_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_reg_reg[1] 
       (.C(clk),
        .CE(output_addr),
        .D(neuron_result[1]),
        .Q(\output_reg_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_reg_reg[2] 
       (.C(clk),
        .CE(output_addr),
        .D(neuron_result[2]),
        .Q(\output_reg_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_reg_reg[3] 
       (.C(clk),
        .CE(output_addr),
        .D(neuron_result[3]),
        .Q(\output_reg_reg_n_0_[3] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_reg_reg[4] 
       (.C(clk),
        .CE(output_addr),
        .D(neuron_result[4]),
        .Q(\output_reg_reg_n_0_[4] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_reg_reg[5] 
       (.C(clk),
        .CE(output_addr),
        .D(neuron_result[5]),
        .Q(\output_reg_reg_n_0_[5] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_reg_reg[6] 
       (.C(clk),
        .CE(output_addr),
        .D(neuron_result[6]),
        .Q(\output_reg_reg_n_0_[6] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \output_reg_reg[7] 
       (.C(clk),
        .CE(output_addr),
        .D(neuron_result[7]),
        .Q(\output_reg_reg_n_0_[7] ),
        .R(rst));
  LUT3 #(
    .INIT(8'h80)) 
    output_valid_i_1
       (.I0(\layer_reg_n_0_[1] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(p_1_in),
        .O(output_valid_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    output_valid_reg
       (.C(clk),
        .CE(1'b1),
        .D(output_valid_i_1_n_0),
        .Q(output_valid),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[0] 
       (.C(clk),
        .CE(bias_reg),
        .D(1'b1),
        .Q(\shift_reg_reg_n_0_[0] ),
        .R(rst));
  LUT6 #(
    .INIT(64'h00000000001F0000)) 
    \t[0]_i_1 
       (.I0(\t_reg_n_0_[1] ),
        .I1(\t_reg_n_0_[2] ),
        .I2(\t_reg_n_0_[3] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(\FSM_onehot_state_reg_n_0_[6] ),
        .I5(\t_reg_n_0_[0] ),
        .O(\t[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00020200)) 
    \t[1]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[6] ),
        .I1(\layer_reg_n_0_[1] ),
        .I2(\t_reg_n_0_[3] ),
        .I3(\t_reg_n_0_[0] ),
        .I4(\t_reg_n_0_[1] ),
        .O(\t[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0002020002020000)) 
    \t[2]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[6] ),
        .I1(\layer_reg_n_0_[1] ),
        .I2(\t_reg_n_0_[3] ),
        .I3(\t_reg_n_0_[0] ),
        .I4(\t_reg_n_0_[2] ),
        .I5(\t_reg_n_0_[1] ),
        .O(\t[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hEA)) 
    \t[3]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[6] ),
        .I1(start),
        .I2(\FSM_onehot_state_reg_n_0_[4] ),
        .O(\t[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0001000000800000)) 
    \t[3]_i_2 
       (.I0(\t_reg_n_0_[1] ),
        .I1(\t_reg_n_0_[0] ),
        .I2(\t_reg_n_0_[2] ),
        .I3(\layer_reg_n_0_[1] ),
        .I4(\FSM_onehot_state_reg_n_0_[6] ),
        .I5(\t_reg_n_0_[3] ),
        .O(\t[3]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \t_reg[0] 
       (.C(clk),
        .CE(\t[3]_i_1_n_0 ),
        .D(\t[0]_i_1_n_0 ),
        .Q(\t_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \t_reg[1] 
       (.C(clk),
        .CE(\t[3]_i_1_n_0 ),
        .D(\t[1]_i_1_n_0 ),
        .Q(\t_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \t_reg[2] 
       (.C(clk),
        .CE(\t[3]_i_1_n_0 ),
        .D(\t[2]_i_1_n_0 ),
        .Q(\t_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \t_reg[3] 
       (.C(clk),
        .CE(\t[3]_i_1_n_0 ),
        .D(\t[3]_i_2_n_0 ),
        .Q(\t_reg_n_0_[3] ),
        .R(rst));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \weight_reg[0]_i_1 
       (.I0(w3_data[0]),
        .I1(w4_data[0]),
        .I2(w_data[0]),
        .I3(\layer_reg_n_0_[1] ),
        .I4(\layer_reg_n_0_[0] ),
        .I5(w2_data[0]),
        .O(\weight_reg[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \weight_reg[1]_i_1 
       (.I0(w3_data[1]),
        .I1(w4_data[1]),
        .I2(w_data[1]),
        .I3(\layer_reg_n_0_[1] ),
        .I4(\layer_reg_n_0_[0] ),
        .I5(w2_data[1]),
        .O(\weight_reg[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \weight_reg[2]_i_1 
       (.I0(w3_data[2]),
        .I1(w4_data[2]),
        .I2(w_data[2]),
        .I3(\layer_reg_n_0_[1] ),
        .I4(\layer_reg_n_0_[0] ),
        .I5(w2_data[2]),
        .O(\weight_reg[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \weight_reg[3]_i_1 
       (.I0(w3_data[3]),
        .I1(w4_data[3]),
        .I2(w_data[3]),
        .I3(\layer_reg_n_0_[1] ),
        .I4(\layer_reg_n_0_[0] ),
        .I5(w2_data[3]),
        .O(\weight_reg[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \weight_reg[4]_i_1 
       (.I0(w3_data[4]),
        .I1(w4_data[4]),
        .I2(w_data[4]),
        .I3(\layer_reg_n_0_[1] ),
        .I4(\layer_reg_n_0_[0] ),
        .I5(w2_data[4]),
        .O(\weight_reg[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \weight_reg[5]_i_1 
       (.I0(w3_data[5]),
        .I1(w4_data[5]),
        .I2(w_data[5]),
        .I3(\layer_reg_n_0_[1] ),
        .I4(\layer_reg_n_0_[0] ),
        .I5(w2_data[5]),
        .O(\weight_reg[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \weight_reg[6]_i_1 
       (.I0(w3_data[6]),
        .I1(w4_data[6]),
        .I2(w_data[6]),
        .I3(\layer_reg_n_0_[1] ),
        .I4(\layer_reg_n_0_[0] ),
        .I5(w2_data[6]),
        .O(\weight_reg[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hCCFFAAF0CC00AAF0)) 
    \weight_reg[7]_i_1 
       (.I0(w3_data[7]),
        .I1(w4_data[7]),
        .I2(w_data[7]),
        .I3(\layer_reg_n_0_[1] ),
        .I4(\layer_reg_n_0_[0] ),
        .I5(w2_data[7]),
        .O(\weight_reg[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \weight_reg_reg[0] 
       (.C(clk),
        .CE(feature_reg),
        .D(\weight_reg[0]_i_1_n_0 ),
        .Q(weight_reg[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \weight_reg_reg[1] 
       (.C(clk),
        .CE(feature_reg),
        .D(\weight_reg[1]_i_1_n_0 ),
        .Q(weight_reg[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \weight_reg_reg[2] 
       (.C(clk),
        .CE(feature_reg),
        .D(\weight_reg[2]_i_1_n_0 ),
        .Q(weight_reg[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \weight_reg_reg[3] 
       (.C(clk),
        .CE(feature_reg),
        .D(\weight_reg[3]_i_1_n_0 ),
        .Q(weight_reg[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \weight_reg_reg[4] 
       (.C(clk),
        .CE(feature_reg),
        .D(\weight_reg[4]_i_1_n_0 ),
        .Q(weight_reg[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \weight_reg_reg[5] 
       (.C(clk),
        .CE(feature_reg),
        .D(\weight_reg[5]_i_1_n_0 ),
        .Q(weight_reg[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \weight_reg_reg[6] 
       (.C(clk),
        .CE(feature_reg),
        .D(\weight_reg[6]_i_1_n_0 ),
        .Q(weight_reg[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \weight_reg_reg[7] 
       (.C(clk),
        .CE(feature_reg),
        .D(\weight_reg[7]_i_1_n_0 ),
        .Q(weight_reg[7]),
        .R(rst));
  (* ADDR_WIDTH = "10" *) 
  (* DEPTH = "768" *) 
  (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv2_weights.memh" *) 
  (* WIDTH = "8" *) 
  parameter_rom_sync__parameterized8 weights2_rom
       (.addr({weights2_rom_i_2_n_6,weights2_rom_i_2_n_7,weights2_rom_i_3_n_4,weights2_rom_i_3_n_5,weights2_rom_i_3_n_6,weights2_rom_i_3_n_7,\operand_reg_n_0_[3] ,\operand_reg_n_0_[2] ,\operand_reg_n_0_[1] ,\operand_reg_n_0_[0] }),
        .clk(clk),
        .data(w2_data),
        .en(en04_out));
  LUT3 #(
    .INIT(8'h20)) 
    weights2_rom_i_1
       (.I0(operand_req),
        .I1(\layer_reg_n_0_[1] ),
        .I2(\layer_reg_n_0_[0] ),
        .O(en04_out));
  LUT2 #(
    .INIT(4'h9)) 
    weights2_rom_i_10
       (.I0(\oc_reg_n_0_[3] ),
        .I1(\oc_reg_n_0_[5] ),
        .O(weights2_rom_i_10_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    weights2_rom_i_11
       (.I0(\oc_reg_n_0_[2] ),
        .I1(\oc_reg_n_0_[4] ),
        .O(weights2_rom_i_11_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    weights2_rom_i_12
       (.I0(\oc_reg_n_0_[1] ),
        .I1(\oc_reg_n_0_[3] ),
        .O(weights2_rom_i_12_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    weights2_rom_i_13
       (.I0(\oc_reg_n_0_[0] ),
        .I1(\oc_reg_n_0_[2] ),
        .O(weights2_rom_i_13_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    weights2_rom_i_14
       (.I0(\oc_reg_n_0_[1] ),
        .O(weights2_rom_i_14_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 weights2_rom_i_2
       (.CI(weights2_rom_i_3_n_0),
        .CO(NLW_weights2_rom_i_2_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_weights2_rom_i_2_O_UNCONNECTED[3:2],weights2_rom_i_2_n_6,weights2_rom_i_2_n_7}),
        .S({1'b0,1'b0,waddr20[9:8]}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 weights2_rom_i_3
       (.CI(1'b0),
        .CO({weights2_rom_i_3_n_0,NLW_weights2_rom_i_3_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI(waddr20[7:4]),
        .O({weights2_rom_i_3_n_4,weights2_rom_i_3_n_5,weights2_rom_i_3_n_6,weights2_rom_i_3_n_7}),
        .S({weights2_rom_i_6_n_0,weights2_rom_i_7_n_0,weights2_rom_i_8_n_0,weights2_rom_i_9_n_0}));
  CARRY4 weights2_rom_i_4
       (.CI(weights2_rom_i_5_n_0),
        .CO(NLW_weights2_rom_i_4_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\oc_reg_n_0_[2] }),
        .O({NLW_weights2_rom_i_4_O_UNCONNECTED[3:2],waddr20[9:8]}),
        .S({1'b0,1'b0,weights2_rom_i_10_n_0,weights2_rom_i_11_n_0}));
  CARRY4 weights2_rom_i_5
       (.CI(1'b0),
        .CO({weights2_rom_i_5_n_0,NLW_weights2_rom_i_5_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({\oc_reg_n_0_[1] ,\oc_reg_n_0_[0] ,1'b0,1'b1}),
        .O(waddr20[7:4]),
        .S({weights2_rom_i_12_n_0,weights2_rom_i_13_n_0,weights2_rom_i_14_n_0,\oc_reg_n_0_[0] }));
  LUT2 #(
    .INIT(4'h6)) 
    weights2_rom_i_6
       (.I0(waddr20[7]),
        .I1(operand[7]),
        .O(weights2_rom_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    weights2_rom_i_7
       (.I0(waddr20[6]),
        .I1(operand[6]),
        .O(weights2_rom_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    weights2_rom_i_8
       (.I0(waddr20[5]),
        .I1(operand[5]),
        .O(weights2_rom_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    weights2_rom_i_9
       (.I0(waddr20[4]),
        .I1(\operand_reg_n_0_[4] ),
        .O(weights2_rom_i_9_n_0));
  (* ADDR_WIDTH = "13" *) 
  (* DEPTH = "5120" *) 
  (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/fc1_weights.memh" *) 
  (* WIDTH = "8" *) 
  parameter_rom_sync weights3_rom
       (.addr({weights3_rom_i_2_n_4,weights3_rom_i_2_n_5,weights3_rom_i_2_n_6,weights3_rom_i_2_n_7,weights3_rom_i_3_n_4,weights3_rom_i_3_n_5,weights3_rom_i_3_n_6,weights3_rom_i_3_n_7,\operand_reg_n_0_[4] ,\operand_reg_n_0_[3] ,\operand_reg_n_0_[2] ,\operand_reg_n_0_[1] ,\operand_reg_n_0_[0] }),
        .clk(clk),
        .data(w3_data),
        .en(en02_out));
  LUT3 #(
    .INIT(8'h20)) 
    weights3_rom_i_1
       (.I0(operand_req),
        .I1(\layer_reg_n_0_[0] ),
        .I2(\layer_reg_n_0_[1] ),
        .O(en02_out));
  LUT2 #(
    .INIT(4'h6)) 
    weights3_rom_i_10
       (.I0(\oc_reg_n_0_[2] ),
        .I1(\oc_reg_n_0_[4] ),
        .O(weights3_rom_i_10_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    weights3_rom_i_11
       (.I0(\oc_reg_n_0_[1] ),
        .I1(\oc_reg_n_0_[3] ),
        .O(weights3_rom_i_11_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    weights3_rom_i_12
       (.I0(\oc_reg_n_0_[0] ),
        .I1(\oc_reg_n_0_[2] ),
        .O(weights3_rom_i_12_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 weights3_rom_i_2
       (.CI(weights3_rom_i_3_n_0),
        .CO(NLW_weights3_rom_i_2_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({weights3_rom_i_2_n_4,weights3_rom_i_2_n_5,weights3_rom_i_2_n_6,weights3_rom_i_2_n_7}),
        .S(waddr30[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 weights3_rom_i_3
       (.CI(1'b0),
        .CO({weights3_rom_i_3_n_0,NLW_weights3_rom_i_3_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,waddr30[7],\oc_reg_n_0_[1] ,\oc_reg_n_0_[0] }),
        .O({weights3_rom_i_3_n_4,weights3_rom_i_3_n_5,weights3_rom_i_3_n_6,weights3_rom_i_3_n_7}),
        .S({waddr30[8],weights3_rom_i_6_n_0,weights3_rom_i_7_n_0,weights3_rom_i_8_n_0}));
  CARRY4 weights3_rom_i_4
       (.CI(weights3_rom_i_5_n_0),
        .CO(NLW_weights3_rom_i_4_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\oc_reg_n_0_[3] }),
        .O({NLW_weights3_rom_i_4_O_UNCONNECTED[3],waddr30[12:10]}),
        .S({1'b0,\oc_reg_n_0_[5] ,\oc_reg_n_0_[4] ,weights3_rom_i_9_n_0}));
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 weights3_rom_i_5
       (.CI(1'b0),
        .CO({weights3_rom_i_5_n_0,NLW_weights3_rom_i_5_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({\oc_reg_n_0_[2] ,\oc_reg_n_0_[1] ,\oc_reg_n_0_[0] ,1'b0}),
        .O({waddr30[9:7],NLW_weights3_rom_i_5_O_UNCONNECTED[0]}),
        .S({weights3_rom_i_10_n_0,weights3_rom_i_11_n_0,weights3_rom_i_12_n_0,\oc_reg_n_0_[1] }));
  LUT2 #(
    .INIT(4'h6)) 
    weights3_rom_i_6
       (.I0(waddr30[7]),
        .I1(operand[7]),
        .O(weights3_rom_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    weights3_rom_i_7
       (.I0(\oc_reg_n_0_[1] ),
        .I1(operand[6]),
        .O(weights3_rom_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    weights3_rom_i_8
       (.I0(\oc_reg_n_0_[0] ),
        .I1(operand[5]),
        .O(weights3_rom_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    weights3_rom_i_9
       (.I0(\oc_reg_n_0_[3] ),
        .I1(\oc_reg_n_0_[5] ),
        .O(weights3_rom_i_9_n_0));
  (* ADDR_WIDTH = "5" *) 
  (* DEPTH = "32" *) 
  (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/output_weights.memh" *) 
  (* WIDTH = "8" *) 
  parameter_rom_sync__parameterized0 weights4_rom
       (.addr({\operand_reg_n_0_[4] ,\operand_reg_n_0_[3] ,\operand_reg_n_0_[2] ,\operand_reg_n_0_[1] ,\operand_reg_n_0_[0] }),
        .clk(clk),
        .data(w4_data),
        .en(en0));
  LUT3 #(
    .INIT(8'h80)) 
    weights4_rom_i_1
       (.I0(\layer_reg_n_0_[1] ),
        .I1(\layer_reg_n_0_[0] ),
        .I2(operand_req),
        .O(en0));
  (* ADDR_WIDTH = "8" *) 
  (* DEPTH = "192" *) 
  (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv1_weights.memh" *) 
  (* WIDTH = "8" *) 
  parameter_rom_sync__parameterized7 weights_rom
       (.addr({weights_rom_i_2_n_6,weights_rom_i_2_n_7,weights_rom_i_3_n_4,weights_rom_i_3_n_5,weights_rom_i_3_n_6,weights_rom_i_3_n_7,\operand_reg_n_0_[1] ,\operand_reg_n_0_[0] }),
        .clk(clk),
        .data(w_data),
        .en(en06_out));
  LUT3 #(
    .INIT(8'h02)) 
    weights_rom_i_1
       (.I0(operand_req),
        .I1(\layer_reg_n_0_[1] ),
        .I2(\layer_reg_n_0_[0] ),
        .O(en06_out));
  LUT2 #(
    .INIT(4'h6)) 
    weights_rom_i_10
       (.I0(weights_rom_i_7_n_6),
        .I1(\operand_reg_n_0_[3] ),
        .O(weights_rom_i_10_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    weights_rom_i_11
       (.I0(\oc_reg_n_0_[0] ),
        .I1(\operand_reg_n_0_[2] ),
        .O(weights_rom_i_11_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    weights_rom_i_12
       (.I0(\oc_reg_n_0_[3] ),
        .I1(\oc_reg_n_0_[5] ),
        .O(weights_rom_i_12_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    weights_rom_i_13
       (.I0(\oc_reg_n_0_[2] ),
        .I1(\oc_reg_n_0_[4] ),
        .O(weights_rom_i_13_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    weights_rom_i_14
       (.I0(\oc_reg_n_0_[1] ),
        .I1(\oc_reg_n_0_[3] ),
        .O(weights_rom_i_14_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    weights_rom_i_15
       (.I0(\oc_reg_n_0_[0] ),
        .I1(\oc_reg_n_0_[2] ),
        .O(weights_rom_i_15_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    weights_rom_i_16
       (.I0(\oc_reg_n_0_[1] ),
        .O(weights_rom_i_16_n_0));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 weights_rom_i_2
       (.CI(weights_rom_i_3_n_0),
        .CO(NLW_weights_rom_i_2_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,weights_rom_i_4_n_7}),
        .O({NLW_weights_rom_i_2_O_UNCONNECTED[3:2],weights_rom_i_2_n_6,weights_rom_i_2_n_7}),
        .S({1'b0,1'b0,weights_rom_i_5_n_0,weights_rom_i_6_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 weights_rom_i_3
       (.CI(1'b0),
        .CO({weights_rom_i_3_n_0,NLW_weights_rom_i_3_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({weights_rom_i_7_n_4,weights_rom_i_7_n_5,weights_rom_i_7_n_6,\oc_reg_n_0_[0] }),
        .O({weights_rom_i_3_n_4,weights_rom_i_3_n_5,weights_rom_i_3_n_6,weights_rom_i_3_n_7}),
        .S({weights_rom_i_8_n_0,weights_rom_i_9_n_0,weights_rom_i_10_n_0,weights_rom_i_11_n_0}));
  CARRY4 weights_rom_i_4
       (.CI(weights_rom_i_7_n_0),
        .CO(NLW_weights_rom_i_4_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\oc_reg_n_0_[2] }),
        .O({NLW_weights_rom_i_4_O_UNCONNECTED[3:2],weights_rom_i_4_n_6,weights_rom_i_4_n_7}),
        .S({1'b0,1'b0,weights_rom_i_12_n_0,weights_rom_i_13_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    weights_rom_i_5
       (.I0(weights_rom_i_4_n_6),
        .I1(operand[7]),
        .O(weights_rom_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    weights_rom_i_6
       (.I0(weights_rom_i_4_n_7),
        .I1(operand[6]),
        .O(weights_rom_i_6_n_0));
  CARRY4 weights_rom_i_7
       (.CI(1'b0),
        .CO({weights_rom_i_7_n_0,NLW_weights_rom_i_7_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({\oc_reg_n_0_[1] ,\oc_reg_n_0_[0] ,1'b0,1'b1}),
        .O({weights_rom_i_7_n_4,weights_rom_i_7_n_5,weights_rom_i_7_n_6,NLW_weights_rom_i_7_O_UNCONNECTED[0]}),
        .S({weights_rom_i_14_n_0,weights_rom_i_15_n_0,weights_rom_i_16_n_0,\oc_reg_n_0_[0] }));
  LUT2 #(
    .INIT(4'h6)) 
    weights_rom_i_8
       (.I0(weights_rom_i_7_n_4),
        .I1(operand[5]),
        .O(weights_rom_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    weights_rom_i_9
       (.I0(weights_rom_i_7_n_5),
        .I1(\operand_reg_n_0_[4] ),
        .O(weights_rom_i_9_n_0));
endmodule

(* CW = "8" *) (* MAX_FEATURES = "160" *) (* ST_ACC = "3'b001" *) 
(* ST_IDLE = "3'b000" *) (* ST_MAG = "3'b011" *) (* ST_MUL = "3'b010" *) 
(* ST_OUT = "3'b110" *) (* ST_RND = "3'b101" *) (* ST_SHIFT = "3'b100" *) 
module neuron_int8_configurable
   (clk,
    rst,
    start,
    valid_in,
    feature_count_in,
    feature_in,
    weight_in,
    bias_in,
    multiplier_in,
    shift_in,
    relu_in,
    busy,
    done,
    result,
    overflow,
    config_error);
  input clk;
  input rst;
  input start;
  input valid_in;
  input [7:0]feature_count_in;
  input [7:0]feature_in;
  input [7:0]weight_in;
  input [31:0]bias_in;
  input [31:0]multiplier_in;
  input [5:0]shift_in;
  input relu_in;
  output busy;
  output done;
  output [7:0]result;
  output overflow;
  output config_error;

  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_2_n_0 ;
  wire \FSM_sequential_state[1]_i_3_n_0 ;
  wire \FSM_sequential_state[1]_i_4_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_2_n_0 ;
  wire [31:0]acc;
  wire \acc[0]_i_1_psdsp_n ;
  wire \acc[0]_i_1_psdsp_n_1 ;
  wire \acc[10]_i_1_psdsp_n ;
  wire \acc[10]_i_1_psdsp_n_1 ;
  wire \acc[11]_i_1_psdsp_n ;
  wire \acc[11]_i_1_psdsp_n_1 ;
  wire \acc[11]_i_3_n_0 ;
  wire \acc[11]_i_4_n_0 ;
  wire \acc[11]_i_5_n_0 ;
  wire \acc[11]_i_6_n_0 ;
  wire \acc[12]_i_1_psdsp_n ;
  wire \acc[12]_i_1_psdsp_n_1 ;
  wire \acc[13]_i_1_psdsp_n ;
  wire \acc[13]_i_1_psdsp_n_1 ;
  wire \acc[14]_i_1_psdsp_n ;
  wire \acc[14]_i_1_psdsp_n_1 ;
  wire \acc[15]_i_1_psdsp_n ;
  wire \acc[15]_i_1_psdsp_n_1 ;
  wire \acc[15]_i_3_n_0 ;
  wire \acc[15]_i_4_n_0 ;
  wire \acc[15]_i_5_n_0 ;
  wire \acc[15]_i_6_n_0 ;
  wire \acc[16]_i_1_psdsp_n ;
  wire \acc[16]_i_1_psdsp_n_1 ;
  wire \acc[17]_i_1_psdsp_n ;
  wire \acc[17]_i_1_psdsp_n_1 ;
  wire \acc[18]_i_1_psdsp_n ;
  wire \acc[18]_i_1_psdsp_n_1 ;
  wire \acc[19]_i_1_psdsp_n ;
  wire \acc[19]_i_1_psdsp_n_1 ;
  wire \acc[19]_i_3_n_0 ;
  wire \acc[19]_i_4_n_0 ;
  wire \acc[19]_i_5_n_0 ;
  wire \acc[19]_i_6_n_0 ;
  wire \acc[19]_i_7_n_0 ;
  wire \acc[1]_i_1_psdsp_n ;
  wire \acc[1]_i_1_psdsp_n_1 ;
  wire \acc[20]_i_1_psdsp_n ;
  wire \acc[20]_i_1_psdsp_n_1 ;
  wire \acc[21]_i_1_psdsp_n ;
  wire \acc[21]_i_1_psdsp_n_1 ;
  wire \acc[22]_i_1_psdsp_n ;
  wire \acc[22]_i_1_psdsp_n_1 ;
  wire \acc[23]_i_1_psdsp_n ;
  wire \acc[23]_i_1_psdsp_n_1 ;
  wire \acc[23]_i_3_n_0 ;
  wire \acc[23]_i_4_n_0 ;
  wire \acc[23]_i_5_n_0 ;
  wire \acc[23]_i_6_n_0 ;
  wire \acc[24]_i_1_psdsp_n ;
  wire \acc[24]_i_1_psdsp_n_1 ;
  wire \acc[25]_i_1_psdsp_n ;
  wire \acc[25]_i_1_psdsp_n_1 ;
  wire \acc[26]_i_1_psdsp_n ;
  wire \acc[26]_i_1_psdsp_n_1 ;
  wire \acc[27]_i_1_psdsp_n ;
  wire \acc[27]_i_1_psdsp_n_1 ;
  wire \acc[27]_i_3_n_0 ;
  wire \acc[27]_i_4_n_0 ;
  wire \acc[27]_i_5_n_0 ;
  wire \acc[27]_i_6_n_0 ;
  wire \acc[28]_i_1_psdsp_n ;
  wire \acc[28]_i_1_psdsp_n_1 ;
  wire \acc[29]_i_1_psdsp_n ;
  wire \acc[29]_i_1_psdsp_n_1 ;
  wire \acc[2]_i_1_psdsp_n ;
  wire \acc[2]_i_1_psdsp_n_1 ;
  wire \acc[30]_i_1_psdsp_n ;
  wire \acc[30]_i_1_psdsp_n_1 ;
  wire \acc[31]_i_1_n_0 ;
  wire \acc[31]_i_2_psdsp_n ;
  wire \acc[31]_i_2_psdsp_n_1 ;
  wire \acc[3]_i_10_n_0 ;
  wire \acc[3]_i_11_n_0 ;
  wire \acc[3]_i_12_n_0 ;
  wire \acc[3]_i_13_n_0 ;
  wire \acc[3]_i_14_n_0 ;
  wire \acc[3]_i_15_n_0 ;
  wire \acc[3]_i_16_n_0 ;
  wire \acc[3]_i_17_n_0 ;
  wire \acc[3]_i_18_n_0 ;
  wire \acc[3]_i_19_n_0 ;
  wire \acc[3]_i_1_psdsp_n ;
  wire \acc[3]_i_1_psdsp_n_1 ;
  wire \acc[3]_i_20_n_0 ;
  wire \acc[3]_i_21_n_0 ;
  wire \acc[3]_i_22_n_0 ;
  wire \acc[3]_i_23_n_0 ;
  wire \acc[3]_i_24_n_0 ;
  wire \acc[3]_i_3_n_0 ;
  wire \acc[3]_i_4_n_0 ;
  wire \acc[3]_i_5_n_0 ;
  wire \acc[3]_i_6_n_0 ;
  wire \acc[3]_i_9_n_0 ;
  wire \acc[4]_i_1_psdsp_n ;
  wire \acc[4]_i_1_psdsp_n_1 ;
  wire \acc[5]_i_1_psdsp_n ;
  wire \acc[5]_i_1_psdsp_n_1 ;
  wire \acc[6]_i_1_psdsp_n ;
  wire \acc[6]_i_1_psdsp_n_1 ;
  wire \acc[7]_i_1_psdsp_n ;
  wire \acc[7]_i_1_psdsp_n_1 ;
  wire \acc[7]_i_3_n_0 ;
  wire \acc[7]_i_4_n_0 ;
  wire \acc[7]_i_5_n_0 ;
  wire \acc[7]_i_6_n_0 ;
  wire \acc[8]_i_1_psdsp_n ;
  wire \acc[8]_i_1_psdsp_n_1 ;
  wire \acc[9]_i_1_psdsp_n ;
  wire \acc[9]_i_1_psdsp_n_1 ;
  wire \acc_reg[11]_i_2_n_0 ;
  wire \acc_reg[15]_i_2_n_0 ;
  wire \acc_reg[19]_i_2_n_0 ;
  wire \acc_reg[23]_i_2_n_0 ;
  wire \acc_reg[27]_i_2_n_0 ;
  wire \acc_reg[3]_i_2_n_0 ;
  wire \acc_reg[3]_i_7_n_0 ;
  wire \acc_reg[3]_i_7_n_4 ;
  wire \acc_reg[3]_i_8_n_0 ;
  wire \acc_reg[3]_i_8_n_4 ;
  wire \acc_reg[3]_i_8_n_5 ;
  wire \acc_reg[3]_i_8_n_6 ;
  wire \acc_reg[3]_i_8_n_7 ;
  wire \acc_reg[7]_i_2_n_0 ;
  wire \acc_reg_n_0_[0] ;
  wire \acc_reg_n_0_[10] ;
  wire \acc_reg_n_0_[11] ;
  wire \acc_reg_n_0_[12] ;
  wire \acc_reg_n_0_[13] ;
  wire \acc_reg_n_0_[14] ;
  wire \acc_reg_n_0_[15] ;
  wire \acc_reg_n_0_[16] ;
  wire \acc_reg_n_0_[17] ;
  wire \acc_reg_n_0_[18] ;
  wire \acc_reg_n_0_[19] ;
  wire \acc_reg_n_0_[1] ;
  wire \acc_reg_n_0_[20] ;
  wire \acc_reg_n_0_[21] ;
  wire \acc_reg_n_0_[22] ;
  wire \acc_reg_n_0_[23] ;
  wire \acc_reg_n_0_[24] ;
  wire \acc_reg_n_0_[25] ;
  wire \acc_reg_n_0_[26] ;
  wire \acc_reg_n_0_[27] ;
  wire \acc_reg_n_0_[28] ;
  wire \acc_reg_n_0_[29] ;
  wire \acc_reg_n_0_[2] ;
  wire \acc_reg_n_0_[30] ;
  wire \acc_reg_n_0_[3] ;
  wire \acc_reg_n_0_[4] ;
  wire \acc_reg_n_0_[5] ;
  wire \acc_reg_n_0_[6] ;
  wire \acc_reg_n_0_[7] ;
  wire \acc_reg_n_0_[8] ;
  wire \acc_reg_n_0_[9] ;
  wire [7:0]activated;
  wire [31:0]bias_in;
  wire clipped1;
  wire clipped2;
  wire clk;
  wire config_error;
  wire config_error_i_1_n_0;
  wire config_error_i_2_n_0;
  wire [1:0]count;
  wire \count[2]_i_1_n_0 ;
  wire \count[3]_i_1_n_0 ;
  wire \count[4]_i_1_n_0 ;
  wire \count[5]_i_1_n_0 ;
  wire \count[5]_i_2_n_0 ;
  wire \count[6]_i_1_n_0 ;
  wire \count[7]_i_1_n_0 ;
  wire \count[7]_i_2_n_0 ;
  wire \count[7]_i_3_n_0 ;
  wire \count_reg_n_0_[0] ;
  wire \count_reg_n_0_[1] ;
  wire \count_reg_n_0_[2] ;
  wire \count_reg_n_0_[3] ;
  wire \count_reg_n_0_[4] ;
  wire \count_reg_n_0_[5] ;
  wire \count_reg_n_0_[6] ;
  wire \count_reg_n_0_[7] ;
  wire done;
  wire done_i_1_n_0;
  wire [7:0]feature_count_in;
  wire [7:0]feature_in;
  wire increment;
  wire increment10_in;
  wire increment2;
  wire increment_reg;
  wire increment_reg_i_10_n_0;
  wire increment_reg_i_11_n_0;
  wire increment_reg_i_12_n_0;
  wire increment_reg_i_14_n_0;
  wire increment_reg_i_15_n_0;
  wire increment_reg_i_16_n_0;
  wire increment_reg_i_18_n_0;
  wire increment_reg_i_19_n_0;
  wire increment_reg_i_20_n_0;
  wire increment_reg_i_21_n_0;
  wire increment_reg_i_22_n_0;
  wire increment_reg_i_23_n_0;
  wire increment_reg_i_24_n_0;
  wire increment_reg_i_25_n_0;
  wire increment_reg_i_27_n_0;
  wire increment_reg_i_28_n_0;
  wire increment_reg_i_29_n_0;
  wire increment_reg_i_30_n_0;
  wire increment_reg_i_32_n_0;
  wire increment_reg_i_33_n_0;
  wire increment_reg_i_34_n_0;
  wire increment_reg_i_35_n_0;
  wire increment_reg_i_36_n_0;
  wire increment_reg_i_37_n_0;
  wire increment_reg_i_38_n_0;
  wire increment_reg_i_39_n_0;
  wire increment_reg_i_40_n_0;
  wire increment_reg_i_41_n_0;
  wire increment_reg_i_42_n_0;
  wire increment_reg_i_43_n_0;
  wire increment_reg_i_44_n_0;
  wire increment_reg_i_45_n_0;
  wire increment_reg_i_46_n_0;
  wire increment_reg_i_47_n_0;
  wire increment_reg_i_48_n_0;
  wire increment_reg_i_49_n_0;
  wire increment_reg_i_50_n_0;
  wire increment_reg_i_51_n_0;
  wire increment_reg_i_6_n_0;
  wire increment_reg_i_7_n_0;
  wire increment_reg_i_8_n_0;
  wire increment_reg_i_9_n_0;
  wire increment_reg_reg_i_13_n_0;
  wire increment_reg_reg_i_17_n_0;
  wire increment_reg_reg_i_26_n_0;
  wire increment_reg_reg_i_31_n_0;
  wire increment_reg_reg_i_5_n_0;
  wire [7:4]last_count0;
  wire \last_count[7]_i_1_n_0 ;
  wire \last_count_reg_n_0_[2] ;
  wire \last_count_reg_n_0_[3] ;
  wire \last_count_reg_n_0_[4] ;
  wire \last_count_reg_n_0_[5] ;
  wire \last_count_reg_n_0_[6] ;
  wire \last_count_reg_n_0_[7] ;
  wire [0:0]magnitude_reg;
  wire \magnitude_reg[11]_i_2_n_0 ;
  wire \magnitude_reg[11]_i_3_n_0 ;
  wire \magnitude_reg[11]_i_4_n_0 ;
  wire \magnitude_reg[11]_i_5_n_0 ;
  wire \magnitude_reg[15]_i_2_n_0 ;
  wire \magnitude_reg[15]_i_3_n_0 ;
  wire \magnitude_reg[15]_i_4_n_0 ;
  wire \magnitude_reg[15]_i_5_n_0 ;
  wire \magnitude_reg[19]_i_2_n_0 ;
  wire \magnitude_reg[19]_i_3_n_0 ;
  wire \magnitude_reg[19]_i_4_n_0 ;
  wire \magnitude_reg[19]_i_5_n_0 ;
  wire \magnitude_reg[19]_i_7_n_0 ;
  wire \magnitude_reg[19]_i_8_n_0 ;
  wire \magnitude_reg[19]_i_9_n_0 ;
  wire \magnitude_reg[23]_i_10_n_0 ;
  wire \magnitude_reg[23]_i_2_n_0 ;
  wire \magnitude_reg[23]_i_3_n_0 ;
  wire \magnitude_reg[23]_i_4_n_0 ;
  wire \magnitude_reg[23]_i_5_n_0 ;
  wire \magnitude_reg[23]_i_7_n_0 ;
  wire \magnitude_reg[23]_i_8_n_0 ;
  wire \magnitude_reg[23]_i_9_n_0 ;
  wire \magnitude_reg[27]_i_10_n_0 ;
  wire \magnitude_reg[27]_i_2_n_0 ;
  wire \magnitude_reg[27]_i_3_n_0 ;
  wire \magnitude_reg[27]_i_4_n_0 ;
  wire \magnitude_reg[27]_i_5_n_0 ;
  wire \magnitude_reg[27]_i_7_n_0 ;
  wire \magnitude_reg[27]_i_8_n_0 ;
  wire \magnitude_reg[27]_i_9_n_0 ;
  wire \magnitude_reg[31]_i_10_n_0 ;
  wire \magnitude_reg[31]_i_2_n_0 ;
  wire \magnitude_reg[31]_i_3_n_0 ;
  wire \magnitude_reg[31]_i_4_n_0 ;
  wire \magnitude_reg[31]_i_5_n_0 ;
  wire \magnitude_reg[31]_i_7_n_0 ;
  wire \magnitude_reg[31]_i_8_n_0 ;
  wire \magnitude_reg[31]_i_9_n_0 ;
  wire \magnitude_reg[35]_i_10_n_0 ;
  wire \magnitude_reg[35]_i_2_n_0 ;
  wire \magnitude_reg[35]_i_3_n_0 ;
  wire \magnitude_reg[35]_i_4_n_0 ;
  wire \magnitude_reg[35]_i_5_n_0 ;
  wire \magnitude_reg[35]_i_7_n_0 ;
  wire \magnitude_reg[35]_i_8_n_0 ;
  wire \magnitude_reg[35]_i_9_n_0 ;
  wire \magnitude_reg[39]_i_10_n_0 ;
  wire \magnitude_reg[39]_i_2_n_0 ;
  wire \magnitude_reg[39]_i_3_n_0 ;
  wire \magnitude_reg[39]_i_4_n_0 ;
  wire \magnitude_reg[39]_i_5_n_0 ;
  wire \magnitude_reg[39]_i_7_n_0 ;
  wire \magnitude_reg[39]_i_8_n_0 ;
  wire \magnitude_reg[39]_i_9_n_0 ;
  wire \magnitude_reg[3]_i_2_n_0 ;
  wire \magnitude_reg[3]_i_3_n_0 ;
  wire \magnitude_reg[3]_i_4_n_0 ;
  wire \magnitude_reg[43]_i_10_n_0 ;
  wire \magnitude_reg[43]_i_2_n_0 ;
  wire \magnitude_reg[43]_i_3_n_0 ;
  wire \magnitude_reg[43]_i_4_n_0 ;
  wire \magnitude_reg[43]_i_5_n_0 ;
  wire \magnitude_reg[43]_i_7_n_0 ;
  wire \magnitude_reg[43]_i_8_n_0 ;
  wire \magnitude_reg[43]_i_9_n_0 ;
  wire \magnitude_reg[47]_i_10_n_0 ;
  wire \magnitude_reg[47]_i_2_n_0 ;
  wire \magnitude_reg[47]_i_3_n_0 ;
  wire \magnitude_reg[47]_i_4_n_0 ;
  wire \magnitude_reg[47]_i_5_n_0 ;
  wire \magnitude_reg[47]_i_7_n_0 ;
  wire \magnitude_reg[47]_i_8_n_0 ;
  wire \magnitude_reg[47]_i_9_n_0 ;
  wire \magnitude_reg[51]_i_10_n_0 ;
  wire \magnitude_reg[51]_i_2_n_0 ;
  wire \magnitude_reg[51]_i_3_n_0 ;
  wire \magnitude_reg[51]_i_4_n_0 ;
  wire \magnitude_reg[51]_i_5_n_0 ;
  wire \magnitude_reg[51]_i_7_n_0 ;
  wire \magnitude_reg[51]_i_8_n_0 ;
  wire \magnitude_reg[51]_i_9_n_0 ;
  wire \magnitude_reg[55]_i_10_n_0 ;
  wire \magnitude_reg[55]_i_2_n_0 ;
  wire \magnitude_reg[55]_i_3_n_0 ;
  wire \magnitude_reg[55]_i_4_n_0 ;
  wire \magnitude_reg[55]_i_5_n_0 ;
  wire \magnitude_reg[55]_i_7_n_0 ;
  wire \magnitude_reg[55]_i_8_n_0 ;
  wire \magnitude_reg[55]_i_9_n_0 ;
  wire \magnitude_reg[59]_i_2_n_0 ;
  wire \magnitude_reg[59]_i_3_n_0 ;
  wire \magnitude_reg[59]_i_4_n_0 ;
  wire \magnitude_reg[59]_i_5_n_0 ;
  wire \magnitude_reg[63]_i_3_n_0 ;
  wire \magnitude_reg[63]_i_4_n_0 ;
  wire \magnitude_reg[63]_i_5_n_0 ;
  wire \magnitude_reg[7]_i_2_n_0 ;
  wire \magnitude_reg[7]_i_3_n_0 ;
  wire \magnitude_reg[7]_i_4_n_0 ;
  wire \magnitude_reg[7]_i_5_n_0 ;
  wire \magnitude_reg_reg[11]_i_1_n_0 ;
  wire \magnitude_reg_reg[15]_i_1_n_0 ;
  wire \magnitude_reg_reg[19]_i_1_n_0 ;
  wire \magnitude_reg_reg[19]_i_6_n_0 ;
  wire \magnitude_reg_reg[19]_i_6_n_4 ;
  wire \magnitude_reg_reg[19]_i_6_n_5 ;
  wire \magnitude_reg_reg[19]_i_6_n_6 ;
  wire \magnitude_reg_reg[19]_i_6_n_7 ;
  wire \magnitude_reg_reg[23]_i_1_n_0 ;
  wire \magnitude_reg_reg[23]_i_6_n_0 ;
  wire \magnitude_reg_reg[23]_i_6_n_4 ;
  wire \magnitude_reg_reg[23]_i_6_n_5 ;
  wire \magnitude_reg_reg[23]_i_6_n_6 ;
  wire \magnitude_reg_reg[23]_i_6_n_7 ;
  wire \magnitude_reg_reg[27]_i_1_n_0 ;
  wire \magnitude_reg_reg[27]_i_6_n_0 ;
  wire \magnitude_reg_reg[27]_i_6_n_4 ;
  wire \magnitude_reg_reg[27]_i_6_n_5 ;
  wire \magnitude_reg_reg[27]_i_6_n_6 ;
  wire \magnitude_reg_reg[27]_i_6_n_7 ;
  wire \magnitude_reg_reg[31]_i_1_n_0 ;
  wire \magnitude_reg_reg[31]_i_6_n_0 ;
  wire \magnitude_reg_reg[31]_i_6_n_4 ;
  wire \magnitude_reg_reg[31]_i_6_n_5 ;
  wire \magnitude_reg_reg[31]_i_6_n_6 ;
  wire \magnitude_reg_reg[31]_i_6_n_7 ;
  wire \magnitude_reg_reg[35]_i_1_n_0 ;
  wire \magnitude_reg_reg[35]_i_6_n_0 ;
  wire \magnitude_reg_reg[35]_i_6_n_4 ;
  wire \magnitude_reg_reg[35]_i_6_n_5 ;
  wire \magnitude_reg_reg[35]_i_6_n_6 ;
  wire \magnitude_reg_reg[35]_i_6_n_7 ;
  wire \magnitude_reg_reg[39]_i_1_n_0 ;
  wire \magnitude_reg_reg[39]_i_6_n_0 ;
  wire \magnitude_reg_reg[39]_i_6_n_4 ;
  wire \magnitude_reg_reg[39]_i_6_n_5 ;
  wire \magnitude_reg_reg[39]_i_6_n_6 ;
  wire \magnitude_reg_reg[39]_i_6_n_7 ;
  wire \magnitude_reg_reg[3]_i_1_n_0 ;
  wire \magnitude_reg_reg[43]_i_1_n_0 ;
  wire \magnitude_reg_reg[43]_i_6_n_0 ;
  wire \magnitude_reg_reg[43]_i_6_n_4 ;
  wire \magnitude_reg_reg[43]_i_6_n_5 ;
  wire \magnitude_reg_reg[43]_i_6_n_6 ;
  wire \magnitude_reg_reg[43]_i_6_n_7 ;
  wire \magnitude_reg_reg[47]_i_1_n_0 ;
  wire \magnitude_reg_reg[47]_i_6_n_0 ;
  wire \magnitude_reg_reg[47]_i_6_n_4 ;
  wire \magnitude_reg_reg[47]_i_6_n_5 ;
  wire \magnitude_reg_reg[47]_i_6_n_6 ;
  wire \magnitude_reg_reg[47]_i_6_n_7 ;
  wire \magnitude_reg_reg[51]_i_1_n_0 ;
  wire \magnitude_reg_reg[51]_i_6_n_0 ;
  wire \magnitude_reg_reg[51]_i_6_n_4 ;
  wire \magnitude_reg_reg[51]_i_6_n_5 ;
  wire \magnitude_reg_reg[51]_i_6_n_6 ;
  wire \magnitude_reg_reg[51]_i_6_n_7 ;
  wire \magnitude_reg_reg[55]_i_1_n_0 ;
  wire \magnitude_reg_reg[55]_i_6_n_0 ;
  wire \magnitude_reg_reg[55]_i_6_n_4 ;
  wire \magnitude_reg_reg[55]_i_6_n_5 ;
  wire \magnitude_reg_reg[55]_i_6_n_6 ;
  wire \magnitude_reg_reg[55]_i_6_n_7 ;
  wire \magnitude_reg_reg[59]_i_1_n_0 ;
  wire \magnitude_reg_reg[7]_i_1_n_0 ;
  wire \magnitude_reg_reg_n_0_[0] ;
  wire \magnitude_reg_reg_n_0_[10] ;
  wire \magnitude_reg_reg_n_0_[11] ;
  wire \magnitude_reg_reg_n_0_[12] ;
  wire \magnitude_reg_reg_n_0_[13] ;
  wire \magnitude_reg_reg_n_0_[14] ;
  wire \magnitude_reg_reg_n_0_[15] ;
  wire \magnitude_reg_reg_n_0_[16] ;
  wire \magnitude_reg_reg_n_0_[17] ;
  wire \magnitude_reg_reg_n_0_[18] ;
  wire \magnitude_reg_reg_n_0_[19] ;
  wire \magnitude_reg_reg_n_0_[1] ;
  wire \magnitude_reg_reg_n_0_[20] ;
  wire \magnitude_reg_reg_n_0_[21] ;
  wire \magnitude_reg_reg_n_0_[22] ;
  wire \magnitude_reg_reg_n_0_[23] ;
  wire \magnitude_reg_reg_n_0_[24] ;
  wire \magnitude_reg_reg_n_0_[25] ;
  wire \magnitude_reg_reg_n_0_[26] ;
  wire \magnitude_reg_reg_n_0_[27] ;
  wire \magnitude_reg_reg_n_0_[28] ;
  wire \magnitude_reg_reg_n_0_[29] ;
  wire \magnitude_reg_reg_n_0_[2] ;
  wire \magnitude_reg_reg_n_0_[30] ;
  wire \magnitude_reg_reg_n_0_[31] ;
  wire \magnitude_reg_reg_n_0_[32] ;
  wire \magnitude_reg_reg_n_0_[33] ;
  wire \magnitude_reg_reg_n_0_[34] ;
  wire \magnitude_reg_reg_n_0_[35] ;
  wire \magnitude_reg_reg_n_0_[36] ;
  wire \magnitude_reg_reg_n_0_[37] ;
  wire \magnitude_reg_reg_n_0_[38] ;
  wire \magnitude_reg_reg_n_0_[39] ;
  wire \magnitude_reg_reg_n_0_[3] ;
  wire \magnitude_reg_reg_n_0_[40] ;
  wire \magnitude_reg_reg_n_0_[41] ;
  wire \magnitude_reg_reg_n_0_[42] ;
  wire \magnitude_reg_reg_n_0_[43] ;
  wire \magnitude_reg_reg_n_0_[44] ;
  wire \magnitude_reg_reg_n_0_[45] ;
  wire \magnitude_reg_reg_n_0_[46] ;
  wire \magnitude_reg_reg_n_0_[47] ;
  wire \magnitude_reg_reg_n_0_[48] ;
  wire \magnitude_reg_reg_n_0_[49] ;
  wire \magnitude_reg_reg_n_0_[4] ;
  wire \magnitude_reg_reg_n_0_[50] ;
  wire \magnitude_reg_reg_n_0_[51] ;
  wire \magnitude_reg_reg_n_0_[52] ;
  wire \magnitude_reg_reg_n_0_[53] ;
  wire \magnitude_reg_reg_n_0_[54] ;
  wire \magnitude_reg_reg_n_0_[55] ;
  wire \magnitude_reg_reg_n_0_[56] ;
  wire \magnitude_reg_reg_n_0_[57] ;
  wire \magnitude_reg_reg_n_0_[58] ;
  wire \magnitude_reg_reg_n_0_[59] ;
  wire \magnitude_reg_reg_n_0_[5] ;
  wire \magnitude_reg_reg_n_0_[60] ;
  wire \magnitude_reg_reg_n_0_[61] ;
  wire \magnitude_reg_reg_n_0_[62] ;
  wire \magnitude_reg_reg_n_0_[63] ;
  wire \magnitude_reg_reg_n_0_[6] ;
  wire \magnitude_reg_reg_n_0_[7] ;
  wire \magnitude_reg_reg_n_0_[8] ;
  wire \magnitude_reg_reg_n_0_[9] ;
  wire [31:0]multiplier_in;
  wire overflow;
  wire overflow_i_12_n_0;
  wire overflow_i_13_n_0;
  wire overflow_i_14_n_0;
  wire overflow_i_15_n_0;
  wire overflow_i_16_n_0;
  wire overflow_i_18_n_0;
  wire overflow_i_19_n_0;
  wire overflow_i_1_n_0;
  wire overflow_i_20_n_0;
  wire overflow_i_21_n_0;
  wire overflow_i_22_n_0;
  wire overflow_i_23_n_0;
  wire overflow_i_24_n_0;
  wire overflow_i_25_n_0;
  wire overflow_i_27_n_0;
  wire overflow_i_28_n_0;
  wire overflow_i_2_n_0;
  wire overflow_i_30_n_0;
  wire overflow_i_31_n_0;
  wire overflow_i_32_n_0;
  wire overflow_i_33_n_0;
  wire overflow_i_34_n_0;
  wire overflow_i_35_n_0;
  wire overflow_i_36_n_0;
  wire overflow_i_37_n_0;
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
  wire overflow_i_79_n_0;
  wire overflow_i_7_n_0;
  wire overflow_i_80_n_0;
  wire overflow_i_81_n_0;
  wire overflow_i_82_n_0;
  wire overflow_i_83_n_0;
  wire overflow_i_84_n_0;
  wire overflow_i_85_n_0;
  wire overflow_i_86_n_0;
  wire overflow_i_87_n_0;
  wire overflow_i_88_n_0;
  wire overflow_i_8_n_0;
  wire overflow_i_9_n_0;
  wire overflow_reg_i_10_n_0;
  wire overflow_reg_i_11_n_6;
  wire overflow_reg_i_11_n_7;
  wire overflow_reg_i_17_n_0;
  wire overflow_reg_i_26_n_0;
  wire overflow_reg_i_26_n_4;
  wire overflow_reg_i_26_n_5;
  wire overflow_reg_i_26_n_6;
  wire overflow_reg_i_26_n_7;
  wire overflow_reg_i_29_n_1;
  wire overflow_reg_i_29_n_6;
  wire overflow_reg_i_29_n_7;
  wire overflow_reg_i_38_n_1;
  wire overflow_reg_i_38_n_6;
  wire overflow_reg_i_38_n_7;
  wire overflow_reg_i_39_n_0;
  wire overflow_reg_i_39_n_4;
  wire overflow_reg_i_39_n_5;
  wire overflow_reg_i_39_n_6;
  wire overflow_reg_i_39_n_7;
  wire overflow_reg_i_3_n_4;
  wire overflow_reg_i_40_n_0;
  wire overflow_reg_i_40_n_4;
  wire overflow_reg_i_40_n_5;
  wire overflow_reg_i_40_n_6;
  wire overflow_reg_i_40_n_7;
  wire overflow_reg_i_41_n_0;
  wire overflow_reg_i_41_n_4;
  wire overflow_reg_i_41_n_5;
  wire overflow_reg_i_41_n_6;
  wire overflow_reg_i_41_n_7;
  wire [63:1]p_0_in;
  wire [63:0]p_0_in__0;
  wire p_1_in;
  wire p_2_out0;
  wire [15:15]product16;
  wire [14:0]product32;
  wire product_negative_reg;
  wire product_negative_reg_i_10_n_0;
  wire product_negative_reg_i_3_n_0;
  wire product_negative_reg_i_4_n_0;
  wire product_negative_reg_i_5_n_0;
  wire product_negative_reg_i_6_n_0;
  wire product_negative_reg_i_7_n_0;
  wire product_negative_reg_i_8_n_0;
  wire product_negative_reg_i_9_n_0;
  wire product_negative_reg_reg_i_1_n_5;
  wire product_negative_reg_reg_i_1_n_6;
  wire product_negative_reg_reg_i_1_n_7;
  wire product_negative_reg_reg_i_2_n_0;
  wire product_negative_reg_reg_i_2_n_4;
  wire product_negative_reg_reg_i_2_n_5;
  wire product_negative_reg_reg_i_2_n_6;
  wire product_negative_reg_reg_i_2_n_7;
  wire \product_reg[16]_i_1_n_0 ;
  wire \product_reg_reg[0]__0_n_0 ;
  wire \product_reg_reg[10]__0_n_0 ;
  wire \product_reg_reg[11]__0_n_0 ;
  wire \product_reg_reg[12]__0_n_0 ;
  wire \product_reg_reg[13]__0_n_0 ;
  wire \product_reg_reg[14]__0_n_0 ;
  wire \product_reg_reg[15]__0_n_0 ;
  wire \product_reg_reg[16]__0_n_0 ;
  wire \product_reg_reg[1]__0_n_0 ;
  wire \product_reg_reg[2]__0_n_0 ;
  wire \product_reg_reg[3]__0_n_0 ;
  wire \product_reg_reg[4]__0_n_0 ;
  wire \product_reg_reg[5]__0_n_0 ;
  wire \product_reg_reg[6]__0_n_0 ;
  wire \product_reg_reg[7]__0_n_0 ;
  wire \product_reg_reg[8]__0_n_0 ;
  wire \product_reg_reg[9]__0_n_0 ;
  wire product_reg_reg__0_n_100;
  wire product_reg_reg__0_n_101;
  wire product_reg_reg__0_n_102;
  wire product_reg_reg__0_n_103;
  wire product_reg_reg__0_n_104;
  wire product_reg_reg__0_n_105;
  wire product_reg_reg__0_n_59;
  wire product_reg_reg__0_n_60;
  wire product_reg_reg__0_n_61;
  wire product_reg_reg__0_n_62;
  wire product_reg_reg__0_n_63;
  wire product_reg_reg__0_n_64;
  wire product_reg_reg__0_n_65;
  wire product_reg_reg__0_n_66;
  wire product_reg_reg__0_n_67;
  wire product_reg_reg__0_n_68;
  wire product_reg_reg__0_n_69;
  wire product_reg_reg__0_n_70;
  wire product_reg_reg__0_n_71;
  wire product_reg_reg__0_n_72;
  wire product_reg_reg__0_n_73;
  wire product_reg_reg__0_n_74;
  wire product_reg_reg__0_n_75;
  wire product_reg_reg__0_n_76;
  wire product_reg_reg__0_n_77;
  wire product_reg_reg__0_n_78;
  wire product_reg_reg__0_n_79;
  wire product_reg_reg__0_n_80;
  wire product_reg_reg__0_n_81;
  wire product_reg_reg__0_n_82;
  wire product_reg_reg__0_n_83;
  wire product_reg_reg__0_n_84;
  wire product_reg_reg__0_n_85;
  wire product_reg_reg__0_n_86;
  wire product_reg_reg__0_n_87;
  wire product_reg_reg__0_n_88;
  wire product_reg_reg__0_n_89;
  wire product_reg_reg__0_n_90;
  wire product_reg_reg__0_n_91;
  wire product_reg_reg__0_n_92;
  wire product_reg_reg__0_n_93;
  wire product_reg_reg__0_n_94;
  wire product_reg_reg__0_n_95;
  wire product_reg_reg__0_n_96;
  wire product_reg_reg__0_n_97;
  wire product_reg_reg__0_n_98;
  wire product_reg_reg__0_n_99;
  wire \product_reg_reg_n_0_[0] ;
  wire \product_reg_reg_n_0_[10] ;
  wire \product_reg_reg_n_0_[11] ;
  wire \product_reg_reg_n_0_[12] ;
  wire \product_reg_reg_n_0_[13] ;
  wire \product_reg_reg_n_0_[14] ;
  wire \product_reg_reg_n_0_[15] ;
  wire \product_reg_reg_n_0_[16] ;
  wire \product_reg_reg_n_0_[1] ;
  wire \product_reg_reg_n_0_[2] ;
  wire \product_reg_reg_n_0_[3] ;
  wire \product_reg_reg_n_0_[4] ;
  wire \product_reg_reg_n_0_[5] ;
  wire \product_reg_reg_n_0_[6] ;
  wire \product_reg_reg_n_0_[7] ;
  wire \product_reg_reg_n_0_[8] ;
  wire \product_reg_reg_n_0_[9] ;
  wire product_reg_reg_n_100;
  wire product_reg_reg_n_101;
  wire product_reg_reg_n_102;
  wire product_reg_reg_n_103;
  wire product_reg_reg_n_104;
  wire product_reg_reg_n_105;
  wire product_reg_reg_n_76;
  wire product_reg_reg_n_77;
  wire product_reg_reg_n_78;
  wire product_reg_reg_n_79;
  wire product_reg_reg_n_80;
  wire product_reg_reg_n_81;
  wire product_reg_reg_n_82;
  wire product_reg_reg_n_83;
  wire product_reg_reg_n_84;
  wire product_reg_reg_n_85;
  wire product_reg_reg_n_86;
  wire product_reg_reg_n_87;
  wire product_reg_reg_n_88;
  wire product_reg_reg_n_89;
  wire product_reg_reg_n_90;
  wire product_reg_reg_n_91;
  wire product_reg_reg_n_92;
  wire product_reg_reg_n_93;
  wire product_reg_reg_n_94;
  wire product_reg_reg_n_95;
  wire product_reg_reg_n_96;
  wire product_reg_reg_n_97;
  wire product_reg_reg_n_98;
  wire product_reg_reg_n_99;
  wire [0:0]quotient_reg;
  wire \quotient_reg[0]_i_1_n_0 ;
  wire \quotient_reg_reg_n_0_[0] ;
  wire \quotient_reg_reg_n_0_[10] ;
  wire \quotient_reg_reg_n_0_[11] ;
  wire \quotient_reg_reg_n_0_[12] ;
  wire \quotient_reg_reg_n_0_[13] ;
  wire \quotient_reg_reg_n_0_[14] ;
  wire \quotient_reg_reg_n_0_[15] ;
  wire \quotient_reg_reg_n_0_[16] ;
  wire \quotient_reg_reg_n_0_[17] ;
  wire \quotient_reg_reg_n_0_[18] ;
  wire \quotient_reg_reg_n_0_[19] ;
  wire \quotient_reg_reg_n_0_[1] ;
  wire \quotient_reg_reg_n_0_[20] ;
  wire \quotient_reg_reg_n_0_[21] ;
  wire \quotient_reg_reg_n_0_[22] ;
  wire \quotient_reg_reg_n_0_[23] ;
  wire \quotient_reg_reg_n_0_[24] ;
  wire \quotient_reg_reg_n_0_[25] ;
  wire \quotient_reg_reg_n_0_[26] ;
  wire \quotient_reg_reg_n_0_[27] ;
  wire \quotient_reg_reg_n_0_[28] ;
  wire \quotient_reg_reg_n_0_[29] ;
  wire \quotient_reg_reg_n_0_[2] ;
  wire \quotient_reg_reg_n_0_[30] ;
  wire \quotient_reg_reg_n_0_[31] ;
  wire \quotient_reg_reg_n_0_[32] ;
  wire \quotient_reg_reg_n_0_[33] ;
  wire \quotient_reg_reg_n_0_[34] ;
  wire \quotient_reg_reg_n_0_[35] ;
  wire \quotient_reg_reg_n_0_[36] ;
  wire \quotient_reg_reg_n_0_[37] ;
  wire \quotient_reg_reg_n_0_[38] ;
  wire \quotient_reg_reg_n_0_[39] ;
  wire \quotient_reg_reg_n_0_[3] ;
  wire \quotient_reg_reg_n_0_[40] ;
  wire \quotient_reg_reg_n_0_[41] ;
  wire \quotient_reg_reg_n_0_[42] ;
  wire \quotient_reg_reg_n_0_[43] ;
  wire \quotient_reg_reg_n_0_[44] ;
  wire \quotient_reg_reg_n_0_[45] ;
  wire \quotient_reg_reg_n_0_[46] ;
  wire \quotient_reg_reg_n_0_[47] ;
  wire \quotient_reg_reg_n_0_[48] ;
  wire \quotient_reg_reg_n_0_[49] ;
  wire \quotient_reg_reg_n_0_[4] ;
  wire \quotient_reg_reg_n_0_[50] ;
  wire \quotient_reg_reg_n_0_[51] ;
  wire \quotient_reg_reg_n_0_[52] ;
  wire \quotient_reg_reg_n_0_[53] ;
  wire \quotient_reg_reg_n_0_[54] ;
  wire \quotient_reg_reg_n_0_[55] ;
  wire \quotient_reg_reg_n_0_[56] ;
  wire \quotient_reg_reg_n_0_[57] ;
  wire \quotient_reg_reg_n_0_[58] ;
  wire \quotient_reg_reg_n_0_[59] ;
  wire \quotient_reg_reg_n_0_[5] ;
  wire \quotient_reg_reg_n_0_[60] ;
  wire \quotient_reg_reg_n_0_[61] ;
  wire \quotient_reg_reg_n_0_[62] ;
  wire \quotient_reg_reg_n_0_[63] ;
  wire \quotient_reg_reg_n_0_[6] ;
  wire \quotient_reg_reg_n_0_[7] ;
  wire \quotient_reg_reg_n_0_[8] ;
  wire \quotient_reg_reg_n_0_[9] ;
  wire relu_in;
  wire relu_reg_reg_n_0;
  wire [7:0]result;
  wire \result[7]_i_100_n_0 ;
  wire \result[7]_i_101_n_0 ;
  wire \result[7]_i_102_n_0 ;
  wire \result[7]_i_103_n_0 ;
  wire \result[7]_i_104_n_0 ;
  wire \result[7]_i_105_n_0 ;
  wire \result[7]_i_106_n_0 ;
  wire \result[7]_i_108_n_0 ;
  wire \result[7]_i_109_n_0 ;
  wire \result[7]_i_10_n_0 ;
  wire \result[7]_i_110_n_0 ;
  wire \result[7]_i_111_n_0 ;
  wire \result[7]_i_112_n_0 ;
  wire \result[7]_i_113_n_0 ;
  wire \result[7]_i_114_n_0 ;
  wire \result[7]_i_115_n_0 ;
  wire \result[7]_i_117_n_0 ;
  wire \result[7]_i_118_n_0 ;
  wire \result[7]_i_119_n_0 ;
  wire \result[7]_i_11_n_0 ;
  wire \result[7]_i_120_n_0 ;
  wire \result[7]_i_121_n_0 ;
  wire \result[7]_i_122_n_0 ;
  wire \result[7]_i_123_n_0 ;
  wire \result[7]_i_124_n_0 ;
  wire \result[7]_i_125_n_0 ;
  wire \result[7]_i_126_n_0 ;
  wire \result[7]_i_127_n_0 ;
  wire \result[7]_i_128_n_0 ;
  wire \result[7]_i_129_n_0 ;
  wire \result[7]_i_12_n_0 ;
  wire \result[7]_i_130_n_0 ;
  wire \result[7]_i_131_n_0 ;
  wire \result[7]_i_132_n_0 ;
  wire \result[7]_i_133_n_0 ;
  wire \result[7]_i_134_n_0 ;
  wire \result[7]_i_135_n_0 ;
  wire \result[7]_i_136_n_0 ;
  wire \result[7]_i_137_n_0 ;
  wire \result[7]_i_13_n_0 ;
  wire \result[7]_i_15_n_0 ;
  wire \result[7]_i_16_n_0 ;
  wire \result[7]_i_18_n_0 ;
  wire \result[7]_i_19_n_0 ;
  wire \result[7]_i_1_n_0 ;
  wire \result[7]_i_20_n_0 ;
  wire \result[7]_i_21_n_0 ;
  wire \result[7]_i_22_n_0 ;
  wire \result[7]_i_23_n_0 ;
  wire \result[7]_i_24_n_0 ;
  wire \result[7]_i_25_n_0 ;
  wire \result[7]_i_27_n_0 ;
  wire \result[7]_i_28_n_0 ;
  wire \result[7]_i_29_n_0 ;
  wire \result[7]_i_30_n_0 ;
  wire \result[7]_i_31_n_0 ;
  wire \result[7]_i_32_n_0 ;
  wire \result[7]_i_33_n_0 ;
  wire \result[7]_i_34_n_0 ;
  wire \result[7]_i_36_n_0 ;
  wire \result[7]_i_37_n_0 ;
  wire \result[7]_i_38_n_0 ;
  wire \result[7]_i_39_n_0 ;
  wire \result[7]_i_40_n_0 ;
  wire \result[7]_i_41_n_0 ;
  wire \result[7]_i_42_n_0 ;
  wire \result[7]_i_43_n_0 ;
  wire \result[7]_i_45_n_0 ;
  wire \result[7]_i_46_n_0 ;
  wire \result[7]_i_47_n_0 ;
  wire \result[7]_i_48_n_0 ;
  wire \result[7]_i_49_n_0 ;
  wire \result[7]_i_50_n_0 ;
  wire \result[7]_i_51_n_0 ;
  wire \result[7]_i_52_n_0 ;
  wire \result[7]_i_54_n_0 ;
  wire \result[7]_i_55_n_0 ;
  wire \result[7]_i_56_n_0 ;
  wire \result[7]_i_57_n_0 ;
  wire \result[7]_i_58_n_0 ;
  wire \result[7]_i_59_n_0 ;
  wire \result[7]_i_60_n_0 ;
  wire \result[7]_i_61_n_0 ;
  wire \result[7]_i_63_n_0 ;
  wire \result[7]_i_64_n_0 ;
  wire \result[7]_i_65_n_0 ;
  wire \result[7]_i_66_n_0 ;
  wire \result[7]_i_67_n_0 ;
  wire \result[7]_i_68_n_0 ;
  wire \result[7]_i_69_n_0 ;
  wire \result[7]_i_6_n_0 ;
  wire \result[7]_i_70_n_0 ;
  wire \result[7]_i_72_n_0 ;
  wire \result[7]_i_73_n_0 ;
  wire \result[7]_i_74_n_0 ;
  wire \result[7]_i_75_n_0 ;
  wire \result[7]_i_76_n_0 ;
  wire \result[7]_i_77_n_0 ;
  wire \result[7]_i_78_n_0 ;
  wire \result[7]_i_79_n_0 ;
  wire \result[7]_i_7_n_0 ;
  wire \result[7]_i_81_n_0 ;
  wire \result[7]_i_82_n_0 ;
  wire \result[7]_i_83_n_0 ;
  wire \result[7]_i_84_n_0 ;
  wire \result[7]_i_85_n_0 ;
  wire \result[7]_i_86_n_0 ;
  wire \result[7]_i_87_n_0 ;
  wire \result[7]_i_88_n_0 ;
  wire \result[7]_i_8_n_0 ;
  wire \result[7]_i_90_n_0 ;
  wire \result[7]_i_91_n_0 ;
  wire \result[7]_i_92_n_0 ;
  wire \result[7]_i_93_n_0 ;
  wire \result[7]_i_94_n_0 ;
  wire \result[7]_i_95_n_0 ;
  wire \result[7]_i_96_n_0 ;
  wire \result[7]_i_97_n_0 ;
  wire \result[7]_i_99_n_0 ;
  wire \result[7]_i_9_n_0 ;
  wire \result_reg[7]_i_107_n_0 ;
  wire \result_reg[7]_i_116_n_0 ;
  wire \result_reg[7]_i_14_n_0 ;
  wire \result_reg[7]_i_17_n_0 ;
  wire \result_reg[7]_i_26_n_0 ;
  wire \result_reg[7]_i_35_n_0 ;
  wire \result_reg[7]_i_44_n_0 ;
  wire \result_reg[7]_i_53_n_0 ;
  wire \result_reg[7]_i_5_n_0 ;
  wire \result_reg[7]_i_62_n_0 ;
  wire \result_reg[7]_i_71_n_0 ;
  wire \result_reg[7]_i_80_n_0 ;
  wire \result_reg[7]_i_89_n_0 ;
  wire \result_reg[7]_i_98_n_0 ;
  wire [63:0]rounded;
  wire [63:1]rounded0;
  wire [63:0]rounded_mag;
  wire [0:0]rounded_reg;
  wire \rounded_reg[12]_i_3_n_0 ;
  wire \rounded_reg[12]_i_4_n_0 ;
  wire \rounded_reg[12]_i_5_n_0 ;
  wire \rounded_reg[12]_i_6_n_0 ;
  wire \rounded_reg[16]_i_3_n_0 ;
  wire \rounded_reg[16]_i_4_n_0 ;
  wire \rounded_reg[16]_i_5_n_0 ;
  wire \rounded_reg[16]_i_6_n_0 ;
  wire \rounded_reg[20]_i_3_n_0 ;
  wire \rounded_reg[20]_i_4_n_0 ;
  wire \rounded_reg[20]_i_5_n_0 ;
  wire \rounded_reg[20]_i_6_n_0 ;
  wire \rounded_reg[24]_i_3_n_0 ;
  wire \rounded_reg[24]_i_4_n_0 ;
  wire \rounded_reg[24]_i_5_n_0 ;
  wire \rounded_reg[24]_i_6_n_0 ;
  wire \rounded_reg[28]_i_3_n_0 ;
  wire \rounded_reg[28]_i_4_n_0 ;
  wire \rounded_reg[28]_i_5_n_0 ;
  wire \rounded_reg[28]_i_6_n_0 ;
  wire \rounded_reg[32]_i_3_n_0 ;
  wire \rounded_reg[32]_i_4_n_0 ;
  wire \rounded_reg[32]_i_5_n_0 ;
  wire \rounded_reg[32]_i_6_n_0 ;
  wire \rounded_reg[36]_i_3_n_0 ;
  wire \rounded_reg[36]_i_4_n_0 ;
  wire \rounded_reg[36]_i_5_n_0 ;
  wire \rounded_reg[36]_i_6_n_0 ;
  wire \rounded_reg[3]_i_3_n_0 ;
  wire \rounded_reg[40]_i_3_n_0 ;
  wire \rounded_reg[40]_i_4_n_0 ;
  wire \rounded_reg[40]_i_5_n_0 ;
  wire \rounded_reg[40]_i_6_n_0 ;
  wire \rounded_reg[44]_i_3_n_0 ;
  wire \rounded_reg[44]_i_4_n_0 ;
  wire \rounded_reg[44]_i_5_n_0 ;
  wire \rounded_reg[44]_i_6_n_0 ;
  wire \rounded_reg[48]_i_3_n_0 ;
  wire \rounded_reg[48]_i_4_n_0 ;
  wire \rounded_reg[48]_i_5_n_0 ;
  wire \rounded_reg[48]_i_6_n_0 ;
  wire \rounded_reg[4]_i_3_n_0 ;
  wire \rounded_reg[4]_i_4_n_0 ;
  wire \rounded_reg[4]_i_5_n_0 ;
  wire \rounded_reg[4]_i_6_n_0 ;
  wire \rounded_reg[4]_i_7_n_0 ;
  wire \rounded_reg[52]_i_3_n_0 ;
  wire \rounded_reg[52]_i_4_n_0 ;
  wire \rounded_reg[52]_i_5_n_0 ;
  wire \rounded_reg[52]_i_6_n_0 ;
  wire \rounded_reg[56]_i_3_n_0 ;
  wire \rounded_reg[56]_i_4_n_0 ;
  wire \rounded_reg[56]_i_5_n_0 ;
  wire \rounded_reg[56]_i_6_n_0 ;
  wire \rounded_reg[60]_i_3_n_0 ;
  wire \rounded_reg[60]_i_4_n_0 ;
  wire \rounded_reg[60]_i_5_n_0 ;
  wire \rounded_reg[60]_i_6_n_0 ;
  wire \rounded_reg[63]_i_5_n_0 ;
  wire \rounded_reg[63]_i_6_n_0 ;
  wire \rounded_reg[63]_i_7_n_0 ;
  wire \rounded_reg[8]_i_3_n_0 ;
  wire \rounded_reg[8]_i_4_n_0 ;
  wire \rounded_reg[8]_i_5_n_0 ;
  wire \rounded_reg[8]_i_6_n_0 ;
  wire \rounded_reg_reg[11]_i_2_n_0 ;
  wire \rounded_reg_reg[12]_i_2_n_0 ;
  wire \rounded_reg_reg[15]_i_2_n_0 ;
  wire \rounded_reg_reg[16]_i_2_n_0 ;
  wire \rounded_reg_reg[19]_i_2_n_0 ;
  wire \rounded_reg_reg[20]_i_2_n_0 ;
  wire \rounded_reg_reg[23]_i_2_n_0 ;
  wire \rounded_reg_reg[24]_i_2_n_0 ;
  wire \rounded_reg_reg[27]_i_2_n_0 ;
  wire \rounded_reg_reg[28]_i_2_n_0 ;
  wire \rounded_reg_reg[31]_i_2_n_0 ;
  wire \rounded_reg_reg[32]_i_2_n_0 ;
  wire \rounded_reg_reg[35]_i_2_n_0 ;
  wire \rounded_reg_reg[36]_i_2_n_0 ;
  wire \rounded_reg_reg[39]_i_2_n_0 ;
  wire \rounded_reg_reg[3]_i_2_n_0 ;
  wire \rounded_reg_reg[40]_i_2_n_0 ;
  wire \rounded_reg_reg[43]_i_2_n_0 ;
  wire \rounded_reg_reg[44]_i_2_n_0 ;
  wire \rounded_reg_reg[47]_i_2_n_0 ;
  wire \rounded_reg_reg[48]_i_2_n_0 ;
  wire \rounded_reg_reg[4]_i_2_n_0 ;
  wire \rounded_reg_reg[51]_i_2_n_0 ;
  wire \rounded_reg_reg[52]_i_2_n_0 ;
  wire \rounded_reg_reg[55]_i_2_n_0 ;
  wire \rounded_reg_reg[56]_i_2_n_0 ;
  wire \rounded_reg_reg[59]_i_2_n_0 ;
  wire \rounded_reg_reg[60]_i_2_n_0 ;
  wire \rounded_reg_reg[7]_i_2_n_0 ;
  wire \rounded_reg_reg[8]_i_2_n_0 ;
  wire \rounded_reg_reg_n_0_[0] ;
  wire \rounded_reg_reg_n_0_[10] ;
  wire \rounded_reg_reg_n_0_[11] ;
  wire \rounded_reg_reg_n_0_[12] ;
  wire \rounded_reg_reg_n_0_[13] ;
  wire \rounded_reg_reg_n_0_[14] ;
  wire \rounded_reg_reg_n_0_[15] ;
  wire \rounded_reg_reg_n_0_[16] ;
  wire \rounded_reg_reg_n_0_[17] ;
  wire \rounded_reg_reg_n_0_[18] ;
  wire \rounded_reg_reg_n_0_[19] ;
  wire \rounded_reg_reg_n_0_[1] ;
  wire \rounded_reg_reg_n_0_[20] ;
  wire \rounded_reg_reg_n_0_[21] ;
  wire \rounded_reg_reg_n_0_[22] ;
  wire \rounded_reg_reg_n_0_[23] ;
  wire \rounded_reg_reg_n_0_[24] ;
  wire \rounded_reg_reg_n_0_[25] ;
  wire \rounded_reg_reg_n_0_[26] ;
  wire \rounded_reg_reg_n_0_[27] ;
  wire \rounded_reg_reg_n_0_[28] ;
  wire \rounded_reg_reg_n_0_[29] ;
  wire \rounded_reg_reg_n_0_[2] ;
  wire \rounded_reg_reg_n_0_[30] ;
  wire \rounded_reg_reg_n_0_[31] ;
  wire \rounded_reg_reg_n_0_[32] ;
  wire \rounded_reg_reg_n_0_[33] ;
  wire \rounded_reg_reg_n_0_[34] ;
  wire \rounded_reg_reg_n_0_[35] ;
  wire \rounded_reg_reg_n_0_[36] ;
  wire \rounded_reg_reg_n_0_[37] ;
  wire \rounded_reg_reg_n_0_[38] ;
  wire \rounded_reg_reg_n_0_[39] ;
  wire \rounded_reg_reg_n_0_[3] ;
  wire \rounded_reg_reg_n_0_[40] ;
  wire \rounded_reg_reg_n_0_[41] ;
  wire \rounded_reg_reg_n_0_[42] ;
  wire \rounded_reg_reg_n_0_[43] ;
  wire \rounded_reg_reg_n_0_[44] ;
  wire \rounded_reg_reg_n_0_[45] ;
  wire \rounded_reg_reg_n_0_[46] ;
  wire \rounded_reg_reg_n_0_[47] ;
  wire \rounded_reg_reg_n_0_[48] ;
  wire \rounded_reg_reg_n_0_[49] ;
  wire \rounded_reg_reg_n_0_[4] ;
  wire \rounded_reg_reg_n_0_[50] ;
  wire \rounded_reg_reg_n_0_[51] ;
  wire \rounded_reg_reg_n_0_[52] ;
  wire \rounded_reg_reg_n_0_[53] ;
  wire \rounded_reg_reg_n_0_[54] ;
  wire \rounded_reg_reg_n_0_[55] ;
  wire \rounded_reg_reg_n_0_[56] ;
  wire \rounded_reg_reg_n_0_[57] ;
  wire \rounded_reg_reg_n_0_[58] ;
  wire \rounded_reg_reg_n_0_[59] ;
  wire \rounded_reg_reg_n_0_[5] ;
  wire \rounded_reg_reg_n_0_[60] ;
  wire \rounded_reg_reg_n_0_[61] ;
  wire \rounded_reg_reg_n_0_[62] ;
  wire \rounded_reg_reg_n_0_[63] ;
  wire \rounded_reg_reg_n_0_[6] ;
  wire \rounded_reg_reg_n_0_[7] ;
  wire \rounded_reg_reg_n_0_[8] ;
  wire \rounded_reg_reg_n_0_[9] ;
  wire rst;
  wire [5:0]shift_in;
  wire [0:0]shift_reg;
  wire start;
  wire [2:0]state;
  wire state1;
  wire [30:0]sum;
  wire valid_in;
  wire [7:0]weight_in;
  wire wide_product__0_n_100;
  wire wide_product__0_n_101;
  wire wide_product__0_n_102;
  wire wide_product__0_n_103;
  wire wide_product__0_n_104;
  wire wide_product__0_n_105;
  wire wide_product__0_n_106;
  wire wide_product__0_n_107;
  wire wide_product__0_n_108;
  wire wide_product__0_n_109;
  wire wide_product__0_n_110;
  wire wide_product__0_n_111;
  wire wide_product__0_n_112;
  wire wide_product__0_n_113;
  wire wide_product__0_n_114;
  wire wide_product__0_n_115;
  wire wide_product__0_n_116;
  wire wide_product__0_n_117;
  wire wide_product__0_n_118;
  wire wide_product__0_n_119;
  wire wide_product__0_n_120;
  wire wide_product__0_n_121;
  wire wide_product__0_n_122;
  wire wide_product__0_n_123;
  wire wide_product__0_n_124;
  wire wide_product__0_n_125;
  wire wide_product__0_n_126;
  wire wide_product__0_n_127;
  wire wide_product__0_n_128;
  wire wide_product__0_n_129;
  wire wide_product__0_n_130;
  wire wide_product__0_n_131;
  wire wide_product__0_n_132;
  wire wide_product__0_n_133;
  wire wide_product__0_n_134;
  wire wide_product__0_n_135;
  wire wide_product__0_n_136;
  wire wide_product__0_n_137;
  wire wide_product__0_n_138;
  wire wide_product__0_n_139;
  wire wide_product__0_n_140;
  wire wide_product__0_n_141;
  wire wide_product__0_n_142;
  wire wide_product__0_n_143;
  wire wide_product__0_n_144;
  wire wide_product__0_n_145;
  wire wide_product__0_n_146;
  wire wide_product__0_n_147;
  wire wide_product__0_n_148;
  wire wide_product__0_n_149;
  wire wide_product__0_n_150;
  wire wide_product__0_n_151;
  wire wide_product__0_n_152;
  wire wide_product__0_n_153;
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
  wire [2:0]\NLW_acc_reg[11]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_acc_reg[15]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_acc_reg[19]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_acc_reg[23]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_acc_reg[27]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_acc_reg[3]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_acc_reg[3]_i_7_CO_UNCONNECTED ;
  wire [2:0]\NLW_acc_reg[3]_i_8_CO_UNCONNECTED ;
  wire [2:0]\NLW_acc_reg[7]_i_2_CO_UNCONNECTED ;
  wire [2:0]NLW_increment_reg_reg_i_13_CO_UNCONNECTED;
  wire [3:0]NLW_increment_reg_reg_i_13_O_UNCONNECTED;
  wire [2:0]NLW_increment_reg_reg_i_17_CO_UNCONNECTED;
  wire [3:0]NLW_increment_reg_reg_i_17_O_UNCONNECTED;
  wire [2:0]NLW_increment_reg_reg_i_26_CO_UNCONNECTED;
  wire [3:0]NLW_increment_reg_reg_i_26_O_UNCONNECTED;
  wire [2:0]NLW_increment_reg_reg_i_3_CO_UNCONNECTED;
  wire [3:0]NLW_increment_reg_reg_i_3_O_UNCONNECTED;
  wire [2:0]NLW_increment_reg_reg_i_31_CO_UNCONNECTED;
  wire [3:0]NLW_increment_reg_reg_i_31_O_UNCONNECTED;
  wire [3:0]NLW_increment_reg_reg_i_4_CO_UNCONNECTED;
  wire [3:0]NLW_increment_reg_reg_i_4_O_UNCONNECTED;
  wire [2:0]NLW_increment_reg_reg_i_5_CO_UNCONNECTED;
  wire [3:0]NLW_increment_reg_reg_i_5_O_UNCONNECTED;
  wire [2:0]\NLW_magnitude_reg_reg[11]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[15]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[19]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[19]_i_6_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[23]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[23]_i_6_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[27]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[27]_i_6_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[31]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[31]_i_6_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[35]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[35]_i_6_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[39]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[39]_i_6_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[3]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[43]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[43]_i_6_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[47]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[47]_i_6_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[51]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[51]_i_6_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[55]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[55]_i_6_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[59]_i_1_CO_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[63]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_magnitude_reg_reg[63]_i_2_O_UNCONNECTED ;
  wire [2:0]\NLW_magnitude_reg_reg[7]_i_1_CO_UNCONNECTED ;
  wire [2:0]NLW_overflow_reg_i_10_CO_UNCONNECTED;
  wire [3:0]NLW_overflow_reg_i_11_CO_UNCONNECTED;
  wire [3:2]NLW_overflow_reg_i_11_O_UNCONNECTED;
  wire [2:0]NLW_overflow_reg_i_17_CO_UNCONNECTED;
  wire [2:0]NLW_overflow_reg_i_26_CO_UNCONNECTED;
  wire [3:0]NLW_overflow_reg_i_29_CO_UNCONNECTED;
  wire [3:2]NLW_overflow_reg_i_29_O_UNCONNECTED;
  wire [3:0]NLW_overflow_reg_i_3_CO_UNCONNECTED;
  wire [3:0]NLW_overflow_reg_i_38_CO_UNCONNECTED;
  wire [3:2]NLW_overflow_reg_i_38_O_UNCONNECTED;
  wire [2:0]NLW_overflow_reg_i_39_CO_UNCONNECTED;
  wire [3:0]NLW_overflow_reg_i_4_CO_UNCONNECTED;
  wire [2:0]NLW_overflow_reg_i_40_CO_UNCONNECTED;
  wire [2:0]NLW_overflow_reg_i_41_CO_UNCONNECTED;
  wire [3:0]NLW_product_negative_reg_reg_i_1_CO_UNCONNECTED;
  wire [2:0]NLW_product_negative_reg_reg_i_2_CO_UNCONNECTED;
  wire NLW_product_reg_reg_CARRYCASCOUT_UNCONNECTED;
  wire NLW_product_reg_reg_MULTSIGNOUT_UNCONNECTED;
  wire NLW_product_reg_reg_OVERFLOW_UNCONNECTED;
  wire NLW_product_reg_reg_PATTERNBDETECT_UNCONNECTED;
  wire NLW_product_reg_reg_PATTERNDETECT_UNCONNECTED;
  wire NLW_product_reg_reg_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_product_reg_reg_ACOUT_UNCONNECTED;
  wire [17:0]NLW_product_reg_reg_BCOUT_UNCONNECTED;
  wire [3:0]NLW_product_reg_reg_CARRYOUT_UNCONNECTED;
  wire [47:30]NLW_product_reg_reg_P_UNCONNECTED;
  wire [47:0]NLW_product_reg_reg_PCOUT_UNCONNECTED;
  wire NLW_product_reg_reg__0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_product_reg_reg__0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_product_reg_reg__0_OVERFLOW_UNCONNECTED;
  wire NLW_product_reg_reg__0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_product_reg_reg__0_PATTERNDETECT_UNCONNECTED;
  wire NLW_product_reg_reg__0_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_product_reg_reg__0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_product_reg_reg__0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_product_reg_reg__0_CARRYOUT_UNCONNECTED;
  wire [47:47]NLW_product_reg_reg__0_P_UNCONNECTED;
  wire [47:0]NLW_product_reg_reg__0_PCOUT_UNCONNECTED;
  wire [2:0]\NLW_result_reg[7]_i_107_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[7]_i_107_O_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[7]_i_116_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[7]_i_116_O_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[7]_i_14_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[7]_i_14_O_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[7]_i_17_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[7]_i_17_O_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[7]_i_26_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[7]_i_26_O_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[7]_i_3_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[7]_i_3_O_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[7]_i_35_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[7]_i_35_O_UNCONNECTED ;
  wire [3:1]\NLW_result_reg[7]_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[7]_i_4_O_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[7]_i_44_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[7]_i_44_O_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[7]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[7]_i_5_O_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[7]_i_53_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[7]_i_53_O_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[7]_i_62_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[7]_i_62_O_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[7]_i_71_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[7]_i_71_O_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[7]_i_80_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[7]_i_80_O_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[7]_i_89_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[7]_i_89_O_UNCONNECTED ;
  wire [2:0]\NLW_result_reg[7]_i_98_CO_UNCONNECTED ;
  wire [3:0]\NLW_result_reg[7]_i_98_O_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[11]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[12]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[15]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[16]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[19]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[20]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[23]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[24]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[27]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[28]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[31]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[32]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[35]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[36]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[39]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[3]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[40]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[43]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[44]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[47]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[48]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[4]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[51]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[52]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[55]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[56]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[59]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[60]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_rounded_reg_reg[63]_i_3_CO_UNCONNECTED ;
  wire [3:3]\NLW_rounded_reg_reg[63]_i_3_O_UNCONNECTED ;
  wire [3:0]\NLW_rounded_reg_reg[63]_i_4_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[7]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_rounded_reg_reg[8]_i_2_CO_UNCONNECTED ;
  wire NLW_wide_product_CARRYCASCOUT_UNCONNECTED;
  wire NLW_wide_product_MULTSIGNOUT_UNCONNECTED;
  wire NLW_wide_product_OVERFLOW_UNCONNECTED;
  wire NLW_wide_product_PATTERNBDETECT_UNCONNECTED;
  wire NLW_wide_product_PATTERNDETECT_UNCONNECTED;
  wire NLW_wide_product_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_wide_product_ACOUT_UNCONNECTED;
  wire [17:0]NLW_wide_product_BCOUT_UNCONNECTED;
  wire [3:0]NLW_wide_product_CARRYOUT_UNCONNECTED;
  wire [47:17]NLW_wide_product_P_UNCONNECTED;
  wire NLW_wide_product__0_CARRYCASCOUT_UNCONNECTED;
  wire NLW_wide_product__0_MULTSIGNOUT_UNCONNECTED;
  wire NLW_wide_product__0_OVERFLOW_UNCONNECTED;
  wire NLW_wide_product__0_PATTERNBDETECT_UNCONNECTED;
  wire NLW_wide_product__0_PATTERNDETECT_UNCONNECTED;
  wire NLW_wide_product__0_UNDERFLOW_UNCONNECTED;
  wire [29:0]NLW_wide_product__0_ACOUT_UNCONNECTED;
  wire [17:0]NLW_wide_product__0_BCOUT_UNCONNECTED;
  wire [3:0]NLW_wide_product__0_CARRYOUT_UNCONNECTED;
  wire [47:17]NLW_wide_product__0_P_UNCONNECTED;

  LUT6 #(
    .INIT(64'h00000FFFF00B0FF0)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(\FSM_sequential_state[1]_i_2_n_0 ),
        .I1(valid_in),
        .I2(state[2]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\FSM_sequential_state[2]_i_2_n_0 ),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00FF0F00F0F40F00)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(\FSM_sequential_state[1]_i_2_n_0 ),
        .I1(valid_in),
        .I2(state[2]),
        .I3(state[1]),
        .I4(state[0]),
        .I5(\FSM_sequential_state[2]_i_2_n_0 ),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFFEFFFFFFFFEFFE)) 
    \FSM_sequential_state[1]_i_2 
       (.I0(\FSM_sequential_state[1]_i_3_n_0 ),
        .I1(\FSM_sequential_state[1]_i_4_n_0 ),
        .I2(\count_reg_n_0_[7] ),
        .I3(\last_count_reg_n_0_[7] ),
        .I4(\count_reg_n_0_[6] ),
        .I5(\last_count_reg_n_0_[6] ),
        .O(\FSM_sequential_state[1]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h7DFFFFBE)) 
    \FSM_sequential_state[1]_i_3 
       (.I0(\count_reg_n_0_[1] ),
        .I1(\count_reg_n_0_[2] ),
        .I2(\last_count_reg_n_0_[2] ),
        .I3(\last_count_reg_n_0_[3] ),
        .I4(\count_reg_n_0_[0] ),
        .O(\FSM_sequential_state[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \FSM_sequential_state[1]_i_4 
       (.I0(\last_count_reg_n_0_[3] ),
        .I1(\count_reg_n_0_[3] ),
        .I2(\count_reg_n_0_[5] ),
        .I3(\last_count_reg_n_0_[5] ),
        .I4(\count_reg_n_0_[4] ),
        .I5(\last_count_reg_n_0_[4] ),
        .O(\FSM_sequential_state[1]_i_4_n_0 ));
  LUT4 #(
    .INIT(16'h62E2)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(state[2]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(\FSM_sequential_state[2]_i_2_n_0 ),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000000057FE0000)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(feature_count_in[5]),
        .I1(feature_count_in[4]),
        .I2(feature_count_in[3]),
        .I3(feature_count_in[7]),
        .I4(start),
        .I5(state[0]),
        .O(\FSM_sequential_state[2]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_ACC:001,ST_MUL:010,ST_MAG:011,ST_SHIFT:100,ST_RND:101,ST_OUT:110," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state[0]),
        .R(rst));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_ACC:001,ST_MUL:010,ST_MAG:011,ST_SHIFT:100,ST_RND:101,ST_OUT:110," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(rst));
  (* FSM_ENCODED_STATES = "ST_IDLE:000,ST_ACC:001,ST_MUL:010,ST_MAG:011,ST_SHIFT:100,ST_RND:101,ST_OUT:110," *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\FSM_sequential_state[2]_i_1_n_0 ),
        .Q(state[2]),
        .R(rst));
  LUT4 #(
    .INIT(16'h00E2)) 
    \acc[0]_i_1 
       (.I0(bias_in[0]),
        .I1(state[0]),
        .I2(sum[0]),
        .I3(state[1]),
        .O(acc[0]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[0]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[0]),
        .Q(\acc[0]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[0]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[0]),
        .Q(\acc[0]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h00E2)) 
    \acc[10]_i_1 
       (.I0(bias_in[10]),
        .I1(state[0]),
        .I2(sum[10]),
        .I3(state[1]),
        .O(acc[10]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[10]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[10]),
        .Q(\acc[10]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[10]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[10]),
        .Q(\acc[10]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h00E2)) 
    \acc[11]_i_1 
       (.I0(bias_in[11]),
        .I1(state[0]),
        .I2(sum[11]),
        .I3(state[1]),
        .O(acc[11]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[11]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[11]),
        .Q(\acc[11]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[11]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[11]),
        .Q(\acc[11]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT2 #(
    .INIT(4'h6)) 
    \acc[11]_i_3 
       (.I0(\acc_reg_n_0_[11] ),
        .I1(product32[11]),
        .O(\acc[11]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc[11]_i_4 
       (.I0(\acc_reg_n_0_[10] ),
        .I1(product32[10]),
        .O(\acc[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc[11]_i_5 
       (.I0(\acc_reg_n_0_[9] ),
        .I1(product32[9]),
        .O(\acc[11]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc[11]_i_6 
       (.I0(\acc_reg_n_0_[8] ),
        .I1(product32[8]),
        .O(\acc[11]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \acc[12]_i_1 
       (.I0(bias_in[12]),
        .I1(state[0]),
        .I2(sum[12]),
        .I3(state[1]),
        .O(acc[12]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[12]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[12]),
        .Q(\acc[12]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[12]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[12]),
        .Q(\acc[12]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[13]_i_1 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(sum[13]),
        .O(acc[13]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[13]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[13]),
        .Q(\acc[13]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[13]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[13]),
        .Q(\acc[13]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[14]_i_1 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(sum[14]),
        .O(acc[14]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[14]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[14]),
        .Q(\acc[14]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[14]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[14]),
        .Q(\acc[14]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[15]_i_1 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(sum[15]),
        .O(acc[15]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[15]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[15]),
        .Q(\acc[15]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[15]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[15]),
        .Q(\acc[15]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT2 #(
    .INIT(4'h6)) 
    \acc[15]_i_3 
       (.I0(product16),
        .I1(\acc_reg_n_0_[15] ),
        .O(\acc[15]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc[15]_i_4 
       (.I0(\acc_reg_n_0_[14] ),
        .I1(product32[14]),
        .O(\acc[15]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc[15]_i_5 
       (.I0(\acc_reg_n_0_[13] ),
        .I1(product32[13]),
        .O(\acc[15]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc[15]_i_6 
       (.I0(\acc_reg_n_0_[12] ),
        .I1(product32[12]),
        .O(\acc[15]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[16]_i_1 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(sum[16]),
        .O(acc[16]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[16]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[16]),
        .Q(\acc[16]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[16]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[16]),
        .Q(\acc[16]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[17]_i_1 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(sum[17]),
        .O(acc[17]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[17]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[17]),
        .Q(\acc[17]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[17]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[17]),
        .Q(\acc[17]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[18]_i_1 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(sum[18]),
        .O(acc[18]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[18]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[18]),
        .Q(\acc[18]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[18]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[18]),
        .Q(\acc[18]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[19]_i_1 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(sum[19]),
        .O(acc[19]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[19]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[19]),
        .Q(\acc[19]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[19]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[19]),
        .Q(\acc[19]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT1 #(
    .INIT(2'h1)) 
    \acc[19]_i_3 
       (.I0(product16),
        .O(\acc[19]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \acc[19]_i_4 
       (.I0(\acc_reg_n_0_[18] ),
        .I1(\acc_reg_n_0_[19] ),
        .O(\acc[19]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \acc[19]_i_5 
       (.I0(\acc_reg_n_0_[17] ),
        .I1(\acc_reg_n_0_[18] ),
        .O(\acc[19]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \acc[19]_i_6 
       (.I0(\acc_reg_n_0_[16] ),
        .I1(\acc_reg_n_0_[17] ),
        .O(\acc[19]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc[19]_i_7 
       (.I0(product16),
        .I1(\acc_reg_n_0_[16] ),
        .O(\acc[19]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \acc[1]_i_1 
       (.I0(bias_in[1]),
        .I1(state[0]),
        .I2(sum[1]),
        .I3(state[1]),
        .O(acc[1]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[1]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[1]),
        .Q(\acc[1]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[1]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[1]),
        .Q(\acc[1]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[20]_i_1 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(sum[20]),
        .O(acc[20]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[20]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[20]),
        .Q(\acc[20]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[20]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[20]),
        .Q(\acc[20]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[21]_i_1 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(sum[21]),
        .O(acc[21]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[21]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[21]),
        .Q(\acc[21]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[21]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[21]),
        .Q(\acc[21]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[22]_i_1 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(sum[22]),
        .O(acc[22]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[22]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[22]),
        .Q(\acc[22]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[22]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[22]),
        .Q(\acc[22]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[23]_i_1 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(sum[23]),
        .O(acc[23]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[23]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[23]),
        .Q(\acc[23]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[23]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[23]),
        .Q(\acc[23]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT2 #(
    .INIT(4'h9)) 
    \acc[23]_i_3 
       (.I0(\acc_reg_n_0_[22] ),
        .I1(\acc_reg_n_0_[23] ),
        .O(\acc[23]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \acc[23]_i_4 
       (.I0(\acc_reg_n_0_[21] ),
        .I1(\acc_reg_n_0_[22] ),
        .O(\acc[23]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \acc[23]_i_5 
       (.I0(\acc_reg_n_0_[20] ),
        .I1(\acc_reg_n_0_[21] ),
        .O(\acc[23]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \acc[23]_i_6 
       (.I0(\acc_reg_n_0_[19] ),
        .I1(\acc_reg_n_0_[20] ),
        .O(\acc[23]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[24]_i_1 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(sum[24]),
        .O(acc[24]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[24]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[24]),
        .Q(\acc[24]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[24]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[24]),
        .Q(\acc[24]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[25]_i_1 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(sum[25]),
        .O(acc[25]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[25]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[25]),
        .Q(\acc[25]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[25]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[25]),
        .Q(\acc[25]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[26]_i_1 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(sum[26]),
        .O(acc[26]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[26]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[26]),
        .Q(\acc[26]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[26]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[26]),
        .Q(\acc[26]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[27]_i_1 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(sum[27]),
        .O(acc[27]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[27]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[27]),
        .Q(\acc[27]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[27]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[27]),
        .Q(\acc[27]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT2 #(
    .INIT(4'h9)) 
    \acc[27]_i_3 
       (.I0(\acc_reg_n_0_[26] ),
        .I1(\acc_reg_n_0_[27] ),
        .O(\acc[27]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \acc[27]_i_4 
       (.I0(\acc_reg_n_0_[25] ),
        .I1(\acc_reg_n_0_[26] ),
        .O(\acc[27]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \acc[27]_i_5 
       (.I0(\acc_reg_n_0_[24] ),
        .I1(\acc_reg_n_0_[25] ),
        .O(\acc[27]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \acc[27]_i_6 
       (.I0(\acc_reg_n_0_[23] ),
        .I1(\acc_reg_n_0_[24] ),
        .O(\acc[27]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[28]_i_1 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(sum[28]),
        .O(acc[28]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[28]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[28]),
        .Q(\acc[28]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[28]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[28]),
        .Q(\acc[28]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[29]_i_1 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(sum[29]),
        .O(acc[29]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[29]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[29]),
        .Q(\acc[29]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[29]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[29]),
        .Q(\acc[29]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h00E2)) 
    \acc[2]_i_1 
       (.I0(bias_in[2]),
        .I1(state[0]),
        .I2(sum[2]),
        .I3(state[1]),
        .O(acc[2]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[2]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[2]),
        .Q(\acc[2]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[2]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[2]),
        .Q(\acc[2]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[30]_i_1 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(sum[30]),
        .O(acc[30]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[30]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[30]),
        .Q(\acc[30]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[30]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[30]),
        .Q(\acc[30]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT5 #(
    .INIT(32'h03020202)) 
    \acc[31]_i_1 
       (.I0(\FSM_sequential_state[2]_i_2_n_0 ),
        .I1(state[1]),
        .I2(state[2]),
        .I3(valid_in),
        .I4(state[0]),
        .O(\acc[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h3202)) 
    \acc[31]_i_2 
       (.I0(bias_in[31]),
        .I1(state[1]),
        .I2(state[0]),
        .I3(overflow_reg_i_3_n_4),
        .O(acc[31]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[31]_i_2_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[31]),
        .Q(\acc[31]_i_2_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[31]_i_2_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[31]),
        .Q(\acc[31]_i_2_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h00E2)) 
    \acc[3]_i_1 
       (.I0(bias_in[3]),
        .I1(state[0]),
        .I2(sum[3]),
        .I3(state[1]),
        .O(acc[3]));
  LUT4 #(
    .INIT(16'h7888)) 
    \acc[3]_i_10 
       (.I0(weight_in[1]),
        .I1(feature_in[1]),
        .I2(weight_in[2]),
        .I3(feature_in[0]),
        .O(\acc[3]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \acc[3]_i_11 
       (.I0(feature_in[0]),
        .I1(weight_in[1]),
        .O(\acc[3]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h6A953F3F6A6AC0C0)) 
    \acc[3]_i_12 
       (.I0(feature_in[2]),
        .I1(weight_in[0]),
        .I2(feature_in[3]),
        .I3(feature_in[0]),
        .I4(weight_in[1]),
        .I5(\acc[3]_i_23_n_0 ),
        .O(\acc[3]_i_12_n_0 ));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    \acc[3]_i_13 
       (.I0(feature_in[0]),
        .I1(weight_in[2]),
        .I2(feature_in[1]),
        .I3(weight_in[1]),
        .I4(feature_in[2]),
        .I5(weight_in[0]),
        .O(\acc[3]_i_13_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \acc[3]_i_14 
       (.I0(feature_in[1]),
        .I1(weight_in[0]),
        .I2(weight_in[1]),
        .I3(feature_in[0]),
        .O(\acc[3]_i_14_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \acc[3]_i_15 
       (.I0(weight_in[0]),
        .I1(feature_in[0]),
        .O(\acc[3]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    \acc[3]_i_16 
       (.I0(weight_in[3]),
        .I1(feature_in[3]),
        .I2(feature_in[2]),
        .I3(weight_in[4]),
        .I4(feature_in[1]),
        .I5(weight_in[5]),
        .O(\acc[3]_i_16_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \acc[3]_i_17 
       (.I0(weight_in[4]),
        .I1(feature_in[1]),
        .I2(weight_in[5]),
        .I3(feature_in[0]),
        .O(\acc[3]_i_17_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \acc[3]_i_18 
       (.I0(feature_in[0]),
        .I1(weight_in[4]),
        .O(\acc[3]_i_18_n_0 ));
  LUT6 #(
    .INIT(64'h6A953F3F6A6AC0C0)) 
    \acc[3]_i_19 
       (.I0(feature_in[2]),
        .I1(feature_in[3]),
        .I2(weight_in[3]),
        .I3(feature_in[0]),
        .I4(weight_in[4]),
        .I5(\acc[3]_i_24_n_0 ),
        .O(\acc[3]_i_19_n_0 ));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[3]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[3]),
        .Q(\acc[3]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[3]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[3]),
        .Q(\acc[3]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    \acc[3]_i_20 
       (.I0(feature_in[0]),
        .I1(weight_in[5]),
        .I2(feature_in[1]),
        .I3(weight_in[4]),
        .I4(weight_in[3]),
        .I5(feature_in[2]),
        .O(\acc[3]_i_20_n_0 ));
  LUT4 #(
    .INIT(16'h7888)) 
    \acc[3]_i_21 
       (.I0(weight_in[3]),
        .I1(feature_in[1]),
        .I2(weight_in[4]),
        .I3(feature_in[0]),
        .O(\acc[3]_i_21_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \acc[3]_i_22 
       (.I0(feature_in[0]),
        .I1(weight_in[3]),
        .O(\acc[3]_i_22_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \acc[3]_i_23 
       (.I0(feature_in[1]),
        .I1(weight_in[2]),
        .O(\acc[3]_i_23_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \acc[3]_i_24 
       (.I0(feature_in[1]),
        .I1(weight_in[5]),
        .O(\acc[3]_i_24_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \acc[3]_i_3 
       (.I0(\acc_reg_n_0_[3] ),
        .I1(\acc_reg[3]_i_7_n_4 ),
        .I2(\acc_reg[3]_i_8_n_7 ),
        .O(\acc[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc[3]_i_4 
       (.I0(\acc_reg_n_0_[2] ),
        .I1(product32[2]),
        .O(\acc[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc[3]_i_5 
       (.I0(\acc_reg_n_0_[1] ),
        .I1(product32[1]),
        .O(\acc[3]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc[3]_i_6 
       (.I0(\acc_reg_n_0_[0] ),
        .I1(product32[0]),
        .O(\acc[3]_i_6_n_0 ));
  LUT6 #(
    .INIT(64'h8777788878887888)) 
    \acc[3]_i_9 
       (.I0(feature_in[3]),
        .I1(weight_in[0]),
        .I2(feature_in[2]),
        .I3(weight_in[1]),
        .I4(feature_in[1]),
        .I5(weight_in[2]),
        .O(\acc[3]_i_9_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \acc[4]_i_1 
       (.I0(bias_in[4]),
        .I1(state[0]),
        .I2(sum[4]),
        .I3(state[1]),
        .O(acc[4]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[4]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[4]),
        .Q(\acc[4]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[4]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[4]),
        .Q(\acc[4]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h00E2)) 
    \acc[5]_i_1 
       (.I0(bias_in[5]),
        .I1(state[0]),
        .I2(sum[5]),
        .I3(state[1]),
        .O(acc[5]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[5]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[5]),
        .Q(\acc[5]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[5]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[5]),
        .Q(\acc[5]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h00E2)) 
    \acc[6]_i_1 
       (.I0(bias_in[6]),
        .I1(state[0]),
        .I2(sum[6]),
        .I3(state[1]),
        .O(acc[6]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[6]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[6]),
        .Q(\acc[6]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[6]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[6]),
        .Q(\acc[6]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h00E2)) 
    \acc[7]_i_1 
       (.I0(bias_in[7]),
        .I1(state[0]),
        .I2(sum[7]),
        .I3(state[1]),
        .O(acc[7]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[7]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[7]),
        .Q(\acc[7]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[7]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[7]),
        .Q(\acc[7]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT2 #(
    .INIT(4'h6)) 
    \acc[7]_i_3 
       (.I0(\acc_reg_n_0_[7] ),
        .I1(product32[7]),
        .O(\acc[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc[7]_i_4 
       (.I0(\acc_reg_n_0_[6] ),
        .I1(product32[6]),
        .O(\acc[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc[7]_i_5 
       (.I0(\acc_reg_n_0_[5] ),
        .I1(product32[5]),
        .O(\acc[7]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \acc[7]_i_6 
       (.I0(\acc_reg_n_0_[4] ),
        .I1(product32[4]),
        .O(\acc[7]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'h00E2)) 
    \acc[8]_i_1 
       (.I0(bias_in[8]),
        .I1(state[0]),
        .I2(sum[8]),
        .I3(state[1]),
        .O(acc[8]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[8]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[8]),
        .Q(\acc[8]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[8]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[8]),
        .Q(\acc[8]_i_1_psdsp_n_1 ),
        .R(rst));
  LUT4 #(
    .INIT(16'h00E2)) 
    \acc[9]_i_1 
       (.I0(bias_in[9]),
        .I1(state[0]),
        .I2(sum[9]),
        .I3(state[1]),
        .O(acc[9]));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[9]_i_1_psdsp 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[9]),
        .Q(\acc[9]_i_1_psdsp_n ),
        .R(rst));
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  FDRE #(
    .INIT(1'b0)) 
    \acc[9]_i_1_psdsp_1 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[9]),
        .Q(\acc[9]_i_1_psdsp_n_1 ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[0] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[0]),
        .Q(\acc_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[10] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[10]),
        .Q(\acc_reg_n_0_[10] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[11] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[11]),
        .Q(\acc_reg_n_0_[11] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[11]_i_2 
       (.CI(\acc_reg[7]_i_2_n_0 ),
        .CO({\acc_reg[11]_i_2_n_0 ,\NLW_acc_reg[11]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\acc_reg_n_0_[11] ,\acc_reg_n_0_[10] ,\acc_reg_n_0_[9] ,\acc_reg_n_0_[8] }),
        .O(sum[11:8]),
        .S({\acc[11]_i_3_n_0 ,\acc[11]_i_4_n_0 ,\acc[11]_i_5_n_0 ,\acc[11]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[12] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[12]),
        .Q(\acc_reg_n_0_[12] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[13] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[13]),
        .Q(\acc_reg_n_0_[13] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[14] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[14]),
        .Q(\acc_reg_n_0_[14] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[15] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[15]),
        .Q(\acc_reg_n_0_[15] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[15]_i_2 
       (.CI(\acc_reg[11]_i_2_n_0 ),
        .CO({\acc_reg[15]_i_2_n_0 ,\NLW_acc_reg[15]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({product16,\acc_reg_n_0_[14] ,\acc_reg_n_0_[13] ,\acc_reg_n_0_[12] }),
        .O(sum[15:12]),
        .S({\acc[15]_i_3_n_0 ,\acc[15]_i_4_n_0 ,\acc[15]_i_5_n_0 ,\acc[15]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[16] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[16]),
        .Q(\acc_reg_n_0_[16] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[17] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[17]),
        .Q(\acc_reg_n_0_[17] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[18] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[18]),
        .Q(\acc_reg_n_0_[18] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[19] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[19]),
        .Q(\acc_reg_n_0_[19] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[19]_i_2 
       (.CI(\acc_reg[15]_i_2_n_0 ),
        .CO({\acc_reg[19]_i_2_n_0 ,\NLW_acc_reg[19]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\acc_reg_n_0_[18] ,\acc_reg_n_0_[17] ,\acc_reg_n_0_[16] ,\acc[19]_i_3_n_0 }),
        .O(sum[19:16]),
        .S({\acc[19]_i_4_n_0 ,\acc[19]_i_5_n_0 ,\acc[19]_i_6_n_0 ,\acc[19]_i_7_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[1] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[1]),
        .Q(\acc_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[20] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[20]),
        .Q(\acc_reg_n_0_[20] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[21] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[21]),
        .Q(\acc_reg_n_0_[21] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[22] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[22]),
        .Q(\acc_reg_n_0_[22] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[23] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[23]),
        .Q(\acc_reg_n_0_[23] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[23]_i_2 
       (.CI(\acc_reg[19]_i_2_n_0 ),
        .CO({\acc_reg[23]_i_2_n_0 ,\NLW_acc_reg[23]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\acc_reg_n_0_[22] ,\acc_reg_n_0_[21] ,\acc_reg_n_0_[20] ,\acc_reg_n_0_[19] }),
        .O(sum[23:20]),
        .S({\acc[23]_i_3_n_0 ,\acc[23]_i_4_n_0 ,\acc[23]_i_5_n_0 ,\acc[23]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[24] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[24]),
        .Q(\acc_reg_n_0_[24] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[25] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[25]),
        .Q(\acc_reg_n_0_[25] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[26] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[26]),
        .Q(\acc_reg_n_0_[26] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[27] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[27]),
        .Q(\acc_reg_n_0_[27] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[27]_i_2 
       (.CI(\acc_reg[23]_i_2_n_0 ),
        .CO({\acc_reg[27]_i_2_n_0 ,\NLW_acc_reg[27]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\acc_reg_n_0_[26] ,\acc_reg_n_0_[25] ,\acc_reg_n_0_[24] ,\acc_reg_n_0_[23] }),
        .O(sum[27:24]),
        .S({\acc[27]_i_3_n_0 ,\acc[27]_i_4_n_0 ,\acc[27]_i_5_n_0 ,\acc[27]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[28] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[28]),
        .Q(\acc_reg_n_0_[28] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[29] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[29]),
        .Q(\acc_reg_n_0_[29] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[2] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[2]),
        .Q(\acc_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[30] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[30]),
        .Q(\acc_reg_n_0_[30] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[31] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[31]),
        .Q(p_1_in),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[3] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[3]),
        .Q(\acc_reg_n_0_[3] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\acc_reg[3]_i_2_n_0 ,\NLW_acc_reg[3]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\acc_reg_n_0_[3] ,\acc_reg_n_0_[2] ,\acc_reg_n_0_[1] ,\acc_reg_n_0_[0] }),
        .O(sum[3:0]),
        .S({\acc[3]_i_3_n_0 ,\acc[3]_i_4_n_0 ,\acc[3]_i_5_n_0 ,\acc[3]_i_6_n_0 }));
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 \acc_reg[3]_i_7 
       (.CI(1'b0),
        .CO({\acc_reg[3]_i_7_n_0 ,\NLW_acc_reg[3]_i_7_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\acc[3]_i_9_n_0 ,\acc[3]_i_10_n_0 ,\acc[3]_i_11_n_0 ,1'b0}),
        .O({\acc_reg[3]_i_7_n_4 ,product32[2:0]}),
        .S({\acc[3]_i_12_n_0 ,\acc[3]_i_13_n_0 ,\acc[3]_i_14_n_0 ,\acc[3]_i_15_n_0 }));
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 \acc_reg[3]_i_8 
       (.CI(1'b0),
        .CO({\acc_reg[3]_i_8_n_0 ,\NLW_acc_reg[3]_i_8_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\acc[3]_i_16_n_0 ,\acc[3]_i_17_n_0 ,\acc[3]_i_18_n_0 ,1'b0}),
        .O({\acc_reg[3]_i_8_n_4 ,\acc_reg[3]_i_8_n_5 ,\acc_reg[3]_i_8_n_6 ,\acc_reg[3]_i_8_n_7 }),
        .S({\acc[3]_i_19_n_0 ,\acc[3]_i_20_n_0 ,\acc[3]_i_21_n_0 ,\acc[3]_i_22_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[4] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[4]),
        .Q(\acc_reg_n_0_[4] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[5] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[5]),
        .Q(\acc_reg_n_0_[5] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[6] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[6]),
        .Q(\acc_reg_n_0_[6] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[7] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[7]),
        .Q(\acc_reg_n_0_[7] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \acc_reg[7]_i_2 
       (.CI(\acc_reg[3]_i_2_n_0 ),
        .CO({\acc_reg[7]_i_2_n_0 ,\NLW_acc_reg[7]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\acc_reg_n_0_[7] ,\acc_reg_n_0_[6] ,\acc_reg_n_0_[5] ,\acc_reg_n_0_[4] }),
        .O(sum[7:4]),
        .S({\acc[7]_i_3_n_0 ,\acc[7]_i_4_n_0 ,\acc[7]_i_5_n_0 ,\acc[7]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[8] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[8]),
        .Q(\acc_reg_n_0_[8] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \acc_reg[9] 
       (.C(clk),
        .CE(\acc[31]_i_1_n_0 ),
        .D(acc[9]),
        .Q(\acc_reg_n_0_[9] ),
        .R(rst));
  LUT6 #(
    .INIT(64'hA801FFFFA8010000)) 
    config_error_i_1
       (.I0(feature_count_in[7]),
        .I1(feature_count_in[3]),
        .I2(feature_count_in[4]),
        .I3(feature_count_in[5]),
        .I4(config_error_i_2_n_0),
        .I5(config_error),
        .O(config_error_i_1_n_0));
  LUT4 #(
    .INIT(16'h0010)) 
    config_error_i_2
       (.I0(state[1]),
        .I1(state[2]),
        .I2(start),
        .I3(state[0]),
        .O(config_error_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    config_error_reg
       (.C(clk),
        .CE(1'b1),
        .D(config_error_i_1_n_0),
        .Q(config_error),
        .R(rst));
  LUT2 #(
    .INIT(4'h2)) 
    \count[0]_i_1 
       (.I0(state[0]),
        .I1(\count_reg_n_0_[0] ),
        .O(count[0]));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \count[1]_i_1 
       (.I0(state[0]),
        .I1(\count_reg_n_0_[0] ),
        .I2(\count_reg_n_0_[1] ),
        .O(count[1]));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT4 #(
    .INIT(16'h2888)) 
    \count[2]_i_1 
       (.I0(state[0]),
        .I1(\count_reg_n_0_[2] ),
        .I2(\count_reg_n_0_[1] ),
        .I3(\count_reg_n_0_[0] ),
        .O(\count[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair65" *) 
  LUT5 #(
    .INIT(32'h28888888)) 
    \count[3]_i_1 
       (.I0(state[0]),
        .I1(\count_reg_n_0_[3] ),
        .I2(\count_reg_n_0_[2] ),
        .I3(\count_reg_n_0_[0] ),
        .I4(\count_reg_n_0_[1] ),
        .O(\count[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7080F000F000F000)) 
    \count[4]_i_1 
       (.I0(\count_reg_n_0_[0] ),
        .I1(\count_reg_n_0_[1] ),
        .I2(state[0]),
        .I3(\count_reg_n_0_[4] ),
        .I4(\count_reg_n_0_[3] ),
        .I5(\count_reg_n_0_[2] ),
        .O(\count[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair101" *) 
  LUT3 #(
    .INIT(8'h82)) 
    \count[5]_i_1 
       (.I0(state[0]),
        .I1(\count_reg_n_0_[5] ),
        .I2(\count[5]_i_2_n_0 ),
        .O(\count[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \count[5]_i_2 
       (.I0(\count_reg_n_0_[3] ),
        .I1(\count_reg_n_0_[1] ),
        .I2(\count_reg_n_0_[0] ),
        .I3(\count_reg_n_0_[2] ),
        .I4(\count_reg_n_0_[4] ),
        .O(\count[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT3 #(
    .INIT(8'h28)) 
    \count[6]_i_1 
       (.I0(state[0]),
        .I1(\count_reg_n_0_[6] ),
        .I2(\count[7]_i_3_n_0 ),
        .O(\count[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1111111110000000)) 
    \count[7]_i_1 
       (.I0(state[1]),
        .I1(state[2]),
        .I2(state[0]),
        .I3(valid_in),
        .I4(\FSM_sequential_state[1]_i_2_n_0 ),
        .I5(\FSM_sequential_state[2]_i_2_n_0 ),
        .O(\count[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair68" *) 
  LUT4 #(
    .INIT(16'h6A00)) 
    \count[7]_i_2 
       (.I0(\count_reg_n_0_[7] ),
        .I1(\count_reg_n_0_[6] ),
        .I2(\count[7]_i_3_n_0 ),
        .I3(state[0]),
        .O(\count[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \count[7]_i_3 
       (.I0(\count_reg_n_0_[5] ),
        .I1(\count_reg_n_0_[4] ),
        .I2(\count_reg_n_0_[2] ),
        .I3(\count_reg_n_0_[0] ),
        .I4(\count_reg_n_0_[1] ),
        .I5(\count_reg_n_0_[3] ),
        .O(\count[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(clk),
        .CE(\count[7]_i_1_n_0 ),
        .D(count[0]),
        .Q(\count_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(clk),
        .CE(\count[7]_i_1_n_0 ),
        .D(count[1]),
        .Q(\count_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(clk),
        .CE(\count[7]_i_1_n_0 ),
        .D(\count[2]_i_1_n_0 ),
        .Q(\count_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(clk),
        .CE(\count[7]_i_1_n_0 ),
        .D(\count[3]_i_1_n_0 ),
        .Q(\count_reg_n_0_[3] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(clk),
        .CE(\count[7]_i_1_n_0 ),
        .D(\count[4]_i_1_n_0 ),
        .Q(\count_reg_n_0_[4] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[5] 
       (.C(clk),
        .CE(\count[7]_i_1_n_0 ),
        .D(\count[5]_i_1_n_0 ),
        .Q(\count_reg_n_0_[5] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[6] 
       (.C(clk),
        .CE(\count[7]_i_1_n_0 ),
        .D(\count[6]_i_1_n_0 ),
        .Q(\count_reg_n_0_[6] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[7] 
       (.C(clk),
        .CE(\count[7]_i_1_n_0 ),
        .D(\count[7]_i_2_n_0 ),
        .Q(\count_reg_n_0_[7] ),
        .R(rst));
  LUT5 #(
    .INIT(32'h00980088)) 
    done_i_1
       (.I0(state[1]),
        .I1(state[2]),
        .I2(start),
        .I3(state[0]),
        .I4(state1),
        .O(done_i_1_n_0));
  LUT4 #(
    .INIT(16'hA801)) 
    done_i_2
       (.I0(feature_count_in[7]),
        .I1(feature_count_in[3]),
        .I2(feature_count_in[4]),
        .I3(feature_count_in[5]),
        .O(state1));
  FDRE #(
    .INIT(1'b0)) 
    done_reg
       (.C(clk),
        .CE(1'b1),
        .D(done_i_1_n_0),
        .Q(done),
        .R(rst));
  LUT3 #(
    .INIT(8'h02)) 
    increment_reg_i_1
       (.I0(state[2]),
        .I1(state[0]),
        .I2(state[1]),
        .O(quotient_reg));
  LUT3 #(
    .INIT(8'h1F)) 
    increment_reg_i_10
       (.I0(\magnitude_reg_reg_n_0_[29] ),
        .I1(\magnitude_reg_reg_n_0_[28] ),
        .I2(shift_reg),
        .O(increment_reg_i_10_n_0));
  LUT3 #(
    .INIT(8'h1F)) 
    increment_reg_i_11
       (.I0(\magnitude_reg_reg_n_0_[27] ),
        .I1(\magnitude_reg_reg_n_0_[26] ),
        .I2(shift_reg),
        .O(increment_reg_i_11_n_0));
  LUT3 #(
    .INIT(8'h1F)) 
    increment_reg_i_12
       (.I0(\magnitude_reg_reg_n_0_[25] ),
        .I1(\magnitude_reg_reg_n_0_[24] ),
        .I2(shift_reg),
        .O(increment_reg_i_12_n_0));
  LUT2 #(
    .INIT(4'hD)) 
    increment_reg_i_14
       (.I0(shift_reg),
        .I1(\magnitude_reg_reg_n_0_[30] ),
        .O(increment_reg_i_14_n_0));
  LUT4 #(
    .INIT(16'h01FF)) 
    increment_reg_i_15
       (.I0(\magnitude_reg_reg_n_0_[27] ),
        .I1(\magnitude_reg_reg_n_0_[28] ),
        .I2(\magnitude_reg_reg_n_0_[29] ),
        .I3(shift_reg),
        .O(increment_reg_i_15_n_0));
  LUT4 #(
    .INIT(16'h01FF)) 
    increment_reg_i_16
       (.I0(\magnitude_reg_reg_n_0_[24] ),
        .I1(\magnitude_reg_reg_n_0_[25] ),
        .I2(\magnitude_reg_reg_n_0_[26] ),
        .I3(shift_reg),
        .O(increment_reg_i_16_n_0));
  LUT3 #(
    .INIT(8'hE0)) 
    increment_reg_i_18
       (.I0(\magnitude_reg_reg_n_0_[22] ),
        .I1(\magnitude_reg_reg_n_0_[23] ),
        .I2(shift_reg),
        .O(increment_reg_i_18_n_0));
  LUT3 #(
    .INIT(8'hE0)) 
    increment_reg_i_19
       (.I0(\magnitude_reg_reg_n_0_[20] ),
        .I1(\magnitude_reg_reg_n_0_[21] ),
        .I2(shift_reg),
        .O(increment_reg_i_19_n_0));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT4 #(
    .INIT(16'hC888)) 
    increment_reg_i_2
       (.I0(increment10_in),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[31] ),
        .I3(increment2),
        .O(increment));
  LUT3 #(
    .INIT(8'hE0)) 
    increment_reg_i_20
       (.I0(\magnitude_reg_reg_n_0_[18] ),
        .I1(\magnitude_reg_reg_n_0_[19] ),
        .I2(shift_reg),
        .O(increment_reg_i_20_n_0));
  LUT3 #(
    .INIT(8'hE0)) 
    increment_reg_i_21
       (.I0(\magnitude_reg_reg_n_0_[16] ),
        .I1(\magnitude_reg_reg_n_0_[17] ),
        .I2(shift_reg),
        .O(increment_reg_i_21_n_0));
  LUT3 #(
    .INIT(8'h1F)) 
    increment_reg_i_22
       (.I0(\magnitude_reg_reg_n_0_[23] ),
        .I1(\magnitude_reg_reg_n_0_[22] ),
        .I2(shift_reg),
        .O(increment_reg_i_22_n_0));
  LUT3 #(
    .INIT(8'h1F)) 
    increment_reg_i_23
       (.I0(\magnitude_reg_reg_n_0_[21] ),
        .I1(\magnitude_reg_reg_n_0_[20] ),
        .I2(shift_reg),
        .O(increment_reg_i_23_n_0));
  LUT3 #(
    .INIT(8'h1F)) 
    increment_reg_i_24
       (.I0(\magnitude_reg_reg_n_0_[19] ),
        .I1(\magnitude_reg_reg_n_0_[18] ),
        .I2(shift_reg),
        .O(increment_reg_i_24_n_0));
  LUT3 #(
    .INIT(8'h1F)) 
    increment_reg_i_25
       (.I0(\magnitude_reg_reg_n_0_[17] ),
        .I1(\magnitude_reg_reg_n_0_[16] ),
        .I2(shift_reg),
        .O(increment_reg_i_25_n_0));
  LUT4 #(
    .INIT(16'h01FF)) 
    increment_reg_i_27
       (.I0(\magnitude_reg_reg_n_0_[21] ),
        .I1(\magnitude_reg_reg_n_0_[22] ),
        .I2(\magnitude_reg_reg_n_0_[23] ),
        .I3(shift_reg),
        .O(increment_reg_i_27_n_0));
  LUT4 #(
    .INIT(16'h01FF)) 
    increment_reg_i_28
       (.I0(\magnitude_reg_reg_n_0_[18] ),
        .I1(\magnitude_reg_reg_n_0_[19] ),
        .I2(\magnitude_reg_reg_n_0_[20] ),
        .I3(shift_reg),
        .O(increment_reg_i_28_n_0));
  LUT4 #(
    .INIT(16'h01FF)) 
    increment_reg_i_29
       (.I0(\magnitude_reg_reg_n_0_[15] ),
        .I1(\magnitude_reg_reg_n_0_[16] ),
        .I2(\magnitude_reg_reg_n_0_[17] ),
        .I3(shift_reg),
        .O(increment_reg_i_29_n_0));
  LUT4 #(
    .INIT(16'h01FF)) 
    increment_reg_i_30
       (.I0(\magnitude_reg_reg_n_0_[12] ),
        .I1(\magnitude_reg_reg_n_0_[13] ),
        .I2(\magnitude_reg_reg_n_0_[14] ),
        .I3(shift_reg),
        .O(increment_reg_i_30_n_0));
  LUT3 #(
    .INIT(8'hE0)) 
    increment_reg_i_32
       (.I0(\magnitude_reg_reg_n_0_[14] ),
        .I1(\magnitude_reg_reg_n_0_[15] ),
        .I2(shift_reg),
        .O(increment_reg_i_32_n_0));
  LUT3 #(
    .INIT(8'hE0)) 
    increment_reg_i_33
       (.I0(\magnitude_reg_reg_n_0_[12] ),
        .I1(\magnitude_reg_reg_n_0_[13] ),
        .I2(shift_reg),
        .O(increment_reg_i_33_n_0));
  LUT3 #(
    .INIT(8'hE0)) 
    increment_reg_i_34
       (.I0(\magnitude_reg_reg_n_0_[10] ),
        .I1(\magnitude_reg_reg_n_0_[11] ),
        .I2(shift_reg),
        .O(increment_reg_i_34_n_0));
  LUT3 #(
    .INIT(8'hE0)) 
    increment_reg_i_35
       (.I0(\magnitude_reg_reg_n_0_[8] ),
        .I1(\magnitude_reg_reg_n_0_[9] ),
        .I2(shift_reg),
        .O(increment_reg_i_35_n_0));
  LUT3 #(
    .INIT(8'h1F)) 
    increment_reg_i_36
       (.I0(\magnitude_reg_reg_n_0_[15] ),
        .I1(\magnitude_reg_reg_n_0_[14] ),
        .I2(shift_reg),
        .O(increment_reg_i_36_n_0));
  LUT3 #(
    .INIT(8'h1F)) 
    increment_reg_i_37
       (.I0(\magnitude_reg_reg_n_0_[13] ),
        .I1(\magnitude_reg_reg_n_0_[12] ),
        .I2(shift_reg),
        .O(increment_reg_i_37_n_0));
  LUT3 #(
    .INIT(8'h1F)) 
    increment_reg_i_38
       (.I0(\magnitude_reg_reg_n_0_[11] ),
        .I1(\magnitude_reg_reg_n_0_[10] ),
        .I2(shift_reg),
        .O(increment_reg_i_38_n_0));
  LUT3 #(
    .INIT(8'h1F)) 
    increment_reg_i_39
       (.I0(\magnitude_reg_reg_n_0_[9] ),
        .I1(\magnitude_reg_reg_n_0_[8] ),
        .I2(shift_reg),
        .O(increment_reg_i_39_n_0));
  LUT4 #(
    .INIT(16'h01FF)) 
    increment_reg_i_40
       (.I0(\magnitude_reg_reg_n_0_[9] ),
        .I1(\magnitude_reg_reg_n_0_[10] ),
        .I2(\magnitude_reg_reg_n_0_[11] ),
        .I3(shift_reg),
        .O(increment_reg_i_40_n_0));
  LUT4 #(
    .INIT(16'h01FF)) 
    increment_reg_i_41
       (.I0(\magnitude_reg_reg_n_0_[6] ),
        .I1(\magnitude_reg_reg_n_0_[7] ),
        .I2(\magnitude_reg_reg_n_0_[8] ),
        .I3(shift_reg),
        .O(increment_reg_i_41_n_0));
  LUT4 #(
    .INIT(16'h01FF)) 
    increment_reg_i_42
       (.I0(\magnitude_reg_reg_n_0_[3] ),
        .I1(\magnitude_reg_reg_n_0_[5] ),
        .I2(\magnitude_reg_reg_n_0_[4] ),
        .I3(shift_reg),
        .O(increment_reg_i_42_n_0));
  LUT4 #(
    .INIT(16'h01FF)) 
    increment_reg_i_43
       (.I0(\magnitude_reg_reg_n_0_[0] ),
        .I1(\magnitude_reg_reg_n_0_[1] ),
        .I2(\magnitude_reg_reg_n_0_[2] ),
        .I3(shift_reg),
        .O(increment_reg_i_43_n_0));
  LUT3 #(
    .INIT(8'hE0)) 
    increment_reg_i_44
       (.I0(\magnitude_reg_reg_n_0_[6] ),
        .I1(\magnitude_reg_reg_n_0_[7] ),
        .I2(shift_reg),
        .O(increment_reg_i_44_n_0));
  LUT3 #(
    .INIT(8'hE0)) 
    increment_reg_i_45
       (.I0(\magnitude_reg_reg_n_0_[5] ),
        .I1(\magnitude_reg_reg_n_0_[4] ),
        .I2(shift_reg),
        .O(increment_reg_i_45_n_0));
  LUT3 #(
    .INIT(8'hE0)) 
    increment_reg_i_46
       (.I0(\magnitude_reg_reg_n_0_[2] ),
        .I1(\magnitude_reg_reg_n_0_[3] ),
        .I2(shift_reg),
        .O(increment_reg_i_46_n_0));
  LUT3 #(
    .INIT(8'hE0)) 
    increment_reg_i_47
       (.I0(\magnitude_reg_reg_n_0_[0] ),
        .I1(\magnitude_reg_reg_n_0_[1] ),
        .I2(shift_reg),
        .O(increment_reg_i_47_n_0));
  LUT3 #(
    .INIT(8'h1F)) 
    increment_reg_i_48
       (.I0(\magnitude_reg_reg_n_0_[7] ),
        .I1(\magnitude_reg_reg_n_0_[6] ),
        .I2(shift_reg),
        .O(increment_reg_i_48_n_0));
  LUT3 #(
    .INIT(8'h1F)) 
    increment_reg_i_49
       (.I0(\magnitude_reg_reg_n_0_[4] ),
        .I1(\magnitude_reg_reg_n_0_[5] ),
        .I2(shift_reg),
        .O(increment_reg_i_49_n_0));
  LUT3 #(
    .INIT(8'h1F)) 
    increment_reg_i_50
       (.I0(\magnitude_reg_reg_n_0_[3] ),
        .I1(\magnitude_reg_reg_n_0_[2] ),
        .I2(shift_reg),
        .O(increment_reg_i_50_n_0));
  LUT3 #(
    .INIT(8'h1F)) 
    increment_reg_i_51
       (.I0(\magnitude_reg_reg_n_0_[1] ),
        .I1(\magnitude_reg_reg_n_0_[0] ),
        .I2(shift_reg),
        .O(increment_reg_i_51_n_0));
  LUT3 #(
    .INIT(8'hE0)) 
    increment_reg_i_6
       (.I0(\magnitude_reg_reg_n_0_[28] ),
        .I1(\magnitude_reg_reg_n_0_[29] ),
        .I2(shift_reg),
        .O(increment_reg_i_6_n_0));
  LUT3 #(
    .INIT(8'hE0)) 
    increment_reg_i_7
       (.I0(\magnitude_reg_reg_n_0_[26] ),
        .I1(\magnitude_reg_reg_n_0_[27] ),
        .I2(shift_reg),
        .O(increment_reg_i_7_n_0));
  LUT3 #(
    .INIT(8'hE0)) 
    increment_reg_i_8
       (.I0(\magnitude_reg_reg_n_0_[24] ),
        .I1(\magnitude_reg_reg_n_0_[25] ),
        .I2(shift_reg),
        .O(increment_reg_i_8_n_0));
  LUT2 #(
    .INIT(4'hD)) 
    increment_reg_i_9
       (.I0(shift_reg),
        .I1(\magnitude_reg_reg_n_0_[30] ),
        .O(increment_reg_i_9_n_0));
  FDRE #(
    .INIT(1'b0)) 
    increment_reg_reg
       (.C(clk),
        .CE(quotient_reg),
        .D(increment),
        .Q(increment_reg),
        .R(rst));
  CARRY4 increment_reg_reg_i_13
       (.CI(increment_reg_reg_i_26_n_0),
        .CO({increment_reg_reg_i_13_n_0,NLW_increment_reg_reg_i_13_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_increment_reg_reg_i_13_O_UNCONNECTED[3:0]),
        .S({increment_reg_i_27_n_0,increment_reg_i_28_n_0,increment_reg_i_29_n_0,increment_reg_i_30_n_0}));
  CARRY4 increment_reg_reg_i_17
       (.CI(increment_reg_reg_i_31_n_0),
        .CO({increment_reg_reg_i_17_n_0,NLW_increment_reg_reg_i_17_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({increment_reg_i_32_n_0,increment_reg_i_33_n_0,increment_reg_i_34_n_0,increment_reg_i_35_n_0}),
        .O(NLW_increment_reg_reg_i_17_O_UNCONNECTED[3:0]),
        .S({increment_reg_i_36_n_0,increment_reg_i_37_n_0,increment_reg_i_38_n_0,increment_reg_i_39_n_0}));
  CARRY4 increment_reg_reg_i_26
       (.CI(1'b0),
        .CO({increment_reg_reg_i_26_n_0,NLW_increment_reg_reg_i_26_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_increment_reg_reg_i_26_O_UNCONNECTED[3:0]),
        .S({increment_reg_i_40_n_0,increment_reg_i_41_n_0,increment_reg_i_42_n_0,increment_reg_i_43_n_0}));
  CARRY4 increment_reg_reg_i_3
       (.CI(increment_reg_reg_i_5_n_0),
        .CO({increment10_in,NLW_increment_reg_reg_i_3_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,increment_reg_i_6_n_0,increment_reg_i_7_n_0,increment_reg_i_8_n_0}),
        .O(NLW_increment_reg_reg_i_3_O_UNCONNECTED[3:0]),
        .S({increment_reg_i_9_n_0,increment_reg_i_10_n_0,increment_reg_i_11_n_0,increment_reg_i_12_n_0}));
  CARRY4 increment_reg_reg_i_31
       (.CI(1'b0),
        .CO({increment_reg_reg_i_31_n_0,NLW_increment_reg_reg_i_31_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({increment_reg_i_44_n_0,increment_reg_i_45_n_0,increment_reg_i_46_n_0,increment_reg_i_47_n_0}),
        .O(NLW_increment_reg_reg_i_31_O_UNCONNECTED[3:0]),
        .S({increment_reg_i_48_n_0,increment_reg_i_49_n_0,increment_reg_i_50_n_0,increment_reg_i_51_n_0}));
  CARRY4 increment_reg_reg_i_4
       (.CI(increment_reg_reg_i_13_n_0),
        .CO({NLW_increment_reg_reg_i_4_CO_UNCONNECTED[3],increment2,NLW_increment_reg_reg_i_4_CO_UNCONNECTED[1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_increment_reg_reg_i_4_O_UNCONNECTED[3:0]),
        .S({1'b0,increment_reg_i_14_n_0,increment_reg_i_15_n_0,increment_reg_i_16_n_0}));
  CARRY4 increment_reg_reg_i_5
       (.CI(increment_reg_reg_i_17_n_0),
        .CO({increment_reg_reg_i_5_n_0,NLW_increment_reg_reg_i_5_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({increment_reg_i_18_n_0,increment_reg_i_19_n_0,increment_reg_i_20_n_0,increment_reg_i_21_n_0}),
        .O(NLW_increment_reg_reg_i_5_O_UNCONNECTED[3:0]),
        .S({increment_reg_i_22_n_0,increment_reg_i_23_n_0,increment_reg_i_24_n_0,increment_reg_i_25_n_0}));
  LUT2 #(
    .INIT(4'h9)) 
    \last_count[4]_i_1 
       (.I0(feature_count_in[3]),
        .I1(feature_count_in[4]),
        .O(last_count0[4]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'hA9)) 
    \last_count[5]_i_1 
       (.I0(feature_count_in[5]),
        .I1(feature_count_in[3]),
        .I2(feature_count_in[4]),
        .O(last_count0[5]));
  (* SOFT_HLUTNM = "soft_lutpair100" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \last_count[6]_i_1 
       (.I0(feature_count_in[3]),
        .I1(feature_count_in[4]),
        .I2(feature_count_in[5]),
        .O(last_count0[6]));
  LUT3 #(
    .INIT(8'h02)) 
    \last_count[7]_i_1 
       (.I0(\FSM_sequential_state[2]_i_2_n_0 ),
        .I1(state[1]),
        .I2(state[2]),
        .O(\last_count[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hAAA9)) 
    \last_count[7]_i_2 
       (.I0(feature_count_in[7]),
        .I1(feature_count_in[5]),
        .I2(feature_count_in[4]),
        .I3(feature_count_in[3]),
        .O(last_count0[7]));
  FDRE #(
    .INIT(1'b0)) 
    \last_count_reg[2] 
       (.C(clk),
        .CE(\last_count[7]_i_1_n_0 ),
        .D(feature_count_in[5]),
        .Q(\last_count_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \last_count_reg[3] 
       (.C(clk),
        .CE(\last_count[7]_i_1_n_0 ),
        .D(1'b1),
        .Q(\last_count_reg_n_0_[3] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \last_count_reg[4] 
       (.C(clk),
        .CE(\last_count[7]_i_1_n_0 ),
        .D(last_count0[4]),
        .Q(\last_count_reg_n_0_[4] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \last_count_reg[5] 
       (.C(clk),
        .CE(\last_count[7]_i_1_n_0 ),
        .D(last_count0[5]),
        .Q(\last_count_reg_n_0_[5] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \last_count_reg[6] 
       (.C(clk),
        .CE(\last_count[7]_i_1_n_0 ),
        .D(last_count0[6]),
        .Q(\last_count_reg_n_0_[6] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \last_count_reg[7] 
       (.C(clk),
        .CE(\last_count[7]_i_1_n_0 ),
        .D(last_count0[7]),
        .Q(\last_count_reg_n_0_[7] ),
        .R(rst));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[11]_i_2 
       (.I0(p_2_out0),
        .I1(\product_reg_reg[11]__0_n_0 ),
        .O(\magnitude_reg[11]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[11]_i_3 
       (.I0(p_2_out0),
        .I1(\product_reg_reg[10]__0_n_0 ),
        .O(\magnitude_reg[11]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[11]_i_4 
       (.I0(p_2_out0),
        .I1(\product_reg_reg[9]__0_n_0 ),
        .O(\magnitude_reg[11]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[11]_i_5 
       (.I0(p_2_out0),
        .I1(\product_reg_reg[8]__0_n_0 ),
        .O(\magnitude_reg[11]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[15]_i_2 
       (.I0(p_2_out0),
        .I1(\product_reg_reg[15]__0_n_0 ),
        .O(\magnitude_reg[15]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[15]_i_3 
       (.I0(p_2_out0),
        .I1(\product_reg_reg[14]__0_n_0 ),
        .O(\magnitude_reg[15]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[15]_i_4 
       (.I0(p_2_out0),
        .I1(\product_reg_reg[13]__0_n_0 ),
        .O(\magnitude_reg[15]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[15]_i_5 
       (.I0(p_2_out0),
        .I1(\product_reg_reg[12]__0_n_0 ),
        .O(\magnitude_reg[15]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[19]_i_2 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[19]_i_6_n_4 ),
        .O(\magnitude_reg[19]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[19]_i_3 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[19]_i_6_n_5 ),
        .O(\magnitude_reg[19]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[19]_i_4 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[19]_i_6_n_6 ),
        .O(\magnitude_reg[19]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[19]_i_5 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[19]_i_6_n_7 ),
        .O(\magnitude_reg[19]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[19]_i_7 
       (.I0(product_reg_reg__0_n_103),
        .I1(\product_reg_reg_n_0_[2] ),
        .O(\magnitude_reg[19]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[19]_i_8 
       (.I0(product_reg_reg__0_n_104),
        .I1(\product_reg_reg_n_0_[1] ),
        .O(\magnitude_reg[19]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[19]_i_9 
       (.I0(product_reg_reg__0_n_105),
        .I1(\product_reg_reg_n_0_[0] ),
        .O(\magnitude_reg[19]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[23]_i_10 
       (.I0(product_reg_reg__0_n_102),
        .I1(\product_reg_reg_n_0_[3] ),
        .O(\magnitude_reg[23]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[23]_i_2 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[23]_i_6_n_4 ),
        .O(\magnitude_reg[23]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[23]_i_3 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[23]_i_6_n_5 ),
        .O(\magnitude_reg[23]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[23]_i_4 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[23]_i_6_n_6 ),
        .O(\magnitude_reg[23]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[23]_i_5 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[23]_i_6_n_7 ),
        .O(\magnitude_reg[23]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[23]_i_7 
       (.I0(product_reg_reg__0_n_99),
        .I1(\product_reg_reg_n_0_[6] ),
        .O(\magnitude_reg[23]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[23]_i_8 
       (.I0(product_reg_reg__0_n_100),
        .I1(\product_reg_reg_n_0_[5] ),
        .O(\magnitude_reg[23]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[23]_i_9 
       (.I0(product_reg_reg__0_n_101),
        .I1(\product_reg_reg_n_0_[4] ),
        .O(\magnitude_reg[23]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[27]_i_10 
       (.I0(product_reg_reg__0_n_98),
        .I1(\product_reg_reg_n_0_[7] ),
        .O(\magnitude_reg[27]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[27]_i_2 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[27]_i_6_n_4 ),
        .O(\magnitude_reg[27]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[27]_i_3 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[27]_i_6_n_5 ),
        .O(\magnitude_reg[27]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[27]_i_4 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[27]_i_6_n_6 ),
        .O(\magnitude_reg[27]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[27]_i_5 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[27]_i_6_n_7 ),
        .O(\magnitude_reg[27]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[27]_i_7 
       (.I0(product_reg_reg__0_n_95),
        .I1(\product_reg_reg_n_0_[10] ),
        .O(\magnitude_reg[27]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[27]_i_8 
       (.I0(product_reg_reg__0_n_96),
        .I1(\product_reg_reg_n_0_[9] ),
        .O(\magnitude_reg[27]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[27]_i_9 
       (.I0(product_reg_reg__0_n_97),
        .I1(\product_reg_reg_n_0_[8] ),
        .O(\magnitude_reg[27]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[31]_i_10 
       (.I0(product_reg_reg__0_n_94),
        .I1(\product_reg_reg_n_0_[11] ),
        .O(\magnitude_reg[31]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[31]_i_2 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[31]_i_6_n_4 ),
        .O(\magnitude_reg[31]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[31]_i_3 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[31]_i_6_n_5 ),
        .O(\magnitude_reg[31]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[31]_i_4 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[31]_i_6_n_6 ),
        .O(\magnitude_reg[31]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[31]_i_5 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[31]_i_6_n_7 ),
        .O(\magnitude_reg[31]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[31]_i_7 
       (.I0(product_reg_reg__0_n_91),
        .I1(\product_reg_reg_n_0_[14] ),
        .O(\magnitude_reg[31]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[31]_i_8 
       (.I0(product_reg_reg__0_n_92),
        .I1(\product_reg_reg_n_0_[13] ),
        .O(\magnitude_reg[31]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[31]_i_9 
       (.I0(product_reg_reg__0_n_93),
        .I1(\product_reg_reg_n_0_[12] ),
        .O(\magnitude_reg[31]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[35]_i_10 
       (.I0(product_reg_reg__0_n_90),
        .I1(\product_reg_reg_n_0_[15] ),
        .O(\magnitude_reg[35]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[35]_i_2 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[35]_i_6_n_4 ),
        .O(\magnitude_reg[35]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[35]_i_3 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[35]_i_6_n_5 ),
        .O(\magnitude_reg[35]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[35]_i_4 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[35]_i_6_n_6 ),
        .O(\magnitude_reg[35]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[35]_i_5 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[35]_i_6_n_7 ),
        .O(\magnitude_reg[35]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[35]_i_7 
       (.I0(product_reg_reg__0_n_87),
        .I1(product_reg_reg_n_104),
        .O(\magnitude_reg[35]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[35]_i_8 
       (.I0(product_reg_reg__0_n_88),
        .I1(product_reg_reg_n_105),
        .O(\magnitude_reg[35]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[35]_i_9 
       (.I0(product_reg_reg__0_n_89),
        .I1(\product_reg_reg_n_0_[16] ),
        .O(\magnitude_reg[35]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[39]_i_10 
       (.I0(product_reg_reg__0_n_86),
        .I1(product_reg_reg_n_103),
        .O(\magnitude_reg[39]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[39]_i_2 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[39]_i_6_n_4 ),
        .O(\magnitude_reg[39]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[39]_i_3 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[39]_i_6_n_5 ),
        .O(\magnitude_reg[39]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[39]_i_4 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[39]_i_6_n_6 ),
        .O(\magnitude_reg[39]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[39]_i_5 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[39]_i_6_n_7 ),
        .O(\magnitude_reg[39]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[39]_i_7 
       (.I0(product_reg_reg__0_n_83),
        .I1(product_reg_reg_n_100),
        .O(\magnitude_reg[39]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[39]_i_8 
       (.I0(product_reg_reg__0_n_84),
        .I1(product_reg_reg_n_101),
        .O(\magnitude_reg[39]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[39]_i_9 
       (.I0(product_reg_reg__0_n_85),
        .I1(product_reg_reg_n_102),
        .O(\magnitude_reg[39]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[3]_i_2 
       (.I0(p_2_out0),
        .I1(\product_reg_reg[3]__0_n_0 ),
        .O(\magnitude_reg[3]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[3]_i_3 
       (.I0(p_2_out0),
        .I1(\product_reg_reg[2]__0_n_0 ),
        .O(\magnitude_reg[3]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[3]_i_4 
       (.I0(p_2_out0),
        .I1(\product_reg_reg[1]__0_n_0 ),
        .O(\magnitude_reg[3]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[43]_i_10 
       (.I0(product_reg_reg__0_n_82),
        .I1(product_reg_reg_n_99),
        .O(\magnitude_reg[43]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[43]_i_2 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[43]_i_6_n_4 ),
        .O(\magnitude_reg[43]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[43]_i_3 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[43]_i_6_n_5 ),
        .O(\magnitude_reg[43]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[43]_i_4 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[43]_i_6_n_6 ),
        .O(\magnitude_reg[43]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[43]_i_5 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[43]_i_6_n_7 ),
        .O(\magnitude_reg[43]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[43]_i_7 
       (.I0(product_reg_reg__0_n_79),
        .I1(product_reg_reg_n_96),
        .O(\magnitude_reg[43]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[43]_i_8 
       (.I0(product_reg_reg__0_n_80),
        .I1(product_reg_reg_n_97),
        .O(\magnitude_reg[43]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[43]_i_9 
       (.I0(product_reg_reg__0_n_81),
        .I1(product_reg_reg_n_98),
        .O(\magnitude_reg[43]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[47]_i_10 
       (.I0(product_reg_reg__0_n_78),
        .I1(product_reg_reg_n_95),
        .O(\magnitude_reg[47]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[47]_i_2 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[47]_i_6_n_4 ),
        .O(\magnitude_reg[47]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[47]_i_3 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[47]_i_6_n_5 ),
        .O(\magnitude_reg[47]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[47]_i_4 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[47]_i_6_n_6 ),
        .O(\magnitude_reg[47]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[47]_i_5 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[47]_i_6_n_7 ),
        .O(\magnitude_reg[47]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[47]_i_7 
       (.I0(product_reg_reg__0_n_75),
        .I1(product_reg_reg_n_92),
        .O(\magnitude_reg[47]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[47]_i_8 
       (.I0(product_reg_reg__0_n_76),
        .I1(product_reg_reg_n_93),
        .O(\magnitude_reg[47]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[47]_i_9 
       (.I0(product_reg_reg__0_n_77),
        .I1(product_reg_reg_n_94),
        .O(\magnitude_reg[47]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[51]_i_10 
       (.I0(product_reg_reg__0_n_74),
        .I1(product_reg_reg_n_91),
        .O(\magnitude_reg[51]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[51]_i_2 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[51]_i_6_n_4 ),
        .O(\magnitude_reg[51]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[51]_i_3 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[51]_i_6_n_5 ),
        .O(\magnitude_reg[51]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[51]_i_4 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[51]_i_6_n_6 ),
        .O(\magnitude_reg[51]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[51]_i_5 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[51]_i_6_n_7 ),
        .O(\magnitude_reg[51]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[51]_i_7 
       (.I0(product_reg_reg__0_n_71),
        .I1(product_reg_reg_n_88),
        .O(\magnitude_reg[51]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[51]_i_8 
       (.I0(product_reg_reg__0_n_72),
        .I1(product_reg_reg_n_89),
        .O(\magnitude_reg[51]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[51]_i_9 
       (.I0(product_reg_reg__0_n_73),
        .I1(product_reg_reg_n_90),
        .O(\magnitude_reg[51]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[55]_i_10 
       (.I0(product_reg_reg__0_n_70),
        .I1(product_reg_reg_n_87),
        .O(\magnitude_reg[55]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[55]_i_2 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[55]_i_6_n_4 ),
        .O(\magnitude_reg[55]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[55]_i_3 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[55]_i_6_n_5 ),
        .O(\magnitude_reg[55]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[55]_i_4 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[55]_i_6_n_6 ),
        .O(\magnitude_reg[55]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[55]_i_5 
       (.I0(p_2_out0),
        .I1(\magnitude_reg_reg[55]_i_6_n_7 ),
        .O(\magnitude_reg[55]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[55]_i_7 
       (.I0(product_reg_reg__0_n_67),
        .I1(product_reg_reg_n_84),
        .O(\magnitude_reg[55]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[55]_i_8 
       (.I0(product_reg_reg__0_n_68),
        .I1(product_reg_reg_n_85),
        .O(\magnitude_reg[55]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[55]_i_9 
       (.I0(product_reg_reg__0_n_69),
        .I1(product_reg_reg_n_86),
        .O(\magnitude_reg[55]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[59]_i_2 
       (.I0(p_2_out0),
        .I1(product_negative_reg_reg_i_2_n_4),
        .O(\magnitude_reg[59]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[59]_i_3 
       (.I0(p_2_out0),
        .I1(product_negative_reg_reg_i_2_n_5),
        .O(\magnitude_reg[59]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[59]_i_4 
       (.I0(p_2_out0),
        .I1(product_negative_reg_reg_i_2_n_6),
        .O(\magnitude_reg[59]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[59]_i_5 
       (.I0(p_2_out0),
        .I1(product_negative_reg_reg_i_2_n_7),
        .O(\magnitude_reg[59]_i_5_n_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \magnitude_reg[63]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .O(magnitude_reg));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[63]_i_3 
       (.I0(p_2_out0),
        .I1(product_negative_reg_reg_i_1_n_5),
        .O(\magnitude_reg[63]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[63]_i_4 
       (.I0(p_2_out0),
        .I1(product_negative_reg_reg_i_1_n_6),
        .O(\magnitude_reg[63]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[63]_i_5 
       (.I0(p_2_out0),
        .I1(product_negative_reg_reg_i_1_n_7),
        .O(\magnitude_reg[63]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[7]_i_2 
       (.I0(p_2_out0),
        .I1(\product_reg_reg[7]__0_n_0 ),
        .O(\magnitude_reg[7]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[7]_i_3 
       (.I0(p_2_out0),
        .I1(\product_reg_reg[6]__0_n_0 ),
        .O(\magnitude_reg[7]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[7]_i_4 
       (.I0(p_2_out0),
        .I1(\product_reg_reg[5]__0_n_0 ),
        .O(\magnitude_reg[7]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \magnitude_reg[7]_i_5 
       (.I0(p_2_out0),
        .I1(\product_reg_reg[4]__0_n_0 ),
        .O(\magnitude_reg[7]_i_5_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[0] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[0]),
        .Q(\magnitude_reg_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[10] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[10]),
        .Q(\magnitude_reg_reg_n_0_[10] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[11] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[11]),
        .Q(\magnitude_reg_reg_n_0_[11] ),
        .R(rst));
  CARRY4 \magnitude_reg_reg[11]_i_1 
       (.CI(\magnitude_reg_reg[7]_i_1_n_0 ),
        .CO({\magnitude_reg_reg[11]_i_1_n_0 ,\NLW_magnitude_reg_reg[11]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in__0[11:8]),
        .S({\magnitude_reg[11]_i_2_n_0 ,\magnitude_reg[11]_i_3_n_0 ,\magnitude_reg[11]_i_4_n_0 ,\magnitude_reg[11]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[12] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[12]),
        .Q(\magnitude_reg_reg_n_0_[12] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[13] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[13]),
        .Q(\magnitude_reg_reg_n_0_[13] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[14] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[14]),
        .Q(\magnitude_reg_reg_n_0_[14] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[15] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[15]),
        .Q(\magnitude_reg_reg_n_0_[15] ),
        .R(rst));
  CARRY4 \magnitude_reg_reg[15]_i_1 
       (.CI(\magnitude_reg_reg[11]_i_1_n_0 ),
        .CO({\magnitude_reg_reg[15]_i_1_n_0 ,\NLW_magnitude_reg_reg[15]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in__0[15:12]),
        .S({\magnitude_reg[15]_i_2_n_0 ,\magnitude_reg[15]_i_3_n_0 ,\magnitude_reg[15]_i_4_n_0 ,\magnitude_reg[15]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[16] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[16]),
        .Q(\magnitude_reg_reg_n_0_[16] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[17] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[17]),
        .Q(\magnitude_reg_reg_n_0_[17] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[18] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[18]),
        .Q(\magnitude_reg_reg_n_0_[18] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[19] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[19]),
        .Q(\magnitude_reg_reg_n_0_[19] ),
        .R(rst));
  CARRY4 \magnitude_reg_reg[19]_i_1 
       (.CI(\magnitude_reg_reg[15]_i_1_n_0 ),
        .CO({\magnitude_reg_reg[19]_i_1_n_0 ,\NLW_magnitude_reg_reg[19]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in__0[19:16]),
        .S({\magnitude_reg[19]_i_2_n_0 ,\magnitude_reg[19]_i_3_n_0 ,\magnitude_reg[19]_i_4_n_0 ,\magnitude_reg[19]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 \magnitude_reg_reg[19]_i_6 
       (.CI(1'b0),
        .CO({\magnitude_reg_reg[19]_i_6_n_0 ,\NLW_magnitude_reg_reg[19]_i_6_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({product_reg_reg__0_n_103,product_reg_reg__0_n_104,product_reg_reg__0_n_105,1'b0}),
        .O({\magnitude_reg_reg[19]_i_6_n_4 ,\magnitude_reg_reg[19]_i_6_n_5 ,\magnitude_reg_reg[19]_i_6_n_6 ,\magnitude_reg_reg[19]_i_6_n_7 }),
        .S({\magnitude_reg[19]_i_7_n_0 ,\magnitude_reg[19]_i_8_n_0 ,\magnitude_reg[19]_i_9_n_0 ,\product_reg_reg[16]__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[1] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[1]),
        .Q(\magnitude_reg_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[20] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[20]),
        .Q(\magnitude_reg_reg_n_0_[20] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[21] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[21]),
        .Q(\magnitude_reg_reg_n_0_[21] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[22] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[22]),
        .Q(\magnitude_reg_reg_n_0_[22] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[23] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[23]),
        .Q(\magnitude_reg_reg_n_0_[23] ),
        .R(rst));
  CARRY4 \magnitude_reg_reg[23]_i_1 
       (.CI(\magnitude_reg_reg[19]_i_1_n_0 ),
        .CO({\magnitude_reg_reg[23]_i_1_n_0 ,\NLW_magnitude_reg_reg[23]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in__0[23:20]),
        .S({\magnitude_reg[23]_i_2_n_0 ,\magnitude_reg[23]_i_3_n_0 ,\magnitude_reg[23]_i_4_n_0 ,\magnitude_reg[23]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \magnitude_reg_reg[23]_i_6 
       (.CI(\magnitude_reg_reg[19]_i_6_n_0 ),
        .CO({\magnitude_reg_reg[23]_i_6_n_0 ,\NLW_magnitude_reg_reg[23]_i_6_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({product_reg_reg__0_n_99,product_reg_reg__0_n_100,product_reg_reg__0_n_101,product_reg_reg__0_n_102}),
        .O({\magnitude_reg_reg[23]_i_6_n_4 ,\magnitude_reg_reg[23]_i_6_n_5 ,\magnitude_reg_reg[23]_i_6_n_6 ,\magnitude_reg_reg[23]_i_6_n_7 }),
        .S({\magnitude_reg[23]_i_7_n_0 ,\magnitude_reg[23]_i_8_n_0 ,\magnitude_reg[23]_i_9_n_0 ,\magnitude_reg[23]_i_10_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[24] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[24]),
        .Q(\magnitude_reg_reg_n_0_[24] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[25] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[25]),
        .Q(\magnitude_reg_reg_n_0_[25] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[26] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[26]),
        .Q(\magnitude_reg_reg_n_0_[26] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[27] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[27]),
        .Q(\magnitude_reg_reg_n_0_[27] ),
        .R(rst));
  CARRY4 \magnitude_reg_reg[27]_i_1 
       (.CI(\magnitude_reg_reg[23]_i_1_n_0 ),
        .CO({\magnitude_reg_reg[27]_i_1_n_0 ,\NLW_magnitude_reg_reg[27]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in__0[27:24]),
        .S({\magnitude_reg[27]_i_2_n_0 ,\magnitude_reg[27]_i_3_n_0 ,\magnitude_reg[27]_i_4_n_0 ,\magnitude_reg[27]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \magnitude_reg_reg[27]_i_6 
       (.CI(\magnitude_reg_reg[23]_i_6_n_0 ),
        .CO({\magnitude_reg_reg[27]_i_6_n_0 ,\NLW_magnitude_reg_reg[27]_i_6_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({product_reg_reg__0_n_95,product_reg_reg__0_n_96,product_reg_reg__0_n_97,product_reg_reg__0_n_98}),
        .O({\magnitude_reg_reg[27]_i_6_n_4 ,\magnitude_reg_reg[27]_i_6_n_5 ,\magnitude_reg_reg[27]_i_6_n_6 ,\magnitude_reg_reg[27]_i_6_n_7 }),
        .S({\magnitude_reg[27]_i_7_n_0 ,\magnitude_reg[27]_i_8_n_0 ,\magnitude_reg[27]_i_9_n_0 ,\magnitude_reg[27]_i_10_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[28] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[28]),
        .Q(\magnitude_reg_reg_n_0_[28] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[29] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[29]),
        .Q(\magnitude_reg_reg_n_0_[29] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[2] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[2]),
        .Q(\magnitude_reg_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[30] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[30]),
        .Q(\magnitude_reg_reg_n_0_[30] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[31] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[31]),
        .Q(\magnitude_reg_reg_n_0_[31] ),
        .R(rst));
  CARRY4 \magnitude_reg_reg[31]_i_1 
       (.CI(\magnitude_reg_reg[27]_i_1_n_0 ),
        .CO({\magnitude_reg_reg[31]_i_1_n_0 ,\NLW_magnitude_reg_reg[31]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in__0[31:28]),
        .S({\magnitude_reg[31]_i_2_n_0 ,\magnitude_reg[31]_i_3_n_0 ,\magnitude_reg[31]_i_4_n_0 ,\magnitude_reg[31]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \magnitude_reg_reg[31]_i_6 
       (.CI(\magnitude_reg_reg[27]_i_6_n_0 ),
        .CO({\magnitude_reg_reg[31]_i_6_n_0 ,\NLW_magnitude_reg_reg[31]_i_6_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({product_reg_reg__0_n_91,product_reg_reg__0_n_92,product_reg_reg__0_n_93,product_reg_reg__0_n_94}),
        .O({\magnitude_reg_reg[31]_i_6_n_4 ,\magnitude_reg_reg[31]_i_6_n_5 ,\magnitude_reg_reg[31]_i_6_n_6 ,\magnitude_reg_reg[31]_i_6_n_7 }),
        .S({\magnitude_reg[31]_i_7_n_0 ,\magnitude_reg[31]_i_8_n_0 ,\magnitude_reg[31]_i_9_n_0 ,\magnitude_reg[31]_i_10_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[32] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[32]),
        .Q(\magnitude_reg_reg_n_0_[32] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[33] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[33]),
        .Q(\magnitude_reg_reg_n_0_[33] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[34] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[34]),
        .Q(\magnitude_reg_reg_n_0_[34] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[35] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[35]),
        .Q(\magnitude_reg_reg_n_0_[35] ),
        .R(rst));
  CARRY4 \magnitude_reg_reg[35]_i_1 
       (.CI(\magnitude_reg_reg[31]_i_1_n_0 ),
        .CO({\magnitude_reg_reg[35]_i_1_n_0 ,\NLW_magnitude_reg_reg[35]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in__0[35:32]),
        .S({\magnitude_reg[35]_i_2_n_0 ,\magnitude_reg[35]_i_3_n_0 ,\magnitude_reg[35]_i_4_n_0 ,\magnitude_reg[35]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \magnitude_reg_reg[35]_i_6 
       (.CI(\magnitude_reg_reg[31]_i_6_n_0 ),
        .CO({\magnitude_reg_reg[35]_i_6_n_0 ,\NLW_magnitude_reg_reg[35]_i_6_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({product_reg_reg__0_n_87,product_reg_reg__0_n_88,product_reg_reg__0_n_89,product_reg_reg__0_n_90}),
        .O({\magnitude_reg_reg[35]_i_6_n_4 ,\magnitude_reg_reg[35]_i_6_n_5 ,\magnitude_reg_reg[35]_i_6_n_6 ,\magnitude_reg_reg[35]_i_6_n_7 }),
        .S({\magnitude_reg[35]_i_7_n_0 ,\magnitude_reg[35]_i_8_n_0 ,\magnitude_reg[35]_i_9_n_0 ,\magnitude_reg[35]_i_10_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[36] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[36]),
        .Q(\magnitude_reg_reg_n_0_[36] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[37] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[37]),
        .Q(\magnitude_reg_reg_n_0_[37] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[38] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[38]),
        .Q(\magnitude_reg_reg_n_0_[38] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[39] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[39]),
        .Q(\magnitude_reg_reg_n_0_[39] ),
        .R(rst));
  CARRY4 \magnitude_reg_reg[39]_i_1 
       (.CI(\magnitude_reg_reg[35]_i_1_n_0 ),
        .CO({\magnitude_reg_reg[39]_i_1_n_0 ,\NLW_magnitude_reg_reg[39]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in__0[39:36]),
        .S({\magnitude_reg[39]_i_2_n_0 ,\magnitude_reg[39]_i_3_n_0 ,\magnitude_reg[39]_i_4_n_0 ,\magnitude_reg[39]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \magnitude_reg_reg[39]_i_6 
       (.CI(\magnitude_reg_reg[35]_i_6_n_0 ),
        .CO({\magnitude_reg_reg[39]_i_6_n_0 ,\NLW_magnitude_reg_reg[39]_i_6_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({product_reg_reg__0_n_83,product_reg_reg__0_n_84,product_reg_reg__0_n_85,product_reg_reg__0_n_86}),
        .O({\magnitude_reg_reg[39]_i_6_n_4 ,\magnitude_reg_reg[39]_i_6_n_5 ,\magnitude_reg_reg[39]_i_6_n_6 ,\magnitude_reg_reg[39]_i_6_n_7 }),
        .S({\magnitude_reg[39]_i_7_n_0 ,\magnitude_reg[39]_i_8_n_0 ,\magnitude_reg[39]_i_9_n_0 ,\magnitude_reg[39]_i_10_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[3] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[3]),
        .Q(\magnitude_reg_reg_n_0_[3] ),
        .R(rst));
  (* OPT_MODIFIED = "RETARGET" *) 
  CARRY4 \magnitude_reg_reg[3]_i_1 
       (.CI(1'b0),
        .CO({\magnitude_reg_reg[3]_i_1_n_0 ,\NLW_magnitude_reg_reg[3]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,p_2_out0}),
        .O(p_0_in__0[3:0]),
        .S({\magnitude_reg[3]_i_2_n_0 ,\magnitude_reg[3]_i_3_n_0 ,\magnitude_reg[3]_i_4_n_0 ,\product_reg_reg[0]__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[40] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[40]),
        .Q(\magnitude_reg_reg_n_0_[40] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[41] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[41]),
        .Q(\magnitude_reg_reg_n_0_[41] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[42] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[42]),
        .Q(\magnitude_reg_reg_n_0_[42] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[43] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[43]),
        .Q(\magnitude_reg_reg_n_0_[43] ),
        .R(rst));
  CARRY4 \magnitude_reg_reg[43]_i_1 
       (.CI(\magnitude_reg_reg[39]_i_1_n_0 ),
        .CO({\magnitude_reg_reg[43]_i_1_n_0 ,\NLW_magnitude_reg_reg[43]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in__0[43:40]),
        .S({\magnitude_reg[43]_i_2_n_0 ,\magnitude_reg[43]_i_3_n_0 ,\magnitude_reg[43]_i_4_n_0 ,\magnitude_reg[43]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \magnitude_reg_reg[43]_i_6 
       (.CI(\magnitude_reg_reg[39]_i_6_n_0 ),
        .CO({\magnitude_reg_reg[43]_i_6_n_0 ,\NLW_magnitude_reg_reg[43]_i_6_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({product_reg_reg__0_n_79,product_reg_reg__0_n_80,product_reg_reg__0_n_81,product_reg_reg__0_n_82}),
        .O({\magnitude_reg_reg[43]_i_6_n_4 ,\magnitude_reg_reg[43]_i_6_n_5 ,\magnitude_reg_reg[43]_i_6_n_6 ,\magnitude_reg_reg[43]_i_6_n_7 }),
        .S({\magnitude_reg[43]_i_7_n_0 ,\magnitude_reg[43]_i_8_n_0 ,\magnitude_reg[43]_i_9_n_0 ,\magnitude_reg[43]_i_10_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[44] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[44]),
        .Q(\magnitude_reg_reg_n_0_[44] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[45] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[45]),
        .Q(\magnitude_reg_reg_n_0_[45] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[46] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[46]),
        .Q(\magnitude_reg_reg_n_0_[46] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[47] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[47]),
        .Q(\magnitude_reg_reg_n_0_[47] ),
        .R(rst));
  CARRY4 \magnitude_reg_reg[47]_i_1 
       (.CI(\magnitude_reg_reg[43]_i_1_n_0 ),
        .CO({\magnitude_reg_reg[47]_i_1_n_0 ,\NLW_magnitude_reg_reg[47]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in__0[47:44]),
        .S({\magnitude_reg[47]_i_2_n_0 ,\magnitude_reg[47]_i_3_n_0 ,\magnitude_reg[47]_i_4_n_0 ,\magnitude_reg[47]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \magnitude_reg_reg[47]_i_6 
       (.CI(\magnitude_reg_reg[43]_i_6_n_0 ),
        .CO({\magnitude_reg_reg[47]_i_6_n_0 ,\NLW_magnitude_reg_reg[47]_i_6_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({product_reg_reg__0_n_75,product_reg_reg__0_n_76,product_reg_reg__0_n_77,product_reg_reg__0_n_78}),
        .O({\magnitude_reg_reg[47]_i_6_n_4 ,\magnitude_reg_reg[47]_i_6_n_5 ,\magnitude_reg_reg[47]_i_6_n_6 ,\magnitude_reg_reg[47]_i_6_n_7 }),
        .S({\magnitude_reg[47]_i_7_n_0 ,\magnitude_reg[47]_i_8_n_0 ,\magnitude_reg[47]_i_9_n_0 ,\magnitude_reg[47]_i_10_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[48] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[48]),
        .Q(\magnitude_reg_reg_n_0_[48] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[49] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[49]),
        .Q(\magnitude_reg_reg_n_0_[49] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[4] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[4]),
        .Q(\magnitude_reg_reg_n_0_[4] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[50] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[50]),
        .Q(\magnitude_reg_reg_n_0_[50] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[51] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[51]),
        .Q(\magnitude_reg_reg_n_0_[51] ),
        .R(rst));
  CARRY4 \magnitude_reg_reg[51]_i_1 
       (.CI(\magnitude_reg_reg[47]_i_1_n_0 ),
        .CO({\magnitude_reg_reg[51]_i_1_n_0 ,\NLW_magnitude_reg_reg[51]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in__0[51:48]),
        .S({\magnitude_reg[51]_i_2_n_0 ,\magnitude_reg[51]_i_3_n_0 ,\magnitude_reg[51]_i_4_n_0 ,\magnitude_reg[51]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \magnitude_reg_reg[51]_i_6 
       (.CI(\magnitude_reg_reg[47]_i_6_n_0 ),
        .CO({\magnitude_reg_reg[51]_i_6_n_0 ,\NLW_magnitude_reg_reg[51]_i_6_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({product_reg_reg__0_n_71,product_reg_reg__0_n_72,product_reg_reg__0_n_73,product_reg_reg__0_n_74}),
        .O({\magnitude_reg_reg[51]_i_6_n_4 ,\magnitude_reg_reg[51]_i_6_n_5 ,\magnitude_reg_reg[51]_i_6_n_6 ,\magnitude_reg_reg[51]_i_6_n_7 }),
        .S({\magnitude_reg[51]_i_7_n_0 ,\magnitude_reg[51]_i_8_n_0 ,\magnitude_reg[51]_i_9_n_0 ,\magnitude_reg[51]_i_10_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[52] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[52]),
        .Q(\magnitude_reg_reg_n_0_[52] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[53] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[53]),
        .Q(\magnitude_reg_reg_n_0_[53] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[54] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[54]),
        .Q(\magnitude_reg_reg_n_0_[54] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[55] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[55]),
        .Q(\magnitude_reg_reg_n_0_[55] ),
        .R(rst));
  CARRY4 \magnitude_reg_reg[55]_i_1 
       (.CI(\magnitude_reg_reg[51]_i_1_n_0 ),
        .CO({\magnitude_reg_reg[55]_i_1_n_0 ,\NLW_magnitude_reg_reg[55]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in__0[55:52]),
        .S({\magnitude_reg[55]_i_2_n_0 ,\magnitude_reg[55]_i_3_n_0 ,\magnitude_reg[55]_i_4_n_0 ,\magnitude_reg[55]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \magnitude_reg_reg[55]_i_6 
       (.CI(\magnitude_reg_reg[51]_i_6_n_0 ),
        .CO({\magnitude_reg_reg[55]_i_6_n_0 ,\NLW_magnitude_reg_reg[55]_i_6_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({product_reg_reg__0_n_67,product_reg_reg__0_n_68,product_reg_reg__0_n_69,product_reg_reg__0_n_70}),
        .O({\magnitude_reg_reg[55]_i_6_n_4 ,\magnitude_reg_reg[55]_i_6_n_5 ,\magnitude_reg_reg[55]_i_6_n_6 ,\magnitude_reg_reg[55]_i_6_n_7 }),
        .S({\magnitude_reg[55]_i_7_n_0 ,\magnitude_reg[55]_i_8_n_0 ,\magnitude_reg[55]_i_9_n_0 ,\magnitude_reg[55]_i_10_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[56] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[56]),
        .Q(\magnitude_reg_reg_n_0_[56] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[57] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[57]),
        .Q(\magnitude_reg_reg_n_0_[57] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[58] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[58]),
        .Q(\magnitude_reg_reg_n_0_[58] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[59] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[59]),
        .Q(\magnitude_reg_reg_n_0_[59] ),
        .R(rst));
  CARRY4 \magnitude_reg_reg[59]_i_1 
       (.CI(\magnitude_reg_reg[55]_i_1_n_0 ),
        .CO({\magnitude_reg_reg[59]_i_1_n_0 ,\NLW_magnitude_reg_reg[59]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in__0[59:56]),
        .S({\magnitude_reg[59]_i_2_n_0 ,\magnitude_reg[59]_i_3_n_0 ,\magnitude_reg[59]_i_4_n_0 ,\magnitude_reg[59]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[5] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[5]),
        .Q(\magnitude_reg_reg_n_0_[5] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[60] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[60]),
        .Q(\magnitude_reg_reg_n_0_[60] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[61] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[61]),
        .Q(\magnitude_reg_reg_n_0_[61] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[62] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[62]),
        .Q(\magnitude_reg_reg_n_0_[62] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[63] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[63]),
        .Q(\magnitude_reg_reg_n_0_[63] ),
        .R(rst));
  CARRY4 \magnitude_reg_reg[63]_i_2 
       (.CI(\magnitude_reg_reg[59]_i_1_n_0 ),
        .CO({p_0_in__0[63],\NLW_magnitude_reg_reg[63]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_magnitude_reg_reg[63]_i_2_O_UNCONNECTED [3],p_0_in__0[62:60]}),
        .S({1'b1,\magnitude_reg[63]_i_3_n_0 ,\magnitude_reg[63]_i_4_n_0 ,\magnitude_reg[63]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[6] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[6]),
        .Q(\magnitude_reg_reg_n_0_[6] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[7] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[7]),
        .Q(\magnitude_reg_reg_n_0_[7] ),
        .R(rst));
  CARRY4 \magnitude_reg_reg[7]_i_1 
       (.CI(\magnitude_reg_reg[3]_i_1_n_0 ),
        .CO({\magnitude_reg_reg[7]_i_1_n_0 ,\NLW_magnitude_reg_reg[7]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(p_0_in__0[7:4]),
        .S({\magnitude_reg[7]_i_2_n_0 ,\magnitude_reg[7]_i_3_n_0 ,\magnitude_reg[7]_i_4_n_0 ,\magnitude_reg[7]_i_5_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[8] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[8]),
        .Q(\magnitude_reg_reg_n_0_[8] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \magnitude_reg_reg[9] 
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_0_in__0[9]),
        .Q(\magnitude_reg_reg_n_0_[9] ),
        .R(rst));
  LUT6 #(
    .INIT(64'hAAAAFFFF20080000)) 
    overflow_i_1
       (.I0(overflow_i_2_n_0),
        .I1(overflow_reg_i_3_n_4),
        .I2(p_1_in),
        .I3(product16),
        .I4(overflow_i_5_n_0),
        .I5(overflow),
        .O(overflow_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_12
       (.I0(overflow_reg_i_26_n_5),
        .I1(overflow_reg_i_29_n_6),
        .O(overflow_i_12_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_13
       (.I0(overflow_reg_i_26_n_6),
        .I1(overflow_reg_i_29_n_7),
        .O(overflow_i_13_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    overflow_i_14
       (.I0(overflow_reg_i_29_n_1),
        .I1(overflow_reg_i_26_n_4),
        .I2(overflow_reg_i_11_n_7),
        .O(overflow_i_14_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    overflow_i_15
       (.I0(overflow_reg_i_29_n_6),
        .I1(overflow_reg_i_26_n_5),
        .I2(overflow_reg_i_29_n_1),
        .I3(overflow_reg_i_26_n_4),
        .O(overflow_i_15_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    overflow_i_16
       (.I0(overflow_reg_i_29_n_7),
        .I1(overflow_reg_i_26_n_6),
        .I2(overflow_reg_i_29_n_6),
        .I3(overflow_reg_i_26_n_5),
        .O(overflow_i_16_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    overflow_i_18
       (.I0(overflow_reg_i_26_n_7),
        .I1(overflow_reg_i_38_n_1),
        .I2(overflow_reg_i_39_n_4),
        .O(overflow_i_18_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    overflow_i_19
       (.I0(overflow_reg_i_40_n_4),
        .I1(overflow_reg_i_38_n_6),
        .I2(overflow_reg_i_39_n_5),
        .O(overflow_i_19_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    overflow_i_2
       (.I0(state[0]),
        .I1(state[2]),
        .O(overflow_i_2_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    overflow_i_20
       (.I0(overflow_reg_i_40_n_5),
        .I1(overflow_reg_i_38_n_7),
        .I2(overflow_reg_i_39_n_6),
        .O(overflow_i_20_n_0));
  (* HLUTNM = "lutpair0" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    overflow_i_21
       (.I0(overflow_reg_i_40_n_6),
        .I1(overflow_reg_i_41_n_4),
        .I2(overflow_reg_i_39_n_7),
        .O(overflow_i_21_n_0));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    overflow_i_22
       (.I0(overflow_reg_i_39_n_4),
        .I1(overflow_reg_i_38_n_1),
        .I2(overflow_reg_i_26_n_7),
        .I3(overflow_reg_i_29_n_7),
        .I4(overflow_reg_i_26_n_6),
        .O(overflow_i_22_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    overflow_i_23
       (.I0(overflow_i_19_n_0),
        .I1(overflow_reg_i_26_n_7),
        .I2(overflow_reg_i_38_n_1),
        .I3(overflow_reg_i_39_n_4),
        .O(overflow_i_23_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    overflow_i_24
       (.I0(overflow_reg_i_40_n_4),
        .I1(overflow_reg_i_38_n_6),
        .I2(overflow_reg_i_39_n_5),
        .I3(overflow_i_20_n_0),
        .O(overflow_i_24_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    overflow_i_25
       (.I0(overflow_reg_i_40_n_5),
        .I1(overflow_reg_i_38_n_7),
        .I2(overflow_reg_i_39_n_6),
        .I3(overflow_i_21_n_0),
        .O(overflow_i_25_n_0));
  LUT4 #(
    .INIT(16'h0777)) 
    overflow_i_27
       (.I0(weight_in[7]),
        .I1(feature_in[6]),
        .I2(weight_in[6]),
        .I3(feature_in[7]),
        .O(overflow_i_27_n_0));
  LUT4 #(
    .INIT(16'hE53F)) 
    overflow_i_28
       (.I0(weight_in[6]),
        .I1(feature_in[6]),
        .I2(weight_in[7]),
        .I3(feature_in[7]),
        .O(overflow_i_28_n_0));
  LUT3 #(
    .INIT(8'hE8)) 
    overflow_i_30
       (.I0(overflow_reg_i_40_n_7),
        .I1(overflow_reg_i_41_n_5),
        .I2(\acc_reg[3]_i_8_n_4 ),
        .O(overflow_i_30_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_31
       (.I0(\acc_reg[3]_i_8_n_5 ),
        .I1(overflow_reg_i_41_n_6),
        .O(overflow_i_31_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_32
       (.I0(\acc_reg[3]_i_8_n_6 ),
        .I1(overflow_reg_i_41_n_7),
        .O(overflow_i_32_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_33
       (.I0(\acc_reg[3]_i_8_n_7 ),
        .I1(\acc_reg[3]_i_7_n_4 ),
        .O(overflow_i_33_n_0));
  (* HLUTNM = "lutpair0" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    overflow_i_34
       (.I0(overflow_reg_i_40_n_6),
        .I1(overflow_reg_i_41_n_4),
        .I2(overflow_reg_i_39_n_7),
        .I3(overflow_i_30_n_0),
        .O(overflow_i_34_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    overflow_i_35
       (.I0(overflow_reg_i_40_n_7),
        .I1(overflow_reg_i_41_n_5),
        .I2(\acc_reg[3]_i_8_n_4 ),
        .I3(overflow_i_31_n_0),
        .O(overflow_i_35_n_0));
  LUT4 #(
    .INIT(16'h9666)) 
    overflow_i_36
       (.I0(\acc_reg[3]_i_8_n_5 ),
        .I1(overflow_reg_i_41_n_6),
        .I2(overflow_reg_i_41_n_7),
        .I3(\acc_reg[3]_i_8_n_6 ),
        .O(overflow_i_36_n_0));
  LUT4 #(
    .INIT(16'h8778)) 
    overflow_i_37
       (.I0(\acc_reg[3]_i_7_n_4 ),
        .I1(\acc_reg[3]_i_8_n_7 ),
        .I2(overflow_reg_i_41_n_7),
        .I3(\acc_reg[3]_i_8_n_6 ),
        .O(overflow_i_37_n_0));
  LUT4 #(
    .INIT(16'h7000)) 
    overflow_i_42
       (.I0(weight_in[7]),
        .I1(feature_in[5]),
        .I2(weight_in[6]),
        .I3(feature_in[6]),
        .O(overflow_i_42_n_0));
  LUT4 #(
    .INIT(16'h7000)) 
    overflow_i_43
       (.I0(weight_in[7]),
        .I1(feature_in[4]),
        .I2(weight_in[6]),
        .I3(feature_in[5]),
        .O(overflow_i_43_n_0));
  LUT4 #(
    .INIT(16'h7000)) 
    overflow_i_44
       (.I0(weight_in[7]),
        .I1(feature_in[3]),
        .I2(weight_in[6]),
        .I3(feature_in[4]),
        .O(overflow_i_44_n_0));
  LUT4 #(
    .INIT(16'h7000)) 
    overflow_i_45
       (.I0(weight_in[7]),
        .I1(feature_in[2]),
        .I2(weight_in[6]),
        .I3(feature_in[3]),
        .O(overflow_i_45_n_0));
  LUT5 #(
    .INIT(32'h6FC030C0)) 
    overflow_i_46
       (.I0(feature_in[5]),
        .I1(feature_in[7]),
        .I2(weight_in[6]),
        .I3(feature_in[6]),
        .I4(weight_in[7]),
        .O(overflow_i_46_n_0));
  LUT5 #(
    .INIT(32'h903FCF3F)) 
    overflow_i_47
       (.I0(feature_in[4]),
        .I1(feature_in[6]),
        .I2(weight_in[6]),
        .I3(feature_in[5]),
        .I4(weight_in[7]),
        .O(overflow_i_47_n_0));
  LUT5 #(
    .INIT(32'h903FCF3F)) 
    overflow_i_48
       (.I0(feature_in[3]),
        .I1(feature_in[5]),
        .I2(weight_in[6]),
        .I3(feature_in[4]),
        .I4(weight_in[7]),
        .O(overflow_i_48_n_0));
  LUT5 #(
    .INIT(32'h903FCF3F)) 
    overflow_i_49
       (.I0(feature_in[2]),
        .I1(feature_in[4]),
        .I2(weight_in[6]),
        .I3(feature_in[3]),
        .I4(weight_in[7]),
        .O(overflow_i_49_n_0));
  LUT5 #(
    .INIT(32'h000000CA)) 
    overflow_i_5
       (.I0(start),
        .I1(valid_in),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .O(overflow_i_5_n_0));
  LUT4 #(
    .INIT(16'h0888)) 
    overflow_i_50
       (.I0(weight_in[5]),
        .I1(feature_in[6]),
        .I2(weight_in[4]),
        .I3(feature_in[7]),
        .O(overflow_i_50_n_0));
  LUT6 #(
    .INIT(64'h8000EAC0EAC0EAC0)) 
    overflow_i_51
       (.I0(weight_in[4]),
        .I1(feature_in[5]),
        .I2(weight_in[5]),
        .I3(feature_in[6]),
        .I4(feature_in[7]),
        .I5(weight_in[3]),
        .O(overflow_i_51_n_0));
  LUT4 #(
    .INIT(16'h4F3F)) 
    overflow_i_52
       (.I0(weight_in[4]),
        .I1(feature_in[6]),
        .I2(weight_in[5]),
        .I3(feature_in[7]),
        .O(overflow_i_52_n_0));
  LUT6 #(
    .INIT(64'h25404FBFF03FCF3F)) 
    overflow_i_53
       (.I0(weight_in[3]),
        .I1(feature_in[5]),
        .I2(weight_in[5]),
        .I3(feature_in[6]),
        .I4(weight_in[4]),
        .I5(feature_in[7]),
        .O(overflow_i_53_n_0));
  LUT4 #(
    .INIT(16'h0888)) 
    overflow_i_54
       (.I0(weight_in[2]),
        .I1(feature_in[6]),
        .I2(weight_in[1]),
        .I3(feature_in[7]),
        .O(overflow_i_54_n_0));
  LUT6 #(
    .INIT(64'h8000EAC0EAC0EAC0)) 
    overflow_i_55
       (.I0(weight_in[1]),
        .I1(feature_in[5]),
        .I2(weight_in[2]),
        .I3(feature_in[6]),
        .I4(weight_in[0]),
        .I5(feature_in[7]),
        .O(overflow_i_55_n_0));
  LUT4 #(
    .INIT(16'h4F3F)) 
    overflow_i_56
       (.I0(weight_in[1]),
        .I1(feature_in[6]),
        .I2(weight_in[2]),
        .I3(feature_in[7]),
        .O(overflow_i_56_n_0));
  LUT6 #(
    .INIT(64'h25404FBFF03FCF3F)) 
    overflow_i_57
       (.I0(weight_in[0]),
        .I1(feature_in[5]),
        .I2(weight_in[2]),
        .I3(feature_in[6]),
        .I4(weight_in[1]),
        .I5(feature_in[7]),
        .O(overflow_i_57_n_0));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    overflow_i_58
       (.I0(weight_in[5]),
        .I1(feature_in[4]),
        .I2(weight_in[4]),
        .I3(feature_in[5]),
        .I4(feature_in[6]),
        .I5(weight_in[3]),
        .O(overflow_i_58_n_0));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    overflow_i_59
       (.I0(weight_in[5]),
        .I1(feature_in[3]),
        .I2(weight_in[4]),
        .I3(feature_in[4]),
        .I4(feature_in[5]),
        .I5(weight_in[3]),
        .O(overflow_i_59_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    overflow_i_6
       (.I0(\acc_reg_n_0_[30] ),
        .I1(p_1_in),
        .O(overflow_i_6_n_0));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    overflow_i_60
       (.I0(weight_in[5]),
        .I1(feature_in[2]),
        .I2(weight_in[4]),
        .I3(feature_in[3]),
        .I4(feature_in[4]),
        .I5(weight_in[3]),
        .O(overflow_i_60_n_0));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    overflow_i_61
       (.I0(weight_in[5]),
        .I1(feature_in[1]),
        .I2(weight_in[4]),
        .I3(feature_in[2]),
        .I4(feature_in[3]),
        .I5(weight_in[3]),
        .O(overflow_i_61_n_0));
  LUT6 #(
    .INIT(64'h956A6A6A6A959595)) 
    overflow_i_62
       (.I0(overflow_i_58_n_0),
        .I1(feature_in[6]),
        .I2(weight_in[4]),
        .I3(feature_in[5]),
        .I4(weight_in[5]),
        .I5(overflow_i_81_n_0),
        .O(overflow_i_62_n_0));
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    overflow_i_63
       (.I0(overflow_i_59_n_0),
        .I1(weight_in[5]),
        .I2(feature_in[4]),
        .I3(overflow_i_82_n_0),
        .I4(feature_in[6]),
        .I5(weight_in[3]),
        .O(overflow_i_63_n_0));
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    overflow_i_64
       (.I0(overflow_i_60_n_0),
        .I1(weight_in[5]),
        .I2(feature_in[3]),
        .I3(overflow_i_83_n_0),
        .I4(feature_in[5]),
        .I5(weight_in[3]),
        .O(overflow_i_64_n_0));
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    overflow_i_65
       (.I0(overflow_i_61_n_0),
        .I1(weight_in[5]),
        .I2(feature_in[2]),
        .I3(overflow_i_84_n_0),
        .I4(feature_in[4]),
        .I5(weight_in[3]),
        .O(overflow_i_65_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    overflow_i_66
       (.I0(weight_in[7]),
        .I1(feature_in[1]),
        .O(overflow_i_66_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_67
       (.I0(feature_in[1]),
        .I1(weight_in[7]),
        .O(overflow_i_67_n_0));
  LUT2 #(
    .INIT(4'h7)) 
    overflow_i_68
       (.I0(feature_in[0]),
        .I1(weight_in[7]),
        .O(overflow_i_68_n_0));
  LUT5 #(
    .INIT(32'h956AC0C0)) 
    overflow_i_69
       (.I0(feature_in[1]),
        .I1(feature_in[3]),
        .I2(weight_in[6]),
        .I3(feature_in[2]),
        .I4(weight_in[7]),
        .O(overflow_i_69_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    overflow_i_7
       (.I0(\acc_reg_n_0_[29] ),
        .I1(\acc_reg_n_0_[30] ),
        .O(overflow_i_7_n_0));
  LUT4 #(
    .INIT(16'h7888)) 
    overflow_i_70
       (.I0(weight_in[7]),
        .I1(feature_in[1]),
        .I2(weight_in[6]),
        .I3(feature_in[2]),
        .O(overflow_i_70_n_0));
  LUT4 #(
    .INIT(16'h8777)) 
    overflow_i_71
       (.I0(weight_in[7]),
        .I1(feature_in[0]),
        .I2(weight_in[6]),
        .I3(feature_in[1]),
        .O(overflow_i_71_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_72
       (.I0(feature_in[0]),
        .I1(weight_in[6]),
        .O(overflow_i_72_n_0));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    overflow_i_73
       (.I0(weight_in[2]),
        .I1(feature_in[4]),
        .I2(weight_in[1]),
        .I3(feature_in[5]),
        .I4(weight_in[0]),
        .I5(feature_in[6]),
        .O(overflow_i_73_n_0));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    overflow_i_74
       (.I0(weight_in[2]),
        .I1(feature_in[3]),
        .I2(weight_in[1]),
        .I3(feature_in[4]),
        .I4(weight_in[0]),
        .I5(feature_in[5]),
        .O(overflow_i_74_n_0));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    overflow_i_75
       (.I0(weight_in[2]),
        .I1(feature_in[2]),
        .I2(weight_in[1]),
        .I3(feature_in[3]),
        .I4(weight_in[0]),
        .I5(feature_in[4]),
        .O(overflow_i_75_n_0));
  LUT6 #(
    .INIT(64'hF888800080008000)) 
    overflow_i_76
       (.I0(weight_in[2]),
        .I1(feature_in[1]),
        .I2(weight_in[1]),
        .I3(feature_in[2]),
        .I4(weight_in[0]),
        .I5(feature_in[3]),
        .O(overflow_i_76_n_0));
  LUT6 #(
    .INIT(64'h956A6A6A6A959595)) 
    overflow_i_77
       (.I0(overflow_i_73_n_0),
        .I1(feature_in[6]),
        .I2(weight_in[1]),
        .I3(feature_in[5]),
        .I4(weight_in[2]),
        .I5(overflow_i_85_n_0),
        .O(overflow_i_77_n_0));
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    overflow_i_78
       (.I0(overflow_i_74_n_0),
        .I1(weight_in[2]),
        .I2(feature_in[4]),
        .I3(overflow_i_86_n_0),
        .I4(weight_in[0]),
        .I5(feature_in[6]),
        .O(overflow_i_78_n_0));
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    overflow_i_79
       (.I0(overflow_i_75_n_0),
        .I1(weight_in[2]),
        .I2(feature_in[3]),
        .I3(overflow_i_87_n_0),
        .I4(weight_in[0]),
        .I5(feature_in[5]),
        .O(overflow_i_79_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    overflow_i_8
       (.I0(\acc_reg_n_0_[28] ),
        .I1(\acc_reg_n_0_[29] ),
        .O(overflow_i_8_n_0));
  LUT6 #(
    .INIT(64'h6A95956A956A956A)) 
    overflow_i_80
       (.I0(overflow_i_76_n_0),
        .I1(weight_in[2]),
        .I2(feature_in[2]),
        .I3(overflow_i_88_n_0),
        .I4(weight_in[0]),
        .I5(feature_in[4]),
        .O(overflow_i_80_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_81
       (.I0(feature_in[7]),
        .I1(weight_in[3]),
        .O(overflow_i_81_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_82
       (.I0(feature_in[5]),
        .I1(weight_in[4]),
        .O(overflow_i_82_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_83
       (.I0(feature_in[4]),
        .I1(weight_in[4]),
        .O(overflow_i_83_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_84
       (.I0(feature_in[3]),
        .I1(weight_in[4]),
        .O(overflow_i_84_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_85
       (.I0(weight_in[0]),
        .I1(feature_in[7]),
        .O(overflow_i_85_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_86
       (.I0(feature_in[5]),
        .I1(weight_in[1]),
        .O(overflow_i_86_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_87
       (.I0(feature_in[4]),
        .I1(weight_in[1]),
        .O(overflow_i_87_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    overflow_i_88
       (.I0(feature_in[3]),
        .I1(weight_in[1]),
        .O(overflow_i_88_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    overflow_i_9
       (.I0(\acc_reg_n_0_[27] ),
        .I1(\acc_reg_n_0_[28] ),
        .O(overflow_i_9_n_0));
  FDRE #(
    .INIT(1'b0)) 
    overflow_reg
       (.C(clk),
        .CE(1'b1),
        .D(overflow_i_1_n_0),
        .Q(overflow),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_reg_i_10
       (.CI(overflow_reg_i_17_n_0),
        .CO({overflow_reg_i_10_n_0,NLW_overflow_reg_i_10_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({overflow_i_18_n_0,overflow_i_19_n_0,overflow_i_20_n_0,overflow_i_21_n_0}),
        .O(product32[11:8]),
        .S({overflow_i_22_n_0,overflow_i_23_n_0,overflow_i_24_n_0,overflow_i_25_n_0}));
  CARRY4 overflow_reg_i_11
       (.CI(overflow_reg_i_26_n_0),
        .CO(NLW_overflow_reg_i_11_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,overflow_i_27_n_0}),
        .O({NLW_overflow_reg_i_11_O_UNCONNECTED[3:2],overflow_reg_i_11_n_6,overflow_reg_i_11_n_7}),
        .S({1'b0,1'b0,1'b1,overflow_i_28_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_reg_i_17
       (.CI(1'b0),
        .CO({overflow_reg_i_17_n_0,NLW_overflow_reg_i_17_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({overflow_i_30_n_0,overflow_i_31_n_0,overflow_i_32_n_0,overflow_i_33_n_0}),
        .O(product32[7:4]),
        .S({overflow_i_34_n_0,overflow_i_35_n_0,overflow_i_36_n_0,overflow_i_37_n_0}));
  CARRY4 overflow_reg_i_26
       (.CI(overflow_reg_i_40_n_0),
        .CO({overflow_reg_i_26_n_0,NLW_overflow_reg_i_26_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({overflow_i_42_n_0,overflow_i_43_n_0,overflow_i_44_n_0,overflow_i_45_n_0}),
        .O({overflow_reg_i_26_n_4,overflow_reg_i_26_n_5,overflow_reg_i_26_n_6,overflow_reg_i_26_n_7}),
        .S({overflow_i_46_n_0,overflow_i_47_n_0,overflow_i_48_n_0,overflow_i_49_n_0}));
  CARRY4 overflow_reg_i_29
       (.CI(overflow_reg_i_39_n_0),
        .CO({NLW_overflow_reg_i_29_CO_UNCONNECTED[3],overflow_reg_i_29_n_1,NLW_overflow_reg_i_29_CO_UNCONNECTED[1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,overflow_i_50_n_0,overflow_i_51_n_0}),
        .O({NLW_overflow_reg_i_29_O_UNCONNECTED[3:2],overflow_reg_i_29_n_6,overflow_reg_i_29_n_7}),
        .S({1'b0,1'b1,overflow_i_52_n_0,overflow_i_53_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_reg_i_3
       (.CI(\acc_reg[27]_i_2_n_0 ),
        .CO(NLW_overflow_reg_i_3_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,\acc_reg_n_0_[29] ,\acc_reg_n_0_[28] ,\acc_reg_n_0_[27] }),
        .O({overflow_reg_i_3_n_4,sum[30:28]}),
        .S({overflow_i_6_n_0,overflow_i_7_n_0,overflow_i_8_n_0,overflow_i_9_n_0}));
  CARRY4 overflow_reg_i_38
       (.CI(overflow_reg_i_41_n_0),
        .CO({NLW_overflow_reg_i_38_CO_UNCONNECTED[3],overflow_reg_i_38_n_1,NLW_overflow_reg_i_38_CO_UNCONNECTED[1:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,overflow_i_54_n_0,overflow_i_55_n_0}),
        .O({NLW_overflow_reg_i_38_O_UNCONNECTED[3:2],overflow_reg_i_38_n_6,overflow_reg_i_38_n_7}),
        .S({1'b0,1'b1,overflow_i_56_n_0,overflow_i_57_n_0}));
  CARRY4 overflow_reg_i_39
       (.CI(\acc_reg[3]_i_8_n_0 ),
        .CO({overflow_reg_i_39_n_0,NLW_overflow_reg_i_39_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({overflow_i_58_n_0,overflow_i_59_n_0,overflow_i_60_n_0,overflow_i_61_n_0}),
        .O({overflow_reg_i_39_n_4,overflow_reg_i_39_n_5,overflow_reg_i_39_n_6,overflow_reg_i_39_n_7}),
        .S({overflow_i_62_n_0,overflow_i_63_n_0,overflow_i_64_n_0,overflow_i_65_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 overflow_reg_i_4
       (.CI(overflow_reg_i_10_n_0),
        .CO(NLW_overflow_reg_i_4_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,overflow_reg_i_11_n_7,overflow_i_12_n_0,overflow_i_13_n_0}),
        .O({product16,product32[14:12]}),
        .S({overflow_reg_i_11_n_6,overflow_i_14_n_0,overflow_i_15_n_0,overflow_i_16_n_0}));
  (* OPT_MODIFIED = "PROPCONST" *) 
  CARRY4 overflow_reg_i_40
       (.CI(1'b0),
        .CO({overflow_reg_i_40_n_0,NLW_overflow_reg_i_40_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({overflow_i_66_n_0,overflow_i_67_n_0,overflow_i_68_n_0,1'b0}),
        .O({overflow_reg_i_40_n_4,overflow_reg_i_40_n_5,overflow_reg_i_40_n_6,overflow_reg_i_40_n_7}),
        .S({overflow_i_69_n_0,overflow_i_70_n_0,overflow_i_71_n_0,overflow_i_72_n_0}));
  CARRY4 overflow_reg_i_41
       (.CI(\acc_reg[3]_i_7_n_0 ),
        .CO({overflow_reg_i_41_n_0,NLW_overflow_reg_i_41_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({overflow_i_73_n_0,overflow_i_74_n_0,overflow_i_75_n_0,overflow_i_76_n_0}),
        .O({overflow_reg_i_41_n_4,overflow_reg_i_41_n_5,overflow_reg_i_41_n_6,overflow_reg_i_41_n_7}),
        .S({overflow_i_77_n_0,overflow_i_78_n_0,overflow_i_79_n_0,overflow_i_80_n_0}));
  LUT2 #(
    .INIT(4'h6)) 
    product_negative_reg_i_10
       (.I0(product_reg_reg__0_n_66),
        .I1(product_reg_reg_n_83),
        .O(product_negative_reg_i_10_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    product_negative_reg_i_3
       (.I0(product_reg_reg__0_n_59),
        .I1(product_reg_reg_n_76),
        .O(product_negative_reg_i_3_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    product_negative_reg_i_4
       (.I0(product_reg_reg__0_n_60),
        .I1(product_reg_reg_n_77),
        .O(product_negative_reg_i_4_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    product_negative_reg_i_5
       (.I0(product_reg_reg__0_n_61),
        .I1(product_reg_reg_n_78),
        .O(product_negative_reg_i_5_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    product_negative_reg_i_6
       (.I0(product_reg_reg__0_n_62),
        .I1(product_reg_reg_n_79),
        .O(product_negative_reg_i_6_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    product_negative_reg_i_7
       (.I0(product_reg_reg__0_n_63),
        .I1(product_reg_reg_n_80),
        .O(product_negative_reg_i_7_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    product_negative_reg_i_8
       (.I0(product_reg_reg__0_n_64),
        .I1(product_reg_reg_n_81),
        .O(product_negative_reg_i_8_n_0));
  LUT2 #(
    .INIT(4'h6)) 
    product_negative_reg_i_9
       (.I0(product_reg_reg__0_n_65),
        .I1(product_reg_reg_n_82),
        .O(product_negative_reg_i_9_n_0));
  FDRE #(
    .INIT(1'b0)) 
    product_negative_reg_reg
       (.C(clk),
        .CE(magnitude_reg),
        .D(p_2_out0),
        .Q(product_negative_reg),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 product_negative_reg_reg_i_1
       (.CI(product_negative_reg_reg_i_2_n_0),
        .CO(NLW_product_negative_reg_reg_i_1_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,product_reg_reg__0_n_60,product_reg_reg__0_n_61,product_reg_reg__0_n_62}),
        .O({p_2_out0,product_negative_reg_reg_i_1_n_5,product_negative_reg_reg_i_1_n_6,product_negative_reg_reg_i_1_n_7}),
        .S({product_negative_reg_i_3_n_0,product_negative_reg_i_4_n_0,product_negative_reg_i_5_n_0,product_negative_reg_i_6_n_0}));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 product_negative_reg_reg_i_2
       (.CI(\magnitude_reg_reg[55]_i_6_n_0 ),
        .CO({product_negative_reg_reg_i_2_n_0,NLW_product_negative_reg_reg_i_2_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({product_reg_reg__0_n_63,product_reg_reg__0_n_64,product_reg_reg__0_n_65,product_reg_reg__0_n_66}),
        .O({product_negative_reg_reg_i_2_n_4,product_negative_reg_reg_i_2_n_5,product_negative_reg_reg_i_2_n_6,product_negative_reg_reg_i_2_n_7}),
        .S({product_negative_reg_i_7_n_0,product_negative_reg_i_8_n_0,product_negative_reg_i_9_n_0,product_negative_reg_i_10_n_0}));
  LUT3 #(
    .INIT(8'h04)) 
    \product_reg[16]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .O(\product_reg[16]_i_1_n_0 ));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 15x15 4}}" *) 
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
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
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    product_reg_reg
       (.A({\acc[31]_i_2_psdsp_n ,\acc[31]_i_2_psdsp_n ,\acc[31]_i_2_psdsp_n ,\acc[31]_i_2_psdsp_n ,\acc[31]_i_2_psdsp_n ,\acc[31]_i_2_psdsp_n ,\acc[31]_i_2_psdsp_n ,\acc[31]_i_2_psdsp_n ,\acc[31]_i_2_psdsp_n ,\acc[31]_i_2_psdsp_n ,\acc[31]_i_2_psdsp_n ,\acc[31]_i_2_psdsp_n ,\acc[31]_i_2_psdsp_n ,\acc[31]_i_2_psdsp_n ,\acc[31]_i_2_psdsp_n ,\acc[31]_i_2_psdsp_n ,\acc[30]_i_1_psdsp_n ,\acc[29]_i_1_psdsp_n ,\acc[28]_i_1_psdsp_n ,\acc[27]_i_1_psdsp_n ,\acc[26]_i_1_psdsp_n ,\acc[25]_i_1_psdsp_n ,\acc[24]_i_1_psdsp_n ,\acc[23]_i_1_psdsp_n ,\acc[22]_i_1_psdsp_n ,\acc[21]_i_1_psdsp_n ,\acc[20]_i_1_psdsp_n ,\acc[19]_i_1_psdsp_n ,\acc[18]_i_1_psdsp_n ,\acc[17]_i_1_psdsp_n }),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_product_reg_reg_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,multiplier_in[25:17]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_product_reg_reg_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_product_reg_reg_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_product_reg_reg_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(\last_count[7]_i_1_n_0 ),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(\product_reg[16]_i_1_n_0 ),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_product_reg_reg_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_product_reg_reg_OVERFLOW_UNCONNECTED),
        .P({NLW_product_reg_reg_P_UNCONNECTED[47:30],product_reg_reg_n_76,product_reg_reg_n_77,product_reg_reg_n_78,product_reg_reg_n_79,product_reg_reg_n_80,product_reg_reg_n_81,product_reg_reg_n_82,product_reg_reg_n_83,product_reg_reg_n_84,product_reg_reg_n_85,product_reg_reg_n_86,product_reg_reg_n_87,product_reg_reg_n_88,product_reg_reg_n_89,product_reg_reg_n_90,product_reg_reg_n_91,product_reg_reg_n_92,product_reg_reg_n_93,product_reg_reg_n_94,product_reg_reg_n_95,product_reg_reg_n_96,product_reg_reg_n_97,product_reg_reg_n_98,product_reg_reg_n_99,product_reg_reg_n_100,product_reg_reg_n_101,product_reg_reg_n_102,product_reg_reg_n_103,product_reg_reg_n_104,product_reg_reg_n_105}),
        .PATTERNBDETECT(NLW_product_reg_reg_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_product_reg_reg_PATTERNDETECT_UNCONNECTED),
        .PCIN({wide_product_n_106,wide_product_n_107,wide_product_n_108,wide_product_n_109,wide_product_n_110,wide_product_n_111,wide_product_n_112,wide_product_n_113,wide_product_n_114,wide_product_n_115,wide_product_n_116,wide_product_n_117,wide_product_n_118,wide_product_n_119,wide_product_n_120,wide_product_n_121,wide_product_n_122,wide_product_n_123,wide_product_n_124,wide_product_n_125,wide_product_n_126,wide_product_n_127,wide_product_n_128,wide_product_n_129,wide_product_n_130,wide_product_n_131,wide_product_n_132,wide_product_n_133,wide_product_n_134,wide_product_n_135,wide_product_n_136,wide_product_n_137,wide_product_n_138,wide_product_n_139,wide_product_n_140,wide_product_n_141,wide_product_n_142,wide_product_n_143,wide_product_n_144,wide_product_n_145,wide_product_n_146,wide_product_n_147,wide_product_n_148,wide_product_n_149,wide_product_n_150,wide_product_n_151,wide_product_n_152,wide_product_n_153}),
        .PCOUT(NLW_product_reg_reg_PCOUT_UNCONNECTED[47:0]),
        .RSTA(rst),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(rst),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(rst),
        .UNDERFLOW(NLW_product_reg_reg_UNDERFLOW_UNCONNECTED));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[0] 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product_n_105),
        .Q(\product_reg_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[0]__0 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product__0_n_105),
        .Q(\product_reg_reg[0]__0_n_0 ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[10] 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product_n_95),
        .Q(\product_reg_reg_n_0_[10] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[10]__0 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product__0_n_95),
        .Q(\product_reg_reg[10]__0_n_0 ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[11] 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product_n_94),
        .Q(\product_reg_reg_n_0_[11] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[11]__0 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product__0_n_94),
        .Q(\product_reg_reg[11]__0_n_0 ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[12] 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product_n_93),
        .Q(\product_reg_reg_n_0_[12] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[12]__0 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product__0_n_93),
        .Q(\product_reg_reg[12]__0_n_0 ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[13] 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product_n_92),
        .Q(\product_reg_reg_n_0_[13] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[13]__0 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product__0_n_92),
        .Q(\product_reg_reg[13]__0_n_0 ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[14] 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product_n_91),
        .Q(\product_reg_reg_n_0_[14] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[14]__0 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product__0_n_91),
        .Q(\product_reg_reg[14]__0_n_0 ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[15] 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product_n_90),
        .Q(\product_reg_reg_n_0_[15] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[15]__0 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product__0_n_90),
        .Q(\product_reg_reg[15]__0_n_0 ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[16] 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product_n_89),
        .Q(\product_reg_reg_n_0_[16] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[16]__0 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product__0_n_89),
        .Q(\product_reg_reg[16]__0_n_0 ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[1] 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product_n_104),
        .Q(\product_reg_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[1]__0 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product__0_n_104),
        .Q(\product_reg_reg[1]__0_n_0 ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[2] 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product_n_103),
        .Q(\product_reg_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[2]__0 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product__0_n_103),
        .Q(\product_reg_reg[2]__0_n_0 ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[3] 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product_n_102),
        .Q(\product_reg_reg_n_0_[3] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[3]__0 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product__0_n_102),
        .Q(\product_reg_reg[3]__0_n_0 ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[4] 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product_n_101),
        .Q(\product_reg_reg_n_0_[4] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[4]__0 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product__0_n_101),
        .Q(\product_reg_reg[4]__0_n_0 ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[5] 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product_n_100),
        .Q(\product_reg_reg_n_0_[5] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[5]__0 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product__0_n_100),
        .Q(\product_reg_reg[5]__0_n_0 ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[6] 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product_n_99),
        .Q(\product_reg_reg_n_0_[6] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[6]__0 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product__0_n_99),
        .Q(\product_reg_reg[6]__0_n_0 ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[7] 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product_n_98),
        .Q(\product_reg_reg_n_0_[7] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[7]__0 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product__0_n_98),
        .Q(\product_reg_reg[7]__0_n_0 ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[8] 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product_n_97),
        .Q(\product_reg_reg_n_0_[8] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[8]__0 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product__0_n_97),
        .Q(\product_reg_reg[8]__0_n_0 ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[9] 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product_n_96),
        .Q(\product_reg_reg_n_0_[9] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \product_reg_reg[9]__0 
       (.C(clk),
        .CE(\product_reg[16]_i_1_n_0 ),
        .D(wide_product__0_n_96),
        .Q(\product_reg_reg[9]__0_n_0 ),
        .R(rst));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x15 4}}" *) 
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
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
    .PREG(1),
    .SEL_MASK("MASK"),
    .SEL_PATTERN("PATTERN"),
    .USE_DPORT("FALSE"),
    .USE_MULT("MULTIPLY"),
    .USE_PATTERN_DETECT("NO_PATDET"),
    .USE_SIMD("ONE48")) 
    product_reg_reg__0
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\acc[16]_i_1_psdsp_n ,\acc[15]_i_1_psdsp_n ,\acc[14]_i_1_psdsp_n ,\acc[13]_i_1_psdsp_n ,\acc[12]_i_1_psdsp_n ,\acc[11]_i_1_psdsp_n ,\acc[10]_i_1_psdsp_n ,\acc[9]_i_1_psdsp_n ,\acc[8]_i_1_psdsp_n ,\acc[7]_i_1_psdsp_n ,\acc[6]_i_1_psdsp_n ,\acc[5]_i_1_psdsp_n ,\acc[4]_i_1_psdsp_n ,\acc[3]_i_1_psdsp_n ,\acc[2]_i_1_psdsp_n ,\acc[1]_i_1_psdsp_n ,\acc[0]_i_1_psdsp_n }),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_product_reg_reg__0_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,multiplier_in[25:17]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_product_reg_reg__0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_product_reg_reg__0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_product_reg_reg__0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(\last_count[7]_i_1_n_0 ),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(\product_reg[16]_i_1_n_0 ),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_product_reg_reg__0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b1,1'b0,1'b1,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_product_reg_reg__0_OVERFLOW_UNCONNECTED),
        .P({NLW_product_reg_reg__0_P_UNCONNECTED[47],product_reg_reg__0_n_59,product_reg_reg__0_n_60,product_reg_reg__0_n_61,product_reg_reg__0_n_62,product_reg_reg__0_n_63,product_reg_reg__0_n_64,product_reg_reg__0_n_65,product_reg_reg__0_n_66,product_reg_reg__0_n_67,product_reg_reg__0_n_68,product_reg_reg__0_n_69,product_reg_reg__0_n_70,product_reg_reg__0_n_71,product_reg_reg__0_n_72,product_reg_reg__0_n_73,product_reg_reg__0_n_74,product_reg_reg__0_n_75,product_reg_reg__0_n_76,product_reg_reg__0_n_77,product_reg_reg__0_n_78,product_reg_reg__0_n_79,product_reg_reg__0_n_80,product_reg_reg__0_n_81,product_reg_reg__0_n_82,product_reg_reg__0_n_83,product_reg_reg__0_n_84,product_reg_reg__0_n_85,product_reg_reg__0_n_86,product_reg_reg__0_n_87,product_reg_reg__0_n_88,product_reg_reg__0_n_89,product_reg_reg__0_n_90,product_reg_reg__0_n_91,product_reg_reg__0_n_92,product_reg_reg__0_n_93,product_reg_reg__0_n_94,product_reg_reg__0_n_95,product_reg_reg__0_n_96,product_reg_reg__0_n_97,product_reg_reg__0_n_98,product_reg_reg__0_n_99,product_reg_reg__0_n_100,product_reg_reg__0_n_101,product_reg_reg__0_n_102,product_reg_reg__0_n_103,product_reg_reg__0_n_104,product_reg_reg__0_n_105}),
        .PATTERNBDETECT(NLW_product_reg_reg__0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_product_reg_reg__0_PATTERNDETECT_UNCONNECTED),
        .PCIN({wide_product__0_n_106,wide_product__0_n_107,wide_product__0_n_108,wide_product__0_n_109,wide_product__0_n_110,wide_product__0_n_111,wide_product__0_n_112,wide_product__0_n_113,wide_product__0_n_114,wide_product__0_n_115,wide_product__0_n_116,wide_product__0_n_117,wide_product__0_n_118,wide_product__0_n_119,wide_product__0_n_120,wide_product__0_n_121,wide_product__0_n_122,wide_product__0_n_123,wide_product__0_n_124,wide_product__0_n_125,wide_product__0_n_126,wide_product__0_n_127,wide_product__0_n_128,wide_product__0_n_129,wide_product__0_n_130,wide_product__0_n_131,wide_product__0_n_132,wide_product__0_n_133,wide_product__0_n_134,wide_product__0_n_135,wide_product__0_n_136,wide_product__0_n_137,wide_product__0_n_138,wide_product__0_n_139,wide_product__0_n_140,wide_product__0_n_141,wide_product__0_n_142,wide_product__0_n_143,wide_product__0_n_144,wide_product__0_n_145,wide_product__0_n_146,wide_product__0_n_147,wide_product__0_n_148,wide_product__0_n_149,wide_product__0_n_150,wide_product__0_n_151,wide_product__0_n_152,wide_product__0_n_153}),
        .PCOUT(NLW_product_reg_reg__0_PCOUT_UNCONNECTED[47:0]),
        .RSTA(rst),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(rst),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(rst),
        .UNDERFLOW(NLW_product_reg_reg__0_UNDERFLOW_UNCONNECTED));
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[0]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[31] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[0] ),
        .O(\quotient_reg[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[10]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[41] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[10] ),
        .O(p_0_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[11]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[42] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[11] ),
        .O(p_0_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[12]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[43] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[12] ),
        .O(p_0_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[13]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[44] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[13] ),
        .O(p_0_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[14]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[45] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[14] ),
        .O(p_0_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[15]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[46] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[15] ),
        .O(p_0_in[15]));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[16]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[47] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[16] ),
        .O(p_0_in[16]));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[17]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[48] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[17] ),
        .O(p_0_in[17]));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[18]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[49] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[18] ),
        .O(p_0_in[18]));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[19]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[50] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[19] ),
        .O(p_0_in[19]));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[1]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[32] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[1] ),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[20]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[51] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[20] ),
        .O(p_0_in[20]));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[21]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[52] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[21] ),
        .O(p_0_in[21]));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[22]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[53] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[22] ),
        .O(p_0_in[22]));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[23]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[54] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[23] ),
        .O(p_0_in[23]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[24]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[55] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[24] ),
        .O(p_0_in[24]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[25]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[56] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[25] ),
        .O(p_0_in[25]));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[26]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[57] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[26] ),
        .O(p_0_in[26]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[27]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[58] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[27] ),
        .O(p_0_in[27]));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[28]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[59] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[28] ),
        .O(p_0_in[28]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[29]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[60] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[29] ),
        .O(p_0_in[29]));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[2]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[33] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[2] ),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[30]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[61] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[30] ),
        .O(p_0_in[30]));
  (* SOFT_HLUTNM = "soft_lutpair66" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[31]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[62] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[31] ),
        .O(p_0_in[31]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[32]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[63] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[32] ),
        .O(p_0_in[32]));
  (* SOFT_HLUTNM = "soft_lutpair131" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[33]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[33] ),
        .I1(shift_reg),
        .O(p_0_in[33]));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[34]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[34] ),
        .I1(shift_reg),
        .O(p_0_in[34]));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[35]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[35] ),
        .I1(shift_reg),
        .O(p_0_in[35]));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[36]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[36] ),
        .I1(shift_reg),
        .O(p_0_in[36]));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[37]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[37] ),
        .I1(shift_reg),
        .O(p_0_in[37]));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[38]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[38] ),
        .I1(shift_reg),
        .O(p_0_in[38]));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[39]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[39] ),
        .I1(shift_reg),
        .O(p_0_in[39]));
  (* SOFT_HLUTNM = "soft_lutpair130" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[3]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[34] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[3] ),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[40]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[40] ),
        .I1(shift_reg),
        .O(p_0_in[40]));
  (* SOFT_HLUTNM = "soft_lutpair123" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[41]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[41] ),
        .I1(shift_reg),
        .O(p_0_in[41]));
  (* SOFT_HLUTNM = "soft_lutpair122" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[42]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[42] ),
        .I1(shift_reg),
        .O(p_0_in[42]));
  (* SOFT_HLUTNM = "soft_lutpair121" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[43]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[43] ),
        .I1(shift_reg),
        .O(p_0_in[43]));
  (* SOFT_HLUTNM = "soft_lutpair120" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[44]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[44] ),
        .I1(shift_reg),
        .O(p_0_in[44]));
  (* SOFT_HLUTNM = "soft_lutpair119" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[45]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[45] ),
        .I1(shift_reg),
        .O(p_0_in[45]));
  (* SOFT_HLUTNM = "soft_lutpair118" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[46]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[46] ),
        .I1(shift_reg),
        .O(p_0_in[46]));
  (* SOFT_HLUTNM = "soft_lutpair117" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[47]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[47] ),
        .I1(shift_reg),
        .O(p_0_in[47]));
  (* SOFT_HLUTNM = "soft_lutpair116" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[48]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[48] ),
        .I1(shift_reg),
        .O(p_0_in[48]));
  (* SOFT_HLUTNM = "soft_lutpair115" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[49]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[49] ),
        .I1(shift_reg),
        .O(p_0_in[49]));
  (* SOFT_HLUTNM = "soft_lutpair129" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[4]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[35] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[4] ),
        .O(p_0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair114" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[50]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[50] ),
        .I1(shift_reg),
        .O(p_0_in[50]));
  (* SOFT_HLUTNM = "soft_lutpair113" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[51]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[51] ),
        .I1(shift_reg),
        .O(p_0_in[51]));
  (* SOFT_HLUTNM = "soft_lutpair112" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[52]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[52] ),
        .I1(shift_reg),
        .O(p_0_in[52]));
  (* SOFT_HLUTNM = "soft_lutpair111" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[53]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[53] ),
        .I1(shift_reg),
        .O(p_0_in[53]));
  (* SOFT_HLUTNM = "soft_lutpair110" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[54]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[54] ),
        .I1(shift_reg),
        .O(p_0_in[54]));
  (* SOFT_HLUTNM = "soft_lutpair109" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[55]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[55] ),
        .I1(shift_reg),
        .O(p_0_in[55]));
  (* SOFT_HLUTNM = "soft_lutpair108" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[56]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[56] ),
        .I1(shift_reg),
        .O(p_0_in[56]));
  (* SOFT_HLUTNM = "soft_lutpair107" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[57]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[57] ),
        .I1(shift_reg),
        .O(p_0_in[57]));
  (* SOFT_HLUTNM = "soft_lutpair106" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[58]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[58] ),
        .I1(shift_reg),
        .O(p_0_in[58]));
  (* SOFT_HLUTNM = "soft_lutpair105" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[59]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[59] ),
        .I1(shift_reg),
        .O(p_0_in[59]));
  (* SOFT_HLUTNM = "soft_lutpair128" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[5]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[36] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[5] ),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair104" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[60]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[60] ),
        .I1(shift_reg),
        .O(p_0_in[60]));
  (* SOFT_HLUTNM = "soft_lutpair103" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[61]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[61] ),
        .I1(shift_reg),
        .O(p_0_in[61]));
  (* SOFT_HLUTNM = "soft_lutpair132" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[62]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[62] ),
        .I1(shift_reg),
        .O(p_0_in[62]));
  (* SOFT_HLUTNM = "soft_lutpair102" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \quotient_reg[63]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[63] ),
        .I1(shift_reg),
        .O(p_0_in[63]));
  (* SOFT_HLUTNM = "soft_lutpair127" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[6]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[37] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[6] ),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair126" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[7]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[38] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[7] ),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair125" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[8]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[39] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[8] ),
        .O(p_0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair124" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \quotient_reg[9]_i_1 
       (.I0(\magnitude_reg_reg_n_0_[40] ),
        .I1(shift_reg),
        .I2(\magnitude_reg_reg_n_0_[9] ),
        .O(p_0_in[9]));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[0] 
       (.C(clk),
        .CE(quotient_reg),
        .D(\quotient_reg[0]_i_1_n_0 ),
        .Q(\quotient_reg_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[10] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[10]),
        .Q(\quotient_reg_reg_n_0_[10] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[11] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[11]),
        .Q(\quotient_reg_reg_n_0_[11] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[12] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[12]),
        .Q(\quotient_reg_reg_n_0_[12] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[13] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[13]),
        .Q(\quotient_reg_reg_n_0_[13] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[14] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[14]),
        .Q(\quotient_reg_reg_n_0_[14] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[15] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[15]),
        .Q(\quotient_reg_reg_n_0_[15] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[16] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[16]),
        .Q(\quotient_reg_reg_n_0_[16] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[17] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[17]),
        .Q(\quotient_reg_reg_n_0_[17] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[18] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[18]),
        .Q(\quotient_reg_reg_n_0_[18] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[19] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[19]),
        .Q(\quotient_reg_reg_n_0_[19] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[1] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[1]),
        .Q(\quotient_reg_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[20] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[20]),
        .Q(\quotient_reg_reg_n_0_[20] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[21] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[21]),
        .Q(\quotient_reg_reg_n_0_[21] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[22] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[22]),
        .Q(\quotient_reg_reg_n_0_[22] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[23] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[23]),
        .Q(\quotient_reg_reg_n_0_[23] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[24] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[24]),
        .Q(\quotient_reg_reg_n_0_[24] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[25] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[25]),
        .Q(\quotient_reg_reg_n_0_[25] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[26] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[26]),
        .Q(\quotient_reg_reg_n_0_[26] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[27] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[27]),
        .Q(\quotient_reg_reg_n_0_[27] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[28] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[28]),
        .Q(\quotient_reg_reg_n_0_[28] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[29] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[29]),
        .Q(\quotient_reg_reg_n_0_[29] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[2] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[2]),
        .Q(\quotient_reg_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[30] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[30]),
        .Q(\quotient_reg_reg_n_0_[30] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[31] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[31]),
        .Q(\quotient_reg_reg_n_0_[31] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[32] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[32]),
        .Q(\quotient_reg_reg_n_0_[32] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[33] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[33]),
        .Q(\quotient_reg_reg_n_0_[33] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[34] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[34]),
        .Q(\quotient_reg_reg_n_0_[34] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[35] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[35]),
        .Q(\quotient_reg_reg_n_0_[35] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[36] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[36]),
        .Q(\quotient_reg_reg_n_0_[36] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[37] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[37]),
        .Q(\quotient_reg_reg_n_0_[37] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[38] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[38]),
        .Q(\quotient_reg_reg_n_0_[38] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[39] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[39]),
        .Q(\quotient_reg_reg_n_0_[39] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[3] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[3]),
        .Q(\quotient_reg_reg_n_0_[3] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[40] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[40]),
        .Q(\quotient_reg_reg_n_0_[40] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[41] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[41]),
        .Q(\quotient_reg_reg_n_0_[41] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[42] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[42]),
        .Q(\quotient_reg_reg_n_0_[42] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[43] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[43]),
        .Q(\quotient_reg_reg_n_0_[43] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[44] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[44]),
        .Q(\quotient_reg_reg_n_0_[44] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[45] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[45]),
        .Q(\quotient_reg_reg_n_0_[45] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[46] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[46]),
        .Q(\quotient_reg_reg_n_0_[46] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[47] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[47]),
        .Q(\quotient_reg_reg_n_0_[47] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[48] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[48]),
        .Q(\quotient_reg_reg_n_0_[48] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[49] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[49]),
        .Q(\quotient_reg_reg_n_0_[49] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[4] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[4]),
        .Q(\quotient_reg_reg_n_0_[4] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[50] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[50]),
        .Q(\quotient_reg_reg_n_0_[50] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[51] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[51]),
        .Q(\quotient_reg_reg_n_0_[51] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[52] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[52]),
        .Q(\quotient_reg_reg_n_0_[52] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[53] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[53]),
        .Q(\quotient_reg_reg_n_0_[53] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[54] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[54]),
        .Q(\quotient_reg_reg_n_0_[54] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[55] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[55]),
        .Q(\quotient_reg_reg_n_0_[55] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[56] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[56]),
        .Q(\quotient_reg_reg_n_0_[56] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[57] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[57]),
        .Q(\quotient_reg_reg_n_0_[57] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[58] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[58]),
        .Q(\quotient_reg_reg_n_0_[58] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[59] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[59]),
        .Q(\quotient_reg_reg_n_0_[59] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[5] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[5]),
        .Q(\quotient_reg_reg_n_0_[5] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[60] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[60]),
        .Q(\quotient_reg_reg_n_0_[60] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[61] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[61]),
        .Q(\quotient_reg_reg_n_0_[61] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[62] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[62]),
        .Q(\quotient_reg_reg_n_0_[62] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[63] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[63]),
        .Q(\quotient_reg_reg_n_0_[63] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[6] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[6]),
        .Q(\quotient_reg_reg_n_0_[6] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[7] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[7]),
        .Q(\quotient_reg_reg_n_0_[7] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[8] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[8]),
        .Q(\quotient_reg_reg_n_0_[8] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \quotient_reg_reg[9] 
       (.C(clk),
        .CE(quotient_reg),
        .D(p_0_in[9]),
        .Q(\quotient_reg_reg_n_0_[9] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    relu_reg_reg
       (.C(clk),
        .CE(\last_count[7]_i_1_n_0 ),
        .D(relu_in),
        .Q(relu_reg_reg_n_0),
        .R(rst));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT5 #(
    .INIT(32'hFF02FFFA)) 
    \result[0]_i_1 
       (.I0(\rounded_reg_reg_n_0_[0] ),
        .I1(\rounded_reg_reg_n_0_[7] ),
        .I2(clipped2),
        .I3(clipped1),
        .I4(relu_reg_reg_n_0),
        .O(activated[0]));
  LUT5 #(
    .INIT(32'hFF02FF0A)) 
    \result[1]_i_1 
       (.I0(\rounded_reg_reg_n_0_[1] ),
        .I1(\rounded_reg_reg_n_0_[7] ),
        .I2(clipped2),
        .I3(clipped1),
        .I4(relu_reg_reg_n_0),
        .O(activated[1]));
  LUT5 #(
    .INIT(32'hFF02FF0A)) 
    \result[2]_i_1 
       (.I0(\rounded_reg_reg_n_0_[2] ),
        .I1(\rounded_reg_reg_n_0_[7] ),
        .I2(clipped2),
        .I3(clipped1),
        .I4(relu_reg_reg_n_0),
        .O(activated[2]));
  LUT5 #(
    .INIT(32'hFF02FF0A)) 
    \result[3]_i_1 
       (.I0(\rounded_reg_reg_n_0_[3] ),
        .I1(\rounded_reg_reg_n_0_[7] ),
        .I2(clipped2),
        .I3(clipped1),
        .I4(relu_reg_reg_n_0),
        .O(activated[3]));
  LUT5 #(
    .INIT(32'hFF02FF0A)) 
    \result[4]_i_1 
       (.I0(\rounded_reg_reg_n_0_[4] ),
        .I1(\rounded_reg_reg_n_0_[7] ),
        .I2(clipped2),
        .I3(clipped1),
        .I4(relu_reg_reg_n_0),
        .O(activated[4]));
  LUT5 #(
    .INIT(32'hFF02FF0A)) 
    \result[5]_i_1 
       (.I0(\rounded_reg_reg_n_0_[5] ),
        .I1(\rounded_reg_reg_n_0_[7] ),
        .I2(clipped2),
        .I3(clipped1),
        .I4(relu_reg_reg_n_0),
        .O(activated[5]));
  LUT5 #(
    .INIT(32'hFF02FF0A)) 
    \result[6]_i_1 
       (.I0(\rounded_reg_reg_n_0_[6] ),
        .I1(\rounded_reg_reg_n_0_[7] ),
        .I2(clipped2),
        .I3(clipped1),
        .I4(relu_reg_reg_n_0),
        .O(activated[6]));
  LUT3 #(
    .INIT(8'h40)) 
    \result[7]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .O(\result[7]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_10 
       (.I0(\rounded_reg_reg_n_0_[62] ),
        .I1(\rounded_reg_reg_n_0_[63] ),
        .O(\result[7]_i_10_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_100 
       (.I0(\rounded_reg_reg_n_0_[26] ),
        .I1(\rounded_reg_reg_n_0_[27] ),
        .O(\result[7]_i_100_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_101 
       (.I0(\rounded_reg_reg_n_0_[24] ),
        .I1(\rounded_reg_reg_n_0_[25] ),
        .O(\result[7]_i_101_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_102 
       (.I0(\rounded_reg_reg_n_0_[22] ),
        .I1(\rounded_reg_reg_n_0_[23] ),
        .O(\result[7]_i_102_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_103 
       (.I0(\rounded_reg_reg_n_0_[28] ),
        .I1(\rounded_reg_reg_n_0_[29] ),
        .O(\result[7]_i_103_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_104 
       (.I0(\rounded_reg_reg_n_0_[26] ),
        .I1(\rounded_reg_reg_n_0_[27] ),
        .O(\result[7]_i_104_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_105 
       (.I0(\rounded_reg_reg_n_0_[24] ),
        .I1(\rounded_reg_reg_n_0_[25] ),
        .O(\result[7]_i_105_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_106 
       (.I0(\rounded_reg_reg_n_0_[22] ),
        .I1(\rounded_reg_reg_n_0_[23] ),
        .O(\result[7]_i_106_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_108 
       (.I0(\rounded_reg_reg_n_0_[14] ),
        .I1(\rounded_reg_reg_n_0_[15] ),
        .O(\result[7]_i_108_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_109 
       (.I0(\rounded_reg_reg_n_0_[12] ),
        .I1(\rounded_reg_reg_n_0_[13] ),
        .O(\result[7]_i_109_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_11 
       (.I0(\rounded_reg_reg_n_0_[60] ),
        .I1(\rounded_reg_reg_n_0_[61] ),
        .O(\result[7]_i_11_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_110 
       (.I0(\rounded_reg_reg_n_0_[10] ),
        .I1(\rounded_reg_reg_n_0_[11] ),
        .O(\result[7]_i_110_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_111 
       (.I0(\rounded_reg_reg_n_0_[8] ),
        .I1(\rounded_reg_reg_n_0_[9] ),
        .O(\result[7]_i_111_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_112 
       (.I0(\rounded_reg_reg_n_0_[14] ),
        .I1(\rounded_reg_reg_n_0_[15] ),
        .O(\result[7]_i_112_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_113 
       (.I0(\rounded_reg_reg_n_0_[12] ),
        .I1(\rounded_reg_reg_n_0_[13] ),
        .O(\result[7]_i_113_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_114 
       (.I0(\rounded_reg_reg_n_0_[10] ),
        .I1(\rounded_reg_reg_n_0_[11] ),
        .O(\result[7]_i_114_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_115 
       (.I0(\rounded_reg_reg_n_0_[8] ),
        .I1(\rounded_reg_reg_n_0_[9] ),
        .O(\result[7]_i_115_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_117 
       (.I0(\rounded_reg_reg_n_0_[20] ),
        .I1(\rounded_reg_reg_n_0_[21] ),
        .O(\result[7]_i_117_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_118 
       (.I0(\rounded_reg_reg_n_0_[18] ),
        .I1(\rounded_reg_reg_n_0_[19] ),
        .O(\result[7]_i_118_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_119 
       (.I0(\rounded_reg_reg_n_0_[16] ),
        .I1(\rounded_reg_reg_n_0_[17] ),
        .O(\result[7]_i_119_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_12 
       (.I0(\rounded_reg_reg_n_0_[58] ),
        .I1(\rounded_reg_reg_n_0_[59] ),
        .O(\result[7]_i_12_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_120 
       (.I0(\rounded_reg_reg_n_0_[14] ),
        .I1(\rounded_reg_reg_n_0_[15] ),
        .O(\result[7]_i_120_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_121 
       (.I0(\rounded_reg_reg_n_0_[20] ),
        .I1(\rounded_reg_reg_n_0_[21] ),
        .O(\result[7]_i_121_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_122 
       (.I0(\rounded_reg_reg_n_0_[18] ),
        .I1(\rounded_reg_reg_n_0_[19] ),
        .O(\result[7]_i_122_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_123 
       (.I0(\rounded_reg_reg_n_0_[16] ),
        .I1(\rounded_reg_reg_n_0_[17] ),
        .O(\result[7]_i_123_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_124 
       (.I0(\rounded_reg_reg_n_0_[14] ),
        .I1(\rounded_reg_reg_n_0_[15] ),
        .O(\result[7]_i_124_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \result[7]_i_125 
       (.I0(\rounded_reg_reg_n_0_[7] ),
        .O(\result[7]_i_125_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_126 
       (.I0(\rounded_reg_reg_n_0_[0] ),
        .I1(\rounded_reg_reg_n_0_[1] ),
        .O(\result[7]_i_126_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[7]_i_127 
       (.I0(\rounded_reg_reg_n_0_[7] ),
        .I1(\rounded_reg_reg_n_0_[6] ),
        .O(\result[7]_i_127_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_128 
       (.I0(\rounded_reg_reg_n_0_[4] ),
        .I1(\rounded_reg_reg_n_0_[5] ),
        .O(\result[7]_i_128_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_129 
       (.I0(\rounded_reg_reg_n_0_[2] ),
        .I1(\rounded_reg_reg_n_0_[3] ),
        .O(\result[7]_i_129_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_13 
       (.I0(\rounded_reg_reg_n_0_[56] ),
        .I1(\rounded_reg_reg_n_0_[57] ),
        .O(\result[7]_i_13_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[7]_i_130 
       (.I0(\rounded_reg_reg_n_0_[0] ),
        .I1(\rounded_reg_reg_n_0_[1] ),
        .O(\result[7]_i_130_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_131 
       (.I0(\rounded_reg_reg_n_0_[12] ),
        .I1(\rounded_reg_reg_n_0_[13] ),
        .O(\result[7]_i_131_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_132 
       (.I0(\rounded_reg_reg_n_0_[10] ),
        .I1(\rounded_reg_reg_n_0_[11] ),
        .O(\result[7]_i_132_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_133 
       (.I0(\rounded_reg_reg_n_0_[8] ),
        .I1(\rounded_reg_reg_n_0_[9] ),
        .O(\result[7]_i_133_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_134 
       (.I0(\rounded_reg_reg_n_0_[12] ),
        .I1(\rounded_reg_reg_n_0_[13] ),
        .O(\result[7]_i_134_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_135 
       (.I0(\rounded_reg_reg_n_0_[10] ),
        .I1(\rounded_reg_reg_n_0_[11] ),
        .O(\result[7]_i_135_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_136 
       (.I0(\rounded_reg_reg_n_0_[8] ),
        .I1(\rounded_reg_reg_n_0_[9] ),
        .O(\result[7]_i_136_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[7]_i_137 
       (.I0(\rounded_reg_reg_n_0_[6] ),
        .I1(\rounded_reg_reg_n_0_[7] ),
        .O(\result[7]_i_137_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[7]_i_15 
       (.I0(\rounded_reg_reg_n_0_[62] ),
        .I1(\rounded_reg_reg_n_0_[63] ),
        .O(\result[7]_i_15_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_16 
       (.I0(\rounded_reg_reg_n_0_[62] ),
        .I1(\rounded_reg_reg_n_0_[63] ),
        .O(\result[7]_i_16_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_18 
       (.I0(\rounded_reg_reg_n_0_[54] ),
        .I1(\rounded_reg_reg_n_0_[55] ),
        .O(\result[7]_i_18_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_19 
       (.I0(\rounded_reg_reg_n_0_[52] ),
        .I1(\rounded_reg_reg_n_0_[53] ),
        .O(\result[7]_i_19_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair62" *) 
  LUT4 #(
    .INIT(16'h000E)) 
    \result[7]_i_2 
       (.I0(\rounded_reg_reg_n_0_[7] ),
        .I1(clipped2),
        .I2(clipped1),
        .I3(relu_reg_reg_n_0),
        .O(activated[7]));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_20 
       (.I0(\rounded_reg_reg_n_0_[50] ),
        .I1(\rounded_reg_reg_n_0_[51] ),
        .O(\result[7]_i_20_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_21 
       (.I0(\rounded_reg_reg_n_0_[48] ),
        .I1(\rounded_reg_reg_n_0_[49] ),
        .O(\result[7]_i_21_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_22 
       (.I0(\rounded_reg_reg_n_0_[54] ),
        .I1(\rounded_reg_reg_n_0_[55] ),
        .O(\result[7]_i_22_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_23 
       (.I0(\rounded_reg_reg_n_0_[52] ),
        .I1(\rounded_reg_reg_n_0_[53] ),
        .O(\result[7]_i_23_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_24 
       (.I0(\rounded_reg_reg_n_0_[50] ),
        .I1(\rounded_reg_reg_n_0_[51] ),
        .O(\result[7]_i_24_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_25 
       (.I0(\rounded_reg_reg_n_0_[48] ),
        .I1(\rounded_reg_reg_n_0_[49] ),
        .O(\result[7]_i_25_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_27 
       (.I0(\rounded_reg_reg_n_0_[60] ),
        .I1(\rounded_reg_reg_n_0_[61] ),
        .O(\result[7]_i_27_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_28 
       (.I0(\rounded_reg_reg_n_0_[58] ),
        .I1(\rounded_reg_reg_n_0_[59] ),
        .O(\result[7]_i_28_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_29 
       (.I0(\rounded_reg_reg_n_0_[56] ),
        .I1(\rounded_reg_reg_n_0_[57] ),
        .O(\result[7]_i_29_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_30 
       (.I0(\rounded_reg_reg_n_0_[54] ),
        .I1(\rounded_reg_reg_n_0_[55] ),
        .O(\result[7]_i_30_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_31 
       (.I0(\rounded_reg_reg_n_0_[60] ),
        .I1(\rounded_reg_reg_n_0_[61] ),
        .O(\result[7]_i_31_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_32 
       (.I0(\rounded_reg_reg_n_0_[58] ),
        .I1(\rounded_reg_reg_n_0_[59] ),
        .O(\result[7]_i_32_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_33 
       (.I0(\rounded_reg_reg_n_0_[56] ),
        .I1(\rounded_reg_reg_n_0_[57] ),
        .O(\result[7]_i_33_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_34 
       (.I0(\rounded_reg_reg_n_0_[54] ),
        .I1(\rounded_reg_reg_n_0_[55] ),
        .O(\result[7]_i_34_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_36 
       (.I0(\rounded_reg_reg_n_0_[46] ),
        .I1(\rounded_reg_reg_n_0_[47] ),
        .O(\result[7]_i_36_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_37 
       (.I0(\rounded_reg_reg_n_0_[44] ),
        .I1(\rounded_reg_reg_n_0_[45] ),
        .O(\result[7]_i_37_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_38 
       (.I0(\rounded_reg_reg_n_0_[42] ),
        .I1(\rounded_reg_reg_n_0_[43] ),
        .O(\result[7]_i_38_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_39 
       (.I0(\rounded_reg_reg_n_0_[40] ),
        .I1(\rounded_reg_reg_n_0_[41] ),
        .O(\result[7]_i_39_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_40 
       (.I0(\rounded_reg_reg_n_0_[46] ),
        .I1(\rounded_reg_reg_n_0_[47] ),
        .O(\result[7]_i_40_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_41 
       (.I0(\rounded_reg_reg_n_0_[44] ),
        .I1(\rounded_reg_reg_n_0_[45] ),
        .O(\result[7]_i_41_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_42 
       (.I0(\rounded_reg_reg_n_0_[42] ),
        .I1(\rounded_reg_reg_n_0_[43] ),
        .O(\result[7]_i_42_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_43 
       (.I0(\rounded_reg_reg_n_0_[40] ),
        .I1(\rounded_reg_reg_n_0_[41] ),
        .O(\result[7]_i_43_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_45 
       (.I0(\rounded_reg_reg_n_0_[52] ),
        .I1(\rounded_reg_reg_n_0_[53] ),
        .O(\result[7]_i_45_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_46 
       (.I0(\rounded_reg_reg_n_0_[50] ),
        .I1(\rounded_reg_reg_n_0_[51] ),
        .O(\result[7]_i_46_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_47 
       (.I0(\rounded_reg_reg_n_0_[48] ),
        .I1(\rounded_reg_reg_n_0_[49] ),
        .O(\result[7]_i_47_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_48 
       (.I0(\rounded_reg_reg_n_0_[46] ),
        .I1(\rounded_reg_reg_n_0_[47] ),
        .O(\result[7]_i_48_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_49 
       (.I0(\rounded_reg_reg_n_0_[52] ),
        .I1(\rounded_reg_reg_n_0_[53] ),
        .O(\result[7]_i_49_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_50 
       (.I0(\rounded_reg_reg_n_0_[50] ),
        .I1(\rounded_reg_reg_n_0_[51] ),
        .O(\result[7]_i_50_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_51 
       (.I0(\rounded_reg_reg_n_0_[48] ),
        .I1(\rounded_reg_reg_n_0_[49] ),
        .O(\result[7]_i_51_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_52 
       (.I0(\rounded_reg_reg_n_0_[46] ),
        .I1(\rounded_reg_reg_n_0_[47] ),
        .O(\result[7]_i_52_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_54 
       (.I0(\rounded_reg_reg_n_0_[38] ),
        .I1(\rounded_reg_reg_n_0_[39] ),
        .O(\result[7]_i_54_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_55 
       (.I0(\rounded_reg_reg_n_0_[36] ),
        .I1(\rounded_reg_reg_n_0_[37] ),
        .O(\result[7]_i_55_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_56 
       (.I0(\rounded_reg_reg_n_0_[34] ),
        .I1(\rounded_reg_reg_n_0_[35] ),
        .O(\result[7]_i_56_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_57 
       (.I0(\rounded_reg_reg_n_0_[32] ),
        .I1(\rounded_reg_reg_n_0_[33] ),
        .O(\result[7]_i_57_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_58 
       (.I0(\rounded_reg_reg_n_0_[38] ),
        .I1(\rounded_reg_reg_n_0_[39] ),
        .O(\result[7]_i_58_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_59 
       (.I0(\rounded_reg_reg_n_0_[36] ),
        .I1(\rounded_reg_reg_n_0_[37] ),
        .O(\result[7]_i_59_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \result[7]_i_6 
       (.I0(\rounded_reg_reg_n_0_[63] ),
        .I1(\rounded_reg_reg_n_0_[62] ),
        .O(\result[7]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_60 
       (.I0(\rounded_reg_reg_n_0_[34] ),
        .I1(\rounded_reg_reg_n_0_[35] ),
        .O(\result[7]_i_60_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_61 
       (.I0(\rounded_reg_reg_n_0_[32] ),
        .I1(\rounded_reg_reg_n_0_[33] ),
        .O(\result[7]_i_61_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_63 
       (.I0(\rounded_reg_reg_n_0_[44] ),
        .I1(\rounded_reg_reg_n_0_[45] ),
        .O(\result[7]_i_63_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_64 
       (.I0(\rounded_reg_reg_n_0_[42] ),
        .I1(\rounded_reg_reg_n_0_[43] ),
        .O(\result[7]_i_64_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_65 
       (.I0(\rounded_reg_reg_n_0_[40] ),
        .I1(\rounded_reg_reg_n_0_[41] ),
        .O(\result[7]_i_65_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_66 
       (.I0(\rounded_reg_reg_n_0_[38] ),
        .I1(\rounded_reg_reg_n_0_[39] ),
        .O(\result[7]_i_66_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_67 
       (.I0(\rounded_reg_reg_n_0_[44] ),
        .I1(\rounded_reg_reg_n_0_[45] ),
        .O(\result[7]_i_67_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_68 
       (.I0(\rounded_reg_reg_n_0_[42] ),
        .I1(\rounded_reg_reg_n_0_[43] ),
        .O(\result[7]_i_68_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_69 
       (.I0(\rounded_reg_reg_n_0_[40] ),
        .I1(\rounded_reg_reg_n_0_[41] ),
        .O(\result[7]_i_69_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_7 
       (.I0(\rounded_reg_reg_n_0_[60] ),
        .I1(\rounded_reg_reg_n_0_[61] ),
        .O(\result[7]_i_7_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_70 
       (.I0(\rounded_reg_reg_n_0_[38] ),
        .I1(\rounded_reg_reg_n_0_[39] ),
        .O(\result[7]_i_70_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_72 
       (.I0(\rounded_reg_reg_n_0_[30] ),
        .I1(\rounded_reg_reg_n_0_[31] ),
        .O(\result[7]_i_72_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_73 
       (.I0(\rounded_reg_reg_n_0_[28] ),
        .I1(\rounded_reg_reg_n_0_[29] ),
        .O(\result[7]_i_73_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_74 
       (.I0(\rounded_reg_reg_n_0_[26] ),
        .I1(\rounded_reg_reg_n_0_[27] ),
        .O(\result[7]_i_74_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_75 
       (.I0(\rounded_reg_reg_n_0_[24] ),
        .I1(\rounded_reg_reg_n_0_[25] ),
        .O(\result[7]_i_75_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_76 
       (.I0(\rounded_reg_reg_n_0_[30] ),
        .I1(\rounded_reg_reg_n_0_[31] ),
        .O(\result[7]_i_76_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_77 
       (.I0(\rounded_reg_reg_n_0_[28] ),
        .I1(\rounded_reg_reg_n_0_[29] ),
        .O(\result[7]_i_77_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_78 
       (.I0(\rounded_reg_reg_n_0_[26] ),
        .I1(\rounded_reg_reg_n_0_[27] ),
        .O(\result[7]_i_78_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_79 
       (.I0(\rounded_reg_reg_n_0_[24] ),
        .I1(\rounded_reg_reg_n_0_[25] ),
        .O(\result[7]_i_79_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_8 
       (.I0(\rounded_reg_reg_n_0_[58] ),
        .I1(\rounded_reg_reg_n_0_[59] ),
        .O(\result[7]_i_8_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_81 
       (.I0(\rounded_reg_reg_n_0_[36] ),
        .I1(\rounded_reg_reg_n_0_[37] ),
        .O(\result[7]_i_81_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_82 
       (.I0(\rounded_reg_reg_n_0_[34] ),
        .I1(\rounded_reg_reg_n_0_[35] ),
        .O(\result[7]_i_82_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_83 
       (.I0(\rounded_reg_reg_n_0_[32] ),
        .I1(\rounded_reg_reg_n_0_[33] ),
        .O(\result[7]_i_83_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_84 
       (.I0(\rounded_reg_reg_n_0_[30] ),
        .I1(\rounded_reg_reg_n_0_[31] ),
        .O(\result[7]_i_84_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_85 
       (.I0(\rounded_reg_reg_n_0_[36] ),
        .I1(\rounded_reg_reg_n_0_[37] ),
        .O(\result[7]_i_85_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_86 
       (.I0(\rounded_reg_reg_n_0_[34] ),
        .I1(\rounded_reg_reg_n_0_[35] ),
        .O(\result[7]_i_86_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_87 
       (.I0(\rounded_reg_reg_n_0_[32] ),
        .I1(\rounded_reg_reg_n_0_[33] ),
        .O(\result[7]_i_87_n_0 ));
  LUT2 #(
    .INIT(4'h1)) 
    \result[7]_i_88 
       (.I0(\rounded_reg_reg_n_0_[30] ),
        .I1(\rounded_reg_reg_n_0_[31] ),
        .O(\result[7]_i_88_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_9 
       (.I0(\rounded_reg_reg_n_0_[56] ),
        .I1(\rounded_reg_reg_n_0_[57] ),
        .O(\result[7]_i_9_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_90 
       (.I0(\rounded_reg_reg_n_0_[22] ),
        .I1(\rounded_reg_reg_n_0_[23] ),
        .O(\result[7]_i_90_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_91 
       (.I0(\rounded_reg_reg_n_0_[20] ),
        .I1(\rounded_reg_reg_n_0_[21] ),
        .O(\result[7]_i_91_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_92 
       (.I0(\rounded_reg_reg_n_0_[18] ),
        .I1(\rounded_reg_reg_n_0_[19] ),
        .O(\result[7]_i_92_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \result[7]_i_93 
       (.I0(\rounded_reg_reg_n_0_[16] ),
        .I1(\rounded_reg_reg_n_0_[17] ),
        .O(\result[7]_i_93_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_94 
       (.I0(\rounded_reg_reg_n_0_[22] ),
        .I1(\rounded_reg_reg_n_0_[23] ),
        .O(\result[7]_i_94_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_95 
       (.I0(\rounded_reg_reg_n_0_[20] ),
        .I1(\rounded_reg_reg_n_0_[21] ),
        .O(\result[7]_i_95_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_96 
       (.I0(\rounded_reg_reg_n_0_[18] ),
        .I1(\rounded_reg_reg_n_0_[19] ),
        .O(\result[7]_i_96_n_0 ));
  LUT2 #(
    .INIT(4'h8)) 
    \result[7]_i_97 
       (.I0(\rounded_reg_reg_n_0_[16] ),
        .I1(\rounded_reg_reg_n_0_[17] ),
        .O(\result[7]_i_97_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \result[7]_i_99 
       (.I0(\rounded_reg_reg_n_0_[28] ),
        .I1(\rounded_reg_reg_n_0_[29] ),
        .O(\result[7]_i_99_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[0] 
       (.C(clk),
        .CE(\result[7]_i_1_n_0 ),
        .D(activated[0]),
        .Q(result[0]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[1] 
       (.C(clk),
        .CE(\result[7]_i_1_n_0 ),
        .D(activated[1]),
        .Q(result[1]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[2] 
       (.C(clk),
        .CE(\result[7]_i_1_n_0 ),
        .D(activated[2]),
        .Q(result[2]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[3] 
       (.C(clk),
        .CE(\result[7]_i_1_n_0 ),
        .D(activated[3]),
        .Q(result[3]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[4] 
       (.C(clk),
        .CE(\result[7]_i_1_n_0 ),
        .D(activated[4]),
        .Q(result[4]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[5] 
       (.C(clk),
        .CE(\result[7]_i_1_n_0 ),
        .D(activated[5]),
        .Q(result[5]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[6] 
       (.C(clk),
        .CE(\result[7]_i_1_n_0 ),
        .D(activated[6]),
        .Q(result[6]),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \result_reg[7] 
       (.C(clk),
        .CE(\result[7]_i_1_n_0 ),
        .D(activated[7]),
        .Q(result[7]),
        .R(rst));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_107 
       (.CI(1'b0),
        .CO({\result_reg[7]_i_107_n_0 ,\NLW_result_reg[7]_i_107_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[7]_i_125_n_0 ,1'b0,1'b0,\result[7]_i_126_n_0 }),
        .O(\NLW_result_reg[7]_i_107_O_UNCONNECTED [3:0]),
        .S({\result[7]_i_127_n_0 ,\result[7]_i_128_n_0 ,\result[7]_i_129_n_0 ,\result[7]_i_130_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_116 
       (.CI(1'b0),
        .CO({\result_reg[7]_i_116_n_0 ,\NLW_result_reg[7]_i_116_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[7]_i_131_n_0 ,\result[7]_i_132_n_0 ,\result[7]_i_133_n_0 ,\rounded_reg_reg_n_0_[7] }),
        .O(\NLW_result_reg[7]_i_116_O_UNCONNECTED [3:0]),
        .S({\result[7]_i_134_n_0 ,\result[7]_i_135_n_0 ,\result[7]_i_136_n_0 ,\result[7]_i_137_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_14 
       (.CI(\result_reg[7]_i_26_n_0 ),
        .CO({\result_reg[7]_i_14_n_0 ,\NLW_result_reg[7]_i_14_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[7]_i_27_n_0 ,\result[7]_i_28_n_0 ,\result[7]_i_29_n_0 ,\result[7]_i_30_n_0 }),
        .O(\NLW_result_reg[7]_i_14_O_UNCONNECTED [3:0]),
        .S({\result[7]_i_31_n_0 ,\result[7]_i_32_n_0 ,\result[7]_i_33_n_0 ,\result[7]_i_34_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_17 
       (.CI(\result_reg[7]_i_35_n_0 ),
        .CO({\result_reg[7]_i_17_n_0 ,\NLW_result_reg[7]_i_17_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[7]_i_36_n_0 ,\result[7]_i_37_n_0 ,\result[7]_i_38_n_0 ,\result[7]_i_39_n_0 }),
        .O(\NLW_result_reg[7]_i_17_O_UNCONNECTED [3:0]),
        .S({\result[7]_i_40_n_0 ,\result[7]_i_41_n_0 ,\result[7]_i_42_n_0 ,\result[7]_i_43_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_26 
       (.CI(\result_reg[7]_i_44_n_0 ),
        .CO({\result_reg[7]_i_26_n_0 ,\NLW_result_reg[7]_i_26_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[7]_i_45_n_0 ,\result[7]_i_46_n_0 ,\result[7]_i_47_n_0 ,\result[7]_i_48_n_0 }),
        .O(\NLW_result_reg[7]_i_26_O_UNCONNECTED [3:0]),
        .S({\result[7]_i_49_n_0 ,\result[7]_i_50_n_0 ,\result[7]_i_51_n_0 ,\result[7]_i_52_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_3 
       (.CI(\result_reg[7]_i_5_n_0 ),
        .CO({clipped2,\NLW_result_reg[7]_i_3_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[7]_i_6_n_0 ,\result[7]_i_7_n_0 ,\result[7]_i_8_n_0 ,\result[7]_i_9_n_0 }),
        .O(\NLW_result_reg[7]_i_3_O_UNCONNECTED [3:0]),
        .S({\result[7]_i_10_n_0 ,\result[7]_i_11_n_0 ,\result[7]_i_12_n_0 ,\result[7]_i_13_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_35 
       (.CI(\result_reg[7]_i_53_n_0 ),
        .CO({\result_reg[7]_i_35_n_0 ,\NLW_result_reg[7]_i_35_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[7]_i_54_n_0 ,\result[7]_i_55_n_0 ,\result[7]_i_56_n_0 ,\result[7]_i_57_n_0 }),
        .O(\NLW_result_reg[7]_i_35_O_UNCONNECTED [3:0]),
        .S({\result[7]_i_58_n_0 ,\result[7]_i_59_n_0 ,\result[7]_i_60_n_0 ,\result[7]_i_61_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_4 
       (.CI(\result_reg[7]_i_14_n_0 ),
        .CO({\NLW_result_reg[7]_i_4_CO_UNCONNECTED [3:1],clipped1}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\result[7]_i_15_n_0 }),
        .O(\NLW_result_reg[7]_i_4_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,\result[7]_i_16_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_44 
       (.CI(\result_reg[7]_i_62_n_0 ),
        .CO({\result_reg[7]_i_44_n_0 ,\NLW_result_reg[7]_i_44_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[7]_i_63_n_0 ,\result[7]_i_64_n_0 ,\result[7]_i_65_n_0 ,\result[7]_i_66_n_0 }),
        .O(\NLW_result_reg[7]_i_44_O_UNCONNECTED [3:0]),
        .S({\result[7]_i_67_n_0 ,\result[7]_i_68_n_0 ,\result[7]_i_69_n_0 ,\result[7]_i_70_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_5 
       (.CI(\result_reg[7]_i_17_n_0 ),
        .CO({\result_reg[7]_i_5_n_0 ,\NLW_result_reg[7]_i_5_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[7]_i_18_n_0 ,\result[7]_i_19_n_0 ,\result[7]_i_20_n_0 ,\result[7]_i_21_n_0 }),
        .O(\NLW_result_reg[7]_i_5_O_UNCONNECTED [3:0]),
        .S({\result[7]_i_22_n_0 ,\result[7]_i_23_n_0 ,\result[7]_i_24_n_0 ,\result[7]_i_25_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_53 
       (.CI(\result_reg[7]_i_71_n_0 ),
        .CO({\result_reg[7]_i_53_n_0 ,\NLW_result_reg[7]_i_53_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[7]_i_72_n_0 ,\result[7]_i_73_n_0 ,\result[7]_i_74_n_0 ,\result[7]_i_75_n_0 }),
        .O(\NLW_result_reg[7]_i_53_O_UNCONNECTED [3:0]),
        .S({\result[7]_i_76_n_0 ,\result[7]_i_77_n_0 ,\result[7]_i_78_n_0 ,\result[7]_i_79_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_62 
       (.CI(\result_reg[7]_i_80_n_0 ),
        .CO({\result_reg[7]_i_62_n_0 ,\NLW_result_reg[7]_i_62_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[7]_i_81_n_0 ,\result[7]_i_82_n_0 ,\result[7]_i_83_n_0 ,\result[7]_i_84_n_0 }),
        .O(\NLW_result_reg[7]_i_62_O_UNCONNECTED [3:0]),
        .S({\result[7]_i_85_n_0 ,\result[7]_i_86_n_0 ,\result[7]_i_87_n_0 ,\result[7]_i_88_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_71 
       (.CI(\result_reg[7]_i_89_n_0 ),
        .CO({\result_reg[7]_i_71_n_0 ,\NLW_result_reg[7]_i_71_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[7]_i_90_n_0 ,\result[7]_i_91_n_0 ,\result[7]_i_92_n_0 ,\result[7]_i_93_n_0 }),
        .O(\NLW_result_reg[7]_i_71_O_UNCONNECTED [3:0]),
        .S({\result[7]_i_94_n_0 ,\result[7]_i_95_n_0 ,\result[7]_i_96_n_0 ,\result[7]_i_97_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_80 
       (.CI(\result_reg[7]_i_98_n_0 ),
        .CO({\result_reg[7]_i_80_n_0 ,\NLW_result_reg[7]_i_80_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[7]_i_99_n_0 ,\result[7]_i_100_n_0 ,\result[7]_i_101_n_0 ,\result[7]_i_102_n_0 }),
        .O(\NLW_result_reg[7]_i_80_O_UNCONNECTED [3:0]),
        .S({\result[7]_i_103_n_0 ,\result[7]_i_104_n_0 ,\result[7]_i_105_n_0 ,\result[7]_i_106_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_89 
       (.CI(\result_reg[7]_i_107_n_0 ),
        .CO({\result_reg[7]_i_89_n_0 ,\NLW_result_reg[7]_i_89_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[7]_i_108_n_0 ,\result[7]_i_109_n_0 ,\result[7]_i_110_n_0 ,\result[7]_i_111_n_0 }),
        .O(\NLW_result_reg[7]_i_89_O_UNCONNECTED [3:0]),
        .S({\result[7]_i_112_n_0 ,\result[7]_i_113_n_0 ,\result[7]_i_114_n_0 ,\result[7]_i_115_n_0 }));
  (* COMPARATOR_THRESHOLD = "11" *) 
  CARRY4 \result_reg[7]_i_98 
       (.CI(\result_reg[7]_i_116_n_0 ),
        .CO({\result_reg[7]_i_98_n_0 ,\NLW_result_reg[7]_i_98_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({\result[7]_i_117_n_0 ,\result[7]_i_118_n_0 ,\result[7]_i_119_n_0 ,\result[7]_i_120_n_0 }),
        .O(\NLW_result_reg[7]_i_98_O_UNCONNECTED [3:0]),
        .S({\result[7]_i_121_n_0 ,\result[7]_i_122_n_0 ,\result[7]_i_123_n_0 ,\result[7]_i_124_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[10]_i_1 
       (.I0(rounded0[10]),
        .I1(rounded_mag[10]),
        .I2(product_negative_reg),
        .O(rounded[10]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[11]_i_1 
       (.I0(rounded0[11]),
        .I1(rounded_mag[11]),
        .I2(product_negative_reg),
        .O(rounded[11]));
  (* SOFT_HLUTNM = "soft_lutpair95" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[12]_i_1 
       (.I0(rounded0[12]),
        .I1(rounded_mag[12]),
        .I2(product_negative_reg),
        .O(rounded[12]));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[12]_i_3 
       (.I0(rounded_mag[12]),
        .O(\rounded_reg[12]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[12]_i_4 
       (.I0(rounded_mag[11]),
        .O(\rounded_reg[12]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[12]_i_5 
       (.I0(rounded_mag[10]),
        .O(\rounded_reg[12]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[12]_i_6 
       (.I0(rounded_mag[9]),
        .O(\rounded_reg[12]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair94" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[13]_i_1 
       (.I0(rounded0[13]),
        .I1(rounded_mag[13]),
        .I2(product_negative_reg),
        .O(rounded[13]));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[14]_i_1 
       (.I0(rounded0[14]),
        .I1(rounded_mag[14]),
        .I2(product_negative_reg),
        .O(rounded[14]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[15]_i_1 
       (.I0(rounded0[15]),
        .I1(rounded_mag[15]),
        .I2(product_negative_reg),
        .O(rounded[15]));
  (* SOFT_HLUTNM = "soft_lutpair93" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[16]_i_1 
       (.I0(rounded0[16]),
        .I1(rounded_mag[16]),
        .I2(product_negative_reg),
        .O(rounded[16]));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[16]_i_3 
       (.I0(rounded_mag[16]),
        .O(\rounded_reg[16]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[16]_i_4 
       (.I0(rounded_mag[15]),
        .O(\rounded_reg[16]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[16]_i_5 
       (.I0(rounded_mag[14]),
        .O(\rounded_reg[16]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[16]_i_6 
       (.I0(rounded_mag[13]),
        .O(\rounded_reg[16]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair92" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[17]_i_1 
       (.I0(rounded0[17]),
        .I1(rounded_mag[17]),
        .I2(product_negative_reg),
        .O(rounded[17]));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[18]_i_1 
       (.I0(rounded0[18]),
        .I1(rounded_mag[18]),
        .I2(product_negative_reg),
        .O(rounded[18]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[19]_i_1 
       (.I0(rounded0[19]),
        .I1(rounded_mag[19]),
        .I2(product_negative_reg),
        .O(rounded[19]));
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[1]_i_1 
       (.I0(rounded0[1]),
        .I1(rounded_mag[1]),
        .I2(product_negative_reg),
        .O(rounded[1]));
  (* SOFT_HLUTNM = "soft_lutpair91" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[20]_i_1 
       (.I0(rounded0[20]),
        .I1(rounded_mag[20]),
        .I2(product_negative_reg),
        .O(rounded[20]));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[20]_i_3 
       (.I0(rounded_mag[20]),
        .O(\rounded_reg[20]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[20]_i_4 
       (.I0(rounded_mag[19]),
        .O(\rounded_reg[20]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[20]_i_5 
       (.I0(rounded_mag[18]),
        .O(\rounded_reg[20]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[20]_i_6 
       (.I0(rounded_mag[17]),
        .O(\rounded_reg[20]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair90" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[21]_i_1 
       (.I0(rounded0[21]),
        .I1(rounded_mag[21]),
        .I2(product_negative_reg),
        .O(rounded[21]));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[22]_i_1 
       (.I0(rounded0[22]),
        .I1(rounded_mag[22]),
        .I2(product_negative_reg),
        .O(rounded[22]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[23]_i_1 
       (.I0(rounded0[23]),
        .I1(rounded_mag[23]),
        .I2(product_negative_reg),
        .O(rounded[23]));
  (* SOFT_HLUTNM = "soft_lutpair89" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[24]_i_1 
       (.I0(rounded0[24]),
        .I1(rounded_mag[24]),
        .I2(product_negative_reg),
        .O(rounded[24]));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[24]_i_3 
       (.I0(rounded_mag[24]),
        .O(\rounded_reg[24]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[24]_i_4 
       (.I0(rounded_mag[23]),
        .O(\rounded_reg[24]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[24]_i_5 
       (.I0(rounded_mag[22]),
        .O(\rounded_reg[24]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[24]_i_6 
       (.I0(rounded_mag[21]),
        .O(\rounded_reg[24]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair88" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[25]_i_1 
       (.I0(rounded0[25]),
        .I1(rounded_mag[25]),
        .I2(product_negative_reg),
        .O(rounded[25]));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[26]_i_1 
       (.I0(rounded0[26]),
        .I1(rounded_mag[26]),
        .I2(product_negative_reg),
        .O(rounded[26]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[27]_i_1 
       (.I0(rounded0[27]),
        .I1(rounded_mag[27]),
        .I2(product_negative_reg),
        .O(rounded[27]));
  (* SOFT_HLUTNM = "soft_lutpair87" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[28]_i_1 
       (.I0(rounded0[28]),
        .I1(rounded_mag[28]),
        .I2(product_negative_reg),
        .O(rounded[28]));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[28]_i_3 
       (.I0(rounded_mag[28]),
        .O(\rounded_reg[28]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[28]_i_4 
       (.I0(rounded_mag[27]),
        .O(\rounded_reg[28]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[28]_i_5 
       (.I0(rounded_mag[26]),
        .O(\rounded_reg[28]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[28]_i_6 
       (.I0(rounded_mag[25]),
        .O(\rounded_reg[28]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair86" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[29]_i_1 
       (.I0(rounded0[29]),
        .I1(rounded_mag[29]),
        .I2(product_negative_reg),
        .O(rounded[29]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[2]_i_1 
       (.I0(rounded0[2]),
        .I1(rounded_mag[2]),
        .I2(product_negative_reg),
        .O(rounded[2]));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[30]_i_1 
       (.I0(rounded0[30]),
        .I1(rounded_mag[30]),
        .I2(product_negative_reg),
        .O(rounded[30]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[31]_i_1 
       (.I0(rounded0[31]),
        .I1(rounded_mag[31]),
        .I2(product_negative_reg),
        .O(rounded[31]));
  (* SOFT_HLUTNM = "soft_lutpair85" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[32]_i_1 
       (.I0(rounded0[32]),
        .I1(rounded_mag[32]),
        .I2(product_negative_reg),
        .O(rounded[32]));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[32]_i_3 
       (.I0(rounded_mag[32]),
        .O(\rounded_reg[32]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[32]_i_4 
       (.I0(rounded_mag[31]),
        .O(\rounded_reg[32]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[32]_i_5 
       (.I0(rounded_mag[30]),
        .O(\rounded_reg[32]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[32]_i_6 
       (.I0(rounded_mag[29]),
        .O(\rounded_reg[32]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair84" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[33]_i_1 
       (.I0(rounded0[33]),
        .I1(rounded_mag[33]),
        .I2(product_negative_reg),
        .O(rounded[33]));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[34]_i_1 
       (.I0(rounded0[34]),
        .I1(rounded_mag[34]),
        .I2(product_negative_reg),
        .O(rounded[34]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[35]_i_1 
       (.I0(rounded0[35]),
        .I1(rounded_mag[35]),
        .I2(product_negative_reg),
        .O(rounded[35]));
  (* SOFT_HLUTNM = "soft_lutpair83" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[36]_i_1 
       (.I0(rounded0[36]),
        .I1(rounded_mag[36]),
        .I2(product_negative_reg),
        .O(rounded[36]));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[36]_i_3 
       (.I0(rounded_mag[36]),
        .O(\rounded_reg[36]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[36]_i_4 
       (.I0(rounded_mag[35]),
        .O(\rounded_reg[36]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[36]_i_5 
       (.I0(rounded_mag[34]),
        .O(\rounded_reg[36]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[36]_i_6 
       (.I0(rounded_mag[33]),
        .O(\rounded_reg[36]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair82" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[37]_i_1 
       (.I0(rounded0[37]),
        .I1(rounded_mag[37]),
        .I2(product_negative_reg),
        .O(rounded[37]));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[38]_i_1 
       (.I0(rounded0[38]),
        .I1(rounded_mag[38]),
        .I2(product_negative_reg),
        .O(rounded[38]));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[39]_i_1 
       (.I0(rounded0[39]),
        .I1(rounded_mag[39]),
        .I2(product_negative_reg),
        .O(rounded[39]));
  (* SOFT_HLUTNM = "soft_lutpair99" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[3]_i_1 
       (.I0(rounded0[3]),
        .I1(rounded_mag[3]),
        .I2(product_negative_reg),
        .O(rounded[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \rounded_reg[3]_i_3 
       (.I0(\quotient_reg_reg_n_0_[0] ),
        .I1(increment_reg),
        .O(\rounded_reg[3]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair81" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[40]_i_1 
       (.I0(rounded0[40]),
        .I1(rounded_mag[40]),
        .I2(product_negative_reg),
        .O(rounded[40]));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[40]_i_3 
       (.I0(rounded_mag[40]),
        .O(\rounded_reg[40]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[40]_i_4 
       (.I0(rounded_mag[39]),
        .O(\rounded_reg[40]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[40]_i_5 
       (.I0(rounded_mag[38]),
        .O(\rounded_reg[40]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[40]_i_6 
       (.I0(rounded_mag[37]),
        .O(\rounded_reg[40]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair80" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[41]_i_1 
       (.I0(rounded0[41]),
        .I1(rounded_mag[41]),
        .I2(product_negative_reg),
        .O(rounded[41]));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[42]_i_1 
       (.I0(rounded0[42]),
        .I1(rounded_mag[42]),
        .I2(product_negative_reg),
        .O(rounded[42]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[43]_i_1 
       (.I0(rounded0[43]),
        .I1(rounded_mag[43]),
        .I2(product_negative_reg),
        .O(rounded[43]));
  (* SOFT_HLUTNM = "soft_lutpair79" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[44]_i_1 
       (.I0(rounded0[44]),
        .I1(rounded_mag[44]),
        .I2(product_negative_reg),
        .O(rounded[44]));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[44]_i_3 
       (.I0(rounded_mag[44]),
        .O(\rounded_reg[44]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[44]_i_4 
       (.I0(rounded_mag[43]),
        .O(\rounded_reg[44]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[44]_i_5 
       (.I0(rounded_mag[42]),
        .O(\rounded_reg[44]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[44]_i_6 
       (.I0(rounded_mag[41]),
        .O(\rounded_reg[44]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair78" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[45]_i_1 
       (.I0(rounded0[45]),
        .I1(rounded_mag[45]),
        .I2(product_negative_reg),
        .O(rounded[45]));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[46]_i_1 
       (.I0(rounded0[46]),
        .I1(rounded_mag[46]),
        .I2(product_negative_reg),
        .O(rounded[46]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[47]_i_1 
       (.I0(rounded0[47]),
        .I1(rounded_mag[47]),
        .I2(product_negative_reg),
        .O(rounded[47]));
  (* SOFT_HLUTNM = "soft_lutpair77" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[48]_i_1 
       (.I0(rounded0[48]),
        .I1(rounded_mag[48]),
        .I2(product_negative_reg),
        .O(rounded[48]));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[48]_i_3 
       (.I0(rounded_mag[48]),
        .O(\rounded_reg[48]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[48]_i_4 
       (.I0(rounded_mag[47]),
        .O(\rounded_reg[48]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[48]_i_5 
       (.I0(rounded_mag[46]),
        .O(\rounded_reg[48]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[48]_i_6 
       (.I0(rounded_mag[45]),
        .O(\rounded_reg[48]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair76" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[49]_i_1 
       (.I0(rounded0[49]),
        .I1(rounded_mag[49]),
        .I2(product_negative_reg),
        .O(rounded[49]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[4]_i_1 
       (.I0(rounded0[4]),
        .I1(rounded_mag[4]),
        .I2(product_negative_reg),
        .O(rounded[4]));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[4]_i_3 
       (.I0(rounded_mag[0]),
        .O(\rounded_reg[4]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[4]_i_4 
       (.I0(rounded_mag[4]),
        .O(\rounded_reg[4]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[4]_i_5 
       (.I0(rounded_mag[3]),
        .O(\rounded_reg[4]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[4]_i_6 
       (.I0(rounded_mag[2]),
        .O(\rounded_reg[4]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[4]_i_7 
       (.I0(rounded_mag[1]),
        .O(\rounded_reg[4]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[50]_i_1 
       (.I0(rounded0[50]),
        .I1(rounded_mag[50]),
        .I2(product_negative_reg),
        .O(rounded[50]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[51]_i_1 
       (.I0(rounded0[51]),
        .I1(rounded_mag[51]),
        .I2(product_negative_reg),
        .O(rounded[51]));
  (* SOFT_HLUTNM = "soft_lutpair75" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[52]_i_1 
       (.I0(rounded0[52]),
        .I1(rounded_mag[52]),
        .I2(product_negative_reg),
        .O(rounded[52]));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[52]_i_3 
       (.I0(rounded_mag[52]),
        .O(\rounded_reg[52]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[52]_i_4 
       (.I0(rounded_mag[51]),
        .O(\rounded_reg[52]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[52]_i_5 
       (.I0(rounded_mag[50]),
        .O(\rounded_reg[52]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[52]_i_6 
       (.I0(rounded_mag[49]),
        .O(\rounded_reg[52]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair74" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[53]_i_1 
       (.I0(rounded0[53]),
        .I1(rounded_mag[53]),
        .I2(product_negative_reg),
        .O(rounded[53]));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[54]_i_1 
       (.I0(rounded0[54]),
        .I1(rounded_mag[54]),
        .I2(product_negative_reg),
        .O(rounded[54]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[55]_i_1 
       (.I0(rounded0[55]),
        .I1(rounded_mag[55]),
        .I2(product_negative_reg),
        .O(rounded[55]));
  (* SOFT_HLUTNM = "soft_lutpair73" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[56]_i_1 
       (.I0(rounded0[56]),
        .I1(rounded_mag[56]),
        .I2(product_negative_reg),
        .O(rounded[56]));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[56]_i_3 
       (.I0(rounded_mag[56]),
        .O(\rounded_reg[56]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[56]_i_4 
       (.I0(rounded_mag[55]),
        .O(\rounded_reg[56]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[56]_i_5 
       (.I0(rounded_mag[54]),
        .O(\rounded_reg[56]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[56]_i_6 
       (.I0(rounded_mag[53]),
        .O(\rounded_reg[56]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair72" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[57]_i_1 
       (.I0(rounded0[57]),
        .I1(rounded_mag[57]),
        .I2(product_negative_reg),
        .O(rounded[57]));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[58]_i_1 
       (.I0(rounded0[58]),
        .I1(rounded_mag[58]),
        .I2(product_negative_reg),
        .O(rounded[58]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[59]_i_1 
       (.I0(rounded0[59]),
        .I1(rounded_mag[59]),
        .I2(product_negative_reg),
        .O(rounded[59]));
  (* SOFT_HLUTNM = "soft_lutpair98" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[5]_i_1 
       (.I0(rounded0[5]),
        .I1(rounded_mag[5]),
        .I2(product_negative_reg),
        .O(rounded[5]));
  (* SOFT_HLUTNM = "soft_lutpair71" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[60]_i_1 
       (.I0(rounded0[60]),
        .I1(rounded_mag[60]),
        .I2(product_negative_reg),
        .O(rounded[60]));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[60]_i_3 
       (.I0(rounded_mag[60]),
        .O(\rounded_reg[60]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[60]_i_4 
       (.I0(rounded_mag[59]),
        .O(\rounded_reg[60]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[60]_i_5 
       (.I0(rounded_mag[58]),
        .O(\rounded_reg[60]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[60]_i_6 
       (.I0(rounded_mag[57]),
        .O(\rounded_reg[60]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair70" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[61]_i_1 
       (.I0(rounded0[61]),
        .I1(rounded_mag[61]),
        .I2(product_negative_reg),
        .O(rounded[61]));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[62]_i_1 
       (.I0(rounded0[62]),
        .I1(rounded_mag[62]),
        .I2(product_negative_reg),
        .O(rounded[62]));
  LUT3 #(
    .INIT(8'h08)) 
    \rounded_reg[63]_i_1 
       (.I0(state[2]),
        .I1(state[0]),
        .I2(state[1]),
        .O(rounded_reg));
  (* SOFT_HLUTNM = "soft_lutpair69" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[63]_i_2 
       (.I0(rounded0[63]),
        .I1(rounded_mag[63]),
        .I2(product_negative_reg),
        .O(rounded[63]));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[63]_i_5 
       (.I0(rounded_mag[63]),
        .O(\rounded_reg[63]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[63]_i_6 
       (.I0(rounded_mag[62]),
        .O(\rounded_reg[63]_i_6_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[63]_i_7 
       (.I0(rounded_mag[61]),
        .O(\rounded_reg[63]_i_7_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[6]_i_1 
       (.I0(rounded0[6]),
        .I1(rounded_mag[6]),
        .I2(product_negative_reg),
        .O(rounded[6]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[7]_i_1 
       (.I0(rounded0[7]),
        .I1(rounded_mag[7]),
        .I2(product_negative_reg),
        .O(rounded[7]));
  (* SOFT_HLUTNM = "soft_lutpair97" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[8]_i_1 
       (.I0(rounded0[8]),
        .I1(rounded_mag[8]),
        .I2(product_negative_reg),
        .O(rounded[8]));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[8]_i_3 
       (.I0(rounded_mag[8]),
        .O(\rounded_reg[8]_i_3_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[8]_i_4 
       (.I0(rounded_mag[7]),
        .O(\rounded_reg[8]_i_4_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[8]_i_5 
       (.I0(rounded_mag[6]),
        .O(\rounded_reg[8]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \rounded_reg[8]_i_6 
       (.I0(rounded_mag[5]),
        .O(\rounded_reg[8]_i_6_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair96" *) 
  LUT3 #(
    .INIT(8'hAC)) 
    \rounded_reg[9]_i_1 
       (.I0(rounded0[9]),
        .I1(rounded_mag[9]),
        .I2(product_negative_reg),
        .O(rounded[9]));
  (* OPT_MODIFIED = "RETARGET" *) 
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[0] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded_mag[0]),
        .Q(\rounded_reg_reg_n_0_[0] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[10] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[10]),
        .Q(\rounded_reg_reg_n_0_[10] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[11] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[11]),
        .Q(\rounded_reg_reg_n_0_[11] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[11]_i_2 
       (.CI(\rounded_reg_reg[7]_i_2_n_0 ),
        .CO({\rounded_reg_reg[11]_i_2_n_0 ,\NLW_rounded_reg_reg[11]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded_mag[11:8]),
        .S({\quotient_reg_reg_n_0_[11] ,\quotient_reg_reg_n_0_[10] ,\quotient_reg_reg_n_0_[9] ,\quotient_reg_reg_n_0_[8] }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[12] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[12]),
        .Q(\rounded_reg_reg_n_0_[12] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[12]_i_2 
       (.CI(\rounded_reg_reg[8]_i_2_n_0 ),
        .CO({\rounded_reg_reg[12]_i_2_n_0 ,\NLW_rounded_reg_reg[12]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded0[12:9]),
        .S({\rounded_reg[12]_i_3_n_0 ,\rounded_reg[12]_i_4_n_0 ,\rounded_reg[12]_i_5_n_0 ,\rounded_reg[12]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[13] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[13]),
        .Q(\rounded_reg_reg_n_0_[13] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[14] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[14]),
        .Q(\rounded_reg_reg_n_0_[14] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[15] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[15]),
        .Q(\rounded_reg_reg_n_0_[15] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[15]_i_2 
       (.CI(\rounded_reg_reg[11]_i_2_n_0 ),
        .CO({\rounded_reg_reg[15]_i_2_n_0 ,\NLW_rounded_reg_reg[15]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded_mag[15:12]),
        .S({\quotient_reg_reg_n_0_[15] ,\quotient_reg_reg_n_0_[14] ,\quotient_reg_reg_n_0_[13] ,\quotient_reg_reg_n_0_[12] }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[16] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[16]),
        .Q(\rounded_reg_reg_n_0_[16] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[16]_i_2 
       (.CI(\rounded_reg_reg[12]_i_2_n_0 ),
        .CO({\rounded_reg_reg[16]_i_2_n_0 ,\NLW_rounded_reg_reg[16]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded0[16:13]),
        .S({\rounded_reg[16]_i_3_n_0 ,\rounded_reg[16]_i_4_n_0 ,\rounded_reg[16]_i_5_n_0 ,\rounded_reg[16]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[17] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[17]),
        .Q(\rounded_reg_reg_n_0_[17] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[18] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[18]),
        .Q(\rounded_reg_reg_n_0_[18] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[19] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[19]),
        .Q(\rounded_reg_reg_n_0_[19] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[19]_i_2 
       (.CI(\rounded_reg_reg[15]_i_2_n_0 ),
        .CO({\rounded_reg_reg[19]_i_2_n_0 ,\NLW_rounded_reg_reg[19]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded_mag[19:16]),
        .S({\quotient_reg_reg_n_0_[19] ,\quotient_reg_reg_n_0_[18] ,\quotient_reg_reg_n_0_[17] ,\quotient_reg_reg_n_0_[16] }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[1] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[1]),
        .Q(\rounded_reg_reg_n_0_[1] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[20] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[20]),
        .Q(\rounded_reg_reg_n_0_[20] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[20]_i_2 
       (.CI(\rounded_reg_reg[16]_i_2_n_0 ),
        .CO({\rounded_reg_reg[20]_i_2_n_0 ,\NLW_rounded_reg_reg[20]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded0[20:17]),
        .S({\rounded_reg[20]_i_3_n_0 ,\rounded_reg[20]_i_4_n_0 ,\rounded_reg[20]_i_5_n_0 ,\rounded_reg[20]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[21] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[21]),
        .Q(\rounded_reg_reg_n_0_[21] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[22] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[22]),
        .Q(\rounded_reg_reg_n_0_[22] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[23] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[23]),
        .Q(\rounded_reg_reg_n_0_[23] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[23]_i_2 
       (.CI(\rounded_reg_reg[19]_i_2_n_0 ),
        .CO({\rounded_reg_reg[23]_i_2_n_0 ,\NLW_rounded_reg_reg[23]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded_mag[23:20]),
        .S({\quotient_reg_reg_n_0_[23] ,\quotient_reg_reg_n_0_[22] ,\quotient_reg_reg_n_0_[21] ,\quotient_reg_reg_n_0_[20] }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[24] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[24]),
        .Q(\rounded_reg_reg_n_0_[24] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[24]_i_2 
       (.CI(\rounded_reg_reg[20]_i_2_n_0 ),
        .CO({\rounded_reg_reg[24]_i_2_n_0 ,\NLW_rounded_reg_reg[24]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded0[24:21]),
        .S({\rounded_reg[24]_i_3_n_0 ,\rounded_reg[24]_i_4_n_0 ,\rounded_reg[24]_i_5_n_0 ,\rounded_reg[24]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[25] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[25]),
        .Q(\rounded_reg_reg_n_0_[25] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[26] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[26]),
        .Q(\rounded_reg_reg_n_0_[26] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[27] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[27]),
        .Q(\rounded_reg_reg_n_0_[27] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[27]_i_2 
       (.CI(\rounded_reg_reg[23]_i_2_n_0 ),
        .CO({\rounded_reg_reg[27]_i_2_n_0 ,\NLW_rounded_reg_reg[27]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded_mag[27:24]),
        .S({\quotient_reg_reg_n_0_[27] ,\quotient_reg_reg_n_0_[26] ,\quotient_reg_reg_n_0_[25] ,\quotient_reg_reg_n_0_[24] }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[28] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[28]),
        .Q(\rounded_reg_reg_n_0_[28] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[28]_i_2 
       (.CI(\rounded_reg_reg[24]_i_2_n_0 ),
        .CO({\rounded_reg_reg[28]_i_2_n_0 ,\NLW_rounded_reg_reg[28]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded0[28:25]),
        .S({\rounded_reg[28]_i_3_n_0 ,\rounded_reg[28]_i_4_n_0 ,\rounded_reg[28]_i_5_n_0 ,\rounded_reg[28]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[29] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[29]),
        .Q(\rounded_reg_reg_n_0_[29] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[2] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[2]),
        .Q(\rounded_reg_reg_n_0_[2] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[30] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[30]),
        .Q(\rounded_reg_reg_n_0_[30] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[31] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[31]),
        .Q(\rounded_reg_reg_n_0_[31] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[31]_i_2 
       (.CI(\rounded_reg_reg[27]_i_2_n_0 ),
        .CO({\rounded_reg_reg[31]_i_2_n_0 ,\NLW_rounded_reg_reg[31]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded_mag[31:28]),
        .S({\quotient_reg_reg_n_0_[31] ,\quotient_reg_reg_n_0_[30] ,\quotient_reg_reg_n_0_[29] ,\quotient_reg_reg_n_0_[28] }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[32] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[32]),
        .Q(\rounded_reg_reg_n_0_[32] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[32]_i_2 
       (.CI(\rounded_reg_reg[28]_i_2_n_0 ),
        .CO({\rounded_reg_reg[32]_i_2_n_0 ,\NLW_rounded_reg_reg[32]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded0[32:29]),
        .S({\rounded_reg[32]_i_3_n_0 ,\rounded_reg[32]_i_4_n_0 ,\rounded_reg[32]_i_5_n_0 ,\rounded_reg[32]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[33] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[33]),
        .Q(\rounded_reg_reg_n_0_[33] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[34] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[34]),
        .Q(\rounded_reg_reg_n_0_[34] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[35] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[35]),
        .Q(\rounded_reg_reg_n_0_[35] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[35]_i_2 
       (.CI(\rounded_reg_reg[31]_i_2_n_0 ),
        .CO({\rounded_reg_reg[35]_i_2_n_0 ,\NLW_rounded_reg_reg[35]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded_mag[35:32]),
        .S({\quotient_reg_reg_n_0_[35] ,\quotient_reg_reg_n_0_[34] ,\quotient_reg_reg_n_0_[33] ,\quotient_reg_reg_n_0_[32] }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[36] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[36]),
        .Q(\rounded_reg_reg_n_0_[36] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[36]_i_2 
       (.CI(\rounded_reg_reg[32]_i_2_n_0 ),
        .CO({\rounded_reg_reg[36]_i_2_n_0 ,\NLW_rounded_reg_reg[36]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded0[36:33]),
        .S({\rounded_reg[36]_i_3_n_0 ,\rounded_reg[36]_i_4_n_0 ,\rounded_reg[36]_i_5_n_0 ,\rounded_reg[36]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[37] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[37]),
        .Q(\rounded_reg_reg_n_0_[37] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[38] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[38]),
        .Q(\rounded_reg_reg_n_0_[38] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[39] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[39]),
        .Q(\rounded_reg_reg_n_0_[39] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[39]_i_2 
       (.CI(\rounded_reg_reg[35]_i_2_n_0 ),
        .CO({\rounded_reg_reg[39]_i_2_n_0 ,\NLW_rounded_reg_reg[39]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded_mag[39:36]),
        .S({\quotient_reg_reg_n_0_[39] ,\quotient_reg_reg_n_0_[38] ,\quotient_reg_reg_n_0_[37] ,\quotient_reg_reg_n_0_[36] }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[3] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[3]),
        .Q(\rounded_reg_reg_n_0_[3] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[3]_i_2 
       (.CI(1'b0),
        .CO({\rounded_reg_reg[3]_i_2_n_0 ,\NLW_rounded_reg_reg[3]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,\quotient_reg_reg_n_0_[0] }),
        .O(rounded_mag[3:0]),
        .S({\quotient_reg_reg_n_0_[3] ,\quotient_reg_reg_n_0_[2] ,\quotient_reg_reg_n_0_[1] ,\rounded_reg[3]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[40] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[40]),
        .Q(\rounded_reg_reg_n_0_[40] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[40]_i_2 
       (.CI(\rounded_reg_reg[36]_i_2_n_0 ),
        .CO({\rounded_reg_reg[40]_i_2_n_0 ,\NLW_rounded_reg_reg[40]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded0[40:37]),
        .S({\rounded_reg[40]_i_3_n_0 ,\rounded_reg[40]_i_4_n_0 ,\rounded_reg[40]_i_5_n_0 ,\rounded_reg[40]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[41] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[41]),
        .Q(\rounded_reg_reg_n_0_[41] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[42] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[42]),
        .Q(\rounded_reg_reg_n_0_[42] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[43] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[43]),
        .Q(\rounded_reg_reg_n_0_[43] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[43]_i_2 
       (.CI(\rounded_reg_reg[39]_i_2_n_0 ),
        .CO({\rounded_reg_reg[43]_i_2_n_0 ,\NLW_rounded_reg_reg[43]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded_mag[43:40]),
        .S({\quotient_reg_reg_n_0_[43] ,\quotient_reg_reg_n_0_[42] ,\quotient_reg_reg_n_0_[41] ,\quotient_reg_reg_n_0_[40] }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[44] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[44]),
        .Q(\rounded_reg_reg_n_0_[44] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[44]_i_2 
       (.CI(\rounded_reg_reg[40]_i_2_n_0 ),
        .CO({\rounded_reg_reg[44]_i_2_n_0 ,\NLW_rounded_reg_reg[44]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded0[44:41]),
        .S({\rounded_reg[44]_i_3_n_0 ,\rounded_reg[44]_i_4_n_0 ,\rounded_reg[44]_i_5_n_0 ,\rounded_reg[44]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[45] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[45]),
        .Q(\rounded_reg_reg_n_0_[45] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[46] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[46]),
        .Q(\rounded_reg_reg_n_0_[46] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[47] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[47]),
        .Q(\rounded_reg_reg_n_0_[47] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[47]_i_2 
       (.CI(\rounded_reg_reg[43]_i_2_n_0 ),
        .CO({\rounded_reg_reg[47]_i_2_n_0 ,\NLW_rounded_reg_reg[47]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded_mag[47:44]),
        .S({\quotient_reg_reg_n_0_[47] ,\quotient_reg_reg_n_0_[46] ,\quotient_reg_reg_n_0_[45] ,\quotient_reg_reg_n_0_[44] }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[48] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[48]),
        .Q(\rounded_reg_reg_n_0_[48] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[48]_i_2 
       (.CI(\rounded_reg_reg[44]_i_2_n_0 ),
        .CO({\rounded_reg_reg[48]_i_2_n_0 ,\NLW_rounded_reg_reg[48]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded0[48:45]),
        .S({\rounded_reg[48]_i_3_n_0 ,\rounded_reg[48]_i_4_n_0 ,\rounded_reg[48]_i_5_n_0 ,\rounded_reg[48]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[49] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[49]),
        .Q(\rounded_reg_reg_n_0_[49] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[4] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[4]),
        .Q(\rounded_reg_reg_n_0_[4] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\rounded_reg_reg[4]_i_2_n_0 ,\NLW_rounded_reg_reg[4]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(\rounded_reg[4]_i_3_n_0 ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded0[4:1]),
        .S({\rounded_reg[4]_i_4_n_0 ,\rounded_reg[4]_i_5_n_0 ,\rounded_reg[4]_i_6_n_0 ,\rounded_reg[4]_i_7_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[50] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[50]),
        .Q(\rounded_reg_reg_n_0_[50] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[51] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[51]),
        .Q(\rounded_reg_reg_n_0_[51] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[51]_i_2 
       (.CI(\rounded_reg_reg[47]_i_2_n_0 ),
        .CO({\rounded_reg_reg[51]_i_2_n_0 ,\NLW_rounded_reg_reg[51]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded_mag[51:48]),
        .S({\quotient_reg_reg_n_0_[51] ,\quotient_reg_reg_n_0_[50] ,\quotient_reg_reg_n_0_[49] ,\quotient_reg_reg_n_0_[48] }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[52] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[52]),
        .Q(\rounded_reg_reg_n_0_[52] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[52]_i_2 
       (.CI(\rounded_reg_reg[48]_i_2_n_0 ),
        .CO({\rounded_reg_reg[52]_i_2_n_0 ,\NLW_rounded_reg_reg[52]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded0[52:49]),
        .S({\rounded_reg[52]_i_3_n_0 ,\rounded_reg[52]_i_4_n_0 ,\rounded_reg[52]_i_5_n_0 ,\rounded_reg[52]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[53] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[53]),
        .Q(\rounded_reg_reg_n_0_[53] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[54] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[54]),
        .Q(\rounded_reg_reg_n_0_[54] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[55] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[55]),
        .Q(\rounded_reg_reg_n_0_[55] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[55]_i_2 
       (.CI(\rounded_reg_reg[51]_i_2_n_0 ),
        .CO({\rounded_reg_reg[55]_i_2_n_0 ,\NLW_rounded_reg_reg[55]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded_mag[55:52]),
        .S({\quotient_reg_reg_n_0_[55] ,\quotient_reg_reg_n_0_[54] ,\quotient_reg_reg_n_0_[53] ,\quotient_reg_reg_n_0_[52] }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[56] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[56]),
        .Q(\rounded_reg_reg_n_0_[56] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[56]_i_2 
       (.CI(\rounded_reg_reg[52]_i_2_n_0 ),
        .CO({\rounded_reg_reg[56]_i_2_n_0 ,\NLW_rounded_reg_reg[56]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded0[56:53]),
        .S({\rounded_reg[56]_i_3_n_0 ,\rounded_reg[56]_i_4_n_0 ,\rounded_reg[56]_i_5_n_0 ,\rounded_reg[56]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[57] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[57]),
        .Q(\rounded_reg_reg_n_0_[57] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[58] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[58]),
        .Q(\rounded_reg_reg_n_0_[58] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[59] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[59]),
        .Q(\rounded_reg_reg_n_0_[59] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[59]_i_2 
       (.CI(\rounded_reg_reg[55]_i_2_n_0 ),
        .CO({\rounded_reg_reg[59]_i_2_n_0 ,\NLW_rounded_reg_reg[59]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded_mag[59:56]),
        .S({\quotient_reg_reg_n_0_[59] ,\quotient_reg_reg_n_0_[58] ,\quotient_reg_reg_n_0_[57] ,\quotient_reg_reg_n_0_[56] }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[5] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[5]),
        .Q(\rounded_reg_reg_n_0_[5] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[60] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[60]),
        .Q(\rounded_reg_reg_n_0_[60] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[60]_i_2 
       (.CI(\rounded_reg_reg[56]_i_2_n_0 ),
        .CO({\rounded_reg_reg[60]_i_2_n_0 ,\NLW_rounded_reg_reg[60]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded0[60:57]),
        .S({\rounded_reg[60]_i_3_n_0 ,\rounded_reg[60]_i_4_n_0 ,\rounded_reg[60]_i_5_n_0 ,\rounded_reg[60]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[61] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[61]),
        .Q(\rounded_reg_reg_n_0_[61] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[62] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[62]),
        .Q(\rounded_reg_reg_n_0_[62] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[63] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[63]),
        .Q(\rounded_reg_reg_n_0_[63] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[63]_i_3 
       (.CI(\rounded_reg_reg[60]_i_2_n_0 ),
        .CO(\NLW_rounded_reg_reg[63]_i_3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_rounded_reg_reg[63]_i_3_O_UNCONNECTED [3],rounded0[63:61]}),
        .S({1'b0,\rounded_reg[63]_i_5_n_0 ,\rounded_reg[63]_i_6_n_0 ,\rounded_reg[63]_i_7_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[63]_i_4 
       (.CI(\rounded_reg_reg[59]_i_2_n_0 ),
        .CO(\NLW_rounded_reg_reg[63]_i_4_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded_mag[63:60]),
        .S({\quotient_reg_reg_n_0_[63] ,\quotient_reg_reg_n_0_[62] ,\quotient_reg_reg_n_0_[61] ,\quotient_reg_reg_n_0_[60] }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[6] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[6]),
        .Q(\rounded_reg_reg_n_0_[6] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[7] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[7]),
        .Q(\rounded_reg_reg_n_0_[7] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[7]_i_2 
       (.CI(\rounded_reg_reg[3]_i_2_n_0 ),
        .CO({\rounded_reg_reg[7]_i_2_n_0 ,\NLW_rounded_reg_reg[7]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded_mag[7:4]),
        .S({\quotient_reg_reg_n_0_[7] ,\quotient_reg_reg_n_0_[6] ,\quotient_reg_reg_n_0_[5] ,\quotient_reg_reg_n_0_[4] }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[8] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[8]),
        .Q(\rounded_reg_reg_n_0_[8] ),
        .R(rst));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \rounded_reg_reg[8]_i_2 
       (.CI(\rounded_reg_reg[4]_i_2_n_0 ),
        .CO({\rounded_reg_reg[8]_i_2_n_0 ,\NLW_rounded_reg_reg[8]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(rounded0[8:5]),
        .S({\rounded_reg[8]_i_3_n_0 ,\rounded_reg[8]_i_4_n_0 ,\rounded_reg[8]_i_5_n_0 ,\rounded_reg[8]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \rounded_reg_reg[9] 
       (.C(clk),
        .CE(rounded_reg),
        .D(rounded[9]),
        .Q(\rounded_reg_reg_n_0_[9] ),
        .R(rst));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg_reg[0] 
       (.C(clk),
        .CE(\last_count[7]_i_1_n_0 ),
        .D(shift_in[0]),
        .Q(shift_reg),
        .R(rst));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 15x18 4}}" *) 
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  DSP48E1 #(
    .ACASCREG(1),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(1),
    .AUTORESET_PATDET("NO_RESET"),
    .A_INPUT("DIRECT"),
    .BCASCREG(0),
    .BREG(0),
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
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,multiplier_in[16:0]}),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_wide_product_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({\acc[31]_i_2_psdsp_n_1 ,\acc[31]_i_2_psdsp_n_1 ,\acc[31]_i_2_psdsp_n_1 ,\acc[31]_i_2_psdsp_n_1 ,\acc[30]_i_1_psdsp_n_1 ,\acc[29]_i_1_psdsp_n_1 ,\acc[28]_i_1_psdsp_n_1 ,\acc[27]_i_1_psdsp_n_1 ,\acc[26]_i_1_psdsp_n_1 ,\acc[25]_i_1_psdsp_n_1 ,\acc[24]_i_1_psdsp_n_1 ,\acc[23]_i_1_psdsp_n_1 ,\acc[22]_i_1_psdsp_n_1 ,\acc[21]_i_1_psdsp_n_1 ,\acc[20]_i_1_psdsp_n_1 ,\acc[19]_i_1_psdsp_n_1 ,\acc[18]_i_1_psdsp_n_1 ,\acc[17]_i_1_psdsp_n_1 }),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_wide_product_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_wide_product_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_wide_product_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(\last_count[7]_i_1_n_0 ),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(1'b0),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_wide_product_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_wide_product_OVERFLOW_UNCONNECTED),
        .P({NLW_wide_product_P_UNCONNECTED[47:17],wide_product_n_89,wide_product_n_90,wide_product_n_91,wide_product_n_92,wide_product_n_93,wide_product_n_94,wide_product_n_95,wide_product_n_96,wide_product_n_97,wide_product_n_98,wide_product_n_99,wide_product_n_100,wide_product_n_101,wide_product_n_102,wide_product_n_103,wide_product_n_104,wide_product_n_105}),
        .PATTERNBDETECT(NLW_wide_product_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_wide_product_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({wide_product_n_106,wide_product_n_107,wide_product_n_108,wide_product_n_109,wide_product_n_110,wide_product_n_111,wide_product_n_112,wide_product_n_113,wide_product_n_114,wide_product_n_115,wide_product_n_116,wide_product_n_117,wide_product_n_118,wide_product_n_119,wide_product_n_120,wide_product_n_121,wide_product_n_122,wide_product_n_123,wide_product_n_124,wide_product_n_125,wide_product_n_126,wide_product_n_127,wide_product_n_128,wide_product_n_129,wide_product_n_130,wide_product_n_131,wide_product_n_132,wide_product_n_133,wide_product_n_134,wide_product_n_135,wide_product_n_136,wide_product_n_137,wide_product_n_138,wide_product_n_139,wide_product_n_140,wide_product_n_141,wide_product_n_142,wide_product_n_143,wide_product_n_144,wide_product_n_145,wide_product_n_146,wide_product_n_147,wide_product_n_148,wide_product_n_149,wide_product_n_150,wide_product_n_151,wide_product_n_152,wide_product_n_153}),
        .RSTA(rst),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(rst),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_wide_product_UNDERFLOW_UNCONNECTED));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-10 {cell *THIS*} {string 18x18 4}}" *) 
  (* PHYS_OPT_MODIFIED = "DSP_REGISTER_OPT" *) 
  DSP48E1 #(
    .ACASCREG(0),
    .ADREG(1),
    .ALUMODEREG(0),
    .AREG(0),
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
       (.A({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,\acc[16]_i_1_psdsp_n_1 ,\acc[15]_i_1_psdsp_n_1 ,\acc[14]_i_1_psdsp_n_1 ,\acc[13]_i_1_psdsp_n_1 ,\acc[12]_i_1_psdsp_n_1 ,\acc[11]_i_1_psdsp_n_1 ,\acc[10]_i_1_psdsp_n_1 ,\acc[9]_i_1_psdsp_n_1 ,\acc[8]_i_1_psdsp_n_1 ,\acc[7]_i_1_psdsp_n_1 ,\acc[6]_i_1_psdsp_n_1 ,\acc[5]_i_1_psdsp_n_1 ,\acc[4]_i_1_psdsp_n_1 ,\acc[3]_i_1_psdsp_n_1 ,\acc[2]_i_1_psdsp_n_1 ,\acc[1]_i_1_psdsp_n_1 ,\acc[0]_i_1_psdsp_n_1 }),
        .ACIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .ACOUT(NLW_wide_product__0_ACOUT_UNCONNECTED[29:0]),
        .ALUMODE({1'b0,1'b0,1'b0,1'b0}),
        .B({1'b0,multiplier_in[16:0]}),
        .BCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .BCOUT(NLW_wide_product__0_BCOUT_UNCONNECTED[17:0]),
        .C({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CARRYCASCIN(1'b0),
        .CARRYCASCOUT(NLW_wide_product__0_CARRYCASCOUT_UNCONNECTED),
        .CARRYIN(1'b0),
        .CARRYINSEL({1'b0,1'b0,1'b0}),
        .CARRYOUT(NLW_wide_product__0_CARRYOUT_UNCONNECTED[3:0]),
        .CEA1(1'b0),
        .CEA2(1'b0),
        .CEAD(1'b0),
        .CEALUMODE(1'b0),
        .CEB1(1'b0),
        .CEB2(\last_count[7]_i_1_n_0 ),
        .CEC(1'b0),
        .CECARRYIN(1'b0),
        .CECTRL(1'b0),
        .CED(1'b0),
        .CEINMODE(1'b0),
        .CEM(1'b0),
        .CEP(1'b0),
        .CLK(clk),
        .D({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .INMODE({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MULTSIGNIN(1'b0),
        .MULTSIGNOUT(NLW_wide_product__0_MULTSIGNOUT_UNCONNECTED),
        .OPMODE({1'b0,1'b0,1'b0,1'b0,1'b1,1'b0,1'b1}),
        .OVERFLOW(NLW_wide_product__0_OVERFLOW_UNCONNECTED),
        .P({NLW_wide_product__0_P_UNCONNECTED[47:17],wide_product__0_n_89,wide_product__0_n_90,wide_product__0_n_91,wide_product__0_n_92,wide_product__0_n_93,wide_product__0_n_94,wide_product__0_n_95,wide_product__0_n_96,wide_product__0_n_97,wide_product__0_n_98,wide_product__0_n_99,wide_product__0_n_100,wide_product__0_n_101,wide_product__0_n_102,wide_product__0_n_103,wide_product__0_n_104,wide_product__0_n_105}),
        .PATTERNBDETECT(NLW_wide_product__0_PATTERNBDETECT_UNCONNECTED),
        .PATTERNDETECT(NLW_wide_product__0_PATTERNDETECT_UNCONNECTED),
        .PCIN({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .PCOUT({wide_product__0_n_106,wide_product__0_n_107,wide_product__0_n_108,wide_product__0_n_109,wide_product__0_n_110,wide_product__0_n_111,wide_product__0_n_112,wide_product__0_n_113,wide_product__0_n_114,wide_product__0_n_115,wide_product__0_n_116,wide_product__0_n_117,wide_product__0_n_118,wide_product__0_n_119,wide_product__0_n_120,wide_product__0_n_121,wide_product__0_n_122,wide_product__0_n_123,wide_product__0_n_124,wide_product__0_n_125,wide_product__0_n_126,wide_product__0_n_127,wide_product__0_n_128,wide_product__0_n_129,wide_product__0_n_130,wide_product__0_n_131,wide_product__0_n_132,wide_product__0_n_133,wide_product__0_n_134,wide_product__0_n_135,wide_product__0_n_136,wide_product__0_n_137,wide_product__0_n_138,wide_product__0_n_139,wide_product__0_n_140,wide_product__0_n_141,wide_product__0_n_142,wide_product__0_n_143,wide_product__0_n_144,wide_product__0_n_145,wide_product__0_n_146,wide_product__0_n_147,wide_product__0_n_148,wide_product__0_n_149,wide_product__0_n_150,wide_product__0_n_151,wide_product__0_n_152,wide_product__0_n_153}),
        .RSTA(rst),
        .RSTALLCARRYIN(1'b0),
        .RSTALUMODE(1'b0),
        .RSTB(rst),
        .RSTC(1'b0),
        .RSTCTRL(1'b0),
        .RSTD(1'b0),
        .RSTINMODE(1'b0),
        .RSTM(1'b0),
        .RSTP(1'b0),
        .UNDERFLOW(NLW_wide_product__0_UNDERFLOW_UNCONNECTED));
endmodule

(* ADDR_WIDTH = "13" *) (* DEPTH = "5120" *) (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/fc1_weights.memh" *) 
(* WIDTH = "8" *) 
module parameter_rom_sync
   (clk,
    en,
    addr,
    data);
  input clk;
  input en;
  input [12:0]addr;
  output [7:0]data;

  wire [12:0]addr;
  wire clk;
  wire [7:0]data;
  wire en;
  wire NLW_data_reg_0_CASCADEOUTA_UNCONNECTED;
  wire NLW_data_reg_0_CASCADEOUTB_UNCONNECTED;
  wire NLW_data_reg_0_DBITERR_UNCONNECTED;
  wire NLW_data_reg_0_INJECTDBITERR_UNCONNECTED;
  wire NLW_data_reg_0_INJECTSBITERR_UNCONNECTED;
  wire NLW_data_reg_0_SBITERR_UNCONNECTED;
  wire [31:4]NLW_data_reg_0_DOADO_UNCONNECTED;
  wire [31:0]NLW_data_reg_0_DOBDO_UNCONNECTED;
  wire [3:0]NLW_data_reg_0_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_data_reg_0_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_data_reg_0_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_data_reg_0_RDADDRECC_UNCONNECTED;
  wire NLW_data_reg_1_CASCADEOUTA_UNCONNECTED;
  wire NLW_data_reg_1_CASCADEOUTB_UNCONNECTED;
  wire NLW_data_reg_1_DBITERR_UNCONNECTED;
  wire NLW_data_reg_1_INJECTDBITERR_UNCONNECTED;
  wire NLW_data_reg_1_INJECTSBITERR_UNCONNECTED;
  wire NLW_data_reg_1_SBITERR_UNCONNECTED;
  wire [31:4]NLW_data_reg_1_DOADO_UNCONNECTED;
  wire [31:0]NLW_data_reg_1_DOBDO_UNCONNECTED;
  wire [3:0]NLW_data_reg_1_DOPADOP_UNCONNECTED;
  wire [3:0]NLW_data_reg_1_DOPBDOP_UNCONNECTED;
  wire [7:0]NLW_data_reg_1_ECCPARITY_UNCONNECTED;
  wire [8:0]NLW_data_reg_1_RDADDRECC_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d4" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "65536" *) 
  (* RTL_RAM_NAME = "parameter_rom_sync/data_reg_0" *) 
  (* RTL_RAM_STYLE = "NONE" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "8191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "3" *) 
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
    .INIT_00(256'hAABAD9BA7151B13FE2B189693E4EB383E0718C59550442B72AEF038B6BDC7897),
    .INIT_01(256'h9A7E09645288D13FDD67FCF78707801B107B214EA7328ADC1B777F9A1AD64FA5),
    .INIT_02(256'h34D5BFB6E51DBCCE5C9C7E1A0E21983B6B7B8224A9C15F75E35DEDB85A41A21C),
    .INIT_03(256'h605BF14AE9BF21EF40DE996A567371B8E2B46A7B367903025DCABD8DA13312C0),
    .INIT_04(256'hFBE66E9FFCE00DCE173BCF3C27DFB2F1141F635413610164D8F5F34E74FD4DF1),
    .INIT_05(256'hCD7ED9E763FD458F0FFC7E5A8C5D9437819B2CCBE045CFB30CF261C45A53B792),
    .INIT_06(256'h4C095F1D263908176474E456787980C7EE645191D434142BD43CA52EA5F1683B),
    .INIT_07(256'h10B622E6B98BF82CCD92DAB6B930744D405A38CBD47676455F09D6D341D80941),
    .INIT_08(256'h1A559EE5F723C7665071F9C2730BDD382B173ABB85A402AEB71D85C1143C3EFA),
    .INIT_09(256'hA6C60C195366EBB4D94FD29DB31806FA3DB937A6936B0D3D940615A8BA07600D),
    .INIT_0A(256'hAD123D7826D3FDF0FFFC48408456AC3D288E14A234D2C5D9AE76EAFC167DDBB6),
    .INIT_0B(256'hBAAD5A27C9FCEDD3B1DCA851B91B18A70299416C4088F1852745124C0D470B0F),
    .INIT_0C(256'h0799F4445E202DDBF4DE53E310B5F174E645F3401F55556D146639EA75FEC684),
    .INIT_0D(256'h32DD16B3E8EC3163E74F1E21A938D1D260085DAB78243CA0152825009698583A),
    .INIT_0E(256'h2E218F6FD7D94839FC414BF70CD2B5A35F30F08E0E4C45110173D03F93638C1E),
    .INIT_0F(256'h328F909EEEA5EC3952E395B8CF72FCEA3307F8888F6AE21D9377A021E505848E),
    .INIT_10(256'h129A723786EECB1C4E29DEAB120188632F28947E12A9F9BC162FF520745B100E),
    .INIT_11(256'h181C3768733FD2803008EE89C8C893AADF1C5030323034542C7C5AE3234CEBBC),
    .INIT_12(256'h5A9921D6A54ABB13F42B691882F100A0F6F555CA30C8AF4B275CAFFE138C6774),
    .INIT_13(256'h533C857DDA9BD21DA12E94109FAC59F8E35CF09F6F747786CCF96DE606C8BAE1),
    .INIT_14(256'h016E9241282B9F80531FC3EB93C15A5083A30F20E46EC7A188A460DBB717A952),
    .INIT_15(256'h564DB40D4159FFA8372A5F8E402BDF5C1AED6A528E2FFF47E777EA1C3FB90A31),
    .INIT_16(256'hBFB7DEE573987D855BA6320C7858DA401A9E12934C2B0F4BBC5D3C4A56910CF7),
    .INIT_17(256'h7BE8A0321F837F7409D4B3E2818A9EA0CD449335B09F0A1FB9C7654B9D20C295),
    .INIT_18(256'h7274432A53C0895E2DEFE0351C1A618DF5E24D9AA27C0A3297259BEC4FA9752C),
    .INIT_19(256'hB25FFC40C164178DC8B3B1E7CF539C2034A6E359C7798805581DE7CEE5A8D8F5),
    .INIT_1A(256'hFEAF93100C4319BE406EAF0AB8DF0A15BF5E1A09AE63BC5E11746F8E243A768C),
    .INIT_1B(256'hDC5EB3E48503CAEB64957C699177DA80B862FC73F180E53510493C232CF79EC7),
    .INIT_1C(256'h23638119C35F4F88A8A4D04AF28D1383143F6D49A42B4032361A8ABB434A2F4B),
    .INIT_1D(256'h4F1AA6F0ECE447CFBCB566CAF5905DCAC9D8494628173CD1DC90A8C4C9DFBB80),
    .INIT_1E(256'hCA39477BC7478CA5101B6DF5FD14E2F8127FF16B26020CCF47B8A8B862970619),
    .INIT_1F(256'h93C90C52C0880C85129C8EC3A07DAC154AD1911A146A90FF2C2B9B2305B88D27),
    .INIT_20(256'hC7E856EAA145C38C764714F140E49B19BE4CA429EEF479A1437C01CF83109ED0),
    .INIT_21(256'h7FFB6FDAA5590013D00D83C5532C4E8AB82F8F6A0451D0674576E58D05789D43),
    .INIT_22(256'hA3B09EB4834B18ED88B7B0764A433CE77CA502CB6325B6E443FFBC2DFF791174),
    .INIT_23(256'hA8620235D31810A893D981450F1CA15A439D2D1B9D618B66F7452BA28420B554),
    .INIT_24(256'h69AA7A824AE8B877E16493CA11A458DCA27FCBC6C0E49BE0D7906BC5CEAFF61D),
    .INIT_25(256'hDB992DAF7901F0BDD7C8E9E5B16EF4F34978DBB230DE1B81F978DD69EEFA8E28),
    .INIT_26(256'hE4E938650A4F617FBC7615D49D8A142B02331C5AA82039A21AE1149AAADC5351),
    .INIT_27(256'h2EF8D116A8B865E332A150E6887664E585C4DD941A81A08B104FDD90095A1D56),
    .INIT_28(256'h847854EFC19A00B477B742342FE6BE3C0BABC36E993F54D44DDACE013BE21C98),
    .INIT_29(256'h18EF351B3F43850E8C37971677D19410060A7C119D3ABBC2DE1DCAC54EF973A9),
    .INIT_2A(256'hAABA3816402144F08D3BB18856C29DB469B6118DD5EF6FF1A3033EF1FA6EA2D8),
    .INIT_2B(256'h7DFC82D40114F60590C34FDE34ECDC24C556E88B701733D71245ABF151803E11),
    .INIT_2C(256'h5C8854C5C4E7CC18776D75F0D3D8D1B7451BA6F72100F0E4B8B848FB3119C68A),
    .INIT_2D(256'hF9B35AF1DAD76D22805B4A51EE0DF3877661F4475DAF2B307DF14D7C57275F94),
    .INIT_2E(256'h8B974CE0CE1DB922070A86FF47C9D3E4419CB193B6744C306FE03A52DDA594B4),
    .INIT_2F(256'h7770D7BE37AB0378E6E77FE5E295466AA6E655773B1C853C5B705F5AA164BD37),
    .INIT_30(256'h4A7D142A73B36F11AE3426E4C862338C2A8DC138A51328E52173BFF1F3BD9BCB),
    .INIT_31(256'h67D226659473E4895EF1BFD7E07BD00A53AC8007A5CB95B28214EA3D0F10E662),
    .INIT_32(256'hB30744096B9CC230F8FAF311FE51321ECCB918F6E88AE2DBF834D594CA369682),
    .INIT_33(256'h79D51A4AFF630A3F8B0869429F464A233A8AC2F54DE6F4AE7BC9F61F26A6CC61),
    .INIT_34(256'hCBF40356E611D2FAF8F4BA35413043F209D164021035D0C1A1E4108043AD08BB),
    .INIT_35(256'h4AD6319915DF1EAF0119F4A098BCABBAEADB92C9BB82C384202A4555832E38FC),
    .INIT_36(256'h00BB000117A9A696AE03FFCF6863E36DDBCCBB03832718C3EDAD4E1EBE197540),
    .INIT_37(256'h312F23EC0DDCC4C045D0DF36AAF28EB51E6B48120339AB03C7866EC23C8DDCBA),
    .INIT_38(256'hB65EA46540639227545E42DFEFC723C47CCB11B6193DC357A4F39B52BB093758),
    .INIT_39(256'h54FFC4639D43EC1D09D27EAB5F436F72465EDF7511383306D77570FACA0816EB),
    .INIT_3A(256'hDD6CC2CD91A0C6EAF8F68CB9998DCC752BFC328CEF1FE98D49BB60D515475D4E),
    .INIT_3B(256'h2111ADDC8CC6163CE43BCCBB87EC5D126E29A703877A44022DD1FA14CA45E6A5),
    .INIT_3C(256'h5DB1E92976A595F7121229108D43DAEBBC2EA535336EE67F97699B9B97A6FAA4),
    .INIT_3D(256'h376254C558079F7E5A61E0D54054D9777D9FB1B8A06169FEA3BBBEF53A60A4B2),
    .INIT_3E(256'h1EC8107D53A8497F9A9396E40C91756377D6D6F3F19D1B62C4A12F334E174D60),
    .INIT_3F(256'h577A81F0E369366CE51E093CBB8CE81E2296AC33F178D8738496F51A30D608CA),
    .INIT_40(256'h024005FDDEEFD3311463B61653D2A80C8F43936DDA4961C8D80F6BD8E2523E0C),
    .INIT_41(256'h5D61F3627AAA6701372688FF99AFC20435DE86CD2136A2610698FFA7FDA3DDA3),
    .INIT_42(256'h4070AB2B43F63626E265C099FD364407A1D32C6BB2A2F8EE2BAFA9F210CF6672),
    .INIT_43(256'hCC61556AC7AB76778E961772F95EFC265778574FF8BB22C4DEE1F92F18053CD9),
    .INIT_44(256'hEE910B31A9D3844D7A56B7E0972BD3EBC697B455D2D47E76BFCCC5A7A3D217A7),
    .INIT_45(256'h053EC9AB5636C1F4F7516D053FA506C7FD3E16DE8CBE4DE90463C649DD0D08FE),
    .INIT_46(256'h4D8A3166D983BE6E74ABE53AF9225BC0CCD541E0FE44588E9211F86C90E8654B),
    .INIT_47(256'hC1EF14F73BB96C347702491808010BBB1A3B8061CB0A761BB715498A34C0D551),
    .INIT_48(256'h0A72E9B4405DCE4051109CDCFA42010DF9A78FC74CE7DF7D9CF0A889DC321B75),
    .INIT_49(256'h1885D1D8BD175AF09AA929E65945D4CADFB15CCA5B0E27F93D2C68E407A9545D),
    .INIT_4A(256'hBD577B3CF3CD7210C78448BD1A10420544AC31162CD98D7EBAC0510D28CDC3AA),
    .INIT_4B(256'hE830D33B8E2FFC68F48CB189E7D4EE73B804746447E158315852D2874818593F),
    .INIT_4C(256'h2ED0178272AC54FD923928F9DA19F33F6E8421E83FD5D23A6D3F4168CF254643),
    .INIT_4D(256'hC75FAB98EAE2CED59454949270A4511DBA3BC9408CE8295BB49D9F7A30C894BF),
    .INIT_4E(256'hCE15DDFF61E56BF7108F5BB7C248FB4C7448E18E95A3299E35D824424F5CB5C6),
    .INIT_4F(256'hC65238CE23C28E7F0870DD3AB98F8D1F95D7525F59F50AC9737A6043CCD708C0),
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
    .INIT_FILE("NONE"),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(4),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(4),
    .WRITE_WIDTH_B(0)) 
    data_reg_0
       (.ADDRARDADDR({1'b1,addr,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(NLW_data_reg_0_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_data_reg_0_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_data_reg_0_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1}),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b1,1'b1,1'b1,1'b1}),
        .DOADO({NLW_data_reg_0_DOADO_UNCONNECTED[31:4],data[3:0]}),
        .DOBDO(NLW_data_reg_0_DOBDO_UNCONNECTED[31:0]),
        .DOPADOP(NLW_data_reg_0_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_data_reg_0_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_data_reg_0_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(en),
        .ENBWREN(1'b0),
        .INJECTDBITERR(NLW_data_reg_0_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_data_reg_0_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_data_reg_0_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_data_reg_0_SBITERR_UNCONNECTED),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d4" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "65536" *) 
  (* RTL_RAM_NAME = "parameter_rom_sync/data_reg_1" *) 
  (* RTL_RAM_STYLE = "NONE" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "8191" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "4" *) 
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
    .INIT_00(256'h0000F0FF00F001FFF0FF00F00F0F0000F1F000000011FFF000FEF000FFFF00F0),
    .INIT_01(256'h0000FCCCE00F010FEEFF0FF00010F0001132C80FFFF0FFFFEFEFFDDCDB0F0FFF),
    .INIT_02(256'h2100F0E0F0FFE0FFF1FE0E010001EF00FFF0000FFFF0F0F0F000E0F000F1F000),
    .INIT_03(256'h10F1A8000F10E0FEEFDEFDDF10FFF001000010FFFFF02FF0EF0F01F1F00011F1),
    .INIT_04(256'hE1FF00F0F0DEEDCE00E0FEE01EEF01AF2F1DF000F1FF1100F100F01001F10EFF),
    .INIT_05(256'h011E1EFFE0F13EF0DDDE1220D001FE2221000E00DE13EE01FF0FF01F010201F0),
    .INIT_06(256'hD10F20FB0EEE010303FEEEE2E22FF0F11F13F8F20EFE01D1EFEDE01FF0DF001F),
    .INIT_07(256'hE06301F10D13FEDDFEDEED3EF00E0E0E11E010D11F0EDF0D0101EF0EE0D0F111),
    .INIT_08(256'h21000330F022F42CCCEECEFCC3FEFFFF1EDFFFDEE10F0000EE0FFBD85E411120),
    .INIT_09(256'hEEE00DEEFEEEFFFF1BFBDDB9CACBA8E000FFD0FC0100110341FEFECDCCDE0232),
    .INIT_0A(256'h110F0E011FF201F0EEEE0010F11F01F1010EF001FF110FE00FF1FF0010FFEE00),
    .INIT_0B(256'hF0F0FEFFDE0FF0F000F000F01111F0110100B80FF0EFEED0F1FFFF001F0FF00F),
    .INIT_0C(256'hAD45E92F92290A0E3EA0032434EBCDF40F010F1F1FFDFEDE01E1F00000F0E1F0),
    .INIT_0D(256'h9E1F859CCDCDD2EAB3FA308BACFEEBAB20D0CE02C4C6CE5CFD1A3462B41ED403),
    .INIT_0E(256'hEF0939FC0A3B4D052FB2BC45BB22AF20F0490E18FCFA053A1EEF4BDD3DC3F0DD),
    .INIT_0F(256'h9AFC2BDD13EA1FBBDC1C9BF1C0CCAE2A3AD0D14E30FCA0DCC0C2B9A9ED10AFD9),
    .INIT_10(256'h2DC22213FA9FB102202DFD1FA1EF9ED121A23AC1A0CAE1F10D24A0D3BCB08EAF),
    .INIT_11(256'h0ECBDFDFF1F2DE22120D1E3E1D10E4F3931C2BEFDE2E329029F32B02B0E18DB3),
    .INIT_12(256'h7434E842F3001EB0CC0DD01CF2C00212D4EEFF1100324ECF11DF3232CDC00E12),
    .INIT_13(256'hDEFF1020FFBBAEDBEFF1D0110D01F4023EFEFCBCFFF4130310FE221043E03243),
    .INIT_14(256'h01D2CEAD1F480ACCF029820EC3DADFB4035900EB0FCDFBDB01C2F3F0CCD2BC1E),
    .INIT_15(256'hFD5EBA0A28FEA918811202D011E01CDD1DFB1F2D10FEDC91E00A4C522DFBCDFD),
    .INIT_16(256'hEFE221C30FF6E1FF1422EE0C0EDE2124AF3A0EAAF00A39CD0CBCA12C1A2FCAFA),
    .INIT_17(256'hE1151F23DD1F252FF9CE3DDAC01B1CEC124ED22D30F20EE0DD0F4401FDC1C3CF),
    .INIT_18(256'h1E32FD11B18DD9EBE447AC1322200408BE200C8DE1314130F6D0EEFF33EFF40D),
    .INIT_19(256'hF000FFFFFFF00F0EF0E0FF0F00F0FF0FF0F000000000000FF000FF0FFFF0F0F0),
    .INIT_1A(256'hDEFF100FF0000FFFFF000F0F00FFFEF0001E8810F0F0FEFFFDDFFEF01F00000F),
    .INIT_1B(256'h110F00F0FF0FFFF0F0F0000FF00FFFF0FF0FFF00FFEFF00FFFE000000FF000FF),
    .INIT_1C(256'h1013D800F0FFFEFFF0EEEECEEDF0F0000010FF00F00F1000F00FF0F000000F0F),
    .INIT_1D(256'hFF0F00F00FF000FFF1F1FFFFF001FFF0F0FFEBFDDFEFF000FFF0F0F000F0EF01),
    .INIT_1E(256'hFF0000FFF00F000000000FF0FF00F0F0100FF00F000000FF0FF0FFF00000000F),
    .INIT_1F(256'h00FFFDDCE0FF0FFDDEFFFF000000F0001112C80000FFF0EFFFFFFECCEBFFFF00),
    .INIT_20(256'hA30F0F992B93E15D09CF20BBD0324AA2FF0FF000FEF0000001F000FF00000FF1),
    .INIT_21(256'h8EDE8AE432E0F0C4BF4CD400AECEA01CEAD1B032D19E41B2E0C5F5C9BA343E3B),
    .INIT_22(256'h33B3B991A0ED91CBE5ACFAC5DDA9D2CD1F055B9E4951CD09F9EFD9C00C52C829),
    .INIT_23(256'h100222DD134000000EDE1EF0EEEE2CCC2ADDFFDE1125F11DC00E2E21DD2D3031),
    .INIT_24(256'h403219BE2F2DE033F02213F24EDD01FEEEFDDBED04301E0331044DEFCD1E1032),
    .INIT_25(256'h15012FE0FCE000F1E10100DE111EDEFE222D0FF21ECC88BDA0D40FF2EC21FEF1),
    .INIT_26(256'hF10E0E10EDFFE10D11F00010231110FE0FE0000FFEFFF13F01E01FEFEDFE0E0F),
    .INIT_27(256'h1D00D0100EFDBDDBFDF800DFF0F0FE002220011E00F10211311D1FFEFEED000F),
    .INIT_28(256'h20EDEFD1110130DDCEED2F10E1C2EDDC30CF001E0F2110EE22FDF01ED0222F1F),
    .INIT_29(256'h1B1D188C0FF12F3000E1F00E20E01FF01EFDCC4FE12F2FDEF13D1DEACE00E0E1),
    .INIT_2A(256'h34DB18B2AECFCFC13094B4B22396CDB1221121FDEEEDBECFFFF310B21F2EF0F2),
    .INIT_2B(256'h3A4EE6F8118EB0DE90F8EABBB224F542BCD9CED93D1353C829C20D5D52320BC1),
    .INIT_2C(256'hE830CE4BB91BB1A04ECC3DAE0A9FD18084101AF032A5C5092EBC09445A3C4496),
    .INIT_2D(256'hE32201FD10F21FFD1D101233BDFFFFE00CEEFE0E21341DF20EF2F1FD22F220F1),
    .INIT_2E(256'hEE0FEADF23012230110E010E0F3320E1F011F84020F3E1CFDFFDE0FEFD20E2F1),
    .INIT_2F(256'h0F0101F000000FFFF0FFFFEFF10000FF0022F21D02DBEDEA0E0500F0CEE2E101),
    .INIT_30(256'h10108E1000F10F10DF000FEF0DFF0FFFF0FEF10FFF111EE0F0000012F00FF0FF),
    .INIT_31(256'h0FF1FEFEFEF001F00F0FFF00F00FF11EC100F10D000F011111F0F0101F00FF01),
    .INIT_32(256'h12EF1E0FF020F020F00FF03EC1EF00FDE9FF0EEFFDEEEF01021EF0F1010FFF10),
    .INIT_33(256'h100010E2EFFFEEF1111210100FEE0DEFEDEE24EEFEFFF11B3111113211120010),
    .INIT_34(256'hF0F00000F001F0FFFFF0FF00000000F0F000111E02DECCBCB8F82100F0FF1B01),
    .INIT_35(256'h1111B81000FF0FF0FFEEDEBCECFFFFFFFF0FF0FFFFF000F0000000F1000F00FF),
    .INIT_36(256'h00FF00000EF000000001FFFF0000F0FFFFFFFDC8F00010FDCEFF0F0FFF000011),
    .INIT_37(256'h010F1FFF0FF000100000FFF1EFF0FF0F0FFFFF000FFFF000F00000F1000FFFFF),
    .INIT_38(256'h00F0FDDEE0FFF00EEF0F00000FF1F0F00011D8EFFF0FEEF000EFEFE0FE00000F),
    .INIT_39(256'h11C23030D353BD01C233BFCA2DF04EFB000000000FFFFF0FF0EFF0FFFFFF0FF0),
    .INIT_3A(256'hBAC0CEFBFA3B8C31FC6F7DBFB4C02A3104D0C3B2DF1D01CADBAA82C4BBB24412),
    .INIT_3B(256'hAF092D2ACBEEBA4FFB0B8A02DE8AF2808A0D9BC7BA0DB3E02BEBECECA24D54A9),
    .INIT_3C(256'h20010F10FFE021FDFFE0FF10D1E1E1001F0FEFE0E11FE00F10EEFF1FF0FF01F2),
    .INIT_3D(256'h1E11FFCC02F10E02111F00121010F01EFF21D81F102FE0011FFEFFDEFEF1FE0F),
    .INIT_3E(256'h10FDFFED012500FFE21FFEEF2EF0FF03201F1EE2F1ECECCFCDF3FFF1EEE11E0F),
    .INIT_3F(256'h1E33E8F201FF200ECECFDFFB001E20F034FFDEF1E0242F1DC0DEF115F00F0010),
    .INIT_40(256'hFF100F20D1FFCEF0F0E40FEDFFDEE0DEDE3D1F1C032E235321EFF1EE30120132),
    .INIT_41(256'h3003CFCBCCCF1B03C33E0DD0FD31011D3EF3EE20013E0F012ADF212E23CBFACC),
    .INIT_42(256'h39D01DCFDCE3F2FDBB2CA4FCA13D0CEFD83E52C11BEFABD3F1EE0D2CBE2F0EC1),
    .INIT_43(256'hF0F000FEEFDFF0FF0F0000E0EF0FF00FDEC02ADFADCEDC9BFC9C03C1E0D12BBE),
    .INIT_44(256'h00F00F00F0FFF00F0110000110FFFFFFF0FFFFFFFFF0000FFF0FEFF1FEE0000F),
    .INIT_45(256'h0F0F000000FFCECEEE080FF0FFEF10F0000F101FFFFDCCD02FFFFF00F0000F00),
    .INIT_46(256'h00EDEFE0D0FEEEAD0011021FC0EE102101FFD0101CE0EF1EF11EDE0CD1FEF00D),
    .INIT_47(256'hCDEBD2F3FE2DE1F0E0F100FF02EE33FE2BB34640EDCE1E2080DBFEAE23E1ED1E),
    .INIT_48(256'h0FFFEFFFF00100011FFF0000EF0000FFC1E01F0DD01A9BF1527BFFDE0FF2F1EA),
    .INIT_49(256'h0012D8FEEE0E0EE100F000DEFE00F0F0001FF00FFF0F1F00FFFF0F0110F0100F),
    .INIT_4A(256'hFF1FF0000FEF0E00F0F10EEFFEF000F02100FF0EFF00F000F0F11F0F0000EFFF),
    .INIT_4B(256'hFF00F00FFF0FFF0FF00FF00FF0F0FFFFFF0000000FF000000F00F0000000000F),
    .INIT_4C(256'h0FFFEFFCE0FF00EEEF0000F0F00FF010001188F00FF0FF0FFEEEF0F00E000000),
    .INIT_4D(256'h120EFFEE0F16F11EEEE2E0EE1FD0D1FFFF0FFFF0FEFF0F0FF0FF0F0F00F0F0FF),
    .INIT_4E(256'hA10B92E1DDD31AF20E0B30D5F4E1DD1EC01EDE10F8C7F211BCFEA3F1D00E1DCE),
    .INIT_4F(256'hFDE21FE1DDDEE0CA10232E1C1F0B130012DB55071FFD9ACED10C0220E011310D),
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
    .INIT_FILE("NONE"),
    .RAM_EXTENSION_A("NONE"),
    .RAM_EXTENSION_B("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(4),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(36'h000000000),
    .SRVAL_B(36'h000000000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(4),
    .WRITE_WIDTH_B(0)) 
    data_reg_1
       (.ADDRARDADDR({1'b1,addr,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CASCADEINA(1'b1),
        .CASCADEINB(1'b0),
        .CASCADEOUTA(NLW_data_reg_1_CASCADEOUTA_UNCONNECTED),
        .CASCADEOUTB(NLW_data_reg_1_CASCADEOUTB_UNCONNECTED),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DBITERR(NLW_data_reg_1_DBITERR_UNCONNECTED),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1}),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0,1'b0,1'b0}),
        .DIPBDIP({1'b1,1'b1,1'b1,1'b1}),
        .DOADO({NLW_data_reg_1_DOADO_UNCONNECTED[31:4],data[7:4]}),
        .DOBDO(NLW_data_reg_1_DOBDO_UNCONNECTED[31:0]),
        .DOPADOP(NLW_data_reg_1_DOPADOP_UNCONNECTED[3:0]),
        .DOPBDOP(NLW_data_reg_1_DOPBDOP_UNCONNECTED[3:0]),
        .ECCPARITY(NLW_data_reg_1_ECCPARITY_UNCONNECTED[7:0]),
        .ENARDEN(en),
        .ENBWREN(1'b0),
        .INJECTDBITERR(NLW_data_reg_1_INJECTDBITERR_UNCONNECTED),
        .INJECTSBITERR(NLW_data_reg_1_INJECTSBITERR_UNCONNECTED),
        .RDADDRECC(NLW_data_reg_1_RDADDRECC_UNCONNECTED[8:0]),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .SBITERR(NLW_data_reg_1_SBITERR_UNCONNECTED),
        .WEA({1'b0,1'b0,1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ADDR_WIDTH = "5" *) (* DEPTH = "32" *) (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/output_weights.memh" *) 
(* ORIG_REF_NAME = "parameter_rom_sync" *) (* WIDTH = "8" *) 
module parameter_rom_sync__parameterized0
   (clk,
    en,
    addr,
    data);
  input clk;
  input en;
  input [4:0]addr;
  output [7:0]data;

  wire [4:0]addr;
  wire clk;
  wire [7:0]data;
  wire en;
  wire [7:0]p_0_out;

  FDRE #(
    .INIT(1'b0)) 
    \data_reg[0] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[0]),
        .Q(data[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[1] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[1]),
        .Q(data[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[2] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[2]),
        .Q(data[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[3] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[3]),
        .Q(data[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[4] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[4]),
        .Q(data[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[5] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[5]),
        .Q(data[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[6] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[6]),
        .Q(data[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[7] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[7]),
        .Q(data[7]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hC13FDAB6)) 
    g0_b0
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h73A17AC9)) 
    g0_b1
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hD0E16BFC)) 
    g0_b2
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h7BB7D0EA)) 
    g0_b3
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hB3360889)) 
    g0_b4
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h1878AC75)) 
    g0_b5
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hC822B040)) 
    g0_b6
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'h9802A048)) 
    g0_b7
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[7]));
endmodule

(* ADDR_WIDTH = "5" *) (* DEPTH = "32" *) (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/fc1_bias.memh" *) 
(* ORIG_REF_NAME = "parameter_rom_sync" *) (* WIDTH = "32" *) 
module parameter_rom_sync__parameterized1
   (clk,
    en,
    addr,
    data);
  input clk;
  input en;
  input [4:0]addr;
  output [31:0]data;

  wire [4:0]addr;
  wire clk;
  wire [31:0]data;
  wire en;
  wire [13:0]p_0_out;

  FDRE #(
    .INIT(1'b0)) 
    \data_reg[0] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[0]),
        .Q(data[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[10] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[10]),
        .Q(data[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[11] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[11]),
        .Q(data[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[12] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[12]),
        .Q(data[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[13] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[13]),
        .Q(data[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[1] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[1]),
        .Q(data[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[2] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[2]),
        .Q(data[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[3] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[3]),
        .Q(data[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[4] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[4]),
        .Q(data[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[5] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[5]),
        .Q(data[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[6] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[6]),
        .Q(data[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[7] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[7]),
        .Q(data[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[8] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[8]),
        .Q(data[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[9] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[9]),
        .Q(data[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h5F617BCD)) 
    g0_b0
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h7E010B6B)) 
    g0_b1
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h47BA7B07)) 
    g0_b10
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[10]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'hC42F5B61)) 
    g0_b11
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[11]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hC4A81821)) 
    g0_b12
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[12]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hC4AA1961)) 
    g0_b13
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[13]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h6D545B77)) 
    g0_b2
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'h4D011364)) 
    g0_b3
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h8F10A267)) 
    g0_b4
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h02AD908A)) 
    g0_b5
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h9900034E)) 
    g0_b6
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT5 #(
    .INIT(32'h9188B5AD)) 
    g0_b7
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[7]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hF6CB1221)) 
    g0_b8
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[8]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h72B7CC1A)) 
    g0_b9
       (.I0(addr[0]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[3]),
        .I4(addr[4]),
        .O(p_0_out[9]));
endmodule

(* ADDR_WIDTH = "4" *) (* DEPTH = "16" *) (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv2_multiplier.memh" *) 
(* ORIG_REF_NAME = "parameter_rom_sync" *) (* WIDTH = "32" *) 
module parameter_rom_sync__parameterized10
   (clk,
    en,
    addr,
    data);
  input clk;
  input en;
  input [3:0]addr;
  output [31:0]data;

  wire [3:0]addr;
  wire clk;
  wire [31:0]data;
  wire \data[0]_i_1_n_0 ;
  wire \data[10]_i_1_n_0 ;
  wire \data[11]_i_1_n_0 ;
  wire \data[12]_i_1_n_0 ;
  wire \data[13]_i_1_n_0 ;
  wire \data[14]_i_1_n_0 ;
  wire \data[15]_i_1_n_0 ;
  wire \data[16]_i_1_n_0 ;
  wire \data[17]_i_1_n_0 ;
  wire \data[18]_i_1_n_0 ;
  wire \data[19]_i_1_n_0 ;
  wire \data[1]_i_1_n_0 ;
  wire \data[20]_i_1_n_0 ;
  wire \data[21]_i_1_n_0 ;
  wire \data[22]_i_1_n_0 ;
  wire \data[23]_i_1_n_0 ;
  wire \data[24]_i_1_n_0 ;
  wire \data[2]_i_1_n_0 ;
  wire \data[3]_i_1_n_0 ;
  wire \data[4]_i_1_n_0 ;
  wire \data[5]_i_1_n_0 ;
  wire \data[6]_i_1_n_0 ;
  wire \data[7]_i_1_n_0 ;
  wire \data[8]_i_1_n_0 ;
  wire \data[9]_i_1_n_0 ;
  wire en;

  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h8003)) 
    \data[0]_i_1 
       (.I0(addr[3]),
        .I1(addr[0]),
        .I2(addr[1]),
        .I3(addr[2]),
        .O(\data[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'hB420)) 
    \data[10]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair36" *) 
  LUT4 #(
    .INIT(16'hAF30)) 
    \data[11]_i_1 
       (.I0(addr[1]),
        .I1(addr[0]),
        .I2(addr[3]),
        .I3(addr[2]),
        .O(\data[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h12D7)) 
    \data[12]_i_1 
       (.I0(addr[3]),
        .I1(addr[0]),
        .I2(addr[2]),
        .I3(addr[1]),
        .O(\data[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair37" *) 
  LUT4 #(
    .INIT(16'h4B30)) 
    \data[13]_i_1 
       (.I0(addr[2]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'hB0C8)) 
    \data[14]_i_1 
       (.I0(addr[1]),
        .I1(addr[3]),
        .I2(addr[2]),
        .I3(addr[0]),
        .O(\data[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair38" *) 
  LUT4 #(
    .INIT(16'h8071)) 
    \data[15]_i_1 
       (.I0(addr[3]),
        .I1(addr[0]),
        .I2(addr[1]),
        .I3(addr[2]),
        .O(\data[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'hD608)) 
    \data[16]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair39" *) 
  LUT4 #(
    .INIT(16'h94E9)) 
    \data[17]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h0078)) 
    \data[18]_i_1 
       (.I0(addr[2]),
        .I1(addr[3]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair40" *) 
  LUT4 #(
    .INIT(16'h74C3)) 
    \data[19]_i_1 
       (.I0(addr[0]),
        .I1(addr[3]),
        .I2(addr[2]),
        .I3(addr[1]),
        .O(\data[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair31" *) 
  LUT4 #(
    .INIT(16'h3077)) 
    \data[1]_i_1 
       (.I0(addr[0]),
        .I1(addr[3]),
        .I2(addr[2]),
        .I3(addr[1]),
        .O(\data[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h8FCA)) 
    \data[20]_i_1 
       (.I0(addr[3]),
        .I1(addr[0]),
        .I2(addr[2]),
        .I3(addr[1]),
        .O(\data[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair41" *) 
  LUT4 #(
    .INIT(16'h9EF7)) 
    \data[21]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'h6814)) 
    \data[22]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair42" *) 
  LUT4 #(
    .INIT(16'h4020)) 
    \data[23]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0200)) 
    \data[24]_i_1 
       (.I0(addr[3]),
        .I1(addr[1]),
        .I2(addr[0]),
        .I3(addr[2]),
        .O(\data[24]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h681E)) 
    \data[2]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair32" *) 
  LUT4 #(
    .INIT(16'h8494)) 
    \data[3]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'hBCBF)) 
    \data[4]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair33" *) 
  LUT4 #(
    .INIT(16'h405A)) 
    \data[5]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h9A07)) 
    \data[6]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair34" *) 
  LUT4 #(
    .INIT(16'h61C6)) 
    \data[7]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'hA2BD)) 
    \data[8]_i_1 
       (.I0(addr[3]),
        .I1(addr[0]),
        .I2(addr[2]),
        .I3(addr[1]),
        .O(\data[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair35" *) 
  LUT4 #(
    .INIT(16'h8A21)) 
    \data[9]_i_1 
       (.I0(addr[3]),
        .I1(addr[0]),
        .I2(addr[1]),
        .I3(addr[2]),
        .O(\data[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[0] 
       (.C(clk),
        .CE(en),
        .D(\data[0]_i_1_n_0 ),
        .Q(data[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[10] 
       (.C(clk),
        .CE(en),
        .D(\data[10]_i_1_n_0 ),
        .Q(data[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[11] 
       (.C(clk),
        .CE(en),
        .D(\data[11]_i_1_n_0 ),
        .Q(data[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[12] 
       (.C(clk),
        .CE(en),
        .D(\data[12]_i_1_n_0 ),
        .Q(data[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[13] 
       (.C(clk),
        .CE(en),
        .D(\data[13]_i_1_n_0 ),
        .Q(data[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[14] 
       (.C(clk),
        .CE(en),
        .D(\data[14]_i_1_n_0 ),
        .Q(data[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[15] 
       (.C(clk),
        .CE(en),
        .D(\data[15]_i_1_n_0 ),
        .Q(data[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[16] 
       (.C(clk),
        .CE(en),
        .D(\data[16]_i_1_n_0 ),
        .Q(data[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[17] 
       (.C(clk),
        .CE(en),
        .D(\data[17]_i_1_n_0 ),
        .Q(data[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[18] 
       (.C(clk),
        .CE(en),
        .D(\data[18]_i_1_n_0 ),
        .Q(data[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[19] 
       (.C(clk),
        .CE(en),
        .D(\data[19]_i_1_n_0 ),
        .Q(data[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[1] 
       (.C(clk),
        .CE(en),
        .D(\data[1]_i_1_n_0 ),
        .Q(data[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[20] 
       (.C(clk),
        .CE(en),
        .D(\data[20]_i_1_n_0 ),
        .Q(data[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[21] 
       (.C(clk),
        .CE(en),
        .D(\data[21]_i_1_n_0 ),
        .Q(data[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[22] 
       (.C(clk),
        .CE(en),
        .D(\data[22]_i_1_n_0 ),
        .Q(data[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[23] 
       (.C(clk),
        .CE(en),
        .D(\data[23]_i_1_n_0 ),
        .Q(data[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[24] 
       (.C(clk),
        .CE(en),
        .D(\data[24]_i_1_n_0 ),
        .Q(data[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[2] 
       (.C(clk),
        .CE(en),
        .D(\data[2]_i_1_n_0 ),
        .Q(data[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[3] 
       (.C(clk),
        .CE(en),
        .D(\data[3]_i_1_n_0 ),
        .Q(data[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[4] 
       (.C(clk),
        .CE(en),
        .D(\data[4]_i_1_n_0 ),
        .Q(data[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[5] 
       (.C(clk),
        .CE(en),
        .D(\data[5]_i_1_n_0 ),
        .Q(data[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[6] 
       (.C(clk),
        .CE(en),
        .D(\data[6]_i_1_n_0 ),
        .Q(data[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[7] 
       (.C(clk),
        .CE(en),
        .D(\data[7]_i_1_n_0 ),
        .Q(data[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[8] 
       (.C(clk),
        .CE(en),
        .D(\data[8]_i_1_n_0 ),
        .Q(data[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[9] 
       (.C(clk),
        .CE(en),
        .D(\data[9]_i_1_n_0 ),
        .Q(data[9]),
        .R(1'b0));
endmodule

(* ADDR_WIDTH = "4" *) (* DEPTH = "16" *) (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv1_bias.memh" *) 
(* ORIG_REF_NAME = "parameter_rom_sync" *) (* WIDTH = "32" *) 
module parameter_rom_sync__parameterized12
   (clk,
    en,
    addr,
    data);
  input clk;
  input en;
  input [3:0]addr;
  output [31:0]data;

  wire [3:0]addr;
  wire clk;
  wire [31:0]data;
  wire \data[0]_i_1_n_0 ;
  wire \data[10]_i_1_n_0 ;
  wire \data[11]_i_1_n_0 ;
  wire \data[12]_i_1_n_0 ;
  wire \data[1]_i_1_n_0 ;
  wire \data[2]_i_1_n_0 ;
  wire \data[31]_i_1_n_0 ;
  wire \data[3]_i_1_n_0 ;
  wire \data[4]_i_1_n_0 ;
  wire \data[5]_i_1_n_0 ;
  wire \data[6]_i_1_n_0 ;
  wire \data[7]_i_1_n_0 ;
  wire \data[8]_i_1_n_0 ;
  wire \data[9]_i_1_n_0 ;
  wire en;

  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'h4288)) 
    \data[0]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'h33F8)) 
    \data[10]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair48" *) 
  LUT4 #(
    .INIT(16'hD262)) 
    \data[11]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'h2373)) 
    \data[12]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair43" *) 
  LUT4 #(
    .INIT(16'h2A9E)) 
    \data[1]_i_1 
       (.I0(addr[3]),
        .I1(addr[0]),
        .I2(addr[1]),
        .I3(addr[2]),
        .O(\data[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'h3840)) 
    \data[2]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair49" *) 
  LUT4 #(
    .INIT(16'h1732)) 
    \data[31]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair44" *) 
  LUT4 #(
    .INIT(16'h6834)) 
    \data[3]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'hE37B)) 
    \data[4]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair45" *) 
  LUT4 #(
    .INIT(16'hF07F)) 
    \data[5]_i_1 
       (.I0(addr[0]),
        .I1(addr[2]),
        .I2(addr[3]),
        .I3(addr[1]),
        .O(\data[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'hC56C)) 
    \data[6]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair46" *) 
  LUT4 #(
    .INIT(16'h3F20)) 
    \data[7]_i_1 
       (.I0(addr[1]),
        .I1(addr[0]),
        .I2(addr[3]),
        .I3(addr[2]),
        .O(\data[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'hE267)) 
    \data[8]_i_1 
       (.I0(addr[3]),
        .I1(addr[0]),
        .I2(addr[2]),
        .I3(addr[1]),
        .O(\data[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair47" *) 
  LUT4 #(
    .INIT(16'h92F1)) 
    \data[9]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[0] 
       (.C(clk),
        .CE(en),
        .D(\data[0]_i_1_n_0 ),
        .Q(data[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[10] 
       (.C(clk),
        .CE(en),
        .D(\data[10]_i_1_n_0 ),
        .Q(data[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[11] 
       (.C(clk),
        .CE(en),
        .D(\data[11]_i_1_n_0 ),
        .Q(data[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[12] 
       (.C(clk),
        .CE(en),
        .D(\data[12]_i_1_n_0 ),
        .Q(data[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[1] 
       (.C(clk),
        .CE(en),
        .D(\data[1]_i_1_n_0 ),
        .Q(data[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[2] 
       (.C(clk),
        .CE(en),
        .D(\data[2]_i_1_n_0 ),
        .Q(data[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[31] 
       (.C(clk),
        .CE(en),
        .D(\data[31]_i_1_n_0 ),
        .Q(data[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[3] 
       (.C(clk),
        .CE(en),
        .D(\data[3]_i_1_n_0 ),
        .Q(data[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[4] 
       (.C(clk),
        .CE(en),
        .D(\data[4]_i_1_n_0 ),
        .Q(data[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[5] 
       (.C(clk),
        .CE(en),
        .D(\data[5]_i_1_n_0 ),
        .Q(data[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[6] 
       (.C(clk),
        .CE(en),
        .D(\data[6]_i_1_n_0 ),
        .Q(data[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[7] 
       (.C(clk),
        .CE(en),
        .D(\data[7]_i_1_n_0 ),
        .Q(data[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[8] 
       (.C(clk),
        .CE(en),
        .D(\data[8]_i_1_n_0 ),
        .Q(data[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[9] 
       (.C(clk),
        .CE(en),
        .D(\data[9]_i_1_n_0 ),
        .Q(data[9]),
        .R(1'b0));
endmodule

(* ADDR_WIDTH = "4" *) (* DEPTH = "16" *) (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv1_multiplier.memh" *) 
(* ORIG_REF_NAME = "parameter_rom_sync" *) (* WIDTH = "32" *) 
module parameter_rom_sync__parameterized13
   (clk,
    en,
    addr,
    data);
  input clk;
  input en;
  input [3:0]addr;
  output [31:0]data;

  wire [3:0]addr;
  wire clk;
  wire [31:0]data;
  wire \data[0]_i_1_n_0 ;
  wire \data[10]_i_1_n_0 ;
  wire \data[11]_i_1_n_0 ;
  wire \data[12]_i_1_n_0 ;
  wire \data[13]_i_1_n_0 ;
  wire \data[14]_i_1_n_0 ;
  wire \data[15]_i_1_n_0 ;
  wire \data[16]_i_1_n_0 ;
  wire \data[17]_i_1_n_0 ;
  wire \data[18]_i_1_n_0 ;
  wire \data[19]_i_1_n_0 ;
  wire \data[1]_i_1_n_0 ;
  wire \data[20]_i_1_n_0 ;
  wire \data[21]_i_1_n_0 ;
  wire \data[22]_i_1_n_0 ;
  wire \data[23]_i_1_n_0 ;
  wire \data[2]_i_1_n_0 ;
  wire \data[3]_i_1_n_0 ;
  wire \data[4]_i_1_n_0 ;
  wire \data[5]_i_1_n_0 ;
  wire \data[6]_i_1_n_0 ;
  wire \data[7]_i_1_n_0 ;
  wire \data[8]_i_1_n_0 ;
  wire \data[9]_i_1_n_0 ;
  wire en;

  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'h7801)) 
    \data[0]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'hB8F9)) 
    \data[10]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'hA46D)) 
    \data[11]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair55" *) 
  LUT4 #(
    .INIT(16'h4235)) 
    \data[12]_i_1 
       (.I0(addr[3]),
        .I1(addr[0]),
        .I2(addr[2]),
        .I3(addr[1]),
        .O(\data[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT4 #(
    .INIT(16'h3C77)) 
    \data[13]_i_1 
       (.I0(addr[0]),
        .I1(addr[3]),
        .I2(addr[2]),
        .I3(addr[1]),
        .O(\data[13]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair56" *) 
  LUT4 #(
    .INIT(16'h20B7)) 
    \data[14]_i_1 
       (.I0(addr[3]),
        .I1(addr[0]),
        .I2(addr[2]),
        .I3(addr[1]),
        .O(\data[14]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'hF748)) 
    \data[15]_i_1 
       (.I0(addr[3]),
        .I1(addr[0]),
        .I2(addr[2]),
        .I3(addr[1]),
        .O(\data[15]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'h5F38)) 
    \data[16]_i_1 
       (.I0(addr[3]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[0]),
        .O(\data[16]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair58" *) 
  LUT4 #(
    .INIT(16'h64A7)) 
    \data[17]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[17]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'h1DF2)) 
    \data[18]_i_1 
       (.I0(addr[3]),
        .I1(addr[0]),
        .I2(addr[2]),
        .I3(addr[1]),
        .O(\data[18]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair59" *) 
  LUT4 #(
    .INIT(16'h1FDC)) 
    \data[19]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[19]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair50" *) 
  LUT4 #(
    .INIT(16'h7A41)) 
    \data[1]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'hF8F7)) 
    \data[20]_i_1 
       (.I0(addr[1]),
        .I1(addr[3]),
        .I2(addr[2]),
        .I3(addr[0]),
        .O(\data[20]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair60" *) 
  LUT4 #(
    .INIT(16'h8712)) 
    \data[21]_i_1 
       (.I0(addr[3]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[0]),
        .O(\data[21]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'hBEF9)) 
    \data[22]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[22]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair61" *) 
  LUT4 #(
    .INIT(16'h0080)) 
    \data[23]_i_1 
       (.I0(addr[1]),
        .I1(addr[0]),
        .I2(addr[2]),
        .I3(addr[3]),
        .O(\data[23]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'h44CA)) 
    \data[2]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair51" *) 
  LUT4 #(
    .INIT(16'h607A)) 
    \data[3]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'h0E00)) 
    \data[4]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair52" *) 
  LUT4 #(
    .INIT(16'hE15D)) 
    \data[5]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'h4B7B)) 
    \data[6]_i_1 
       (.I0(addr[0]),
        .I1(addr[3]),
        .I2(addr[2]),
        .I3(addr[1]),
        .O(\data[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair53" *) 
  LUT4 #(
    .INIT(16'h5204)) 
    \data[7]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair54" *) 
  LUT4 #(
    .INIT(16'h92FF)) 
    \data[8]_i_1 
       (.I0(addr[3]),
        .I1(addr[0]),
        .I2(addr[2]),
        .I3(addr[1]),
        .O(\data[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair57" *) 
  LUT4 #(
    .INIT(16'hA028)) 
    \data[9]_i_1 
       (.I0(addr[3]),
        .I1(addr[0]),
        .I2(addr[1]),
        .I3(addr[2]),
        .O(\data[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[0] 
       (.C(clk),
        .CE(en),
        .D(\data[0]_i_1_n_0 ),
        .Q(data[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[10] 
       (.C(clk),
        .CE(en),
        .D(\data[10]_i_1_n_0 ),
        .Q(data[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[11] 
       (.C(clk),
        .CE(en),
        .D(\data[11]_i_1_n_0 ),
        .Q(data[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[12] 
       (.C(clk),
        .CE(en),
        .D(\data[12]_i_1_n_0 ),
        .Q(data[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[13] 
       (.C(clk),
        .CE(en),
        .D(\data[13]_i_1_n_0 ),
        .Q(data[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[14] 
       (.C(clk),
        .CE(en),
        .D(\data[14]_i_1_n_0 ),
        .Q(data[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[15] 
       (.C(clk),
        .CE(en),
        .D(\data[15]_i_1_n_0 ),
        .Q(data[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[16] 
       (.C(clk),
        .CE(en),
        .D(\data[16]_i_1_n_0 ),
        .Q(data[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[17] 
       (.C(clk),
        .CE(en),
        .D(\data[17]_i_1_n_0 ),
        .Q(data[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[18] 
       (.C(clk),
        .CE(en),
        .D(\data[18]_i_1_n_0 ),
        .Q(data[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[19] 
       (.C(clk),
        .CE(en),
        .D(\data[19]_i_1_n_0 ),
        .Q(data[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[1] 
       (.C(clk),
        .CE(en),
        .D(\data[1]_i_1_n_0 ),
        .Q(data[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[20] 
       (.C(clk),
        .CE(en),
        .D(\data[20]_i_1_n_0 ),
        .Q(data[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[21] 
       (.C(clk),
        .CE(en),
        .D(\data[21]_i_1_n_0 ),
        .Q(data[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[22] 
       (.C(clk),
        .CE(en),
        .D(\data[22]_i_1_n_0 ),
        .Q(data[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[23] 
       (.C(clk),
        .CE(en),
        .D(\data[23]_i_1_n_0 ),
        .Q(data[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[2] 
       (.C(clk),
        .CE(en),
        .D(\data[2]_i_1_n_0 ),
        .Q(data[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[3] 
       (.C(clk),
        .CE(en),
        .D(\data[3]_i_1_n_0 ),
        .Q(data[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[4] 
       (.C(clk),
        .CE(en),
        .D(\data[4]_i_1_n_0 ),
        .Q(data[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[5] 
       (.C(clk),
        .CE(en),
        .D(\data[5]_i_1_n_0 ),
        .Q(data[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[6] 
       (.C(clk),
        .CE(en),
        .D(\data[6]_i_1_n_0 ),
        .Q(data[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[7] 
       (.C(clk),
        .CE(en),
        .D(\data[7]_i_1_n_0 ),
        .Q(data[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[8] 
       (.C(clk),
        .CE(en),
        .D(\data[8]_i_1_n_0 ),
        .Q(data[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[9] 
       (.C(clk),
        .CE(en),
        .D(\data[9]_i_1_n_0 ),
        .Q(data[9]),
        .R(1'b0));
endmodule

(* ADDR_WIDTH = "5" *) (* DEPTH = "32" *) (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/fc1_multiplier.memh" *) 
(* ORIG_REF_NAME = "parameter_rom_sync" *) (* WIDTH = "32" *) 
module parameter_rom_sync__parameterized2
   (clk,
    en,
    addr,
    data);
  input clk;
  input en;
  input [4:0]addr;
  output [31:0]data;

  wire [4:0]addr;
  wire clk;
  wire [31:0]data;
  wire en;
  wire [25:0]p_0_out;

  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'h25302F11)) 
    \data[0]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[1]),
        .I4(addr[2]),
        .O(p_0_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'hA3FC451F)) 
    \data[10]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[2]),
        .I4(addr[1]),
        .O(p_0_out[10]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'hC8EB7524)) 
    \data[11]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[2]),
        .I4(addr[1]),
        .O(p_0_out[11]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h389A3718)) 
    \data[12]_i_1 
       (.I0(addr[4]),
        .I1(addr[0]),
        .I2(addr[3]),
        .I3(addr[1]),
        .I4(addr[2]),
        .O(p_0_out[12]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT5 #(
    .INIT(32'h8F808473)) 
    \data[13]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[1]),
        .I3(addr[0]),
        .I4(addr[2]),
        .O(p_0_out[13]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h9711CDAC)) 
    \data[14]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[2]),
        .I4(addr[1]),
        .O(p_0_out[14]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h822E044B)) 
    \data[15]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[2]),
        .I3(addr[1]),
        .I4(addr[0]),
        .O(p_0_out[15]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT5 #(
    .INIT(32'h19F04D85)) 
    \data[16]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[2]),
        .I4(addr[1]),
        .O(p_0_out[16]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h6786C448)) 
    \data[17]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[1]),
        .I3(addr[2]),
        .I4(addr[0]),
        .O(p_0_out[17]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'hFADD6DF5)) 
    \data[18]_i_1 
       (.I0(addr[4]),
        .I1(addr[2]),
        .I2(addr[3]),
        .I3(addr[1]),
        .I4(addr[0]),
        .O(p_0_out[18]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'hB2B30C24)) 
    \data[19]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[2]),
        .I3(addr[0]),
        .I4(addr[1]),
        .O(p_0_out[19]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h2E4487B8)) 
    \data[1]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[1]),
        .I4(addr[2]),
        .O(p_0_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h80A0BAC9)) 
    \data[20]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[1]),
        .I4(addr[2]),
        .O(p_0_out[20]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h296D7D7E)) 
    \data[21]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[2]),
        .I4(addr[1]),
        .O(p_0_out[21]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT5 #(
    .INIT(32'h9E8A238A)) 
    \data[22]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[1]),
        .I4(addr[2]),
        .O(p_0_out[22]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'h4830A710)) 
    \data[23]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[2]),
        .I4(addr[1]),
        .O(p_0_out[23]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT5 #(
    .INIT(32'h0C00A441)) 
    \data[24]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[2]),
        .I3(addr[1]),
        .I4(addr[0]),
        .O(p_0_out[24]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT5 #(
    .INIT(32'h10000000)) 
    \data[25]_i_1 
       (.I0(addr[3]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[0]),
        .I4(addr[4]),
        .O(p_0_out[25]));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hB241A7C4)) 
    \data[2]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[2]),
        .I4(addr[1]),
        .O(p_0_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'hDEB80B62)) 
    \data[3]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[1]),
        .I4(addr[2]),
        .O(p_0_out[3]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT5 #(
    .INIT(32'h7086F588)) 
    \data[4]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[2]),
        .I4(addr[1]),
        .O(p_0_out[4]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'hDD860B13)) 
    \data[5]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[2]),
        .I3(addr[0]),
        .I4(addr[1]),
        .O(p_0_out[5]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'hDB2264B2)) 
    \data[6]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[1]),
        .I4(addr[2]),
        .O(p_0_out[6]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT5 #(
    .INIT(32'hF397EF00)) 
    \data[7]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[2]),
        .I4(addr[1]),
        .O(p_0_out[7]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h1BEE0A2B)) 
    \data[8]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[2]),
        .I4(addr[1]),
        .O(p_0_out[8]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT5 #(
    .INIT(32'h24B5136F)) 
    \data[9]_i_1 
       (.I0(addr[4]),
        .I1(addr[3]),
        .I2(addr[0]),
        .I3(addr[2]),
        .I4(addr[1]),
        .O(p_0_out[9]));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[0] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[0]),
        .Q(data[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[10] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[10]),
        .Q(data[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[11] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[11]),
        .Q(data[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[12] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[12]),
        .Q(data[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[13] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[13]),
        .Q(data[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[14] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[14]),
        .Q(data[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[15] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[15]),
        .Q(data[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[16] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[16]),
        .Q(data[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[17] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[17]),
        .Q(data[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[18] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[18]),
        .Q(data[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[19] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[19]),
        .Q(data[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[1] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[1]),
        .Q(data[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[20] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[20]),
        .Q(data[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[21] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[21]),
        .Q(data[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[22] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[22]),
        .Q(data[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[23] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[23]),
        .Q(data[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[24] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[24]),
        .Q(data[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[25] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[25]),
        .Q(data[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[2] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[2]),
        .Q(data[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[3] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[3]),
        .Q(data[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[4] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[4]),
        .Q(data[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[5] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[5]),
        .Q(data[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[6] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[6]),
        .Q(data[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[7] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[7]),
        .Q(data[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[8] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[8]),
        .Q(data[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[9] 
       (.C(clk),
        .CE(en),
        .D(p_0_out[9]),
        .Q(data[9]),
        .R(1'b0));
endmodule

(* ADDR_WIDTH = "8" *) (* DEPTH = "192" *) (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv1_weights.memh" *) 
(* ORIG_REF_NAME = "parameter_rom_sync" *) (* WIDTH = "8" *) 
module parameter_rom_sync__parameterized7
   (clk,
    en,
    addr,
    data);
  input clk;
  input en;
  input [7:0]addr;
  output [7:0]data;

  wire [7:0]addr;
  wire clk;
  wire [7:0]data;
  wire en;
  wire [15:8]NLW_data_reg_DOADO_UNCONNECTED;
  wire [15:0]NLW_data_reg_DOBDO_UNCONNECTED;
  wire [1:0]NLW_data_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_data_reg_DOPBDOP_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "2048" *) 
  (* RTL_RAM_NAME = "parameter_rom_sync/data_reg" *) 
  (* RTL_RAM_STYLE = "NONE" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
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
    .INIT_00(256'h007600500055005300C8003F00F2002900B2002A00D900A000DB007F00E10012),
    .INIT_01(256'h00E9000E00D5007A00A40016007F00BA00710081001500F000C4006C009C00E6),
    .INIT_02(256'h00FA00F6000F000800F0000A007F00D400A00066001800FA00F7000400040007),
    .INIT_03(256'h002A009200FC008100D400EC001000ED00F4000C007F00A9003900E90069008D),
    .INIT_04(256'h00BD000C00BC001E00120000002D007F00180009000800F40010002400C5002E),
    .INIT_05(256'h00FF000500FC00FC000600FF00C2007F002D00B10044000500E7001800F8002F),
    .INIT_06(256'h006900A300130081002F00CD002600E800130030007F002800AD00CD0067003B),
    .INIT_07(256'h001E00C900BA001F001C007F00700072000D00F5000200F7001200F600180031),
    .INIT_08(256'h00D8001F000700F9001B00ED003A0014000700EB00FC007F00E7003600DF000A),
    .INIT_09(256'h0004002A0081009600E9003700E200EC002F00E4008100430065000C00FA00FE),
    .INIT_0A(256'h0001000800D00007005C00000081008800E500F1001B0012000F00D000E700CF),
    .INIT_0B(256'h002200E800F700F7000B00FE00F4008B008100EF00F6002C00F1001300F200F0),
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
    .INIT_FILE("NONE"),
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
       (.ADDRARDADDR({1'b0,1'b0,addr,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b1,1'b1}),
        .DOADO({NLW_data_reg_DOADO_UNCONNECTED[15:8],data}),
        .DOBDO(NLW_data_reg_DOBDO_UNCONNECTED[15:0]),
        .DOPADOP(NLW_data_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_data_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(en),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ADDR_WIDTH = "10" *) (* DEPTH = "768" *) (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv2_weights.memh" *) 
(* ORIG_REF_NAME = "parameter_rom_sync" *) (* WIDTH = "8" *) 
module parameter_rom_sync__parameterized8
   (clk,
    en,
    addr,
    data);
  input clk;
  input en;
  input [9:0]addr;
  output [7:0]data;

  wire [9:0]addr;
  wire clk;
  wire [7:0]data;
  wire en;
  wire [15:8]NLW_data_reg_DOADO_UNCONNECTED;
  wire [15:0]NLW_data_reg_DOBDO_UNCONNECTED;
  wire [1:0]NLW_data_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_data_reg_DOPBDOP_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "8192" *) 
  (* RTL_RAM_NAME = "parameter_rom_sync/data_reg" *) 
  (* RTL_RAM_STYLE = "NONE" *) 
  (* RTL_RAM_TYPE = "RAM_SP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
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
    .INIT_00(256'h003C00CE00DA00ED00A8003000E3008E000F005300650090003F00A4004E00F7),
    .INIT_01(256'h000C005A000B00E700E7001E00AD004D006000BD00A0007F001D00C7003900A2),
    .INIT_02(256'h00D000F000E4009B002D00210061005100A400A80032002D007C00F80044006D),
    .INIT_03(256'h00D400E500E4001200BA00A200810035000E000F002400E100DF004500B3002A),
    .INIT_04(256'h00BB003900A7002100E4001B00EA003C00FA002100F100240007003900DD004D),
    .INIT_05(256'h00D1003B001100F3002F00CB00050024000F004200F500B500EE004400380002),
    .INIT_06(256'h00AE002D0022002400DB005700E3000F007F003D00E50032001E001800AA00FF),
    .INIT_07(256'h00510045006900CA00E500CC00340055007C00DF00DE00130039000C00FA001A),
    .INIT_08(256'h000F00EE00FF00560025001100D500D000EF00C0000E00F300F800ED005100F3),
    .INIT_09(256'h0081003500FD00D4006F00ED0007002100C7004300CF00E20045005B005000CD),
    .INIT_0A(256'h004900580060001B0001005B002800B500F8002300CF003900EF000500670085),
    .INIT_0B(256'h00710056001300370091002C00EE00BA008400120019004F002700BC00420017),
    .INIT_0C(256'h00FD00C3001B00FB002600DA00F10012000400F50038001500E800F100F700C5),
    .INIT_0D(256'h002500CA00A8002900190011002900F6000E0043001700F500EE003200E00003),
    .INIT_0E(256'h002400E800AB003C008100FE004A00C000220023001A00F200F9002000230017),
    .INIT_0F(256'h00B400CD002700F20037000400C7003A00B4005700EC004400B9005B00EE00F7),
    .INIT_10(256'h004B00DD00BB0022007400D900FA00BF0090004E006800BD00C40064001500C0),
    .INIT_11(256'h0033002E00E6002A00BD008E001F00F1008100C40059003F000500FA003C0008),
    .INIT_12(256'h00390016002B003800DA002F00BA00A700E400780018005A000F003C004B00A2),
    .INIT_13(256'h002400E000EE00AA00F1003300D30044000600EE0071000E007F007A000E0099),
    .INIT_14(256'h0006004700CC00F500DF0042001D008D00A9001E004F0019003D00E9009700AB),
    .INIT_15(256'h00F9001200F6001400C500DA0081003900CE006700F7001500BF000700180022),
    .INIT_16(256'h00EA009E005700BB00100016001500F8002800E8002D0003001D00D7000800DC),
    .INIT_17(256'h00050019000000E900E600EF00FE00F900F00005000200FA00ED000600BF00B4),
    .INIT_18(256'h005500990055001700C90065001000FE005A00C600FD00F7004700EF00B900F7),
    .INIT_19(256'h00DD00A900F8003D0054007500ED00F0004900B7001300240045008200EF0016),
    .INIT_1A(256'h002B00BE0040000E00FF005B002A007F005500C700420043005800A500E40064),
    .INIT_1B(256'h00DB000500F00004007F00420058005700E000C1000600ED00F300F50010002B),
    .INIT_1C(256'h00F0001800ED002F00D6001500E900F700B9009500B100E600EA00C9000B0016),
    .INIT_1D(256'h00F700320025002200F9000E001A000E002000CB00FA00F500F200DE00D80013),
    .INIT_1E(256'h00ED00ED00080004001800FA001000C300F300C70022002B00230025005300CF),
    .INIT_1F(256'h0033003B00AF00C7002500C6004F001800EE00280060001A00440034002E0015),
    .INIT_20(256'h001F00EA0019001500AD008100AB00F3001800C8004200C8003E005200D900F7),
    .INIT_21(256'h000900FD00000011009400C300DC003000F7004600C900F500BF00F700E10006),
    .INIT_22(256'h001D00B60052007B004C003600CB00CA002F00DB004D000D000700AF00200055),
    .INIT_23(256'h00A9008100B000FB00540043001A00CF00E300E900060017002B0008001300F6),
    .INIT_24(256'h00D8000B00050009003300040081003F00CB002400EE000800DB0002001C0008),
    .INIT_25(256'h000000D800EF00DA00E6000C00D0000F001000BA00E600E300EA00FF000F00F8),
    .INIT_26(256'h000D001E001200F400F500F30006000000F900CE00F400EF00F6000D00F5000A),
    .INIT_27(256'h00E9000B001B00F00007001300DC00EF007F000600080088001F0016007100EB),
    .INIT_28(256'h004400F600AA000F00C800EA002600E60042005300E6002700CE00D300D80059),
    .INIT_29(256'h004200A200D700E4002D00EB009B00600013004A00F40004000E00BF00000022),
    .INIT_2A(256'h00E500D500040011006B004E007F003A005100D90017001C0031000A00D70007),
    .INIT_2B(256'h0003001C000000E800EA00F100E2001200E600E0002A000B00C6000A000F001D),
    .INIT_2C(256'h00F20017001F00040016003500E0003A00FF000400F80004001F00EF0006002D),
    .INIT_2D(256'h0022004600BC000900D200D000D9005F00A600FD001400C400FC0059000E0022),
    .INIT_2E(256'h001F0000006900B600FB00DC004300CF00C6008100F700D3004400580017008F),
    .INIT_2F(256'h002D0036005C004000FC00BD00E000F200A1003900C5008F00DD0004004F00D4),
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
    .INIT_FILE("NONE"),
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
       (.ADDRARDADDR({addr,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(clk),
        .CLKBWRCLK(1'b0),
        .DIADI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b1,1'b1}),
        .DOADO({NLW_data_reg_DOADO_UNCONNECTED[15:8],data}),
        .DOBDO(NLW_data_reg_DOBDO_UNCONNECTED[15:0]),
        .DOPADOP(NLW_data_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_data_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(en),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ADDR_WIDTH = "4" *) (* DEPTH = "16" *) (* INIT_FILE = "/hdd/c.eguzo/per-fpga-edge-quantization/results/p3_m06/qat_hardware/parameter_rom/conv2_bias.memh" *) 
(* ORIG_REF_NAME = "parameter_rom_sync" *) (* WIDTH = "32" *) 
module parameter_rom_sync__parameterized9
   (clk,
    en,
    addr,
    data);
  input clk;
  input en;
  input [3:0]addr;
  output [31:0]data;

  wire [3:0]addr;
  wire clk;
  wire [31:0]data;
  wire \data[0]_i_1_n_0 ;
  wire \data[10]_i_1_n_0 ;
  wire \data[11]_i_1_n_0 ;
  wire \data[12]_i_1_n_0 ;
  wire \data[1]_i_1_n_0 ;
  wire \data[2]_i_1_n_0 ;
  wire \data[31]_i_1_n_0 ;
  wire \data[3]_i_1_n_0 ;
  wire \data[4]_i_1_n_0 ;
  wire \data[5]_i_1_n_0 ;
  wire \data[6]_i_1_n_0 ;
  wire \data[7]_i_1_n_0 ;
  wire \data[8]_i_1_n_0 ;
  wire \data[9]_i_1_n_0 ;
  wire en;

  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'h7468)) 
    \data[0]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'hB284)) 
    \data[10]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[10]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT4 #(
    .INIT(16'h9A57)) 
    \data[11]_i_1 
       (.I0(addr[3]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[0]),
        .O(\data[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h0AC7)) 
    \data[12]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[12]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT4 #(
    .INIT(16'hC86F)) 
    \data[1]_i_1 
       (.I0(addr[3]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[0]),
        .O(\data[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'hA89C)) 
    \data[2]_i_1 
       (.I0(addr[3]),
        .I1(addr[0]),
        .I2(addr[1]),
        .I3(addr[2]),
        .O(\data[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair30" *) 
  LUT4 #(
    .INIT(16'h259A)) 
    \data[31]_i_1 
       (.I0(addr[3]),
        .I1(addr[0]),
        .I2(addr[2]),
        .I3(addr[1]),
        .O(\data[31]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h1479)) 
    \data[3]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h0222)) 
    \data[4]_i_1 
       (.I0(addr[3]),
        .I1(addr[1]),
        .I2(addr[2]),
        .I3(addr[0]),
        .O(\data[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'hF87B)) 
    \data[5]_i_1 
       (.I0(addr[0]),
        .I1(addr[3]),
        .I2(addr[2]),
        .I3(addr[1]),
        .O(\data[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h6C52)) 
    \data[6]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h2FBC)) 
    \data[7]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[1]),
        .I3(addr[0]),
        .O(\data[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'h6975)) 
    \data[8]_i_1 
       (.I0(addr[3]),
        .I1(addr[1]),
        .I2(addr[0]),
        .I3(addr[2]),
        .O(\data[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'hF4E0)) 
    \data[9]_i_1 
       (.I0(addr[3]),
        .I1(addr[2]),
        .I2(addr[0]),
        .I3(addr[1]),
        .O(\data[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[0] 
       (.C(clk),
        .CE(en),
        .D(\data[0]_i_1_n_0 ),
        .Q(data[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[10] 
       (.C(clk),
        .CE(en),
        .D(\data[10]_i_1_n_0 ),
        .Q(data[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[11] 
       (.C(clk),
        .CE(en),
        .D(\data[11]_i_1_n_0 ),
        .Q(data[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[12] 
       (.C(clk),
        .CE(en),
        .D(\data[12]_i_1_n_0 ),
        .Q(data[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[1] 
       (.C(clk),
        .CE(en),
        .D(\data[1]_i_1_n_0 ),
        .Q(data[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[2] 
       (.C(clk),
        .CE(en),
        .D(\data[2]_i_1_n_0 ),
        .Q(data[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[31] 
       (.C(clk),
        .CE(en),
        .D(\data[31]_i_1_n_0 ),
        .Q(data[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[3] 
       (.C(clk),
        .CE(en),
        .D(\data[3]_i_1_n_0 ),
        .Q(data[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[4] 
       (.C(clk),
        .CE(en),
        .D(\data[4]_i_1_n_0 ),
        .Q(data[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[5] 
       (.C(clk),
        .CE(en),
        .D(\data[5]_i_1_n_0 ),
        .Q(data[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[6] 
       (.C(clk),
        .CE(en),
        .D(\data[6]_i_1_n_0 ),
        .Q(data[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[7] 
       (.C(clk),
        .CE(en),
        .D(\data[7]_i_1_n_0 ),
        .Q(data[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[8] 
       (.C(clk),
        .CE(en),
        .D(\data[8]_i_1_n_0 ),
        .Q(data[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[9] 
       (.C(clk),
        .CE(en),
        .D(\data[9]_i_1_n_0 ),
        .Q(data[9]),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
