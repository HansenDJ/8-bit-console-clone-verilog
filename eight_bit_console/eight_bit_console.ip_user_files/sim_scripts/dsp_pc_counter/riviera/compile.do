transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xbip_utils_v3_0_11
vlib riviera/c_reg_fd_v12_0_7
vlib riviera/xbip_dsp48_wrapper_v3_0_5
vlib riviera/xbip_pipe_v3_0_7
vlib riviera/xbip_dsp48_addsub_v3_0_7
vlib riviera/xbip_addsub_v3_0_7
vlib riviera/c_addsub_v12_0_16
vlib riviera/c_gate_bit_v12_0_7
vlib riviera/xbip_counter_v3_0_7
vlib riviera/c_counter_binary_v12_0_17
vlib riviera/xil_defaultlib

vmap xbip_utils_v3_0_11 riviera/xbip_utils_v3_0_11
vmap c_reg_fd_v12_0_7 riviera/c_reg_fd_v12_0_7
vmap xbip_dsp48_wrapper_v3_0_5 riviera/xbip_dsp48_wrapper_v3_0_5
vmap xbip_pipe_v3_0_7 riviera/xbip_pipe_v3_0_7
vmap xbip_dsp48_addsub_v3_0_7 riviera/xbip_dsp48_addsub_v3_0_7
vmap xbip_addsub_v3_0_7 riviera/xbip_addsub_v3_0_7
vmap c_addsub_v12_0_16 riviera/c_addsub_v12_0_16
vmap c_gate_bit_v12_0_7 riviera/c_gate_bit_v12_0_7
vmap xbip_counter_v3_0_7 riviera/xbip_counter_v3_0_7
vmap c_counter_binary_v12_0_17 riviera/c_counter_binary_v12_0_17
vmap xil_defaultlib riviera/xil_defaultlib

vcom -work xbip_utils_v3_0_11 -93  -incr \
"../../../ipstatic/hdl/xbip_utils_v3_0_vh_rfs.vhd" \

vcom -work c_reg_fd_v12_0_7 -93  -incr \
"../../../ipstatic/hdl/c_reg_fd_v12_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_wrapper_v3_0_5 -93  -incr \
"../../../ipstatic/hdl/xbip_dsp48_wrapper_v3_0_vh_rfs.vhd" \

vcom -work xbip_pipe_v3_0_7 -93  -incr \
"../../../ipstatic/hdl/xbip_pipe_v3_0_vh_rfs.vhd" \

vcom -work xbip_dsp48_addsub_v3_0_7 -93  -incr \
"../../../ipstatic/hdl/xbip_dsp48_addsub_v3_0_vh_rfs.vhd" \

vcom -work xbip_addsub_v3_0_7 -93  -incr \
"../../../ipstatic/hdl/xbip_addsub_v3_0_vh_rfs.vhd" \

vcom -work c_addsub_v12_0_16 -93  -incr \
"../../../ipstatic/hdl/c_addsub_v12_0_vh_rfs.vhd" \

vcom -work c_gate_bit_v12_0_7 -93  -incr \
"../../../ipstatic/hdl/c_gate_bit_v12_0_vh_rfs.vhd" \

vcom -work xbip_counter_v3_0_7 -93  -incr \
"../../../ipstatic/hdl/xbip_counter_v3_0_vh_rfs.vhd" \

vcom -work c_counter_binary_v12_0_17 -93  -incr \
"../../../ipstatic/hdl/c_counter_binary_v12_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../../eight_bit_console.gen/sources_1/ip/dsp_pc_counter/sim/dsp_pc_counter.vhd" \


