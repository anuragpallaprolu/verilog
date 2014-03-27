module fil_tb;

reg clock, in;
wire out,w0;

initial begin
	$dumpfile("fil_tb.vcd");
	$dumpvars(1,fil_tb);
	clock = 0;
	in=1;
	#10 in = 0;
        #12 in = 1;
        #18 in = 0;
	#20 in= 0;
	#25 in= 1;
	#26 in=0;
	#30 in=1;
	#37 in=0;
        #40 $finish;
end

always
	begin #3 clock = !clock;
end

fil f0(.in(in),.out(out),.w0(w0),.clk(clock));

endmodule
