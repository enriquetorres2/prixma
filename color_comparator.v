// -----------------------------------------------------------------
// -- Design Name : color_comp
// -- File Name   : color_comparator.v
// -- Function    : Color Comparator Module
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
//`include "and_3.v"
//`include "and_2.v"
//`include "not.v"
`include "comparator_8.v"

module color_comp(red,green,blue,purple,yellow,
	r_signal,g_signal,b_signal,
	r1_code,g1_code,b1_code,r2_code,g2_code,b2_code);
	input [7:0] r_signal,g_signal,b_signal,r1_code,g1_code,b1_code,r2_code,g2_code,b2_code;
	wire P0_2,P0_3,P0_4,P1_1,P1_2,P1_3,P1_4,P1_5,P1_6;
	wire out_1,out_2,out_3,out_4,out_5,out_6,out_7;
	output red,green,blue,purple,yellow;

	comp_8 COMP_R1 (,P1_1,r_signal,r1_code);
	comp_8 COMP_G1 (P0_2,P1_2,g_signal,g1_code);
	comp_8 COMP_B1 (P0_3,P1_3,b_signal,b1_code);
	comp_8 COMP_R2 (P0_4,P1_4,r_signal,r2_code);
	comp_8 COMP_G2 (,P1_5,g_signal,g2_code);
	comp_8 COMP_B2 (,P1_6,b_signal,b2_code);

	NOT notP11 (out_1,P1_1);
	AND_2 andP02P12 (out_2,P0_2,P1_2);
	AND_2 andP03P13 (out_3,P0_3,P1_3);
	AND_2 andP04P14 (out_4,P0_4,P1_4);
	NOT notP15 (out_5,P1_5);
	NOT notP16 (out_6,P1_6);
	NOT notP14 (out_7,P1_4);

	AND_3 andRed (red,out_1,out_2,out_3);
	AND_3 andGreen (green,out_3,out_5,out_4);
	AND_3 andBlue (blue,out_4,out_2,out_6);
	AND_3 andPurple (purple,out_7,out_2,out_6);
	AND_3 andYellow (yellow,out_1,out_5,out_3);
endmodule