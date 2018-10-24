module multibase(out, in, flag);
   input  flag;
   input  [7:0] in;
   output reg [7:0] out;

   always
   @(flag or in)
   begin
      out = in << 1;
      if (flag == 'B1)
         out = out ^ 'B00011011;
   end
endmodule

module multi1x1(out, a, b);
   output reg [7:0] out;
   input  [7:0] a, b;
   reg  [63:0] tmpTmp;
   wire [63:0] tmp;
   wire [7:0] num[7:0];

   assign tmp[7:0] = b; 

   multibase
      BIT1(.out(tmp[15: 8]), .in(tmp[ 7: 0]), .flag(tmp[7])),
      BIT2(.out(tmp[23:16]), .in(tmp[15: 8]), .flag(tmp[15])),
      BIT3(.out(tmp[31:24]), .in(tmp[23:16]), .flag(tmp[23])),
      BIT4(.out(tmp[39:32]), .in(tmp[31:24]), .flag(tmp[31])),
      BIT5(.out(tmp[47:40]), .in(tmp[39:32]), .flag(tmp[39])),
      BIT6(.out(tmp[55:48]), .in(tmp[47:40]), .flag(tmp[47])),
      BIT7(.out(tmp[63:56]), .in(tmp[55:48]), .flag(tmp[55]));
   
   always 
   @(tmp[63:56])
   begin
      tmpTmp = tmp;
      if (a[0] == 'B0)
         tmpTmp[7:0] = 'B0;
      if (a[1] == 'B0)
         tmpTmp[15:8] = 'B0;
      if (a[2] == 'B0)
         tmpTmp[23:16] = 'B0;
      if (a[3] == 'B0)
         tmpTmp[31:24] = 'B0;
      if (a[4] == 'B0)
         tmpTmp[39:32] = 'B0;
      if (a[5] == 'B0)
         tmpTmp[47:40] = 'B0;
      if (a[6] == 'B0)
         tmpTmp[55:48] = 'B0;
      if (a[7] == 'B0)
         tmpTmp[63:56] = 'B0;

      out = tmpTmp[7:0] ^ tmpTmp[15:8] ^ tmpTmp[23:16] ^ tmpTmp[31:24] ^ tmpTmp[39:32] ^ tmpTmp[47:40] ^ tmpTmp[55:48] ^ tmpTmp[63:56];  

   end
endmodule


module multiRow(out, inRow, in);
   output reg[ 31:0]  out;
   input [ 31:0]  inRow;
   input [127:0]  in;
   wire   [127:0]  tmp;
   
   multi1x1
      A(.out(tmp[  7:  0]), .a(inRow[31:24]), .b(in[127:120])),
      B(.out(tmp[ 15:  8]), .a(inRow[23:16]), .b(in[ 95: 88])),
      C(.out(tmp[ 23: 16]), .a(inRow[15: 8]), .b(in[ 63: 56])),
      D(.out(tmp[ 31: 24]), .a(inRow[ 7: 0]), .b(in[ 31: 24])),
      E(.out(tmp[ 39: 32]), .a(inRow[31:24]), .b(in[119:112])),
      F(.out(tmp[ 47: 40]), .a(inRow[23:16]), .b(in[ 87: 80])),
      G(.out(tmp[ 55: 48]), .a(inRow[15: 8]), .b(in[ 55: 48])),
      H(.out(tmp[ 63: 56]), .a(inRow[ 7: 0]), .b(in[ 23: 16])),
      I(.out(tmp[ 71: 64]), .a(inRow[31:24]), .b(in[111:104])),
      J(.out(tmp[ 79: 72]), .a(inRow[23:16]), .b(in[ 79: 72])),
      K(.out(tmp[ 87: 80]), .a(inRow[15: 8]), .b(in[ 47: 40])),
      L(.out(tmp[ 95: 88]), .a(inRow[ 7: 0]), .b(in[ 15:  8])),
      M(.out(tmp[103: 96]), .a(inRow[31:24]), .b(in[103: 96])),
      N(.out(tmp[111:104]), .a(inRow[23:16]), .b(in[ 71: 64])),
      O(.out(tmp[119:112]), .a(inRow[15: 8]), .b(in[ 39: 32])),
      P(.out(tmp[127:120]), .a(inRow[ 7: 0]), .b(in[  7:  0]));

   always
   @(tmp[7:0] or tmp[15:8] or tmp[23:16] or tmp[31:24])
   begin
      out[31:24] = tmp[7:0] ^ tmp[15:8] ^ tmp[23:16] ^ tmp[31:24];
   end

   always
   @(tmp[39:32] or tmp[47:40] or tmp[55:48] or tmp[63:56])
   begin
      out[23:16] = tmp[39:32] ^ tmp[47:40] ^ tmp[55:48] ^ tmp[63:56];
   end

   always
   @(tmp[71: 64] or tmp[79: 72] or tmp[87: 80] or tmp[95: 88])
   begin
      out[15:8] = tmp[71: 64] ^ tmp[79: 72] ^ tmp[87: 80] ^ tmp[95: 88];
   end

   always
   @(tmp[103: 96] or tmp[111:104] or tmp[119:112] or tmp[127:120])
   begin
      out[7:0] = tmp[103: 96] ^ tmp[111:104] ^ tmp[119:112] ^ tmp[127:120];
   end
endmodule // multiRow

module multiMatrix(out, inMatrix, in);
   output [127:0] out;
   input  [127:0] in, inMatrix;
   
   multiRow
      ROW0(.out(out[127:96]), .inRow(inMatrix[127:96]), .in(in)),
      ROW1(.out(out[ 95:64]), .inRow(inMatrix[ 95:64]), .in(in)),
      ROW2(.out(out[ 63:32]), .inRow(inMatrix[ 63:32]), .in(in)),
      ROW3(.out(out[ 31: 0]), .inRow(inMatrix[ 31: 0]), .in(in));

endmodule// multiMatrix

module mixColumns(out, in, flag);
   input flag;
   input  [127:0] in;
   output [127:0] out;
   reg [7:0] 	   matrixTmp[15:0];
   reg [127:0] 	matrix; 	  
      
   always
     @(flag)
     begin
      if (flag == 'B0)
         begin
            $readmemh("../MixC/Matrix_dat.txt", matrixTmp);
         end
      else
         begin
            $readmemh("../MixC/Matrix-1_dat.txt", matrixTmp);
         end
      matrix[127:120] = matrixTmp[0];
      matrix[119:112] = matrixTmp[1];
      matrix[111:104] = matrixTmp[2];
      matrix[103: 96] = matrixTmp[3];

      matrix[95:88] = matrixTmp[4];
      matrix[87:80] = matrixTmp[5];
      matrix[79:72] = matrixTmp[6];
      matrix[71:64] = matrixTmp[7];

      matrix[63:56] = matrixTmp[8];
      matrix[55:48] = matrixTmp[9];
      matrix[47:40] = matrixTmp[10];
      matrix[39:32] = matrixTmp[11];

      matrix[31:24] = matrixTmp[12];
      matrix[23:16] = matrixTmp[13];
      matrix[15: 8] = matrixTmp[14];
      matrix[ 7: 0] = matrixTmp[15];
     end
	       
   multiMatrix
      Matrix(.out(out), .inMatrix(matrix), .in(in));

endmodule // MixColumns

	
	
	
