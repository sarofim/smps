module ol_duty_sel
(
    input [7:0] i_sel,
    output [10:0] o_ton
)
    always@(*) begin
        case (i_sel)
            8'd0:	o_ton <= 0;
            8'd1:	o_ton <= 4;
            8'd2:	o_ton <= 8;
            8'd3:	o_ton <= 12;
            8'd4:	o_ton <= 16;
            8'd5:	o_ton <= 20;
            8'd6:	o_ton <= 24;
            8'd7:	o_ton <= 27;
            8'd8:	o_ton <= 31;
            8'd9:	o_ton <= 35;
            8'd10:	o_ton <= 39;
            8'd11:	o_ton <= 43;
            8'd12:	o_ton <= 47;
            8'd13:	o_ton <= 51;
            8'd14:	o_ton <= 55;
            8'd15:	o_ton <= 59;
            8'd16:	o_ton <= 63;
            8'd17:	o_ton <= 67;
            8'd18:	o_ton <= 71;
            8'd19:	o_ton <= 75;
            8'd20:	o_ton <= 78;
            8'd21:	o_ton <= 82;
            8'd22:	o_ton <= 86;
            8'd23:	o_ton <= 90;
            8'd24:	o_ton <= 94;
            8'd25:	o_ton <= 98;
            8'd26:	o_ton <= 102;
            8'd27:	o_ton <= 106;
            8'd28:	o_ton <= 110;
            8'd29:	o_ton <= 114;
            8'd30:	o_ton <= 118;
            8'd31:	o_ton <= 122;
            8'd32:	o_ton <= 125;
            8'd33:	o_ton <= 129;
            8'd34:	o_ton <= 133;
            8'd35:	o_ton <= 137;
            8'd36:	o_ton <= 141;
            8'd37:	o_ton <= 145;
            8'd38:	o_ton <= 149;
            8'd39:	o_ton <= 153;
            8'd40:	o_ton <= 157;
            8'd41:	o_ton <= 161;
            8'd42:	o_ton <= 165;
            8'd43:	o_ton <= 169;
            8'd44:	o_ton <= 173;
            8'd45:	o_ton <= 176;
            8'd46:	o_ton <= 180;
            8'd47:	o_ton <= 184;
            8'd48:	o_ton <= 188;
            8'd49:	o_ton <= 192;
            8'd50:	o_ton <= 196;
            8'd51:	o_ton <= 200;
            8'd52:	o_ton <= 204;
            8'd53:	o_ton <= 208;
            8'd54:	o_ton <= 212;
            8'd55:	o_ton <= 216;
            8'd56:	o_ton <= 220;
            8'd57:	o_ton <= 224;
            8'd58:	o_ton <= 227;
            8'd59:	o_ton <= 231;
            8'd60:	o_ton <= 235;
            8'd61:	o_ton <= 239;
            8'd62:	o_ton <= 243;
            8'd63:	o_ton <= 247;
            8'd64:	o_ton <= 251;
            8'd65:	o_ton <= 255;
            8'd66:	o_ton <= 259;
            8'd67:	o_ton <= 263;
            8'd68:	o_ton <= 267;
            8'd69:	o_ton <= 271;
            8'd70:	o_ton <= 275;
            8'd71:	o_ton <= 278;
            8'd72:	o_ton <= 282;
            8'd73:	o_ton <= 286;
            8'd74:	o_ton <= 290;
            8'd75:	o_ton <= 294;
            8'd76:	o_ton <= 298;
            8'd77:	o_ton <= 302;
            8'd78:	o_ton <= 306;
            8'd79:	o_ton <= 310;
            8'd80:	o_ton <= 314;
            8'd81:	o_ton <= 318;
            8'd82:	o_ton <= 322;
            8'd83:	o_ton <= 325;
            8'd84:	o_ton <= 329;
            8'd85:	o_ton <= 333;
            8'd86:	o_ton <= 337;
            8'd87:	o_ton <= 341;
            8'd88:	o_ton <= 345;
            8'd89:	o_ton <= 349;
            8'd90:	o_ton <= 353;
            8'd91:	o_ton <= 357;
            8'd92:	o_ton <= 361;
            8'd93:	o_ton <= 365;
            8'd94:	o_ton <= 369;
            8'd95:	o_ton <= 373;
            8'd96:	o_ton <= 376;
            8'd97:	o_ton <= 380;
            8'd98:	o_ton <= 384;
            8'd99:	o_ton <= 388;
            8'd100: o_ton <=	392;
            8'd101: o_ton <=	396;
            8'd102: o_ton <=	400;
            8'd103: o_ton <=	404;
            8'd104: o_ton <=	408;
            8'd105: o_ton <=	412;
            8'd106: o_ton <=	416;
            8'd107: o_ton <=	420;
            8'd108: o_ton <=	424;
            8'd109: o_ton <=	427;
            8'd110: o_ton <=	431;
            8'd111: o_ton <=	435;
            8'd112: o_ton <=	439;
            8'd113: o_ton <=	443;
            8'd114: o_ton <=	447;
            8'd115: o_ton <=	451;
            8'd116: o_ton <=	455;
            8'd117: o_ton <=	459;
            8'd118: o_ton <=	463;
            8'd119: o_ton <=	467;
            8'd120: o_ton <=	471;
            8'd121: o_ton <=	475;
            8'd122: o_ton <=	478;
            8'd123: o_ton <=	482;
            8'd124: o_ton <=	486;
            8'd125: o_ton <=	490;
            8'd126: o_ton <=	494;
            8'd127: o_ton <=	498;
            8'd128: o_ton <=	502;
            8'd129: o_ton <=	506;
            8'd130: o_ton <=	510;
            8'd131: o_ton <=	514;
            8'd132: o_ton <=	518;
            8'd133: o_ton <=	522;
            8'd134: o_ton <=	525;
            8'd135: o_ton <=	529;
            8'd136: o_ton <=	533;
            8'd137: o_ton <=	537;
            8'd138: o_ton <=	541;
            8'd139: o_ton <=	545;
            8'd140: o_ton <=	549;
            8'd141: o_ton <=	553;
            8'd142: o_ton <=	557;
            8'd143: o_ton <=	561;
            8'd144: o_ton <=	565;
            8'd145: o_ton <=	569;
            8'd146: o_ton <=	573;
            8'd147: o_ton <=	576;
            8'd148: o_ton <=	580;
            8'd149: o_ton <=	584;
            8'd150: o_ton <=	588;
            8'd151: o_ton <=	592;
            8'd152: o_ton <=	596;
            8'd153: o_ton <=	600;
            8'd154: o_ton <=	604;
            8'd155: o_ton <=	608;
            8'd156: o_ton <=	612;
            8'd157: o_ton <=	616;
            8'd158: o_ton <=	620;
            8'd159: o_ton <=	624;
            8'd160: o_ton <=	627;
            8'd161: o_ton <=	631;
            8'd162: o_ton <=	635;
            8'd163: o_ton <=	639;
            8'd164: o_ton <=	643;
            8'd165: o_ton <=	647;
            8'd166: o_ton <=	651;
            8'd167: o_ton <=	655;
            8'd168: o_ton <=	659;
            8'd169: o_ton <=	663;
            8'd170: o_ton <=	667;
            8'd171: o_ton <=	671;
            8'd172: o_ton <=	675;
            8'd173: o_ton <=	678;
            8'd174: o_ton <=	682;
            8'd175: o_ton <=	686;
            8'd176: o_ton <=	690;
            8'd177: o_ton <=	694;
            8'd178: o_ton <=	698;
            8'd179: o_ton <=	702;
            8'd180: o_ton <=	706;
            8'd181: o_ton <=	710;
            8'd182: o_ton <=	714;
            8'd183: o_ton <=	718;
            8'd184: o_ton <=	722;
            8'd185: o_ton <=	725;
            8'd186: o_ton <=	729;
            8'd187: o_ton <=	733;
            8'd188: o_ton <=	737;
            8'd189: o_ton <=	741;
            8'd190: o_ton <=	745;
            8'd191: o_ton <=	749;
            8'd192: o_ton <=	753;
            8'd193: o_ton <=	757;
            8'd194: o_ton <=	761;
            8'd195: o_ton <=	765;
            8'd196: o_ton <=	769;
            8'd197: o_ton <=	773;
            8'd198: o_ton <=	776;
            8'd199: o_ton <=	780;
            8'd200: o_ton <=	784;
            8'd201: o_ton <=	788;
            8'd202: o_ton <=	792;
            8'd203: o_ton <=	796;
            8'd204: o_ton <=	800;
            8'd205: o_ton <=	804;
            8'd206: o_ton <=	808;
            8'd207: o_ton <=	812;
            8'd208: o_ton <=	816;
            8'd209: o_ton <=	820;
            8'd210: o_ton <=	824;
            8'd211: o_ton <=	827;
            8'd212: o_ton <=	831;
            8'd213: o_ton <=	835;
            8'd214: o_ton <=	839;
            8'd215: o_ton <=	843;
            8'd216: o_ton <=	847;
            8'd217: o_ton <=	851;
            8'd218: o_ton <=	855;
            8'd219: o_ton <=	859;
            8'd220: o_ton <=	863;
            8'd221: o_ton <=	867;
            8'd222: o_ton <=	871;
            8'd223: o_ton <=	875;
            8'd224: o_ton <=	878;
            8'd225: o_ton <=	882;
            8'd226: o_ton <=	886;
            8'd227: o_ton <=	890;
            8'd228: o_ton <=	894;
            8'd229: o_ton <=	898;
            8'd230: o_ton <=	902;
            8'd231: o_ton <=	906;
            8'd232: o_ton <=	910;
            8'd233: o_ton <=	914;
            8'd234: o_ton <=	918;
            8'd235: o_ton <=	922;
            8'd236: o_ton <=	925;
            8'd237: o_ton <=	929;
            8'd238: o_ton <=	933;
            8'd239: o_ton <=	937;
            8'd240: o_ton <=	941;
            8'd241: o_ton <=	945;
            8'd242: o_ton <=	949;
            8'd243: o_ton <=	953;
            8'd244: o_ton <=	957;
            8'd245: o_ton <=	961;
            8'd246: o_ton <=	965;
            8'd247: o_ton <=	969;
            8'd248: o_ton <=	973;
            8'd249: o_ton <=	976;
            8'd250: o_ton <=	980;
            8'd251: o_ton <=	984;
            8'd252: o_ton <=	988;
            8'd253: o_ton <=	992;
            8'd254: o_ton <=	996;
            8'd255: o_ton <=	100;
        endcase
    end
endmodule;