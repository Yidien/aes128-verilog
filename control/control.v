module aes128base(out, in, k);
   output [127:0] out;
   input [127:0]  in, k;

   wire 	  Sflag, shflag, mflag;
   wire [127:0]   STmp, shiftTmp, mixTmp;	  
   
   assign 
     Sflag = 'B0,
     shflag = 'B0,
     mflag = 'B0;
      
   byte2S127
     SBox(.out(STmp), .in(in), .flag(Sflag));

   shiftRows
     sh(.out(shiftTmp), .in(STmp), .flag(shflag));

   mixColumns
     MixC(.out(mixTmp), .in(shiftTmp), .flag(mflag));

   addRoundKey
     Add(.out(out), .in(mixTmp), .key(k));

endmodule // aes128base

   
module aes128(out, in, k);
   output [127:0] out;
   input [127:0]   in, k;

   wire [127:0]   inRot, K0, K1, K2, K3, K4, K5, K6, K7, K8, K9, K10, outTmp;
   wire [1407:0]  kEx;
   wire [127:0]   tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8, tmp9, Stmp, shTmp;
   wire 	  SFlag, shflag;

   assign
     SFlag = 'B0,
     shflag = 'B0;
   
   rotate
     inR(.out(inRot), .in(in)),
     outR(.out(out), .in(outTmp)),
     //
     KR0(.out(K0), .in(kEx[ 127:   0])),
     KR1(.out(K1), .in(kEx[ 255: 128])),
     KR2(.out(K2), .in(kEx[ 383: 256])),
     KR3(.out(K3), .in(kEx[ 511: 384])),
     KR4(.out(K4), .in(kEx[ 639: 512])),
     KR5(.out(K5), .in(kEx[ 767: 640])),
     KR6(.out(K6), .in(kEx[ 895: 768])),
     KR7(.out(K7), .in(kEx[1023: 896])),
     KR8(.out(K8), .in(kEx[1151:1024])),
     KR9(.out(K9), .in(kEx[1279:1152])),
     KR10(.out(K10), .in(kEx[1407:1280]));

   kExtend
     kE(.out(kEx), .in(k));
   
   addRoundKey
     A0(.out(tmp0), .in(inRot), .key(K0)),
     A1(.out(outTmp), .in(shTmp), .key(K10));

   aes128base
     B1(.out(tmp1), .in(tmp0), .k(K1)),
     B2(.out(tmp2), .in(tmp1), .k(K2)),
     B3(.out(tmp3), .in(tmp2), .k(K3)),
     B4(.out(tmp4), .in(tmp3), .k(K4)),
     B5(.out(tmp5), .in(tmp4), .k(K5)),
     B6(.out(tmp6), .in(tmp5), .k(K6)),
     B7(.out(tmp7), .in(tmp6), .k(K7)),
     B8(.out(tmp8), .in(tmp7), .k(K8)),
     B9(.out(tmp9), .in(tmp8), .k(K9));

   byte2S127
     SBox(.out(Stmp), .in(tmp9), .flag(SFlag));

   shiftRows
     SH(.out(shTmp), .in(Stmp), .flag(shflag));

   
endmodule // aes128

    
module aes128base_1(out, in, k);
   output [127:0] out;
   input [127:0]  in, k;

   wire 	  Sflag, shflag, mflag;
   wire [127:0]   STmp, shiftTmp, addTmp;	  
   
   assign 
     Sflag = 'B1,
     shflag = 'B1,
     mflag = 'B1;
      
   byte2S127
     SBox(.out(STmp), .in(shiftTmp), .flag(Sflag));

   shiftRows
     sh(.out(shiftTmp), .in(in), .flag(shflag));

   mixColumns
     MixC(.out(out), .in(addTmp), .flag(mflag));

   addRoundKey
     Add(.out(addTmp), .in(STmp), .key(k));

endmodule // aes128base_1


   
module aes128_1(out, in, k);
   output [127:0] out;
   input [127:0]   in, k;

   wire [127:0]   inRot, K0, K1, K2, K3, K4, K5, K6, K7, K8, K9, K10, outTmp;
   wire [1407:0]  kEx;
   wire [127:0]   tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7, tmp8, tmp9, Stmp, shTmp;
   wire 	  SFlag, shflag;

   assign
     SFlag = 'B1,
     shflag = 'B1;
   
   rotate
     inR(.out(inRot), .in(in)),
     outR(.out(out), .in(outTmp)),
     //
     KR0(.out(K0), .in(kEx[ 127:   0])),
     KR1(.out(K1), .in(kEx[ 255: 128])),
     KR2(.out(K2), .in(kEx[ 383: 256])),
     KR3(.out(K3), .in(kEx[ 511: 384])),
     KR4(.out(K4), .in(kEx[ 639: 512])),
     KR5(.out(K5), .in(kEx[ 767: 640])),
     KR6(.out(K6), .in(kEx[ 895: 768])),
     KR7(.out(K7), .in(kEx[1023: 896])),
     KR8(.out(K8), .in(kEx[1151:1024])),
     KR9(.out(K9), .in(kEx[1279:1152])),
     KR10(.out(K10), .in(kEx[1407:1280]));

   kExtend
     kE(.out(kEx), .in(k));
   
   addRoundKey
     A0(.out(tmp0), .in(inRot), .key(K10)),
     A1(.out(outTmp), .in(Stmp), .key(K0));

   aes128base_1
     B1(.out(tmp1), .in(tmp0), .k(K9)),
     B2(.out(tmp2), .in(tmp1), .k(K8)),
     B3(.out(tmp3), .in(tmp2), .k(K7)),
     B4(.out(tmp4), .in(tmp3), .k(K6)),
     B5(.out(tmp5), .in(tmp4), .k(K5)),
     B6(.out(tmp6), .in(tmp5), .k(K4)),
     B7(.out(tmp7), .in(tmp6), .k(K3)),
     B8(.out(tmp8), .in(tmp7), .k(K2)),
     B9(.out(tmp9), .in(tmp8), .k(K1));

   byte2S127
     SBox(.out(Stmp), .in(shTmp), .flag(SFlag));

   shiftRows
     SH(.out(shTmp), .in(tmp9), .flag(shflag));

   
endmodule // aes128_1
