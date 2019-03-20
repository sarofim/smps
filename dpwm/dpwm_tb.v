`timescale 1ns/1ns
module dpwm_tb();
	  reg clk;
    reg reset;
    reg enable;
    wire o_c1, o_c2;
    reg [4:0] dt1, dt2;
    reg [10:0] ton;


	dpwm dut(
        .i_clk(clk),
        .reset(reset),
        .enable(enable),
        .i_ton(ton),
        .i_dt1(dt1),
        .i_dt2(dt2),
        .c1(o_c1),
        .c2(o_c2)
	);


	initial begin
        #1 clk = 1'b0;
        #1 enable = 1'b1;
        #1 dt1 = 5'b8;
        #1 dt2 = 5'b10;
        #1 ton = 5'b680;
        #5 reset = 1'b1;
        #5 reset = 1'b0;
	end

    always
		#1 clk <= ~clk;


    initial
    #1200 $stop; 
	

endmodule