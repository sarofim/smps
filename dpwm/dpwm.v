module dpwm
(
    input i_clk,
    input reset,
    input enable,
    output o_cntrl_ts_last,
    output c1,
    output c2
);

    // wire clk_200;    
    // pll	pll_200_inst
    // (
	// .inclk0 (i_clk),
	// .c0 (clk_200)
	// );

    //use constants for now
    reg [11:0]  count;
    wire [11:0] ts;
    wire [11:0] ton;
    wire [3:0] CONST_DT1;
    wire [3:0] CONST_DT2;

    assign ts = 11'd140;
    assign ton = 11'd80;
    assign CONST_DT1 = 4'd14;
    assign CONST_DT2 = 4'd10;

    wire cntrl_ts_last, cntrl_dt1_on, cntrl_dt2_on, cntrl_ton;
    assign cntrl_ts_last = count == ts - 1'd1;
    assign cntrl_dt1_on = count < CONST_DT1;  
    assign cntrl_dt2_on = ~cntrl_ton & (count < (ton + CONST_DT1 + CONST_DT2)); 
    assign cntrl_ton = count < (ton + CONST_DT1);
    
    //ignore pll for modelsim testing
    //always@(posedge clk_200) begin
    always@(posedge i_clk) begin
        if(cntrl_ts_last || reset) begin
            count <= 11'd0;
        end
        else count <= count + 1;
    end

    assign c1 = enable & (cntrl_ton & (~cntrl_dt1_on));
    assign c2 = enable & ~(c1 | cntrl_dt2_on | cntrl_dt1_on);
    assign o_cntrl_ts_last = cntrl_ts_last; 

endmodule