module shiftL(out, in, num);
   input [ 1:0] num;
   input [31:0] in;
   output reg [31:0] out;

   always
   @(in or num)
   begin
      case(num)
         'D0:  out <= in;
         'D1:  out <= {in[23:0], in[31:24]};
         'D2:  out <= {in[15:0], in[31:16]};
         'D3:  out <= {in[ 7:0], in[31: 8]};
      endcase
   end

endmodule

module shiftR(out, in, num);
   input [ 1:0] num;
   input [31:0] in;
   output[31:0] out;
   wire [1:0] numtmp;
   
   assign numtmp = 4-num; 
   
   shiftL
      A(.out(out), .in(in), .num(numtmp));

endmodule

module shiftRows(out, in, flag);
   input  flag;
   input  [127:0] in;
   output [127:0] out;
   wire [1:0] num[3:0];

   assign
      num[0] = 'D0,
      num[1] = (flag == 'D0) ? 'D1 : 'D3,
      num[2] = 'D2,
      num[3] = (flag == 'D0) ? 'D3 : 'D1;

   shiftL
      Row_1(.out(out[127:96]), .in(in[127:96]), .num(num[0])),
      Row_2(.out(out[ 95:64]), .in(in[ 95:64]), .num(num[1])),
      Row_3(.out(out[ 63:32]), .in(in[ 63:32]), .num(num[2])),
      Row_4(.out(out[ 31: 0]), .in(in[ 31: 0]), .num(num[3]));

endmodule
