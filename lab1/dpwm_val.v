module dpwm_val
(
    input i_clk,
    input [4:0] i_duty_sel,
    input [3:0] i_dt1_sel,
    input [3:0] i_dt2_sel,
    input [3:0] i_freq_sel,
    //input update, maybe won't need it 
    input i_reset,
    input i_ts_last,
    output reg [11:0] o_ton, o_ts,
    output reg [4:0] o_dt1, o_dt2
);
    reg [4:0] curr_duty;

    //freq & dt select
    always@(posedge i_clk) begin
        case(i_freq_sel)
            0: o_ts <= 12'd4000;
            1: o_ts <= 12'd3125;
            2: o_ts <= 12'd2500;
            3: o_ts <= 12'd2083;
            4: o_ts <= 12'd2000;
            5: o_ts <= 12'd1600;
            6: o_ts <= 12'd1333;
            7: o_ts <= 12'd1143;
            8: o_ts <= 12'd1053;
            9: o_ts <= 12'd1000;
        endcase

        case(i_dt1_sel)
            0: o_dt1 <= 5'd2;  
            1: o_dt1 <= 5'd4;
            2: o_dt1 <= 5'd6;
            3: o_dt1 <= 5'd8;
            4: o_dt1 <= 5'd10;
            5: o_dt1 <= 5'd12;
            6: o_dt1 <= 5'd14;
            7: o_dt1 <= 5'd16;
            8: o_dt1 <= 5'd18;
            9: o_dt1 <= 5'd20;
        endcase

        case(i_dt2_sel)
            0: o_dt2 <= 5'd2;  
            1: o_dt2 <= 5'd4;
            2: o_dt2 <= 5'd6;
            3: o_dt2 <= 5'd8;
            4: o_dt2 <= 5'd10;
            5: o_dt2 <= 5'd12;
            6: o_dt2 <= 5'd14;
            7: o_dt2 <= 5'd16;
            8: o_dt2 <= 5'd18;
            9: o_dt2 <= 5'd20;
        endcase
    end

    always@(posedge i_clk) begin
        if(i_reset | i_ts_last)
            curr_duty <= i_duty_sel;
    end

    always@(posedge i_clk) begin
        case(curr_duty)
            0: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd200;
                    1: o_ton <= 12'd156;
                    2: o_ton <= 12'd125;
                    3: o_ton <= 12'd104;
                    4: o_ton <= 12'd100;
                    5: o_ton <= 12'd80;
                    6: o_ton <= 12'd67;
                    7: o_ton <= 12'd57;
                    8: o_ton <= 12'd53;
                    9: o_ton <= 12'd50;
                endcase
              end
            
            1: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd400;
                    1: o_ton <= 12'd313;
                    2: o_ton <= 12'd250;
                    3: o_ton <= 12'd208;
                    4: o_ton <= 12'd200;
                    5: o_ton <= 12'd160;
                    6: o_ton <= 12'd133;
                    7: o_ton <= 12'd114;
                    8: o_ton <= 12'd105;
                    9: o_ton <= 12'd100;
                endcase
               end
            
            2: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd600;
                    1: o_ton <= 12'd469;
                    2: o_ton <= 12'd375;
                    3: o_ton <= 12'd313;
                    4: o_ton <= 12'd300;
                    5: o_ton <= 12'd240;
                    6: o_ton <= 12'd200;
                    7: o_ton <= 12'd171;
                    8: o_ton <= 12'd158;
                    9: o_ton <= 12'd150;
                endcase
               end 
            
            3: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd800;
                    1: o_ton <= 12'd625;
                    2: o_ton <= 12'd500;
                    3: o_ton <= 12'd417;
                    4: o_ton <= 12'd400;
                    5: o_ton <= 12'd320;
                    6: o_ton <= 12'd267;
                    7: o_ton <= 12'd229;
                    8: o_ton <= 12'd211;
                    9: o_ton <= 12'd200;
                endcase
               end
            
            4: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd1000;
                    1: o_ton <= 12'd781;
                    2: o_ton <= 12'd625;
                    3: o_ton <= 12'd521;
                    4: o_ton <= 12'd500;
                    5: o_ton <= 12'd400;
                    6: o_ton <= 12'd333;
                    7: o_ton <= 12'd286;
                    8: o_ton <= 12'd263;
                    9: o_ton <= 12'd250;
                endcase
               end
            
            5: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd1200;
                    1: o_ton <= 12'd938;
                    2: o_ton <= 12'd750;
                    3: o_ton <= 12'd625;
                    4: o_ton <= 12'd600;
                    5: o_ton <= 12'd480;
                    6: o_ton <= 12'd400;
                    7: o_ton <= 12'd343;
                    8: o_ton <= 12'd316;
                    9: o_ton <= 12'd300;
                endcase
               end
            
            6: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd1400;
                    1: o_ton <= 12'd1094;
                    2: o_ton <= 12'd875;
                    3: o_ton <= 12'd729;
                    4: o_ton <= 12'd700;
                    5: o_ton <= 12'd560;
                    6: o_ton <= 12'd467;
                    7: o_ton <= 12'd400;
                    8: o_ton <= 12'd368;
                    9: o_ton <= 12'd350;
                endcase
               end
            
            7: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd1600;
                    1: o_ton <= 12'd1250;
                    2: o_ton <= 12'd1000;
                    3: o_ton <= 12'd833;
                    4: o_ton <= 12'd800;
                    5: o_ton <= 12'd640;
                    6: o_ton <= 12'd533;
                    7: o_ton <= 12'd457;
                    8: o_ton <= 12'd421;
                    9: o_ton <= 12'd400;
                endcase
               end
            
            8: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd1800;
                    1: o_ton <= 12'd1406;
                    2: o_ton <= 12'd1125;
                    3: o_ton <= 12'd938;
                    4: o_ton <= 12'd900;
                    5: o_ton <= 12'd720;
                    6: o_ton <= 12'd600;
                    7: o_ton <= 12'd514;
                    8: o_ton <= 12'd474;
                    9: o_ton <= 12'd450;
                endcase
               end

            9: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd2000;
                    1: o_ton <= 12'd1563;
                    2: o_ton <= 12'd1250;
                    3: o_ton <= 12'd1042;
                    4: o_ton <= 12'd1000;
                    5: o_ton <= 12'd800;
                    6: o_ton <= 12'd667;
                    7: o_ton <= 12'd571;
                    8: o_ton <= 12'd526;
                    9: o_ton <= 12'd500;
                endcase
               end

            10: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd2200;
                    1: o_ton <= 12'd1719;
                    2: o_ton <= 12'd1375;
                    3: o_ton <= 12'd1146;
                    4: o_ton <= 12'd1100;
                    5: o_ton <= 12'd880;
                    6: o_ton <= 12'd733;
                    7: o_ton <= 12'd629;
                    8: o_ton <= 12'd579;
                    9: o_ton <= 12'd550;
                endcase
               end
               
            11: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd2400;
                    1: o_ton <= 12'd1875;
                    2: o_ton <= 12'd1500;
                    3: o_ton <= 12'd1250;
                    4: o_ton <= 12'd1200;
                    5: o_ton <= 12'd960;
                    6: o_ton <= 12'd800;
                    7: o_ton <= 12'd686;
                    8: o_ton <= 12'd632;
                    9: o_ton <= 12'd600;
                endcase
               end
               
            12: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd2600;
                    1: o_ton <= 12'd2031;
                    2: o_ton <= 12'd1625;
                    3: o_ton <= 12'd1354;
                    4: o_ton <= 12'd1300;
                    5: o_ton <= 12'd1040;
                    6: o_ton <= 12'd867;
                    7: o_ton <= 12'd743;
                    8: o_ton <= 12'd684;
                    9: o_ton <= 12'd650;
                endcase
               end
               
            13: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd2800;
                    1: o_ton <= 12'd2188;
                    2: o_ton <= 12'd1750;
                    3: o_ton <= 12'd1458;
                    4: o_ton <= 12'd1400;
                    5: o_ton <= 12'd1120;
                    6: o_ton <= 12'd933;
                    7: o_ton <= 12'd800;
                    8: o_ton <= 12'd737;
                    9: o_ton <= 12'd700;
                endcase
               end
               
            14: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd3000;
                    1: o_ton <= 12'd2344;
                    2: o_ton <= 12'd1875;
                    3: o_ton <= 12'd1563;
                    4: o_ton <= 12'd1500;
                    5: o_ton <= 12'd1200;
                    6: o_ton <= 12'd1000;
                    7: o_ton <= 12'd857;
                    8: o_ton <= 12'd789;
                    9: o_ton <= 12'd750;
                endcase
               end
               
            15: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd3200;
                    1: o_ton <= 12'd2500;
                    2: o_ton <= 12'd2000;
                    3: o_ton <= 12'd1667;
                    4: o_ton <= 12'd1600;
                    5: o_ton <= 12'd1280;
                    6: o_ton <= 12'd1067;
                    7: o_ton <= 12'd914;
                    8: o_ton <= 12'd842;
                    9: o_ton <= 12'd800;
                endcase
               end
               
            16: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd3400;
                    1: o_ton <= 12'd2656;
                    2: o_ton <= 12'd2125;
                    3: o_ton <= 12'd1771;
                    4: o_ton <= 12'd1700;
                    5: o_ton <= 12'd1360;
                    6: o_ton <= 12'd1133;
                    7: o_ton <= 12'd971;
                    8: o_ton <= 12'd895;
                    9: o_ton <= 12'd850;
                endcase
               end
               
            17: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd3600;
                    1: o_ton <= 12'd2813;
                    2: o_ton <= 12'd2250;
                    3: o_ton <= 12'd1875;
                    4: o_ton <= 12'd1800;
                    5: o_ton <= 12'd1440;
                    6: o_ton <= 12'd1200;
                    7: o_ton <= 12'd1029;
                    8: o_ton <= 12'd947;
                    9: o_ton <= 12'd900;
                endcase
               end
               
            18: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd3800;
                    1: o_ton <= 12'd2969;
                    2: o_ton <= 12'd2375;
                    3: o_ton <= 12'd1979;
                    4: o_ton <= 12'd1900;
                    5: o_ton <= 12'd1520;
                    6: o_ton <= 12'd1267;
                    7: o_ton <= 12'd1086;
                    8: o_ton <= 12'd1000;
                    9: o_ton <= 12'd950;
                endcase
               end
               
            19: begin
                case(i_freq_sel)
                    0: o_ton <= 12'd4000;
                    1: o_ton <= 12'd3125;
                    2: o_ton <= 12'd2500;
                    3: o_ton <= 12'd2083;
                    4: o_ton <= 12'd2000;
                    5: o_ton <= 12'd1600;
                    6: o_ton <= 12'd1333;
                    7: o_ton <= 12'd1143;
                    8: o_ton <= 12'd1053;
                    9: o_ton <= 12'd1000;
                endcase
               end

        endcase
    end    




endmodule