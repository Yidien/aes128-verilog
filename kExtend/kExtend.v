module xor32bits(out, in1, in2);
   output reg [31:0] out;
   input [31:0]      in1, in2;
   
   always
     @(in1 or in2)
     out = in1 ^ in2;

endmodule // xor32

   

module kExtend(out, in);
   output [1407:0] out;
   input [127:0]   in;
   
   wire [40:0] 	   gFlag;
   wire [319:0]    gTmp;
      
   assign
     out[127:0] = in,
     gFlag = 'HA987654321;
   
   g
     g1(.out(gTmp[ 31:  0]), .in(out[  31:   0]), .iflag(gFlag[ 3: 0])),
     g2(.out(gTmp[ 63: 32]), .in(out[ 159: 128]), .iflag(gFlag[ 7: 4])),
     g3(.out(gTmp[ 95: 64]), .in(out[ 287: 256]), .iflag(gFlag[11: 8])),
     g4(.out(gTmp[127: 96]), .in(out[ 415: 384]), .iflag(gFlag[15:12])),
     g5(.out(gTmp[159:128]), .in(out[ 543: 512]), .iflag(gFlag[19:16])),
     g6(.out(gTmp[191:160]), .in(out[ 671: 640]), .iflag(gFlag[23:20])),
     g7(.out(gTmp[223:192]), .in(out[ 799: 768]), .iflag(gFlag[27:24])),
     g8(.out(gTmp[255:224]), .in(out[ 927: 896]), .iflag(gFlag[31:28])),
     g9(.out(gTmp[287:256]), .in(out[1055:1024]), .iflag(gFlag[35:32])),
     g10(.out(gTmp[319:288]), .in(out[1183:1152]), .iflag(gFlag[39:36]));

   xor32bits
     xwg1(.out(out[ 255: 224]), .in1(gTmp[ 31:  0]), .in2(out[ 127:  96])),
     xwg2(.out(out[ 383: 352]), .in1(gTmp[ 63: 32]), .in2(out[ 255: 224])),
     xwg3(.out(out[ 511: 480]), .in1(gTmp[ 95: 64]), .in2(out[ 383: 352])),
     xwg4(.out(out[ 639: 608]), .in1(gTmp[127: 96]), .in2(out[ 511: 480])),
     xwg5(.out(out[ 767: 736]), .in1(gTmp[159:128]), .in2(out[ 639: 608])),
     xwg6(.out(out[ 895: 864]), .in1(gTmp[191:160]), .in2(out[ 767: 736])),
     xwg7(.out(out[1023: 992]), .in1(gTmp[223:192]), .in2(out[ 895: 864])),
     xwg8(.out(out[1151:1120]), .in1(gTmp[255:224]), .in2(out[1023: 992])),
     xwg9(.out(out[1279:1248]), .in1(gTmp[287:256]), .in2(out[1151:1120])),
     xwg10(.out(out[1407:1376]), .in1(gTmp[319:288]), .in2(out[1279:1248])),
     //
     xor1(.out(out[ 223: 192]), .in1(out[ 255: 224]), .in2(out[  95:  64])),
     xor2(.out(out[ 191: 160]), .in1(out[ 223: 192]), .in2(out[  63:  32])),
     xor3(.out(out[ 159: 128]), .in1(out[ 191: 160]), .in2(out[  31:   0])),
     xor4(.out(out[ 351: 320]), .in1(out[ 383: 352]), .in2(out[ 223: 192])),
     xor5(.out(out[ 319: 288]), .in1(out[ 351: 320]), .in2(out[ 191: 160])),
     xor6(.out(out[ 287: 256]), .in1(out[ 319: 288]), .in2(out[ 159: 128])),
     xor7(.out(out[ 479: 448]), .in1(out[ 511: 480]), .in2(out[ 351: 320])),
     xor8(.out(out[ 447: 416]), .in1(out[ 479: 448]), .in2(out[ 319: 288])),
     xor9(.out(out[ 415: 384]), .in1(out[ 447: 416]), .in2(out[ 287: 256])),
     xor10(.out(out[ 607: 576]), .in1(out[ 639: 608]), .in2(out[ 479: 448])),
     xor11(.out(out[ 575: 544]), .in1(out[ 607: 576]), .in2(out[ 447: 416])),
     xor12(.out(out[ 543: 512]), .in1(out[ 575: 544]), .in2(out[ 415: 384])),
     xor13(.out(out[ 735: 704]), .in1(out[ 767: 736]), .in2(out[ 607: 576])),
     xor14(.out(out[ 703: 672]), .in1(out[ 735: 704]), .in2(out[ 575: 544])),
     xor15(.out(out[ 671: 640]), .in1(out[ 703: 672]), .in2(out[ 543: 512])),
     xor16(.out(out[ 863: 832]), .in1(out[ 895: 864]), .in2(out[ 735: 704])),
     xor17(.out(out[ 831: 800]), .in1(out[ 863: 832]), .in2(out[ 703: 672])),
     xor18(.out(out[ 799: 768]), .in1(out[ 831: 800]), .in2(out[ 671: 640])),
     xor19(.out(out[ 991: 960]), .in1(out[1023: 992]), .in2(out[ 863: 832])),
     xor20(.out(out[ 959: 928]), .in1(out[ 991: 960]), .in2(out[ 831: 800])),
     xor21(.out(out[ 927: 896]), .in1(out[ 959: 928]), .in2(out[ 799: 768])),
     xor22(.out(out[1119:1088]), .in1(out[1151:1120]), .in2(out[ 991: 960])),
     xor23(.out(out[1087:1056]), .in1(out[1119:1088]), .in2(out[ 959: 928])),
     xor24(.out(out[1055:1024]), .in1(out[1087:1056]), .in2(out[ 927: 896])),
     xor25(.out(out[1247:1216]), .in1(out[1279:1248]), .in2(out[1119:1088])),
     xor26(.out(out[1215:1184]), .in1(out[1247:1216]), .in2(out[1087:1056])),
     xor27(.out(out[1183:1152]), .in1(out[1215:1184]), .in2(out[1055:1024])),
     xor28(.out(out[1375:1344]), .in1(out[1407:1376]), .in2(out[1247:1216])),
     xor29(.out(out[1343:1312]), .in1(out[1375:1344]), .in2(out[1215:1184])),
     xor30(.out(out[1311:1280]), .in1(out[1343:1312]), .in2(out[1183:1152]));

   
   
endmodule // kExtend

