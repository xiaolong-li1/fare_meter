vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../srbj.srcs/sources_1/ip/mux81_0/mux81.v" \
"../../../../srbj.srcs/sources_1/ip/mux81_0/sim/mux81_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

