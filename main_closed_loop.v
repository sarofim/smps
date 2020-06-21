module main(CLOCK_50, SW, KEY0, KEY1, KEY2, LEDR, GPIO_0);
	input CLOCK_50;
	input KEY0, KEY1, KEY2;
	input 	[17:0]	SW;
	output	[17:0]	 LEDR;
	inout [35:0] GPIO_0;
	
	
	//CLOCK GENERATORS
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
	
	//SOFT-START
	wire ss_done, s_start_en, 
	assign s_start_en = SW[0];
    soft_start start_inst
    (
        .i_clk(clk_200),
        .reset(reset),
        .i_enable(ss_en),
        .o_duty_sel(ss_duty_sel),
        .o_enable(dp_ss_dpwm_en),
        .o_done(ss_done)
	);

	//SOFT-SHUTDOWN 
	wire [9:0] shutdown_duty;
	wire s_shutdown_load, s_shutdown_en;
	assign s_shutdown_load = ~KEY2;
	assign s_shutdown_en = SW[1];
	soft_shutdown shutdown_inst
	(
		.i_clk(clk_200),
		.i_enable(s_shutdown_en),
		.reset(rst),
		.i_load_shutdown(s_shutdown_load),
		.curr_duty(dp_ton),
		.out_duty(),
		.o_enable(),
		.o_done()
	);

	//DPWM GENERATOR
	reg [10:0] dp_ton;
    wire [4:0] dp_dt1;
    wire [4:0] dp_dt2;
	assign dp_dt1 = 5'd2;
	assign dp_dt2 = 5'd2;
	
	always@(*) begin
		if(s_shutdown_load & ~ s_start_en)
	end

	reg dpwm_en;
	dpwm pwn_gen
    (
        .i_clk(clk_200),
        .reset(rst),
        .enable(dpwm_en), //either soft start enable or user i ennable
        .i_ton(dp_ton),
        .i_dt1(dp_dt1),
        .i_dt2(dp_dt2),
        .c1(o_c1),
        .c2(o_c2)
    );

	//COMPENSATOR
	wire en_compensator;
	wire [9:0] comp_d_out;
	assign en_compensator = SW[2];
	compensator compensator_dut
	(
		.v_sense(adc_vo[11:4]),
		.enable(en_compensator),
		.rst(rst),
		.clk(clk_10),
		.d_out(comp_d_out),
	);

	///ADC STUFFF
	wire adc_d_out, adc_d_in, adc_cs, adc_clk_out, adc_busy;
	wire adc_read_all;
	assign adc_read_all = 1'b0; //ignored in logic for now
	wire [12:0] adc_vo, adc_temp, adc_i, adc_vin;
	adc adc_inst
    (
        .clk(clk_10), //
        .rst(~KEY0),
        .read_val(adc_read_all), 
        .v_i(adc_vin),
        .v_o(adc_vo),
        .temp(adc_temp),
        .i_in(adc_i),
        .miso(adc_d_out),   
        .sclk(adc_clk_out),   
        .ss_n(adc_cs),   
        .mosi(adc_d_in),
		.busy(adc_busy)
    );

	assign GPIO_0[0] = o1;
	assign GPIO_0[1] = o2;
	assign GPIO_0[2] = clk_10;
	assign GPIO_0[16] = adc_d_out;
	assign GPIO_0[18] = adc_clk_out;
	assign GPIO_0[20] = adc_cs;
	assign GPIO_0[22] = adc_d_in;
	assign GPIO_0[17] = load_step_en;
	assign GPIO_0[17] = load_step_c0;


endmodule