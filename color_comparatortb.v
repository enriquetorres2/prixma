// -----------------------------------------------------------------
// -- Design Name : color_comptb
// -- File Name   : color_comparatortb.v
// -- Function    : Color Comparator Module Test Bench
// -- Coder       : Enrique J. Torres Rivera
// -----------------------------------------------------------------
`include "color_comparator.v"

module color_comparatortb;
	wire red,green,blue,purple,yellow;
	reg [7:0] r_signal,g_signal,b_signal,r1_code,g1_code,b1_code,r2_code,g2_code,b2_code;

	color_comp COMP (red,green,blue,purple,yellow,
		r_signal,g_signal,b_signal,r1_code,g1_code,b1_code,r2_code,g2_code,b2_code);

	initial begin
		r1_code = 8'h96;
		g1_code = 8'h32;
		b1_code = 8'h32;
		r2_code = 8'h32;
		g2_code = 8'h96;
		b2_code = 8'h96;

		r_signal = 0;
		g_signal = 0;
		b_signal = 0;

		//RED TEST 1
		#5 r_signal = 8'h97;
		$display("RED TEST 1");
		#5 $display("Red = %d Green = %d Blue = %d, Purple = %d, Yellow = %d",red,green,blue,purple,yellow);

		//GREEN TEST 1
		#5 r_signal = 0;
		g_signal = 8'h97;
		$display("GREEN TEST 1");
		#5 $display("Red = %d Green = %d Blue = %d, Purple = %d, Yellow = %d",red,green,blue,purple,yellow);

		//BLUE TEST 1
		#5 r_signal = 0;
		g_signal = 0;
		b_signal = 8'h97;
		$display("BLUE TEST 1");
		#5 $display("Red = %d Green = %d Blue = %d, Purple = %d, Yellow = %d",red,green,blue,purple,yellow);

		//PURPLE TEST 1
		#5 r_signal = 8'h33;
		g_signal = 0;
		b_signal = 8'h97;
		$display("PURPLE TEST 1");
		#5 $display("Red = %d Green = %d Blue = %d, Purple = %d, Yellow = %d",red,green,blue,purple,yellow);

		//YELLOW TEST 1
		#5 r_signal = 8'h97;
		g_signal = 8'h97;
		b_signal = 0;
		$display("YELLOW TEST 1");
		#5 $display("Red = %d Green = %d Blue = %d, Purple = %d, Yellow = %d",red,green,blue,purple,yellow);



		//RED TEST 2
		#5 r_signal = 8'h96;
		g_signal = 0;
		b_signal = 0;
		$display("RED TEST 2 (NO RED)");
		#5 $display("Red = %d Green = %d Blue = %d, Purple = %d, Yellow = %d",red,green,blue,purple,yellow);

		//GREEN TEST 2
		#5 r_signal = 0;
		g_signal = 8'h96;
		b_signal = 0;
		$display("GREEN TEST 2 (NO GREEN)");
		#5 $display("Red = %d Green = %d Blue = %d, Purple = %d, Yellow = %d",red,green,blue,purple,yellow);

		//BLUE TEST 2
		#5 r_signal = 0;
		g_signal = 0;
		b_signal = 8'h96;
		$display("BLUE TEST 2 (NO BLUE)");
		#5 $display("Red = %d Green = %d Blue = %d, Purple = %d, Yellow = %d",red,green,blue,purple,yellow);

		//PURPLE TEST 2
		#5 r_signal = 8'h33;
		g_signal = 0;
		b_signal = 8'h96;
		$display("PURPLE TEST 2 (NO PURPLE)");
		#5 $display("Red = %d Green = %d Blue = %d, Purple = %d, Yellow = %d",red,green,blue,purple,yellow);

		//YELLOW TEST 2
		#5 r_signal = 8'h96;
		g_signal = 8'h96;
		b_signal = 0;
		$display("YELLOW TEST 2 (NO YELLOW)");
		#5 $display("Red = %d Green = %d Blue = %d, Purple = %d, Yellow = %d",red,green,blue,purple,yellow);

		//WHITE TEST
		#5 r_signal = 8'hFF;
		g_signal = 8'hFF;
		b_signal = 8'hFF;
		$display("WHITE");
		#5 $display("Red = %d Green = %d Blue = %d, Purple = %d, Yellow = %d",red,green,blue,purple,yellow);

		//BLACK TEST
		#5 r_signal = 0;
		g_signal = 0;
		b_signal = 0;
		$display("BLACK");
		#5 $display("Red = %d Green = %d Blue = %d, Purple = %d, Yellow = %d",red,green,blue,purple,yellow);

		//ORANGE TEST
		#5 r_signal = 8'hFF;
		g_signal = 8'h7F;
		b_signal = 0;
		$display("ORANGE");
		#5 $display("Red = %d Green = %d Blue = %d, Purple = %d, Yellow = %d",red,green,blue,purple,yellow);
	end
endmodule