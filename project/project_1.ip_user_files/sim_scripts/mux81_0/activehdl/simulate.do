onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+mux81_0 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.mux81_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {mux81_0.udo}

run -all

endsim

quit -force
