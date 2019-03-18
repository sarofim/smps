module soft_start
(
    input i_clk,
    input i_enable,
    input reset,
    output [7:0] o_duty_sel,
    output o_enable,
    output o_done
);
    localparam [7:0] CONST_DUTY_LIM = 8'd4;
    localparam [6:0] NUM_CYCLES = 7'd5;
    localparam [9:0] CONST_TS = 10'd10;

    wire cycle_delay_done;
    wire ts_done;
    assign o_enable = (i_enable) && (o_duty_sel > 0);

    up_counter #(8) duty_sel_counter
    (
        .clk(i_clk), 
        .reset(reset), 
        .i_enable(cycle_delay_done),
        .i_val(CONST_DUTY_LIM),
        .o_val(o_duty_sel),
        .done(o_done)   
    );

    down_counter #(7) cycle_counter
    (
        .clk(i_clk),
        .reset(reset),
        .i_enable(ts_done),
        .i_val(NUM_CYCLES),
        .done(cycle_delay_done)
    );

    down_counter #(10) ts_count
    (
        .clk(i_clk),
        .reset(reset),
        .i_enable(i_enable),
        .i_val(CONST_TS),
        .done(ts_done)
    );

endmodule