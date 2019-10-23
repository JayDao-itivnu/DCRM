/************************************************
 * 	Full Adder using Half Adder Modules	*
 * 	(Half Adder low level entity)		*
 * 	Training Source Code			*
 ************************************************/

module halfadder(Sum, CarryOut, a, b)

	input a, b;
	output CarryOut;
	output reg Sum;

	always @(a or b) begin
	if(a != b)
		Sum = 1;
	else
		Sum = 0;
	end
	
	assign CarryOut = (a&b);

endmodule
