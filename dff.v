//-----------------------------------------------------
// Design Name : dff
// File Name   : dff.v
// Function    : D flip-flop async set reset
// Coder       : Enrique J. Torres
//-----------------------------------------------------
module dff (
data  , // Data Input
clk    , // Clock Input
set ,	// Set input
reset , // Reset input 
q ,		// Q output
notq    // notQ output
);
//-----------Input Ports---------------
input data, clk, reset, set ; 

//-----------Output Ports---------------
output q, notq;

//------------Internal Variables--------
reg q, notq;

//-------------Code Starts Here---------
always @ ( posedge clk or posedge reset or posedge set)
if (reset) begin
  q <= 1'b0;
  notq <= 1'b1;
end  else if (set) begin
  q <= 1'b1;
  notq <= 1'b0;
end else begin
  q <= data;
  notq <= ~data;
end

endmodule //End Of Module dff