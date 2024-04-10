// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_counter_binary_v12_0_17,Vivado 2023.2" *)
module dsp_pc_counter(CLK, CE, LOAD, L, Q);
  input CLK /* synthesis syn_isclock = 1 */;
  input CE;
  input LOAD;
  input [15:0]L;
  output [15:0]Q;
endmodule
