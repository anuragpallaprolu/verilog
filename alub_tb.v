module tb;
	alub_tb test();
	
	initial begin
		$dumpfile("alubtest.vcd");
		$dumpvars(0, test);
	end
endmodule

module alub_tb;
	reg x,y;
	reg cin;
	reg[1:0] op;
	wire result;
	wire cout;
	block b0(.in1(x),.in2(y),.carryin(cin),.control(op),.result(result),.carryout(cout));
	
	initial begin
		x = 1;y=0;
		#10 cin=0; op[0]=0; op[1]=0;
                #20 cin=0; op[0]=0; op[1]=1;
                #30 cin=0; op[0]=1; op[1]=1;
                #40 $finish;
        end
endmodule

