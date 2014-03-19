module dut;
	adder_bit_tb test();
	
	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0, test);
	end
endmodule

module adder_bit_tb;
	reg [3:0] x, y;
	reg cin;
	wire [3:0] z;
	wire cout;

	adder_bit #(4) a0(x,y,cin,z,cout); //set parameter

	initial begin
		x = 0; y = 0; cin = 0;
		#10 x = 4'b0101; y = 4'b0001; cin = 1'b0; // 5+1=6=0110
		#10 x = 4'b0101; y = 4'b1110; cin = 1'b1; // 5-1=4=0100
		#10 x = 0; y = 0; cin = 0;
		#10 $finish;
	end

endmodule
