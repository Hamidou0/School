onerror {quit -f}
vlib work
vlog -work work lab2_qsim.vo
vlog -work work lab2.vt
vsim -novopt -c -t 1ps -L cycloneiii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.upcounter_8b_vlg_vec_tst
vcd file -direction lab2.msim.vcd
vcd add -internal upcounter_8b_vlg_vec_tst/*
vcd add -internal upcounter_8b_vlg_vec_tst/i1/*
add wave /*
run -all
