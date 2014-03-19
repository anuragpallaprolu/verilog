//Lynch Semiconductor Research Corporation
//2014. Full 4bit multiplier library
//Gate Level Design of FA. LSC2014
module fa(a,b,cin,sum,cout);
        input a,b,cin;
        output sum, cout;

        assign sum = cin ^ a ^ b;
        assign cout = ~cin & a & b| cin & (a|b);
//assigns the carryout and sum bits. Next step is to develop a ripple carry procedure.
endmodule

module blk(sin,x,y,cin,cout,sout);
	input sin, x, y, cin;
	output cout, sout;
	wire w;
	assign w = x & y;
	
	fa f1(.a(sin),.b(w),.cin(cin),.cout(cout),.sum(sout));
endmodule

module mult(a,b,p);
	input[3:0] a;
	input[3:0] b;
	
	output[7:0] p;
	//We would be using 16 full adder blocks. First sim would be a full fledged split design
	//second sim would be a loopback design
	wire[12:0] cin;
	wire[8:0] sum;
	blk a3b0(.	
	

