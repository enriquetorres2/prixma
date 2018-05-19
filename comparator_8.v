// -----------------------------------------------------------------
// -- Design Name : comp_8
// -- File Name   : comparator_8.v
// -- Function    : 2 input 8 bit comparator
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
module comp_8(P0,P1,P,Q);
	input [7:0] P,Q;
	output reg P0,P1;
	always @* begin
		if (P==Q) begin
			P0 = 1'b0;
		end else begin
			P0 = 1'b1;
		end
		if (P>Q) begin
			P1 = 1'b0;
		end else begin
			P1 = 1'b1;
		end
	end
endmodule