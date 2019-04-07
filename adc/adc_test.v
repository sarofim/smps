module main(CLOCK_50, SW, KEY0, KEY1, LEDR, GPIO_0);
	input CLOCK_50;
	input KEY0;
    input KEY1;

	input 	[17:0]	SW;
	output	[17:0]	 LEDR;
	inout [35:0] GPIO_0;
	
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

    wire adc_d_out, adc_d_in, adc_cs, adc_clk_out;
	wire [12:0] adc_vo, adc_temp, adc_i, adc_vin;

    adc adc_inst
    (
        .clk(clk_10), //
        .rst(~KEY0),
        .read_val(~KEY1), //signal to initiate transaction
        .v_i(adc_vin),
        .v_o(adc_vo),
        .temp(adc_temp),
        .i_in(adc_i),
        .miso(adc_d_out),   
        .sclk(adc_clk_out),   
        .ss_n(adc_cs),   
        .mosi(adc_d_in)
    );

    always@(*) begin
        case(SW[17:16])
            2'd0: LEDR[12:0] <= adc_vo;
            2'd1: LEDR[12:0] <= adc_temp;
            2'd2: LEDR[12:0] <= adc_i;
            2'd3: LEDR[12:0] <= adc_vin;
        endcase
    end

	assign GPIO_0[2] = clk_10;
	assign GPIO_0[16] = adc_d_out;
	assign GPIO_0[18] = adc_clk_out;
	assign GPIO_0[20] = adc_cs;
	assign GPIO_0[22] = adc_d_in;

    assign LEDR[17] = adc_d_in;
	assign LEDR[16] = adc_d_out;
	assign LEDR[15] = adc_cs;
	assign LEDR[14] = ~KEY1; 

endmodule