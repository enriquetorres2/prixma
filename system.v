// -----------------------------------------------------------------
// -- Design Name : system
// -- File Name   : system.v
// -- Function    : System
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
`include "color_comparator.v"
`include "controller.v"
`include "timer.v"
`include "pwm.v"
`include "motor_controller.v" 
`include "sel3_6.v"
`include "decoder_3bit_7segment.v"

module system(motorL,motorR,a,b,c,d,e,f,g,pn,
	R7,R6,R5,R4,R3,R2,R1,R0,
	G7,G6,G5,G4,G3,G2,G1,G0,
	B7,B6,B5,B4,B3,B2,B1,B0,P,
	clk,rst);

	input R7,R6,R5,R4,R3,R2,R1,R0;
	input G7,G6,G5,G4,G3,G2,G1,G0;
	input B7,B6,B5,B4,B3,B2,B1,B0,P;
	input clk,rst;

	wire red,green,blue,purple,yellow;
	wire stop_motor,front_motor,turn_left,turn_right,rotate;
	wire done,O1,O2,O3,S1,S2;
	wire [5:0] t;

	output motorL,motorR,a,b,c,d,e,f,g,pn;

	color_comp CC(red,green,blue,purple,yellow,
		{R7,R6,R5,R4,R3,R2,R1,R0},
		{G7,G6,G5,G4,G3,G2,G1,G0},
		{B7,B6,B5,B4,B3,B2,B1,B0},
		8'h96,8'h32,8'h32,8'h32,8'h96,8'h96);

	sel3_6 sel3(t,turn_left,turn_right,rotate,1,6'b100000,6'b100000,6'b100000);

	timer T1(done,t,clk,front_motor);

	controller ct (stop_motor,front_motor,turn_left,turn_right,rotate,
		O1,O2,O3,
		P,red,green,blue,purple,yellow,done,clk,rst);

	decoder_3bit_7segment d7s({a,b,c,d,e,f,g,pn},1,{O1,O2,O3});

	motor_contoller mt(S1,S2,stop_motor,front_motor,turn_left,turn_right,rotate);

	PWM m1(motorL,clk,S1,1,1,rst);

	PWM m2(motorR,clk,S2,1,1,rst);
endmodule