module dff(b,clk,q,q_0);
	input b, clk;
	output q,q_0;
	reg q;
	reg q_0;
	
	always@(posedge clk)
	begin
		q <= b;
		q_0 <= !b;
	end
endmodule
