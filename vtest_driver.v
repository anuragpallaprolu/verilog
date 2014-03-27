module btoe;
	wire eSeg,p1,p2,p3,p4;
	reg A,B,C,D;
	//initial begin
	//$dumpfile("vtsim.vcd");
	//$dumpvars(0,btoe);	
	nand #1
		g1(p1,C,~D),
		g2 (p2, A, B),
		g3 (p3, ~B, ~D),
		g4 (p4, A, C),
		g5 (eSeg, p1, p2, p3, p4);
//Driver setup
initial
	begin
	$dumpfile("vtsimd1.vcd");
	$dumpvars(0,btoe);
// two slashes introduce a single line comment
	$monitor ($time,,,
		"A = %b B = %b C = %b D = %b, eSeg = %b",
		A,B,C,D, eSeg);
		//waveform for simulating the binaryToESeg driver
		#10 A = 0; B = 0; C = 0; D = 0;
		#10 D = 1;
		#10 C = 1; D = 0;
		#10 $finish;
	end
endmodule
//end driver
