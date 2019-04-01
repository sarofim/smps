module adc_top
(
    //controller inputs
    input clk, //10 MHZ clock
    input rst,
    input hold,
    input read_all,

    //output to controller
    output reg [12:0] adc_vo,
    output reg [12:0] adc_temp,
    output reg [12:0] adc_i,
    output reg [12:0] adc_vin,

    //input from ADC
    input d_out,
    //output to ADC
    output d_in,
    output cs,
    output clk_out
);
   reg [15:0] adc_data;

   spi_ad7324 driver
   (
      .DOUT(d_out),
      .CLK_IN(clk),
      .R(rst),
      .HOLD(hold),
      .READ_ALL(read_all),

      .DIN(d_in),
      .CS(cs),
      .CLK_OUT(clk_out),
      .data_read(adc_data)
   );

    always@(posedge clk) begin
        if(reset) begin
            adc_vo <= 13'b0;
            adc_temp <= 13'b0;
            adc_i <= 13'b0;
            adc_vin <= 13'b0;
        end
        else
            case(adc_data[14:13])
                2'b00: adc_vo <= adc_data[12:0]; 
                2'b01: adc_temp <= adc_data[12:0]; 
                2'b10: adc_i <= adc_data[12:0]; 
                2'b11: adc_vin <= adc_data[12:0]; 
            endcase
        end
    end

endmodule