onerror {quit -f}
vlib work
vlog -work work Moore.vo
vlog -work work Moore.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Mooreblock_vlg_vec_tst
vcd file -direction Moore.msim.vcd
vcd add -internal Mooreblock_vlg_vec_tst/*
vcd add -internal Mooreblock_vlg_vec_tst/i1/*
add wave /*
run -all
