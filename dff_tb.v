module dff_tb;

reg clock, reset, d;
wire q, q_0;

initial begin
	$dumpfile("dff_tb.vcd");
	$dumpvars(1,dff_tb);
	$monitor("clk=%b, d=%b,q=%b,q_0=%b", clock, d, q, q_0);
	clock = 0;
	d = 1;
	#10 d = 0;
	#12 d = 1;
	#18 d = 0;
	#20 $finish;
end

always 
	begin #5 clock = !clock;
end

dff d0( .b(d), .clk(clock), .q(q), .q_0(q_0));

endmodule
