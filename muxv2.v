//Updated multiplexer non gate level design. 
//Lynch Semiconductor Corp.
module muxv2(in1, in2, select, out);
        input in1;
        input in2;
        input[0:0] select;
        output reg out;

        always@(in1 or in2 or select)
        begin
                if(select==0) out=in1;
                else if(select==1) out=in2;
        end
endmodule

