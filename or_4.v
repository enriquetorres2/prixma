// -----------------------------------------------------------------
// -- Design Name : OR_4
// -- File Name   : or_4.v
// -- Function    : 4 input OR
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
module OR_4(S,A,B,C,D);
	input A,B,C,D;
	output reg S;
	always @*
		S = A|B|C|D;
endmodule