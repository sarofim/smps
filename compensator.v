module compensator
(
    input [7:0] v_sense,
    input enable,
    input rst,
    input clk,
    output reg [9:0] d_out,
);
    //@tharindu:
    //how are you planning on doing integer floating poitns ??? 
    //might have to settle for different estimates
    //ex 3.103 = (3 * (e_0 / 10)) or something of the sort  
    localparam [24:0] c1 = 25'd3.103; 
    localparam [24:0] c2 = -25'd3.1011382;
    localparam [24:0] c3 = -25'd3.10299972073;
    localparam [24:0] c4 = 25'd3.10113847927;
    localparam [24:0] c5 = -25'd2.8782;
    localparam [24:0] c6 = 25'd2.76010881;
    localparam [24:0] c7 = -25'd0.88190881; 
    
    localparam [7:0] v_ref;
    reg signed [8:0] e_0, e_1, e_2, e_3; //you'll have to debug this part because i don't know how that works
    reg [9:0] d_1, d_2, d_3;

    always@(posedge clk) begin
        if(rst) begin
            d_out <= 10'd0;
            d_1 <= 10'd0;
            d_2 <= 10'd0;
            d_3 <= 10'd0;
            e_0 <= 8'd0;
            e_1 <= 8'd0;
            e_2 <= 8'd0;
            e_3 <= 8'd0;
        end
        else if (enable) begin
            d_1 <= d_out;
            d_2 <= d_1;
            d_3 <= d_2;
            e_0 <= v_sense - vref;
            e_1 <= e_0;
            e_2 <= e_1;
            e_3 <= e_2;
            d_out <= c1*e_0 -  c2*e_1 - c3*e_2 + c4*e_3 + c5*d_1 - c6*d_2 + c7*d_3;
        end
    end
endmodule