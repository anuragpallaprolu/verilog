//4 BIT ARITHMETIC LOGIC UNIT WITH FULL MULTIPLEXER SUPPORT
//MANUFACTURED BY LYNCH SEMICONDUCTORS

//one bit mux design

module mux(in1, in2, in3, select, out);
	input in1;
        input in2;
	input in3;
        input[1:0] select;
        output reg out;

        always@(in1 or in2 or select)
        begin
                if(select==2'b00) out=in1;
                else if(select==2'b01) out=in2;
		else if(select==2'b10) out=in3;
        end
endmodule

//Gate Level Design of FA. LSC2014
module fa(a,b,cin,sum,cout);
        input a,b,cin;
        output sum, cout;

        assign sum = cin ^ a ^ b;
        assign cout = ~cin & a & b| cin & (a|b);
//assigns the carryout and sum bits. Next step is to develop a ripple carry procedure.
endmodule


//ALU 1 BIT BLOCK
//DESIGNED AND TESTED AT LYNCH SEMICONDUCTORS, RAJASTHAN.

module block(in1, in2, carryin, control, result, carryout);
	input in1,in2,carryin;
	input[1:0] control;
	output result, carryout;
	
	wire w0,w1,w2;
	assign w0 = in1&in2;
	assign w1 = in|in2;
	fa f0(.a(in1),.b(in2),.cin(carryout),.sum(w2),.cout(carryout));
	mux m0(.in1(w0),.in2(w1),.in3(w2),.select(control),.out(result));
endmodule

module alu(a,b,cin,op,cout,res);
	input[3:0] a,b;
	input[1:0] op;
	input cin;
	output[3:0] res;
	output cout;
	wire w0,w1,w2,w3,w4;
	block b0(.in1(a[0]),.in2(b[0]),.carryin(cin),.carryout(w0),.control(op),.result(res[0]));
	block b1(.in1(a[1]),.in2(b[1]),.carryin(w0),.carryout(w1),.control(op),.result(res[1]));
	block b2(.in1(a[2]),.in2(b[2]),.carryin(w1),.carryout(w2),.control(op),.result(res[2]));
	block b3(.in1(a[3]),.in2(b[3]),.carryin(w2),.carryout(cout),.control(op),.result(res[3]));
endmodule	
	
	
