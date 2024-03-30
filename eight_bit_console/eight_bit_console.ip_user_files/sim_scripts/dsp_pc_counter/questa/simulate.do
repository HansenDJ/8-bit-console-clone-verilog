onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib dsp_pc_counter_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {dsp_pc_counter.udo}

run 1000ns

quit -force
