// -----------------------------------------------------------------
// -- Design Name : NOR_2
// -- File Name   : nor_2.v
// -- Function    : 2 input NOR
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
module NOR_2(S,A,B);
	input A,B;
	output reg S;
	always @*
		S = ~(A|B);
endmodule