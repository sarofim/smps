module main(SW, KEY0, KEY1, LEDR, GPIO_0);
	input 	[17:0]	SW;
    input   KEY0;
	input   KEY1;
    output	[17:0] LEDR;
	output [35:0] GPIO_0;
	
	assign LEDR[3:0] = SW[3:0];

    wire clk_200;
    pll ppl_double(.inclk0(CLOCK_50), .c0(clk_200));

    module open_loop_noss
    (
    .clk(clk_200),
    .rst(~KEY0),
    .enable(SW[0]),
    .i_sw_duty(SW[17:10]),
    .i_sw_dt1(SW[9:6]),
    .i_sw_dt2(SW[5:2]),
    .o_c1(GPIO_0[0]),
    .o_c2(GPIO_0[1])
    );

endmodule