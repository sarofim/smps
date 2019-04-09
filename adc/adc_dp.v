module adc_dp
(
    input clk, //10 MHZ clk
    input rst,

    //com w/ adc_cntrl
    input [1:0] sel_tx,
    input load_data,

    //sampled data
    output reg [12:0] v_i,
    output reg [12:0] v_o,
    output reg [12:0] temp,
    output reg [12:0] i_in,

    //com w/ spi_master
    input [15:0] rx_data,
    output [15:0] tx_data
);

//default config values for adc registers
localparam [15:0]
    //CONTROL_REG = 16'b1000110000111000, if reading the whole range
    CONTROL_REG = 16'b1000000000111000,    //only reeading Vo 
    RANGE_REG   = 16'b1010101010100000;

always@(*) begin
    case(sel_tx)
        2'd0: tx_data = 16'd0; //not writing anything
        2'd1: tx_data = CONTROL_REG;
        2'd2: tx_data = RANGE_REG;
    endcase
end


//loading on clk edge
always@(posedge clk) begin
    if(rst) begin
        v_o  <= 13'd0;
        temp <= 13'd0;
        i_in <= 13'd0;
        v_i  <= 13'd0;
    end
    else begin
        if(load_data) begin
            v_o  <= rx_data[12:0]; 
            //temp <= rx_data[12:0]; 
            //i_in <= rx_data[12:0]; 
            //v_i  <= rx_data[12:0]; 
        end
    end
end

//loading on busy neg edge
// always@(negedge busy, posedge rst) begin
//     if(rst) begin
//         v_o  <= 13'd0;
//         temp <= 13'd0;
//         i_in <= 13'd0;
//         v_i  <= 13'd0;
//     end
//     else begin
//         v_o  <= rx_data[12:0]; 
//         //temp <= rx_data[12:0]; 
//         //i_in <= rx_data[12:0]; 
//         //v_i  <= rx_data[12:0]; 
//         end
//     end
// end

endmodule