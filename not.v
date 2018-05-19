//-----------------------------------------------------
// Design Name : NOT
// File Name   : not.v
// Function    : NOT Gate
// Coder       : Enrique J. Torres
//-----------------------------------------------------
module NOT(S,A);
	input A;
	output reg S;
	always @*
	begin
		S = ~A;
	end
endmodule