///////////////////////////////////////////////////////////////////////////////
 // Module: comparator.v
 // Description: generic comparator with hysterisis used for protection features
///////////////////////////////////////////////////////////////////////////////
module comparator
#
(
    parameter N = 8
)
(
    input i_val,
    input [N-1:0] ref_high,
    input [N-1:0] ref_low,
    output o_fault
);

    assign over_low = i_val > ref_low;
    assign under_high = i_val < ref_high;
    assign o_fault = over_low && ~(under_high);

endmodule
