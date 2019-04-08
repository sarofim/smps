module adc_cntrl
(
    input clk,
    input rst,

    //com main
    input read_val,

    //com adc_dp
    output [1:0] sel_tx,
    output load_data,

    //com spi_master
    output reg m_enable,
    output reg m_rst_n,
    input  m_busy
);

//states
localparam [2:0]
    POWER_UP = 3'd0,
    INIT_CNTRL_REG = 3'd1,
    INIT_CNTRL_REG_WAIT = 3'd2,
    INIT_RANGE_REG = 3'd3,
    INIT_RANGE_REG_WAIT = 3'd4,
    READ = 3'd5,
    READ_WAIT = 3'd6,
    LOAD_REG = 3'd7;

reg [2:0] state, next_state;

always@ (posedge clk or posedge rst) begin
	if (reset) state <= POWER_UP;
	else state <= next_state;
end

always@(*) begin
    m_enable = 1'b0;
    m_rst_n = 1'b1;
    sel_tx = 2'd0;
	next_state = state;

	case (state)
        POWER_UP: begin
            next_state = INIT_RANGE_REG;
            m_rst_n = 1'b0;
        end

        INIT_RANGE_REG: begin
            sel_tx = 2'd2;
            m_enable = 1'b1;
            next_state = INIT_RANGE_REG_WAIT;
        end

        INIT_RANGE_REG_WAIT: begin
            sel_tx = 2'd2;
            if(!m_busy) next_state = INIT_CONTROL_REG;
        end

        INIT_CONTROL_REG: begin
            sel_tx = 2'd1;
            m_enable = 1'b1;
            next_state = INIT_CNTRL_REG_WAIT;
        end

        INIT_CNTRL_REG_WAIT: begin
            sel_tx = 2'd1;
            if(!m_busy) next_state = LOAD_REG;
        end

        READ: begin
            if(read_val) begin
                m_enable = 1'b01;
                next_state = READ_WAIT;
            end
        end

        READ_WAIT: if(!m_busy) next_state = LOAD_REG;

        LOAD_REG: begin
            load_data = 1'b1;
            next_state = READ;
        end

	endcase
end


endmodule