// -----------------------------------------------------------------
// -- Design Name : timer
// -- File Name   : timer.v
// -- Function    : 6 bit timer
// -- Coder       : Enrique J. Torres Rivera
// // -----------------------------------------------------------------
// `include "dff.v"
// `include "nand_2.v"
//`include "comparator_8.v"
// `include "not.v"

module timer(Qout,C,clk,reset);
	input clk, reset;
	input [5:0] C;
	wire notClk,l0,l1,l2,l3,l4,l5,Q;
	wire [5:0] T;
	output Qout;

	NAND_2 NANDClock (notClk,clk,Q);
	dff D0 (l0,notClk,0,reset,T[0],l0);
	dff D1 (l1,l0,0,reset,T[1],l1);
	dff D2 (l2,l1,0,reset,T[2],l2);
	dff D3 (l3,l2,0,reset,T[3],l3);
	dff D4 (l4,l3,0,reset,T[4],l4);
	dff D5 (l5,l4,0,reset,T[5],l5);

	comp_8 COMP (Q,,{2'b0,T},{2'b0,C});
	NOT not0 (Qout,Q);

endmodule