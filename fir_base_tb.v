module tst;
	// Inputs
	reg clk;
	reg rst;
	reg [7:0] x;

// Outputs
	wire [9:0] dataout;

// Instantiate the Unit Under Test (UUT)
	filterfir uut (
	.clk(clk), 
	.rst(rst), 
	.x(x), 
	.dataout(dataout)
	);	

	initial begin
// Initialize Inputs
	$dumpfile("test_new.vcd");
        $dumpvars(0,tst);
	clk = 0;
	rst = 0;
	x = 0;
	#100;

	rst = 1;
	#100;

	rst = 0;
	x = 8'd5;
	#100;
	x = 8'd10;
	#100;
	x = 8'd12;
	#100;
	x = 8'd15;
	#100;
	x = 8'd16;
	#100;
end
always begin #50 clk=~clk; end 
endmodule
