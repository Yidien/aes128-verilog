module rotate(out, in);
   output [127:0] out;
   input [127:0]  in;

   assign
	out[127:120] = in[127:120],
	out[119:112] = in[ 95: 88],
	out[111:104] = in[ 63: 56],
	out[103: 96] = in[ 31: 24],
	out[ 95: 88] = in[119:112],
	out[ 87: 80] = in[ 87: 80],
	out[ 79: 72] = in[ 55: 48],
	out[ 71: 64] = in[ 23: 16],
	out[ 63: 56] = in[111:104],
	out[ 55: 48] = in[ 79: 72],
	out[ 47: 40] = in[ 47: 40],
	out[ 39: 32] = in[ 15:  8],
	out[ 31: 24] = in[103: 96],
	out[ 23: 16] = in[ 71: 64],
	out[ 15:  8] = in[ 39: 32],
     out[  7:  0] = in[  7:  0];
   
endmodule
