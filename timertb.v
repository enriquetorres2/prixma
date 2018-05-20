// -----------------------------------------------------------------
// -- Design Name : timertb
// -- File Name   : timertb.v
// -- Function    : 6 bit timer test bench
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
`include "timer.v"

module timertb;
	wire Q;
	reg [5:0] C;
	reg clk, rst;

	timer Ti (Q,C,clk,rst);

	initial begin
		C = 5'b00100;
		rst = 0;
		clk = 1;
		#5 rst = 1;
		#5 rst = 0;
	end

	initial begin
		repeat (10) #5 clk = ~clk;
		#5 	rst = 0;
		clk = 1;
		#5 rst = 1;
		#5 rst = 0;
		repeat (10) #5 clk = ~clk;
	end
	initial begin
		$monitor("Q = %b",Q);
	end
endmodule