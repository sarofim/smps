vlib work
vlog soft_start_tb.v
vlog soft_start.v
vlog counters.v
vsim -novopt soft_start_tb
# See testbench inputs/outputs
add wave /soft_start_tb/*
add wave /soft_start_tb/dut/*
add wave /soft_start_tb/dut/duty_sel_counter/*
add wave /soft_start_tb/dut/cycle_counter/*
add wave /soft_start_tb/dut/ts_count/*
# Optionally, see inner workings too
run -all