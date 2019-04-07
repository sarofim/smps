module adc
(
    input clk, //
    input rst,

    input read_val, //signal to initiate transaction

    output reg [12:0] v_i,
    output reg [12:0] v_o,
    output reg [12:0] temp,
    output reg [12:0] i_in,

    //to gpio
    output miso,   
    output sclk,   
    output ss_n,   
    output mosi
);

wire dp_m_enable, dp_load_data, dp_m_busy, dp_m_rst_n;
wire [1:0] dp_sel_tx;

adc_cntrl adc_cntrl_inst
(
    .clk(clk),
    .rst(rst),
    .read_val(read_val),
    .sel_tx(dp_sel_tx),
    .load_data(dp_load_data),
    .m_enable(dp_m_enable),
    .m_rst_n(dp_m_rst_n),
    .m_busy(dp_m_busy),
);


//datapath
wire [15:0] dp_tx_data, dp_rx_data;
adc_dp adc_dp_inst
(
    .clk(clk),
    .rst(rst),

    //com w/ adc_cntrl
    .sel_tx(dp_sel_tx),
    .load_data(dp_load_data),

    //sampled data
    .v_i(v_i),
    .v_o(v_o),
    .temp(temp),
    .i_in(i_in),

    //com w/ spi_master
    .rx_data(dp_rx_data),
    .tx_data(dp_tx_data)
);

wire cpol, cpha, cont, clk_div, addr;
assign cpol = 1'b0;
assign cpha = 1'b0;
assign cont = 1'b0;
assign clk_div = 1'b0;
assign addr = 1'b0;

//spi_master goes here
spi_master spi_master_inst
(
    .clock(clk),
    .reset_n(dp_m_rst_n),
    .enable(dp_m_enable),
    .cpha(cpha),   
    .cpol(cpol),
    .cont(cont),   
    .clk_div(clk_div),
    .addr(addr),
    .tx_data(dp_tx_data),
    .miso(miso),   
    .sclk(sclk),   
    .ss_n(ss_n),   
    .mosi(mosi),
    .busy(dp_m_busy),
    .rx_data(dp_rx_data),
);


endmodule