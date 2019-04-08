module cl_duty
#
(
    parameter N = 10
)
(
    input[N-1:0] duty,
    output [10:0] ton,
);
    localparam [10:0] TS = 11'd1000;

    assign ton = (duty / 100) * TS;

endmodule