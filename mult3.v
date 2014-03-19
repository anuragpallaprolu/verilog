//Gate Level Design of FA. LSC2014
module fa(a,b,cin,sum,cout);
        input a,b,cin;
        output sum, cout;

        assign sum = cin ^ a ^ b;
        assign cout = ~cin & a & b| cin & (a|b);
//assigns the carryout and sum bits. Next step is to develop a ripple carry procedure.
endmodule

//Half Adder

module ha(a,b,sum,carry);
        input a,b;
        output sum,carry;

        assign sum = (a&(~b))|((~a)&(b));
        assign carry = a&b;
endmodule

module m2b(a0,b0,a1,b1,c0,c1,c2,c3);
	input a0,a1,b0,b1;
	output c0,c1,c2,c3;
	wire w1,w2,w3,w4,w5;
	assign c0 = a0&b0;
	assign w1 = a0&b1;
	assign w2 = a1&b0;
	assign w3 = a1&b1;
	ha f1(.a(w1),.b(w2),.sum(c1),.carry(w4));
	ha f2(.a(w4),.b(w3),.sum(c2),.carry(c3));

endmodule

