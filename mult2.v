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

//INTERCONNECT DESIGN FOR A COMBINATORIAL FPGA BASED MULTIPLIER
//Lynch Semiconductor Corp. 2014
//Designed and fab tested at Inanimate Silicorp PCB 

module mult(a,b,s);
	input[3:0] a;
	input[3:0] b;
	output[7:0] s;
	
	wire[14:0] w;
	wire[10:0] c;
	wire[6:0] i;
	assign s[0] = (a[0]&b[0]);
	assign w[0] = (b[0]&a[1]);
	assign w[1] = a[0]&b[1];
	assign w[2] = a[0]&b[2];
	assign w[3] = a[1]&b[1];
	assign w[4] = a[2]&b[0];
	assign w[5] = a[0]&b[3];
	assign w[6] = a[1]&b[2];
	assign w[7] = a[2]&b[1];
	assign w[8] = a[3]&b[0];
	assign w[9] = a[1]&b[3];
	assign w[10] = a[2]&b[2];
	assign w[11] = a[3]&b[1];
	assign w[12] = a[2]&b[3];
	assign w[13] = a[3]&b[2];
	assign w[14] = a[3]&b[3];
	
	ha h1(.a(w[0]),.b(w[1]),.sum(s[1]),.carry(c[0]));
	ha h2(.a(w[2]),.b(w[3]),.sum(i[0]),.carry(c[1]));
	fa f1(.a(i[0]),.b(w[4]),.cin(c[0]),.sum(s[2]),.cout(c[2]));
	ha h3(.a(w[5]),.b(w[6]),.sum(i[1]),.carry(c[3]));
	fa f2(.a(w[7]),.b(i[1]),.cin(c[1]),.sum(i[2]),.cout(c[4]));
	fa f3(.a(i[2]),.b(w[8]),.cin(c[2]),.sum(s[3]),.cout(c[5]));
	fa f4(.a(w[9]),.b(w[10]),.cin(c[3]),.sum(i[3]),.cout(c[6]));
	fa f5(.a(w[11]),.b(i[3]),.cin(c[4]),.sum(i[4]),.cout(c[7]));
	ha h4(.a(i[4]),.b(c[5]),.sum(s[4]),.carry(c[8]));
	fa f6(.a(w[12]),.b(w[13]),.cin(c[6]),.sum(i[5]),.cout(c[9]));
	fa f7(.a(c[7]),.b(i[5]),.cin(c[8]),.sum(s[5]),.cout(c[10]));
	fa f8(.a(w[14]),.b(c[9]),.cin(c[10]),.sum(s[6]),.cout(s[7]));
	

endmodule

