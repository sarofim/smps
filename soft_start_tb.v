`timescale 1ns/1ns
module soft_start_tb();
	reg clk;
    reg reset;
    reg enable;
    wire [7:0] duty_sel;
    wire o_enable;
    wire o_done;

	soft_start dut(
        .i_clk(clk),
        .reset(reset),
        .i_enable(enable),
        .o_duty_sel(duty_sel),
        .o_enable(o_enable),
        .o_done(o_done)
	);

	initial begin
        #1 clk = 1'b0;
        #1 enable = 1'b1;
        #2 reset = 1'b1;
        #2 reset = 1'b0;
	end

    always
		#1 clk <= ~clk;

    initial
    #500 $stop; 
	

endmodule