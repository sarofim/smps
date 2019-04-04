module clk_10_gen
(
    input i_clk,
    input reset,
    output o_clk
);
    reg [7:0] count;
    wire [7:0] CONST_TS;
	wire [7:0] CONST_TON;
    assign CONST_TS = 8'd200;
	assign CONST_TON = CONST_TS / 2;
	
    assign cntrl_ts_last = count == CONST_TS - 1'd1;
    assign cntrl_ton = count < CONST_TON;
    
    always@(posedge i_clk) begin
        if(cntrl_ts_last || reset) begin
            count <= 11'd0;
        end
        else count <= count + 1;
    end

    assign o_clk = cntrl_ton;

endmodule