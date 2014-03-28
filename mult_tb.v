module mtest;
	mult_tb test();
	initial begin 
		$dumpfile("test.vcd");
		$dumpvars(0,test);
	end
endmodule

module mult_tb;
	reg[3:0] a, y;
	reg[7:0] s;
	
	mult m0(a,b,s);
	
	initial begin
		a=0;b=0;
		#10 a=4'b1010; b=4'b0001;
		#10 a=4'b1011; b=4'b0100;
		#10 a=0; b=4'b1001;
		#10 $finish;
	end

endmodule

