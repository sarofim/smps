`timescale 1ns/1ns
module adc_top_tb();
	reg clk;
    reg reset;
    wire [7:0] duty_sel;
    reg hold, read_all;
    wire [12:0] adc_vo, adc_i, adc_vin, adc_temp;
    wire d_in, d_out, cs, clk_out;

    adc_top dut
    (
        .clk(clk), 
        .rst(reset),
        .hold(hold),
        .read_all(read_all),

        .adc_vo(adc_vo),
        .adc_temp(adc_temp),
        .adc_i(adc_i),
        .adc_vin(adc_vin),

        .d_out(d_out),
        .d_in(d_in),
        .cs(cs),
        .clk_out(clk_out)
    );

    initial begin
        #1 clk = 1'b0;
        #3 hold = 1'b0;
        #2 read_all = 1'b0;
        #2 reset = 1'b0;
        #2 reset = 1'b1;
        #3 read_all = 1'b1;
		//#2 read_all = 1'b0;
	end

    always
		#1 clk <= ~clk;

    initial
    #500 $stop; 


endmodule