module kExtendTst;
   wire [1407:0] out;
   reg [127:0] 	 in;

   kExtend
     kE(.out(out), .in(in));
   
   
   initial
     begin
	in = 'H0f1571c947d9e8590cb7add6af7f6798;
	
	#100 $display("%h", out[ 127:  96]);
	$display("%h", out[  95:  64]);
	$display("%h", out[  63:  32]);
	$display("%h", out[  31:   0]);
	$display("%h", out[ 255: 224]);
	$display("%h", out[ 223: 192]);
	$display("%h", out[ 191: 160]);
	$display("%h", out[ 159: 128]);
	$display("%h", out[ 383: 352]);
	$display("%h", out[ 351: 320]);
	$display("%h", out[ 319: 288]);
	$display("%h", out[ 287: 256]);
	$display("%h", out[ 511: 480]);
	$display("%h", out[ 479: 448]);
	$display("%h", out[ 447: 416]);
	$display("%h", out[ 415: 384]);
	$display("%h", out[ 639: 608]);
	$display("%h", out[ 607: 576]);
	$display("%h", out[ 575: 544]);
	$display("%h", out[ 543: 512]);
	$display("%h", out[ 767: 736]);
	$display("%h", out[ 735: 704]);
	$display("%h", out[ 703: 672]);
	$display("%h", out[ 671: 640]);
	$display("%h", out[ 895: 864]);
	$display("%h", out[ 863: 832]);
	$display("%h", out[ 831: 800]);
	$display("%h", out[ 799: 768]);
	$display("%h", out[1023: 992]);
	$display("%h", out[ 991: 960]);
	$display("%h", out[ 959: 928]);
	$display("%h", out[ 927: 896]);
	$display("%h", out[1151:1120]);
	$display("%h", out[1119:1088]);
	$display("%h", out[1087:1056]);
	$display("%h", out[1055:1024]);
	$display("%h", out[1279:1248]);
	$display("%h", out[1247:1216]);
	$display("%h", out[1215:1184]);
	$display("%h", out[1183:1152]);
	$display("%h", out[1407:1376]);
	$display("%h", out[1375:1344]);
	$display("%h", out[1343:1312]);
	$display("%h", out[1311:1280]);
     end // initial begin
endmodule // kExtendTst
