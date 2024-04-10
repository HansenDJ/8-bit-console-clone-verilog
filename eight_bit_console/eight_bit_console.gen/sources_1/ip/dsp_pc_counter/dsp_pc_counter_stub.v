// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
// Date        : Wed Apr 10 14:27:46 2024
// Host        : carson-yeet running 64-bit CachyOS
// Command     : write_verilog -force -mode synth_stub
//               /home/carson/Nextcloud/Documents/school/ECEN340/final_project/8-bit-console-clone-verilog/eight_bit_console/eight_bit_console.gen/sources_1/ip/dsp_pc_counter/dsp_pc_counter_stub.v
// Design      : dsp_pc_counter
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_counter_binary_v12_0_17,Vivado 2023.2" *)
module dsp_pc_counter(CLK, CE, LOAD, L, Q)
/* synthesis syn_black_box black_box_pad_pin="CE,LOAD,L[15:0],Q[15:0]" */
/* synthesis syn_force_seq_prim="CLK" */;
  input CLK /* synthesis syn_isclock = 1 */;
  input CE;
  input LOAD;
  input [15:0]L;
  output [15:0]Q;
endmodule
