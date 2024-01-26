vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"../../../../srbj.srcs/sources_1/ip/mux81_0/mux81.v" \
"../../../../srbj.srcs/sources_1/ip/mux81_0/sim/mux81_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

