module open_loop(
    input clk, //pll 200 clock
    input rst,
    input enable,
    input [7:0] d_sw,
    input [3:0] dt1_sw,
    input [3:0] dt2_sw,
    output o_c1,
    output o_c2
);



    reg [10:0] dp_ton;
    always@(*) begin
        if(o_done)



    wire dp_cntrl_ts_last;
    dpwm pwn_gen
    (
        .i_clk(clk),
        .reset(rst),
        .enable(),
        .i_ton,
        .i_dt1,
        .i_dt2,
        .o_cntrl_ts_last(dp_cntrl_ts_last),
        .c1(o_c1),
        .c2(o_c2)
    );
    



endmodule