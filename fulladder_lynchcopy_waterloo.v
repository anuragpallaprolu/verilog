module full_adder(a,b,cin,sum,cout);
	input a, b, cin;
	output sum, cout;

	assign sum = cin ^ a ^ b; // cin XOR a XOR b
	assign cout = ~cin & a & b | cin & (a | b); // cin'ab + cin(a + b)
endmodule // note no semicolon

module adder_4_bit(x,y,cin,z,cout); //z=x+y
	input [3:0] x, y; // x and y are 4-bit inputs
	input cin;
	output [3:0] z;
	output cout;
	wire [3:1] carry; // used for internal carries between FA's

	// 4 1-bit full adder instances
	// - note how carry propagates between FA's
	// - the labels fa0,fa1,fa2,fa3 are optional
	full_adder fa0(x[0],y[0],cin,z[0],carry[1]);
	full_adder fa1(x[1],y[1],carry[1],z[1],carry[2]);
	full_adder fa2(x[2],y[2],carry[2],z[2],carry[3]);
	full_adder fa3(x[3],y[3],carry[3],z[3],cout);
endmodule

// the following is a generic adder that can be instantiated for 4 bits, or
// 8 bits or whatever you need
module adder_n_bit(x,y,cin,z,cout); //z=x+y
	parameter n=4; // default is 4 but can be overridden when instantiated
	input [n-1:0] x, y;
	input cin;
	output [n-1:0] z;
	output cout;
	wire [n-1:0] carry_in; // used for internal carries between FA's
	wire [n-1:0] carry_out; // used for internal carries between FA's

	assign carry_in[0] = cin;
	assign cout = carry_out[n-1];
	assign carry_in[n-1:1] = carry_out[n-2:0]; // connect cout's to cin's
	// n-bit arry of 1-bit full adders
	full_adder fa[n-1:0] (x,y,carry_in,z,carry_out);

	// generate loops were added to the Verilog-2001 standard which are
	// more powerful than arrays of instances but aren't supported yet in
	// iverilog
endmodule
