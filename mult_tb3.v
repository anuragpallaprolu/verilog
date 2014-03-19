module mtest2;
	mult_tb test();
	initial begin
		$dumpfile("mtest.vcd");
		$dumpvars(0,mtest);
	end
endmodule

module mult_tb;
	reg a0,a1,b0,b1;
	reg c0, c1, c2, c3;
	m2b m0(a0,b0,a1,b1,c0,c1,c2,c3);
	initial begin
		a0=0;a1=0;b0=0;b1=0;
		#10 a0=1; a1=1; b0=0; b1=1;
		#10 a0=1; a1=0; b0=1; b1=1;
		#10 a0=0; a1=1; b0=0; b1=1;
		#10 $finish;
	end
endmodule
