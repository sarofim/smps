module main(SW, LEDR);
	input 	[3:0]	SW;
	output	[3:0]	 LEDR;
	
	assign LEDR[3:0] = SW[3:0];

endmodule