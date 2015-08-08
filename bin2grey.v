module bin2grey_5bit (
	input [4:0] bin,
	output [4:0] grey
);
	localparam BITS = 5;

	function [BITS-1:0] b2g(input [BITS-1:0] in);
		integer i;
		reg [BITS:0] temp;
		begin
			temp = in;
			for(i=0;i<BITS;i=i+1)
				b2g[i] = ^temp[ i +: 2];
		end
	endfunction

	assign grey = b2g(bin);
endmodule