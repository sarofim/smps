`timescale 1ns/1ns
module dpwm_val_tb();
	reg clk;
    reg reset;
    reg enable;
    reg ts_last; 
    reg [4:0] duty_sel;
    reg [3:0] dt1_sel, dt2_sel, freq_sel;
    wire [11:0] ton, ts;
    wire [4:0] dt1, dt2;

	dpwm_val dut(
        .i_clk(clk),
        .i_duty_sel(duty_sel),
        .i_dt1_sel(dt1_sel),
        .i_dt2_sel(dt2_sel),
        .i_freq_sel(freq_sel),
        .i_reset(reset),
        .i_ts_last(ts_last),
        .o_ton(ton),
        .o_ts(ts),
        .o_dt1(dt1),
        .o_dt2(dt2)
	);

	initial begin
        #1 clk = 1'b0;
        #1 enable = 1'b1;
        #5 reset = 1'b0;
        duty_sel = 5'd5;
        dt1_sel = 4'd3;
        dt2_sel = 4'd5;
        freq_sel = 4'd3;
        
        #50;
        #1 ts_last = 1'b1;
        duty_sel = 5'd4;
        dt1_sel = 4'd5;
        dt2_sel = 4'd7;
        freq_sel = 4'd0;
        #5 ts_last = 1'b1;

        #20;
        //#5 reset = 1'b1;
        //#5 reset = 1'b0;
	end

    always
		#1 clk <= ~clk;


    initial
    #500 $stop; 
	

endmodule