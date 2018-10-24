module gTst();
   wire [31:0] out;
   reg [31:0]  in;
   reg [3:0]   flag;
   wire [7:0]  outS;
   reg [7:0]   inS;
   reg 	       flagS;
   
   g
     A(.out(out), .in(in), .iflag(flag));

//   byte2S(.out(outS), .in(inS), .flag(flagS));
   
   
   initial
     begin
	flag = 'D2;
	in = 'H388115a7;
	#100 $display("%h", out);
     end
endmodule // gTst
