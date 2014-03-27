module ideal_dac(in,out);
 input [0:dac_size-1] in;
 output out;
 voltage in,out;
 parameter real dac_size = 2 from (1:inf);
 parameter vth = 2.5;
 parameter real trise = 0 from [0:inf);
 parameter real tfall = 0 from [0:inf);

 real code;
 integer pow2 [0:dac_size];

 analog
 begin
   @(initial_step)
     for (i=0;i<=dac_size;i=i+1) pow2[i] = pow(2,i);

   code = 0;
   for (i=0;i<dac_size;i=i+1)
     code = code + (V(in[i]) > vth) ? pow2[i] : 0;
   V(out) <+ transition(code/pow2[dac_size],0,trise,tfall);
 end
endmodule
