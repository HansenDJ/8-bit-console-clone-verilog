transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xbip_utils_v3_0_11
vlib activehdl/c_reg_fd_v12_0_7
vlib activehdl/xbip_dsp48_wrapper_v3_0_5
vlib activehdl/xbip_pipe_v3_0_7
vlib activehdl/xbip_dsp48_addsub_v3_0_7
vlib activehdl/xbip_addsub_v3_0_7
vlib activehdl/c_addsub_v12_0_16
vlib activehdl/c_gate_bit_v12_0_7
vlib activehdl/xbip_counter_v3_0_7
vlib activehdl/c_counter_binary_v12_0_17
vlib activehdl/xil_defaultlib

vmap xbip_utils_v3_0_11 activehdl/xbip_utils_v3_0_11
vmap c_reg_fd_v12_0_7 activehdl/c_reg_fd_v12_0_7
vmap xbip_dsp48_wrapper_v3_0_5 activehdl/xbip_dsp48_wrapper_v3_0_5
vmap xbip_pipe_v3_0_7 activehdl/xbip_pipe_v3_0_7
vmap xbip_dsp48_addsub_v3_0_7 activehdl/xbip_dsp48_addsub_v3_0_7
vmap xbip_addsub_v3_0_7 activehdl/xbip_addsub_v3_0_7
vmap c_addsub_v12_0_16 activehdl/c_addsub_v12_0_16
vmap c_gate_bit_v12_0_7 activehdl/c_gate_bit_v12_0_7
vmap xbip_counter_v3_0_7 activehdl/xbip_counter_v3_0_7
vmap c_counter_binary_v12_0_17 activehdl/c_counter_binary_v12_0_17
vmap xil_defaultlib activehdl/xil_defaultlib

vcom -work xbip_utils_v3_0_11 -  \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_7 -  \
"../../../ipstatic/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_5 -  \
"../../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_7 -  \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_7 -  \
"../../../ipstatic/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_7 -  \
"../../../ipstatic/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_16 -  \
"../../../ipstatic/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work c_gate_bit_v12_0_7 -  \
"../../../ipstatic/hdl/c_gate_bit_v12_0_vh_rfs.vhd" \

vcom -work xbip_counter_v3_0_7 -  \
"../../../ipstatic/hdl/xbip_counter_v3_0_vh_rfs.vhd" \

vcom -work c_counter_binary_v12_0_17 -  \
"../../../ipstatic/hdl/c_counter_binary_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -  \
"../../../../eight_bit_console.gen/sources_1/ip/dsp_pc_counter/sim/dsp_pc_counter.vhd" \


