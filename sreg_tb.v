module sreg_tb;

reg clock, reset, b;
wire q, q_0;

initial begin
	$dumpfile("sreg_tb.vcd");
	$dumpvars(1,sreg_tb);
	$monitor("clk=%b, d=%b, q=%b, q_0=%b", clock, b, q, q_0);
	clock = 0;
	b = 1;
        #10 b = 0;
        #12 b = 1;
        #18 b = 0;
        #20 $finish;
end

always
	begin #5 clock = !clock;
end

sreg s0(.b(b), .clock(clock), .q4(q), .q0_4(q_0));

endmodule
