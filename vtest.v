module binaryToESeg;
wire eSeg, p1, p2, p3, p4;
reg A,B,C,D;
nand #1
	g1(p1, C,~D),
	g2 (p2, A, B),
	g3 (p3, ~B, ~D),
	g4 (p4, A, C),
	g5 (eSeg, p1, p2, p3, p4);
endmodule

