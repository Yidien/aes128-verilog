module g(out, in, iflag);
   output reg [31:0] out; 
   input [31:0]      in;
   input [3:0] 	     iflag;

   wire 	     Sflag;
   wire [31:0]      outTmp;
   
   assign 
     Sflag = 'B0;
   
   byte2S
     A(.out(outTmp[31:24]), .in(in[23:16]), .flag(Sflag)),
     B(.out(outTmp[23:16]), .in(in[15: 8]), .flag(Sflag)),
     C(.out(outTmp[15: 8]), .in(in[ 7: 0]), .flag(Sflag)),
     D(.out(outTmp[ 7: 0]), .in(in[31:24]), .flag(Sflag));
   
   always
     @(outTmp)
     begin
	case (iflag)
	  'H1: out[31:24] = outTmp[31:24] ^ 'H01;
	  'H2: out[31:24] = outTmp[31:24] ^ 'H02;
	  'H3: out[31:24] = outTmp[31:24] ^ 'H04;
	  'H4: out[31:24] = outTmp[31:24] ^ 'H08;
	  'H5: out[31:24] = outTmp[31:24] ^ 'H10;
	  'H6: out[31:24] = outTmp[31:24] ^ 'H20;
	  'H7: out[31:24] = outTmp[31:24] ^ 'H40;
	  'H8: out[31:24] = outTmp[31:24] ^ 'H80;
	  'H9: out[31:24] = outTmp[31:24] ^ 'H1B;
	  'HA: out[31:24] = outTmp[31:24] ^ 'H36;
	endcase // case (flag)

	out[23:0] = outTmp[23:0];
     end // always

endmodule // g

	  
      
