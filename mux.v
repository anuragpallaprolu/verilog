//Multiplexer Module
//Electrosofts Corp. and Lynch-eNVY Microcorp. 2014
//Free to share. Free to modify.
//Dcoumented by Lynch-eNVY Corp.
module mux(select,d,q);
	input[1:0] select; //Select wire
	input[3:0] d; //array of select choices
	output q;//out
	
	wire q;
	wire[1:0] select;
	wire[3:0] d;
	assign q = d[select];//give the user what he needs!
endmodule
