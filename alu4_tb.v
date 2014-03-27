module testbed;
	alu4_tb test();
	
	initial begin
		$dumpfile("alutest.vcd");
		$dumpvars(0, test);
	end
endmodule

module alu4_tb;
	reg[3:0] x,y;
	reg cin;
	reg[1:0] op;
	wire[3:0] result;
	wire cout;
	alu a0(.a(x),.b(y),.cin(cin),.op(op),.cout(cout),.res(result));
		
	initial begin
		x=4'b1001; y=4'b0011;
		#10 cin=0; op[0]=0; op[1]=0;
		#20 cin=0; op[0]=0; op[1]=1;
		#30 cin=0; op[0]=1; op[1]=1;
		#40 $finish;
	end
endmodule
