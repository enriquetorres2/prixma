// -----------------------------------------------------------------
// -- Design Name : contollertb
// -- File Name   : contollertb.v
// -- Function    : Controller Test Bench
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
`include "controller.v"

module contollertb;
	wire stop_motor,front_motor,turn_left,turn_right,rotate;
	reg cd,red,green,blue,purple,yellow,done,clk,rst;

	controller ct (stop_motor,front_motor,turn_left,turn_right,rotate,
		cd,red,green,blue,purple,yellow,done,clk,rst);

	initial begin
		rst = 0;
		clk = 0;
		cd = 0;
		red = 0;
		green = 0;
		blue = 0;
		purple = 0;
		yellow = 0;
		done = 1;
		#5 rst = 1;
		#5 rst = 0;
	end
	initial begin
		repeat (1000) #5 clk = ~clk;
	end
	initial begin
		$monitor("time = %d\nstop_motor = %d\nfront_motor = %d\nturn_left = %d\nturn_right = %d\nrotate = %d\n",$time,stop_motor,front_motor,turn_left,turn_right,rotate);
	end

	initial begin
		//RED Tester
		#20 cd = 1;
		red = 1;
		done = 0;
		#20 cd = 0;
		done = 1;

		//GREEN Tester
		red = 0;
		#10 cd = 1;
		green = 1;
		done = 0;
		#20 cd = 0;
		done = 1;

		//BLUE Tester
		green = 0;
		#20 cd = 1;
		blue = 1;
		done = 0;
		#20 cd = 0;
		done = 1;

		//PURPLE Tester
		blue = 0;
		#20 cd = 1;
		purple = 1;
		done = 0;
		#20 cd = 0;
		done = 1;

		//YELLOW Tester
		purple = 0;
		#20 cd = 1;
		yellow = 1;
		done = 0;
		#20 cd = 0;
		done = 1;
	end
endmodule