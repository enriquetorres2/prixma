// -----------------------------------------------------------------
// -- Design Name : contoller
// -- File Name   : contoller.v
// -- Function    : Controller
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
`include "dff.v"
`include "or_2.v"
`include "or_3.v"
`include "or_4.v"
`include "and_2.v"
`include "and_3.v"
`include "and_4.v"
`include "not.v"

module controller(stop_motor,front_motor,turn_left,turn_right,rotate,
	cd,red,green,blue,purple,yellow,done,clk,reset);
	input cd,red,green,blue,purple,yellow,done,clk,reset;
	wire notBlue,notDone,sor1,sor2,sor3,sor4,sor5;
	wire A,notA,B,notB,C,notC;
	wire or1_1,or1_2,or1_3,or1_4,or2_1,or2_2,or2_3,or3_1,or3_2,or3_3;
	wire dI_1,dI_2,dI_3;
	output stop_motor,front_motor,turn_left,turn_right,rotate;

	NOT not1(notBlue,blue);
	AND_3 and1(or1_1,B,notC,notBlue);
	AND_3 and2(or1_2,notA,C,done);
	AND_3 and3(or1_3,A,C,red);
	AND_2 and4(or1_4,A,B);

	NOT not2(notDone,done);
	OR_2 or1(sor1,A,C);
	OR_3 or2(sor2,blue,purple,yellow);
	AND_3 and5(or2_1,notA,notB,cd);
	AND_3 and6(or2_2,notDone,B,sor1);
	AND_4 and7(or2_3,notA,B,notC,sor2);

	OR_3 or3(sor3,yellow,blue,red);
	AND_3 and8(or3_1,notB,C,red);
	AND_3 and9(or3_2,B,C,notDone);
	AND_4 and10(or3_3,notA,B,notC,sor3);

	OR_4 or4(dI_1,or1_1,or1_2,or1_3,or1_4);
	OR_3 or5(dI_2,or2_1,or2_2,or2_3);
	OR_3 or6(dI_3,or3_1,or3_2,or3_3);

	dff DA (dI_1,clk,0,reset,A,notA);
	dff DB (dI_2,clk,0,reset,B,notB);
	dff DC (dI_3,clk,0,reset,C,notC);

	AND_2 and11(sor4,notA,notC);
	AND_2 and12(sor5,notB,notC);
	AND_3 and13(stop_motor,A,notB,C);
	AND_3 and14(turn_left,A,B,C);
	AND_3 and15(turn_right,notA,B,C);
	AND_3 and16(rotate,A,B,notC);
	OR_2 or7(front_motor,sor4,sor5);

endmodule