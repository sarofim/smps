module open_loop(
    input clk, //pll 200 clock
    input rst,
    input dpwm_en, //dpwm block enable
    input ss_en, //soft_start enable
    input [7:0] i_sw_duty,
    input [3:0] i_sw_dt1,
    input [3:0] i_sw_dt2,
    output o_c1,
    output o_c2
);

    wire [4:0] dp_dt1;
    wire [4:0] dp_dt2;
    dt_mux mux_dt1
    (
        .i_sel(i_sw_dt1),
        .o_dt(dp_dt1)
    );
    dt_mux mux_dt2
    (
        .i_sel(i_sw_dt2),
        .o_dt(dp_dt2)
    );

    wire [7:0] ss_duty_sel;
    wire dp_ss_dpwm_en;
    wire ss_done;
    soft_start ss
    (
        .i_clk(clk),
        .reset(reset),
        .i_enable(ss_en),
        .o_duty_sel(ss_duty_sel),
        .o_enable(dp_ss_dpwm_en),
        .o_done(ss_done)
	);

    wire [7:0] dp_duty_sel;
    assign dp_duty_sel = ss_en ? ss_duty_sel : i_sw_duty;
    wire [10:0] dp_ton;
    ol_duty_sel mux_duty
    (
        .i_sel(i_sw_duty),
        .o_ton(dp_ton)
    );

    dpwm pwn_gen
    (
        .i_clk(clk),
        .reset(rst),
        .enable( dp_ss_dpwm_en || dpwm_en), //either soft start enable or user i ennable
        .i_ton(dp_ton),
        .i_dt1(dp_dt1),
        .i_dt2(dp_dt2),
        .c1(o_c1),
        .c2(o_c2)
    );

endmodule