// -----------------------------------------------------------------
// -- Design Name : sel3_6
// -- File Name   : sel3_6.v
// -- Function    : 3-6 bit Selector
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
module sel3_6(P,A,B,C,E,I0,I1,I2);
	input E,A,B,C;
	input [5:0] I0,I1,I2,I3;
	output reg[5:0] P;
	always @*
		if(E)
		begin
			case({A,B,C})
				3'b100: P = I0;
				3'b010: P = I1;
				3'b001: P = I2;
				default: P = 0;
			endcase
		end
		else 
		begin
			P = 0;
		end
endmodule