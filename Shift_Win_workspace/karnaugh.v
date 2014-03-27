module kmap(a,b,c,d,eseg); 
	output reg eseg; 
	input a,b,c,d;
	//initial begin
	 //$monitor("%b %b %b %b %b", a,b,c,d,eseg);

	always @(a,b,c,d) begin	
		eseg=1;
	//	 $monitor("%b %b %b %b %b", a,b,c,d,eseg);

		if(~a&d)
			eseg=0;
	//		 $monitor("%b %b %b %b %b", a,b,c,d,eseg);

		if(~a&b&~c)
			eseg=0;
		if(~b&~c&d)
			eseg=0;
	end
	initial begin
 
	$dumpfile("dump.vcd");
	$dumpvars(0,kmap);
	end
		
	


endmodule
