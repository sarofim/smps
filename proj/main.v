module main(CLOCK_50, SW, KEY0, LEDR, GPIO_0);
	input CLOCK_50;
	input KEY0;
	input 	[17:0]	SW;
	output	[17:0]	 LEDR;
	inout [35:0] GPIO_0;
	
	//assign LEDR[17:0] = SW[17:0];
	wire o1, o2;
	
	wire clk_200;
	pll_200	pll_200_inst (
	.inclk0 ( CLOCK_50),
	.c0 ( clk_200 )
	);
	
	wire clk_10;
	clk_10_gen pll_10
	(
    .i_clk(clk_200),
    .reset(~KEY0),
    .o_clk(clk_10)
	);
	
   open_loop ol
    (
    .clk(clk_200),
    .rst(~KEY0),
    .dpwm_en(SW[0]),
    .ss_en(SW[1]),
    .i_sw_duty(SW[17:10]),
    .i_sw_dt1(SW[9:6]),
    .i_sw_dt2(SW[5:2]),
    .o_c1(o1),
    .o_c2(o2)
   );

	wire adc_hold, adc_read_all;
	assign adc_hold = 1'b0;
	assign adc_read_all = 1'b1;
	wire [12:0] adc_vo, adc_temp, adc_i, adc_vin;
	adc_top adc
	(
	.clk(clk_10), //10 MHZ clock
	.rst(SW[0]),
	.hold(adc_hold),
	.read_all(SW[1]),

    .adc_vo(adc_vo),
    .adc_temp(adc_temp), 
    .adc_i(adc_i),
    .adc_vin(adc_vin),

    .d_out(adc_d_out),
    .d_in(adc_d_in),
    .cs(adc_cs),
    .clk_out(adc_clk_out)
	);

	assign GPIO_0[0] = o1;
	assign GPIO_0[1] = o2;
	assign GPIO_0[2] = clk_10;
	assign GPIO_0[16] = adc_d_out;
	assign GPIO_0[18] = adc_clk_out;
	assign GPIO_0[20] = adc_cs;
	assign GPIO_0[22] = adc_d_in;

	assign LEDR[12:0] = adc_vin;
	assign LEDR[17] = adc_d_in;
	assign LEDR[16] = adc_d_out;
	assign LEDR[15] = adc_cs;
	assign LEDR[14] = adc_clk_out;

endmodule