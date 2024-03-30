onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xbip_utils_v3_0_11 -L c_reg_fd_v12_0_7 -L xbip_dsp48_wrapper_v3_0_5 -L xbip_pipe_v3_0_7 -L xbip_dsp48_addsub_v3_0_7 -L xbip_addsub_v3_0_7 -L c_addsub_v12_0_16 -L c_gate_bit_v12_0_7 -L xbip_counter_v3_0_7 -L c_counter_binary_v12_0_17 -L xil_defaultlib -L secureip -lib xil_defaultlib xil_defaultlib.dsp_pc_counter

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {dsp_pc_counter.udo}

run 1000ns

quit -force
