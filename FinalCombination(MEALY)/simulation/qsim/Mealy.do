onerror {quit -f}
vlib work
vlog -work work Mealy.vo
vlog -work work Mealy.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Mealy_vlg_vec_tst
vcd file -direction Mealy.msim.vcd
vcd add -internal Mealy_vlg_vec_tst/*
vcd add -internal Mealy_vlg_vec_tst/i1/*
add wave /*
run -all
