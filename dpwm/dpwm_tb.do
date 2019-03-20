vlib work
vlog dpwm_tb.v
vlog dpwm.v
vsim -novopt dpwm_tb
# See testbench inputs/outputs
add wave /dpwm_tb/*
add wave /dpwm_tb/dut/*
# Optionally, see inner workings too
run -all
