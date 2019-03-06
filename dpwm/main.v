module main(SW, KEY0, KEY1, LEDR, GPIO_0);
	input 	[17:0]	SW;
    input   KEY0;
	input   KEY1;
    output	[3:0] LEDR;
	output [35:0] GPIO_0;
	
	assign LEDR[3:0] = SW[3:0];

	dpwm_gen gen(
    .i_enable(SW[17]),
    .i_reset(~KEY0),
    .i_update(~KEY1),
    .i_fs(SW[16:13]),
    .i_duty(SW[12:8]),
    .i_dt1(SW[7:4]),
    .i_dt2(SW[3:0]),
    .o_c1(GPIO_0[0]), 
    .o_c2(GPIO_0[1]));

endmodule