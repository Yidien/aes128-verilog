module rotateTst;
   reg [127:0] in;
   wire [127:0] out;

   rotate
     A(.out(out), .in(in));

   initial
     begin
	in = 'H0123456789ABCDEF0123456789ABCDEF;
	#20 $display("%h %h %h %h", out[127:120], out[119:112], out[111:104], out[103: 96]);
	$display("%h %h %h %h", out[ 95: 88], out[ 87: 80], out[ 79: 72], out[ 71: 64]);
	$display("%h %h %h %h", out[ 63: 56], out[ 55: 48], out[ 47: 40], out[ 39: 32]);
	$display("%h %h %h %h", out[ 31: 24], out[ 23: 16], out[ 15:  8], out[  7:  0]);
	$display("%h %h %h %h", out[127:120], out[119:112], out[111:104], out[103: 96]);
	$display("%h %h %h %h", out[ 95: 88], out[ 87: 80], out[ 79: 72], out[ 71: 64]);
	$display("%h %h %h %h", out[ 63: 56], out[ 55: 48], out[ 47: 40], out[ 39: 32]);
	$display("%h %h %h %h", out[ 31: 24], out[ 23: 16], out[ 15:  8], out[  7:  0]);
	$display("%h %h %h %h", out[127:120], out[119:112], out[111:104], out[103: 96]);
	$display("%h %h %h %h", out[ 95: 88], out[ 87: 80], out[ 79: 72], out[ 71: 64]);
	$display("%h %h %h %h", out[ 63: 56], out[ 55: 48], out[ 47: 40], out[ 39: 32]);
	$display("%h %h %h %h", out[ 31: 24], out[ 23: 16], out[ 15:  8], out[  7:  0]);
	$display("%h %h %h %h", out[127:120], out[119:112], out[111:104], out[103: 96]);
	$display("%h %h %h %h", out[ 95: 88], out[ 87: 80], out[ 79: 72], out[ 71: 64]);
	$display("%h %h %h %h", out[ 63: 56], out[ 55: 48], out[ 47: 40], out[ 39: 32]);
	$display("%h %h %h %h", out[ 31: 24], out[ 23: 16], out[ 15:  8], out[  7:  0]);
	$display("%h %h %h %h", in[127:120], in[119:112], in[111:104], in[103: 96]);
	$display("%h %h %h %h", in[ 95: 88], in[ 87: 80], in[ 79: 72], in[ 71: 64]);
	$display("%h %h %h %h", in[ 63: 56], in[ 55: 48], in[ 47: 40], in[ 39: 32]);
	$display("%h %h %h %h", in[ 31: 24], in[ 23: 16], in[ 15:  8], in[  7:  0]);
	$display("%h %h %h %h", in[127:120], in[119:112], in[111:104], in[103: 96]);
	$display("%h %h %h %h", in[ 95: 88], in[ 87: 80], in[ 79: 72], in[ 71: 64]);
	$display("%h %h %h %h", in[ 63: 56], in[ 55: 48], in[ 47: 40], in[ 39: 32]);
	$display("%h %h %h %h", in[ 31: 24], in[ 23: 16], in[ 15:  8], in[  7:  0]);
	$display("%h %h %h %h", in[127:120], in[119:112], in[111:104], in[103: 96]);
	$display("%h %h %h %h", in[ 95: 88], in[ 87: 80], in[ 79: 72], in[ 71: 64]);
	$display("%h %h %h %h", in[ 63: 56], in[ 55: 48], in[ 47: 40], in[ 39: 32]);
	$display("%h %h %h %h", in[ 31: 24], in[ 23: 16], in[ 15:  8], in[  7:  0]);
	$display("%h %h %h %h", in[127:120], in[119:112], in[111:104], in[103: 96]);
	$display("%h %h %h %h", in[ 95: 88], in[ 87: 80], in[ 79: 72], in[ 71: 64]);
	$display("%h %h %h %h", in[ 63: 56], in[ 55: 48], in[ 47: 40], in[ 39: 32]);
	$display("%h %h %h %h", in[ 31: 24], in[ 23: 16], in[ 15:  8], in[  7:  0]);
     end // initial begin

endmodule // rotateTst
