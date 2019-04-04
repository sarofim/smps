vlib work
vlog adc_top_tb.v
vlog adc_top.v
vlog spi_ad7324_v2.v
vlog primitives.v
vsim -novopt adc_top_tb
# See testbench inputs/outputs
add wave /adc_top_tb/*
#add wave /adc_top_tb/dut/*
add wave /adc_top_tb/dut/driver/*
# Optionally, see inner workings too
run -all