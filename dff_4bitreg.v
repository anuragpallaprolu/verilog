module dff(b,clk,q,q_0);
	input b, clk;
	output q,q_0;
	reg q;
	reg q_0;
	
	always@(posedge clk)
	begin
		q <= b;
		q_0 <= !b;
	end
endmodule

module sreg(b,clock,q4,q0_4);
	input b, clock;
	output q4, q0_4;
	//dff ff0, ff1, ff2, ff3;
	//wire w1, w2, w3, w4;
	wire q1, q2, q3;
	wire q_01,q0_2, q0_3;
	//w1 = w2 = w3 = w4 = clock;
	//always@(posedge clock)
	//begin
		dff ff0(.b(b), .clk(clock),.q(q1),.q_0(q0_1));
		dff ff1(.b(q1),.clk(clock),.q(q2),.q_0(q0_2));
		dff ff2(.b(q2),.clk(clock),.q(q3),.q_0(q0_3));
		dff ff3(.b(q3),.clk(clock),.q(q4),.q_0(q0_4));
	//end;
endmodule


		
