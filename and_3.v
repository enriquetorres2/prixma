// -----------------------------------------------------------------
// -- Design Name : AND_3
// -- File Name   : and_3.v
// -- Function    : 3 input NAND
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
module AND_3(S,A,B,C);
	input A,B,C;
	output reg S;
	always @*
		S = A&B&C;
endmodule