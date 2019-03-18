module dpwm
(
    input i_clk,
    input reset,
    input enable,
    input [10:0] i_ton,
    input [4:0] i_dt1,
    input [4:0] i_dt2,
    output o_cntrl_ts_last,
    output c1,
    output c2
);
    reg [10:0] count;
    reg [10:0] ton; 
    wire [10:0] CONST_TS;
    //freq 200KHz - set as const
    assign CONST_TS = 11'd1000;

    wire cntrl_ts_last, cntrl_dt1_on, cntrl_dt2_on, cntrl_ton;
    assign cntrl_ts_last = count == ts - 1'd1;
    assign cntrl_dt1_on = count < i_dt1;  
    assign cntrl_dt2_on = ~cntrl_ton & (count < (ton + i_dt1 + i_dt2)); 
    assign cntrl_ton = count < (ton + i_dt1);
    
    always@(posedge i_clk) begin
        if(cntrl_ts_last || reset) begin
            ton <= i_ton;
            count <= 11'd0;
        end
        else count <= count + 1;
    end

    assign c1 = enable & (cntrl_ton & (~cntrl_dt1_on));
    assign c2 = enable & ~(c1 | cntrl_dt2_on | cntrl_dt1_on);
    assign o_cntrl_ts_last = cntrl_ts_last; 

endmodule