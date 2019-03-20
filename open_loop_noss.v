module open_loop_noss
(
    input clk,
    input rst,
    input enable,
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

    wire [10:0] dp_ton;
    ol_duty_sel mux_duty
    (
        i_sel(i_sw_duty),
        o_ton(dp_ton)
    );

    dpwm pwn_gen
    (
        .i_clk(clk),
        .reset(rst),
        .enable(enable),
        .i_ton(dp_ton),
        .i_dt1(dp_dt1),
        .i_dt2(dp_dt2),
        .o_cntrl_ts_last(dp_cntrl_ts_last),
        .c1(o_c1),
        .c2(o_c2)
    );
    
endmodule