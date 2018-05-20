// -----------------------------------------------------------------
// -- Design Name : OR_3
// -- File Name   : or_3.v
// -- Function    : 3 input OR
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
module OR_3(S,A,B,C);
	input A,B,C;
	output reg S;
	always @*
		S = A|B|C;
endmodule