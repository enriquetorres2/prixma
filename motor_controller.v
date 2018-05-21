// -----------------------------------------------------------------
// -- Design Name : motor_contoller
// -- File Name   : motor_contoller.v
// -- Function    : Motor Controller
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
`include "not.v"
`include "or_2.v"
`include "or_3.v"
`include "and_2.v"

module motor_contoller(S1,S2,stop_motor,front_motor,turn_left,turn_right,rotate);
	input stop_motor,front_motor,turn_left,turn_right,rotate;
	wire and_2_1,and_2_2;
	output S1,S2;

	OR_3 or1 (and_2_1,front_motor,turn_right,rotate);
	NOT not1 (and_2_2,stop_motor);
	OR_2 or2 (S2,turn_left,front_motor);
	AND_2 and1 (S1,and_2_2,and_2_1);
endmodule