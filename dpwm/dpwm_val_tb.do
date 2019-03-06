vlib work
vlog dpwm_val_tb.v
vlog dpwm_val.v
vlog pll.v
vsim -novopt dpwm_val_tb
# See testbench inputs/outputs
add wave /dpwm_val_tb/*
add wave /dpwm_val_tb/dut/*
# Optionally, see inner workings too
run -all