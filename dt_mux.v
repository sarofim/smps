//dt val select module
module dt_mux
(
    input [3:0] i_sel,
    output reg [4:0] o_dt
);

    always@(*) begin
        case(i_sel)
            0: o_dt <= 5'd2;  
            1: o_dt <= 5'd4;
            2: o_dt <= 5'd6;
            3: o_dt <= 5'd8;
            4: o_dt <= 5'd10;
            5: o_dt <= 5'd12;
            6: o_dt <= 5'd14;
            7: o_dt <= 5'd16;
            8: o_dt <= 5'd18;
            9: o_dt <= 5'd20;
            default: o_dt <= 5'd2; 
        endcase
    end

endmodule
