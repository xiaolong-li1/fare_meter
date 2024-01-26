vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../srbj.srcs/sources_1/ip/mux81_0/mux81.v" \
"../../../../srbj.srcs/sources_1/ip/mux81_0/sim/mux81_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

