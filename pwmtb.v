`include "pwm.v"

module pwmtb;

	reg Clk,E,X,Y,reset;
	wire Out;

	PWM p(Out,Clk,E,X,Y,reset);


	initial begin
		//Initializa
		reset =0;
		Clk = 0;
		#2 Clk = ~Clk;
		reset =1;
		repeat(6) #2 Clk = ~Clk;
		//End Initialization
		repeat(16) #2 Clk = ~Clk;

	end
	initial begin
		//Starts In 14 units
		//Period Starts in 16 units
		#14 X = 0;
	end
	initial begin
		//Starts In 14 units
		//Period Starts in 16 units
		#14 Y = 0;
	end
	initial begin
		//Starts In 14 units
		//Period Starts in 16 units
		#14 E = 1;
	end
	initial begin
	    $dumpfile("test.vcd");
     	$dumpvars(0,pwmtb);
		#50 $finish;
	end
endmodule