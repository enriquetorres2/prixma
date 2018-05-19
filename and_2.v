// -----------------------------------------------------------------
// -- Design Name : AND_2
// -- File Name   : and_2.v
// -- Function    : 2 input AND
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
module AND_2(S,A,B);
	input A,B;
	output reg S;
	always @*
		S = A&B;
endmodule