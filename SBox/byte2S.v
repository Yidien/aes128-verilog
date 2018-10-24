module byte2S(out, in, flag);
   input  flag;
   input  [7:0] in;
   output reg[7:0] out;
   reg [7:0] mem[255:0];

   always
   @(flag)  
   if (flag == 'B0)
      $readmemh("../SBox/S_dat.txt", mem);
   else
     $readmemh("../SBox/S-1_dat.txt", mem);
   

   always 
   @(in)
      out = mem[in];

endmodule // byte2S

module byte2S127(out, in, flag);
   output [127:0] out;
   input [127:0]  in;
   input 	  flag;

   byte2S
     S1(.out(out[  7:  0]), .in(in[  7:  0]), .flag(flag)),
     S2(.out(out[ 15:  8]), .in(in[ 15:  8]), .flag(flag)),
     S3(.out(out[ 23: 16]), .in(in[ 23: 16]), .flag(flag)),
     S4(.out(out[ 31: 24]), .in(in[ 31: 24]), .flag(flag)),
     S5(.out(out[ 39: 32]), .in(in[ 39: 32]), .flag(flag)),
     S6(.out(out[ 47: 40]), .in(in[ 47: 40]), .flag(flag)),
     S7(.out(out[ 55: 48]), .in(in[ 55: 48]), .flag(flag)),
     S8(.out(out[ 63: 56]), .in(in[ 63: 56]), .flag(flag)),
     S9(.out(out[ 71: 64]), .in(in[ 71: 64]), .flag(flag)),
     S10(.out(out[ 79: 72]), .in(in[ 79: 72]), .flag(flag)),
     S11(.out(out[ 87: 80]), .in(in[ 87: 80]), .flag(flag)),
     S12(.out(out[ 95: 88]), .in(in[ 95: 88]), .flag(flag)),
     S13(.out(out[103: 96]), .in(in[103: 96]), .flag(flag)),
     S14(.out(out[111:104]), .in(in[111:104]), .flag(flag)),
     S15(.out(out[119:112]), .in(in[119:112]), .flag(flag)),
     S16(.out(out[127:120]), .in(in[127:120]), .flag(flag));

endmodule // byte2S127

