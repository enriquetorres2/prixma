// -----------------------------------------------------------------
// -- Design Name : PWM
// -- File Name   : pwm.v
// -- Function    : 5 steps Pulse Width Modulation With D Flip-Flops
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
`include "dff.v"
`include "not.v"
`include "nand_2.v"
`include "mux4x1_1.v"
`include "nor_2.v"

module PWM(Out,Clk,E,X,Y,reset);
	input Clk,E,X,Y,reset;
	wire notClk,DA,QA,nQA,DB,QB,nQB,I0,I1,I2;
	output Out;
	NOT ntClk(notClk,Clk);
	dff A(nQA,notClk,0,reset,QA,nQA);
	dff B(nQB,nQA,0,reset,QB,nQB);
	NOR_2 i0mux(I0,QA,QB);
	NOT i1mux(I1,QB);
	NAND_2 i2mux(I2,QA,QB);
	mux4x1_1 mux(Out,{X,Y},E,I0,I1,I2,1);
endmodule