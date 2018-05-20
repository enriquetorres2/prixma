// -----------------------------------------------------------------
// -- Design Name : OR_2
// -- File Name   : or_2.v
// -- Function    : 2 input OR
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
module OR_2(S,A,B);
	input A,B;
	output reg S;
	always @*
		S = A|B;
endmodule