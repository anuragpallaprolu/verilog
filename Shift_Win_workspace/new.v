module b2eseg;
	wire eseg,p1,p2,p3,p4;
	reg a,b,c,d;

	nand #1
		g1(p1,c,~d),
			g2(p2,a,b),
			g3(p3,~b,~d),
			g4(p4,a,c),
			g5(eseg,p1,p2,p3,p4);

	initial
		begin
			$monitor($time,,
				"A=%b B=%b C=%b D=%b, eseg=%b", a,b,c,d,eseg);
			#10 a=0;b=0;c=0;d=0;
			#10 d=1;
			#10 c=1;d=0;
			#10 $finish;
		end
endmodule
