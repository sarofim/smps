///////////////////////////////////////////////////////////////////////////////
 // Module: down_counter, up_counter
 // Description: generic N bit wide up & down counters 
///////////////////////////////////////////////////////////////////////////////
module down_counter
#(
    parameter N = 10
)
(
    input clk,
    input reset,
    input i_enable,
    input [N-1:0] i_val,
    output done
);

    reg [N-1:0] count;
    assign done = count === 0;
    always@(posedge clk) begin
        if(reset || done) count <= i_val - 1;
        else if(i_enable) count <= count - 1;
    end

endmodule

module down_counter_shutdown
#(
    parameter N = 10
)
(
    input clk,
    input reset,
    input load_shutdown,
    input i_enable,
    input [N-1:0] i_val,
    output [N-1:0] o_val,
    output done
);
    assign done = o_val === 0;
    always@(posedge clk) begin
        if(reset || done || load_shutdown) o_val <= i_val - 1;
        else if(i_enable) o_val <= o_val - 1;
    end

endmodule


module up_counter
#(
    parameter N = 8
)
(
    input clk, 
    input reset, 
    input i_enable,
    input [N-1:0] i_val,
    output reg [N-1:0] o_val,
    output done
);
    assign done = o_val === i_val - 1; 
    always@(posedge clk) begin
        if(reset || done) o_val <= 0;
        else if(i_enable && ~done) o_val <= o_val + 1;
    end

endmodule