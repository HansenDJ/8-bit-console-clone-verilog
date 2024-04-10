-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
-- Date        : Wed Apr 10 14:27:46 2024
-- Host        : carson-yeet running 64-bit CachyOS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/carson/Nextcloud/Documents/school/ECEN340/final_project/8-bit-console-clone-verilog/eight_bit_console/eight_bit_console.gen/sources_1/ip/dsp_pc_counter/dsp_pc_counter_stub.vhdl
-- Design      : dsp_pc_counter
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dsp_pc_counter is
  Port ( 
    CLK : in STD_LOGIC;
    CE : in STD_LOGIC;
    LOAD : in STD_LOGIC;
    L : in STD_LOGIC_VECTOR ( 15 downto 0 );
    Q : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end dsp_pc_counter;

architecture stub of dsp_pc_counter is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK,CE,LOAD,L[15:0],Q[15:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "c_counter_binary_v12_0_17,Vivado 2023.2";
begin
end;
