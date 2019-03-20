module dpwm_gen(
    CLOCK_50,
    i_enable,
    i_reset,
    i_update,
    i_fs,
    i_duty,
    i_dt1,
    i_dt2,
    o_c1, 
    o_c2);

    input CLOCK_50;
    input [3:0] i_fs;
    input [4:0] i_duty;
    input [3:0] i_dt1;
    input [3:0] i_dt2;
    input i_update;
    input i_reset;
    input i_enable;
    output reg o_c1;
    output reg o_c2;

    wire clk_200;
    pll ppl_double(.inclk0(CLOCK_50), .c0(clk_200));

    reg [11:0] dp_ts_sel;
    reg [11:0] dp_ts;
    reg [3:0] dp_dt1, dp_dt2;
    //input selec mux
    always@(posedge clk_200) begin
        case(i_fs)
            0: dp_ts_sel <= 12'd4000;
            1: dp_ts_sel <= 12'd3125;
            2: dp_ts_sel <= 12'd2500;
            3: dp_ts_sel <= 12'd2083;
            4: dp_ts_sel <= 12'd2000;
            5: dp_ts_sel <= 12'd1600;
            6: dp_ts_sel <= 12'd1333;
            7: dp_ts_sel <= 12'd1143;
            8: dp_ts_sel <= 12'd1053;
            9: dp_ts_sel <= 12'd1000;
        endcase

        case(i_dt1)
            0: dp_dt1 <= 4'd2;  
            1: dp_dt1 <= 4'd4;
            2: dp_dt1 <= 4'd6;
            3: dp_dt1 <= 4'd8;
            4: dp_dt1 <= 4'd10;
            5: dp_dt1 <= 4'd12;
            6: dp_dt1 <= 4'd14;
            7: dp_dt1 <= 4'd16;
            8: dp_dt1 <= 4'd18;
            9: dp_dt1 <= 4'd20;
        endcase

        case(i_dt2)
            0: dp_dt1 <= 4'd2;  
            1: dp_dt1 <= 4'd4;
            2: dp_dt1 <= 4'd6;
            3: dp_dt1 <= 4'd8;
            4: dp_dt1 <= 4'd10;
            5: dp_dt1 <= 4'd12;
            6: dp_dt1 <= 4'd14;
            7: dp_dt1 <= 4'd16;
            8: dp_dt1 <= 4'd18;
            9: dp_dt1 <= 4'd20;
        endcase
    end
    
    reg [4:0] dp_duty;
    reg [11:0] dp_ton;
    reg [11:0] dp_ton_sel;
    //mux dp_ton_sel : can change during Ts (switching cycle)
    always@(posedge clk_200) begin
        case(dp_duty)
            //0: dp_ton_sel <= 12'd0;
            0: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd200;
                    1: dp_ton_sel <= 12'd156;
                    2: dp_ton_sel <= 12'd125;
                    3: dp_ton_sel <= 12'd104;
                    4: dp_ton_sel <= 12'd100;
                    5: dp_ton_sel <= 12'd80;
                    6: dp_ton_sel <= 12'd67;
                    7: dp_ton_sel <= 12'd57;
                    8: dp_ton_sel <= 12'd53;
                    9: dp_ton_sel <= 12'd50;
                endcase
              end
            
            1: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd400;
                    1: dp_ton_sel <= 12'd313;
                    2: dp_ton_sel <= 12'd250;
                    3: dp_ton_sel <= 12'd208;
                    4: dp_ton_sel <= 12'd200;
                    5: dp_ton_sel <= 12'd160;
                    6: dp_ton_sel <= 12'd133;
                    7: dp_ton_sel <= 12'd114;
                    8: dp_ton_sel <= 12'd105;
                    9: dp_ton_sel <= 12'd100;
                endcase
               end
            
            2: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd600;
                    1: dp_ton_sel <= 12'd469;
                    2: dp_ton_sel <= 12'd375;
                    3: dp_ton_sel <= 12'd313;
                    4: dp_ton_sel <= 12'd300;
                    5: dp_ton_sel <= 12'd240;
                    6: dp_ton_sel <= 12'd200;
                    7: dp_ton_sel <= 12'd171;
                    8: dp_ton_sel <= 12'd158;
                    9: dp_ton_sel <= 12'd150;
                endcase
               end 
            
            3: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd800;
                    1: dp_ton_sel <= 12'd625;
                    2: dp_ton_sel <= 12'd500;
                    3: dp_ton_sel <= 12'd417;
                    4: dp_ton_sel <= 12'd400;
                    5: dp_ton_sel <= 12'd320;
                    6: dp_ton_sel <= 12'd267;
                    7: dp_ton_sel <= 12'd229;
                    8: dp_ton_sel <= 12'd211;
                    9: dp_ton_sel <= 12'd200;
                endcase
               end
            
            4: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd1000;
                    1: dp_ton_sel <= 12'd781;
                    2: dp_ton_sel <= 12'd625;
                    3: dp_ton_sel <= 12'd521;
                    4: dp_ton_sel <= 12'd500;
                    5: dp_ton_sel <= 12'd400;
                    6: dp_ton_sel <= 12'd333;
                    7: dp_ton_sel <= 12'd286;
                    8: dp_ton_sel <= 12'd263;
                    9: dp_ton_sel <= 12'd250;
                endcase
               end
            
            5: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd1200;
                    1: dp_ton_sel <= 12'd938;
                    2: dp_ton_sel <= 12'd750;
                    3: dp_ton_sel <= 12'd625;
                    4: dp_ton_sel <= 12'd600;
                    5: dp_ton_sel <= 12'd480;
                    6: dp_ton_sel <= 12'd400;
                    7: dp_ton_sel <= 12'd343;
                    8: dp_ton_sel <= 12'd316;
                    9: dp_ton_sel <= 12'd300;
                endcase
               end
            
            6: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd1400;
                    1: dp_ton_sel <= 12'd1094;
                    2: dp_ton_sel <= 12'd875;
                    3: dp_ton_sel <= 12'd729;
                    4: dp_ton_sel <= 12'd700;
                    5: dp_ton_sel <= 12'd560;
                    6: dp_ton_sel <= 12'd467;
                    7: dp_ton_sel <= 12'd400;
                    8: dp_ton_sel <= 12'd368;
                    9: dp_ton_sel <= 12'd350;
                endcase
               end
            
            7: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd1600;
                    1: dp_ton_sel <= 12'd1250;
                    2: dp_ton_sel <= 12'd1000;
                    3: dp_ton_sel <= 12'd833;
                    4: dp_ton_sel <= 12'd800;
                    5: dp_ton_sel <= 12'd640;
                    6: dp_ton_sel <= 12'd533;
                    7: dp_ton_sel <= 12'd457;
                    8: dp_ton_sel <= 12'd421;
                    9: dp_ton_sel <= 12'd400;
                endcase
               end
            
            8: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd1800;
                    1: dp_ton_sel <= 12'd1406;
                    2: dp_ton_sel <= 12'd1125;
                    3: dp_ton_sel <= 12'd938;
                    4: dp_ton_sel <= 12'd900;
                    5: dp_ton_sel <= 12'd720;
                    6: dp_ton_sel <= 12'd600;
                    7: dp_ton_sel <= 12'd514;
                    8: dp_ton_sel <= 12'd474;
                    9: dp_ton_sel <= 12'd450;
                endcase
               end

            9: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd2000;
                    1: dp_ton_sel <= 12'd1563;
                    2: dp_ton_sel <= 12'd1250;
                    3: dp_ton_sel <= 12'd1042;
                    4: dp_ton_sel <= 12'd1000;
                    5: dp_ton_sel <= 12'd800;
                    6: dp_ton_sel <= 12'd667;
                    7: dp_ton_sel <= 12'd571;
                    8: dp_ton_sel <= 12'd526;
                    9: dp_ton_sel <= 12'd500;
                endcase
               end

            10: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd2200;
                    1: dp_ton_sel <= 12'd1719;
                    2: dp_ton_sel <= 12'd1375;
                    3: dp_ton_sel <= 12'd1146;
                    4: dp_ton_sel <= 12'd1100;
                    5: dp_ton_sel <= 12'd880;
                    6: dp_ton_sel <= 12'd733;
                    7: dp_ton_sel <= 12'd629;
                    8: dp_ton_sel <= 12'd579;
                    9: dp_ton_sel <= 12'd550;
                endcase
               end
               
            11: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd2400;
                    1: dp_ton_sel <= 12'd1875;
                    2: dp_ton_sel <= 12'd1500;
                    3: dp_ton_sel <= 12'd1250;
                    4: dp_ton_sel <= 12'd1200;
                    5: dp_ton_sel <= 12'd960;
                    6: dp_ton_sel <= 12'd800;
                    7: dp_ton_sel <= 12'd686;
                    8: dp_ton_sel <= 12'd632;
                    9: dp_ton_sel <= 12'd600;
                endcase
               end
               
            12: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd2600;
                    1: dp_ton_sel <= 12'd2031;
                    2: dp_ton_sel <= 12'd1625;
                    3: dp_ton_sel <= 12'd1354;
                    4: dp_ton_sel <= 12'd1300;
                    5: dp_ton_sel <= 12'd1040;
                    6: dp_ton_sel <= 12'd867;
                    7: dp_ton_sel <= 12'd743;
                    8: dp_ton_sel <= 12'd684;
                    9: dp_ton_sel <= 12'd650;
                endcase
               end
               
            13: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd2800;
                    1: dp_ton_sel <= 12'd2188;
                    2: dp_ton_sel <= 12'd1750;
                    3: dp_ton_sel <= 12'd1458;
                    4: dp_ton_sel <= 12'd1400;
                    5: dp_ton_sel <= 12'd1120;
                    6: dp_ton_sel <= 12'd933;
                    7: dp_ton_sel <= 12'd800;
                    8: dp_ton_sel <= 12'd737;
                    9: dp_ton_sel <= 12'd700;
                endcase
               end
               
            14: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd3000;
                    1: dp_ton_sel <= 12'd2344;
                    2: dp_ton_sel <= 12'd1875;
                    3: dp_ton_sel <= 12'd1563;
                    4: dp_ton_sel <= 12'd1500;
                    5: dp_ton_sel <= 12'd1200;
                    6: dp_ton_sel <= 12'd1000;
                    7: dp_ton_sel <= 12'd857;
                    8: dp_ton_sel <= 12'd789;
                    9: dp_ton_sel <= 12'd750;
                endcase
               end
               
            15: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd3200;
                    1: dp_ton_sel <= 12'd2500;
                    2: dp_ton_sel <= 12'd2000;
                    3: dp_ton_sel <= 12'd1667;
                    4: dp_ton_sel <= 12'd1600;
                    5: dp_ton_sel <= 12'd1280;
                    6: dp_ton_sel <= 12'd1067;
                    7: dp_ton_sel <= 12'd914;
                    8: dp_ton_sel <= 12'd842;
                    9: dp_ton_sel <= 12'd800;
                endcase
               end
               
            16: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd3400;
                    1: dp_ton_sel <= 12'd2656;
                    2: dp_ton_sel <= 12'd2125;
                    3: dp_ton_sel <= 12'd1771;
                    4: dp_ton_sel <= 12'd1700;
                    5: dp_ton_sel <= 12'd1360;
                    6: dp_ton_sel <= 12'd1133;
                    7: dp_ton_sel <= 12'd971;
                    8: dp_ton_sel <= 12'd895;
                    9: dp_ton_sel <= 12'd850;
                endcase
               end
               
            17: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd3600;
                    1: dp_ton_sel <= 12'd2813;
                    2: dp_ton_sel <= 12'd2250;
                    3: dp_ton_sel <= 12'd1875;
                    4: dp_ton_sel <= 12'd1800;
                    5: dp_ton_sel <= 12'd1440;
                    6: dp_ton_sel <= 12'd1200;
                    7: dp_ton_sel <= 12'd1029;
                    8: dp_ton_sel <= 12'd947;
                    9: dp_ton_sel <= 12'd900;
                endcase
               end
               
            18: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd3800;
                    1: dp_ton_sel <= 12'd2969;
                    2: dp_ton_sel <= 12'd2375;
                    3: dp_ton_sel <= 12'd1979;
                    4: dp_ton_sel <= 12'd1900;
                    5: dp_ton_sel <= 12'd1520;
                    6: dp_ton_sel <= 12'd1267;
                    7: dp_ton_sel <= 12'd1086;
                    8: dp_ton_sel <= 12'd1000;
                    9: dp_ton_sel <= 12'd950;
                endcase
               end
               
            19: begin
                case(i_fs)
                    0: dp_ton_sel <= 12'd4000;
                    1: dp_ton_sel <= 12'd3125;
                    2: dp_ton_sel <= 12'd2500;
                    3: dp_ton_sel <= 12'd2083;
                    4: dp_ton_sel <= 12'd2000;
                    5: dp_ton_sel <= 12'd1600;
                    6: dp_ton_sel <= 12'd1333;
                    7: dp_ton_sel <= 12'd1143;
                    8: dp_ton_sel <= 12'd1053;
                    9: dp_ton_sel <= 12'd1000;
                endcase
               end

        endcase
    end


    //main dpwm counter
    reg [11:0] dp_dpwm_counter;
    always@(posedge clk_200) begin
        if(i_reset || dp_dpwm_counter > dp_ts) begin
            dp_dpwm_counter <= 12'd0;
            dp_duty <= i_duty;
            dp_ton <= dp_ton_sel - 12'd1; 
            dp_ts <= dp_ts_sel - 12'd1;
            end
        else begin 
            dp_dpwm_counter <= dp_dpwm_counter + 12'd1;
            if(i_update) begin
                dp_ts <= dp_ts_sel - 12'd1;
                dp_ton <= dp_ton_sel - 12'd1;
                end
            end
    end

    //output controller
    always@(posedge clk_200) begin
        if(i_enable) begin
            if(dp_dpwm_counter < dp_dt1) begin
                o_c1 <= 1'd0;
                o_c2 <= 1'd0;
                end
            else if(dp_dpwm_counter < dp_ton + dp_dt1) begin
                o_c1 <= 1'd1;
                o_c2 <= 1'd0; 
                end
            else if(dp_dpwm_counter < dp_ton + dp_dt2 + dp_dt1) begin
                o_c1 <= 1'd0;
                o_c2 <= 1'd0; 
                end
            else if(dp_dpwm_counter < dp_ts) begin
                o_c1 <= 1'd0;
                o_c2 <= 1'd1; 
                end
            end
        else begin
            o_c1 <= 1'd0;
            o_c2 <= 1'd0;
            end
    end


endmodule