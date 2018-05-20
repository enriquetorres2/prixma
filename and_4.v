// -----------------------------------------------------------------
// -- Design Name : AND_4
// -- File Name   : and_4.v
// -- Function    : 4 input AND
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
module AND_4(S,A,B,C,D);
	input A,B,C,D;
	output reg S;
	always @*
		S = A&B&C&D;
endmodule