///////////////////////////////////////////////////////////////////////////////
 // Module: step_gen.v
 // Description: load step generator 
///////////////////////////////////////////////////////////////////////////////
module step_gen
(
    input clk,
    input rst,
    input enable,
    output c0
);
    reg [11:0] count;
    wire [11:0] CONST_TREP;
	wire [11:0] CONST_TSTEP;
    assign CONST_TREP = 12'd4000;  //20ms
	assign CONST_TSTEP = 12'd1200; //6ms
	
    assign cntrl_ts_last = count == CONST_TS - 1'd1;
    assign cntrl_ton = count < CONST_TON;
    
    always@(posedge clk) begin
        if(cntrl_ts_last || reset) begin
            count <= 12'd0;
        end
        else if(enable) count <= count + 1;
    end

    assign c0 = cntrl_ton;

endmodule