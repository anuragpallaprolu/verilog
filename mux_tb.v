module mux_tb;

reg[1:0] slc;
reg[3:0] d;
wire q;

initial begin 
	$dumpfile("mux_tb.vcd");
	$dumpvars(1,mux_tb);
	$monitor("slc=%b, d=%b, q=%b", slc, d, q);
	d[0]=0;d[1]=1;d[2]=0;d[3]=0;
	#10 slc=1;
	#15 slc=0;
	#20 slc=0;
	#25 slc=1;
	#40 slc=0;
	#45 $finish;
end

mux m0(.select(slc), .d(d), .q(q));

endmodule
