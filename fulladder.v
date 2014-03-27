//Gate Level Design of FA. LSC2014
module fa(a,b,cin,sum,cout);
	input a,b,cin;
	output sum, cout;
	
	assign sum = cin ^ a ^ b;
	assign cout = ~cin & a & b| cin & (a|b);
//assigns the carryout and sum bits. Next step is to develop a ripple carry procedure.
endmodule

module adder_bit(x,y,cin,z,cout);
	//x,y are inputs. x+y=z. cin is the carry in
	//cout is the carry out
	//n is the bit vector size
	parameter n = 4;
	input[n-1:0] x,y;
	input cin;
	output[n-1:0] z;
	output cout;
	wire[n-1:0] carry_in; //interconnect carry bit. temp.
	wire[n-1:0] carry_out;//interconnect carry out bit. temp
	assign carry_in[0] = cin;//initial carry in
	assign cout = carry_out[n-1];//finaly carry out
	assign carry_in[n-1:1] = carry_out[n-2:0]; //interconnect relation
	fa full_Adder[n-1:0] (x,y,carry_in,x,carry_out);
endmodule

//(C) Lynch-eNVY Microcorp. 2014.
//(C) University of Waterloo

	

