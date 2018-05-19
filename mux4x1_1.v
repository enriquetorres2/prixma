// -----------------------------------------------------------------
// -- Design Name : mux4x1_1
// -- File Name   : mux4x1_1.v
// -- Function    : 4 to 1 1 bit Multiplexer
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
module mux4x1_1(P,A,E,I0,I1,I2,I3);
	input E,I0,I1,I2,I3;
	input [1:0] A;
	output reg P;
	always @*
		if(E)
		begin
			case(A)
				2'h0: P = I0;
				2'h1: P = I1;
				2'h2: P = I2;
				2'h3: P = I3;
			endcase
		end
		else 
		begin
			P = 0;
		end
endmodule