// -----------------------------------------------------------------
// -- Design Name : decoder_3bit_7segment
// -- File Name   : decoder_3bit_7segment.v
// -- Function    : 3 bit to 7 segment decoder
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
module decoder_3bit_7segment(P,E,I);
	input [2:0] I;
	input E;
	output reg[7:0] P;
	always @*
		if(E)
		begin
			case(I)		  // abcdefgp
				3'h0: P = 8'b11111100;
				3'h1: P = 8'b01100000;
				3'h2: P = 8'b11011010;
				3'h3: P = 8'b11110010;
				3'h4: P = 8'b01100110;
				3'h5: P = 8'b10110100;
				3'h6: P = 8'b10111110;
				3'h7: P = 8'b11100000;
			endcase
		end
		else 
		begin
			P = 0;
		end
endmodule