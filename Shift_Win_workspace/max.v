module b2eseg(eseg,a,b,c,d);
	output eseg;
	input a,b,c,d;

	nand #1
		g1(p1,c,~d),
			g2(p2,a,b),
			g3(p3,~b,~d),
			g4(p4,a,c),
			g5(eseg,p1,p2,p3,p4);
		endmodule


