module controlTst;
   wire [127:0] out, in, k, outUn;

   assign
     in = 'H0123456789abcdeffedcba9876543210,
     k  = 'H0f1571c947d9e8590cb7add6af7f6798;

   aes128
     main(.out(out), .in(in), .k(k));

   aes128_1
     main_1(.out(outUn), .in(out), .k(k));
   
   initial
     begin
	#100 $display("in = \n%h", in);
	$display("k  = \n%h", k);
	$display("out = \n%h", out);
	$display("outUn = \n%h", outUn);
	
     end
endmodule // controlTst
