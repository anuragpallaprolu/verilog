//SynchAdd Synchronous Adder Chip
//Lynch-eNVY Microcorp. and Chakib Alaoui 
//Designed and documented by Lynch Semiconductor Corp. 

//L-Y-N-C-H 2014

//D Flip Flop LESC0012014
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

module sreg(b,clock,q5,q0_5);
        input b, clock;
        output q5, q0_5;
        //dff ff0, ff1, ff2, ff3;
        //wire w1, w2, w3, w4;
        wire q1, q2, q3, q4;
        wire q_01,q0_2, q0_3, q0_4;
        //w1 = w2 = w3 = w4 = clock;
        //always@(posedge clock)
        //begin
                dff ff0(.b(b), .clk(clock),.q(q1),.q_0(q0_1));
                dff ff1(.b(q1),.clk(clock),.q(q2),.q_0(q0_2));
                dff ff2(.b(q2),.clk(clock),.q(q3),.q_0(q0_3));
                dff ff3(.b(q3),.clk(clock),.q(q4),.q_0(q0_4));
		dff ff4(.b(q4),.clk(clock),.q(q5),.q_0(q0_5));
        //end;
endmodule

//2 bit mux with a select line
module mux(select,d,q);
        input[1:0] select; //Select wire
        input[1:0] d; //array of select choices
        output q;//out

        wire q;
        wire[1:0] select;
        wire[1:0] d;
        assign q = d[select];//give the user what he needs!
endmodule
//Updated multiplexer non gate level design. 
//Lynch Semiconductor Corp.
module muxv2(in1, in2, select, out);
	input in1;
	input in2;
	wire in1, in2;
	input[0:0] select;
	output reg out;
	
	always@(in1 or in2 or select)
	begin
		if(select==0) out=in1;
		else if(select==1) out=in2;
	end
endmodule
//Shift Register with multiple carry output and common clock functionality
//L-Y-N-C-H		
module sregcc(b0,b1,b2,b3,b4,q1,q2,q3,q4,q5,clock);
	input b0,b1,b2,b3,b4 clock;
        output q5, q0_5;
        //dff ff0, ff1, ff2, ff3;
        //wire w1, w2, w3, w4;
        wire q1, q2, q3, q4;
        wire q_01,q0_2, q0_3, q0_4;
        //w1 = w2 = w3 = w4 = clock;
        //always@(posedge clock)
        //begin
                dff ff0(.b(b), .clk(clock),.q(q1),.q_0(q0_1));
                dff ff1(.b(q1),.clk(clock),.q(q2),.q_0(q0_2));
                dff ff2(.b(q2),.clk(clock),.q(q3),.q_0(q0_3));
                dff ff3(.b(q3),.clk(clock),.q(q4),.q_0(q0_4));
                dff ff4(.b(q4),.clk(clock),.q(q5),.q_0(q0_5));
        //end;
endmodule


module syncadd(a,b,c,d,load_abc,load_d,clock);
	input[2:0] a;
	input[3:0] b;
	input[0:0] load_abc;
	input load_d;
	input clock;
	output[3:0] c;
	output[3:0] d;
	wire w0,w1,w2,w3,w4;
	wire d0,d1,d2,d3,d4;
	always@(posedge clock)
	begin
		muxv2 m0(.in1(w0),.in2(b[0]),.select(load_abc),.out(d0));
		muxv2 m1(.in1(w1),.in2(b[1]),.select(load_abc),.out(d1));
		muxv2 m2(.in1(w2),.in2(b[2]),.select(load_abc),.out(d2));
		muxv2 m3(.in1(w3),.in2(b[3]),.select(load_abc),.out(d3));
		muxv2 m4(.in1(w4),.in2(0),   .select(load_abc),.out(d4)); 
		
		
	
	
~           
