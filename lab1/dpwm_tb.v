`timescale 1ns/1ns
module dpwm_tb();
	reg clk;
    reg reset;
    reg enable;
    wire o_c1, o_c2;

	dpwm dut(
        .i_clk(clk),
        .reset(reset),
        .enable(enable),
        .c1(o_c1),
        .c2(o_c2)
	);
	

	initial begin
        #1 clk = 1'b0;
        #1 enable = 1'b1;
        #5 reset = 1'b1;
        #5 reset = 1'b0;
	end

    always
		#1 clk <= ~clk;


    initial
    #500 $stop; 
	

endmodule