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
        if(reset) o_val <= 0;
        else if(i_enable && ~done) o_val <= o_val + 1;
    end

endmodule