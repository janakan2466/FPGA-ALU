onerror {quit -f}
vlib work
vlog -work work MooreFSM.vo
vlog -work work MooreFSM.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Moore_vlg_vec_tst
vcd file -direction MooreFSM.msim.vcd
vcd add -internal Moore_vlg_vec_tst/*
vcd add -internal Moore_vlg_vec_tst/i1/*
add wave /*
run -all
