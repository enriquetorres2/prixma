// -----------------------------------------------------------------
// -- Design Name : NAND_2
// -- File Name   : nand_2.v
// -- Function    : 2 input NAND
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
module NAND_2(S,A,B);
	input A,B;
	output reg S;
	always @*
		S = A~&B;
endmodule