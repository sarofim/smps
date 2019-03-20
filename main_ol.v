module main(CLOCK_50, SW, KEY0, KEY1, LEDR, GPIO_0);
	input CLOCK_50;
    input 	[17:0]	SW;
    input   KEY0;
	input   KEY1;
    output	[17:0] LEDR;
	output [35:0] GPIO_0;
	
	assign LEDR[17:0] = SW[17:0];

    wire clk_200;
    pll ppl_double(.inclk0(CLOCK_50), .c0(clk_200));

    open_loop ol
    (
    .clk(clk_200),
    .rst(~KEY0),
    .dpwm_en(SW[0]),
    .ss_en(SW[1]),
    .i_sw_duty(SW[17:10]),
    .i_sw_dt1(SW[9:6]),
    .i_sw_dt2(SW[5:2]),
    .o_c1(GPIO_0[0]),
    .o_c2(GPIO_0[1])
    );

endmodule