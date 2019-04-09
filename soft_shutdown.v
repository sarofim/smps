///////////////////////////////////////////////////////////////////////////////
 // Module: soft_shutdown.v
 // Description: soft start module - slowly ramps duty cycle down to 0 
///////////////////////////////////////////////////////////////////////////////
module soft_shutdown
(
    input i_clk,
    input i_enable,
    input reset,
    input i_load_shutdown,
    input [9:0] curr_duty,
    output [9:0] out_duty,
    output o_enable,
    output o_done
);
    localparam [13:0] NUM_CYCLES = 14'd5000;
    localparam [9:0] CONST_TS = 10'd1000;

    wire cycle_delay_done;
    wire ts_done;
    assign o_enable = (i_enable) && (o_duty_sel > 0);

    down_counter_shutdown #(10) shutdown_count
    (
        .clk(i_clk),
        .reset(reset),
        .load_shutdown(i_load_shutdown),
        .i_enable(i_enable && ts_done),
        .i_val(curr_duty),
        .o_val(out_duty),
        .done(o_done)
    );

    down_counter #(14) cycle_counter
    (
        .clk(i_clk),
        .reset(reset),
        .i_enable(i_enable && ts_done),
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