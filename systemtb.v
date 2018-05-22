// -----------------------------------------------------------------
// -- Design Name : systemtb
// -- File Name   : systemtb.v
// -- Function    : System Test Bench
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
`include "system.v"

module systemtb;

	wire motorL,motorR,a,b,c,d,e,f,g,pn;
	reg R7,R6,R5,R4,R3,R2,R1,R0;
	reg G7,G6,G5,G4,G3,G2,G1,G0;
	reg B7,B6,B5,B4,B3,B2,B1,B0,P;
	reg clk,rst;

	system s(motorL,motorR,a,b,c,d,e,f,g,pn,
	R7,R6,R5,R4,R3,R2,R1,R0,
	G7,G6,G5,G4,G3,G2,G1,G0,
	B7,B6,B5,B4,B3,B2,B1,B0,P,
	clk,rst);

	initial begin
		{R7,R6,R5,R4,R3,R2,R1,R0} = 8'h00;
		{G7,G6,G5,G4,G3,G2,G1,G0} = 8'h00;
		{B7,B6,B5,B4,B3,B2,B1,B0} = 8'h00;

		P = 0; clk = 0; rst = 0;
		#5 rst = 1;
		#5 rst = 0;
	end

	initial begin
		repeat (2000) #5 clk = ~clk;
	end
	initial begin
		$monitor("time = %d\nmotorL = %d\nmotorR = %d\na = %d\nb = %d\nc = %d\nd = %d\ne = %d\nf = %d\ng = %d\npn = %d\n",$time,motorL,motorR,a,b,c,d,e,f,g,pn);
	end
	initial begin
		//RED TEST 1
		#20 {R7,R6,R5,R4,R3,R2,R1,R0} = 8'h97;
		P = 1;
		#20 P = 0;
		//GREEN TEST 1
		#5 {R7,R6,R5,R4,R3,R2,R1,R0} = 0;
		{G7,G6,G5,G4,G3,G2,G1,G0} = 8'h97;
		P = 1;
		#20 P = 0;
		//BLUE TEST 1
		#20 {R7,R6,R5,R4,R3,R2,R1,R0} = 0;
		{G7,G6,G5,G4,G3,G2,G1,G0} = 0;
		{B7,B6,B5,B4,B3,B2,B1,B0} = 8'h97;
		P = 1;
		#20 P = 0;
		//PURPLE TEST 1
		#20 {R7,R6,R5,R4,R3,R2,R1,R0} = 8'h33;
		{G7,G6,G5,G4,G3,G2,G1,G0} = 0;
		{B7,B6,B5,B4,B3,B2,B1,B0} = 8'h97;
		P = 1;
		#20 P = 0;
		//YELLOW TEST 1
		#20 {R7,R6,R5,R4,R3,R2,R1,R0} = 8'h97;
		{G7,G6,G5,G4,G3,G2,G1,G0} = 8'h97;
		{B7,B6,B5,B4,B3,B2,B1,B0} = 0;
		P = 1;
		#20 P = 0;
		//RED TEST 2
		#5 {R7,R6,R5,R4,R3,R2,R1,R0} = 8'h96;
		{G7,G6,G5,G4,G3,G2,G1,G0} = 0;
		{B7,B6,B5,B4,B3,B2,B1,B0} = 0;
		P = 1;
		#20 P = 0;
		//GREEN TEST 2
		#20 {R7,R6,R5,R4,R3,R2,R1,R0} = 0;
		{G7,G6,G5,G4,G3,G2,G1,G0} = 8'h96;
		{B7,B6,B5,B4,B3,B2,B1,B0} = 0;
		P = 1;
		#20 P = 0;
		//BLUE TEST 2
		#20 {R7,R6,R5,R4,R3,R2,R1,R0} = 0;
		{G7,G6,G5,G4,G3,G2,G1,G0} = 0;
		{B7,B6,B5,B4,B3,B2,B1,B0} = 8'h96;
		P = 1;
		#20 P = 0;
		//PURPLE TEST 2
		#20 {R7,R6,R5,R4,R3,R2,R1,R0} = 8'h33;
		{G7,G6,G5,G4,G3,G2,G1,G0} = 0;
		{B7,B6,B5,B4,B3,B2,B1,B0} = 8'h96;
		P = 1;
		#20 P = 0;
		//YELLOW TEST 2
		#20 {R7,R6,R5,R4,R3,R2,R1,R0} = 8'h96;
		{G7,G6,G5,G4,G3,G2,G1,G0} = 8'h96;
		{B7,B6,B5,B4,B3,B2,B1,B0} = 0;
		P = 1;
		#20 P = 0;
		//WHITE TEST
		#20 {R7,R6,R5,R4,R3,R2,R1,R0} = 8'hFF;
		{G7,G6,G5,G4,G3,G2,G1,G0} = 8'hFF;
		{B7,B6,B5,B4,B3,B2,B1,B0} = 8'hFF;
		P = 1;
		#20 P = 0;
		//BLACK TEST
		#20 {R7,R6,R5,R4,R3,R2,R1,R0} = 0;
		{G7,G6,G5,G4,G3,G2,G1,G0} = 0;
		{B7,B6,B5,B4,B3,B2,B1,B0} = 0;
		P = 1;
		#20 P = 0;
		//ORANGE TEST
		#20 {R7,R6,R5,R4,R3,R2,R1,R0} = 8'hFF;
		{G7,G6,G5,G4,G3,G2,G1,G0} = 8'h7F;
		{B7,B6,B5,B4,B3,B2,B1,B0} = 0;
		P = 1;
		#20 P = 0;
	end

endmodule