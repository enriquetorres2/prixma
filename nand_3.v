// -----------------------------------------------------------------
// -- Design Name : NAND_3
// -- File Name   : nand_3.v
// -- Function    : 3 input NAND
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
module NAND_3(S,A,B,C);
	input A,B,C;
	output reg S;
	always @*
		S = ~(A&B&C);
endmodule