`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module mix_column(
input clk,
input [7:0] r11,r12,r13,r14,
input [7:0] r21,r22,r23,r24,
input [7:0] r31,r32,r33,r34,
input [7:0] r41,r42,r43,r44,
output reg [7:0] c1,c2,c3,c4,c5,
output reg [7:0] c6,c7,c8,c9,c10,
output reg [7:0] c11,c12,c13,c14,c15,c16
);
reg [7:0] matrix [0:3][0:3];

initial
begin
  matrix[0][0] <= 8'h02;
  matrix[0][1] <= 8'h03;
  matrix[0][2] <= 8'h01;
  matrix[0][3] <= 8'h01;
  matrix[1][0] <= 8'h01;
  matrix[1][1] <= 8'h02;
  matrix[1][2] <= 8'h03;
  matrix[1][3] <= 8'h01;
  matrix[2][0] <= 8'h01;
  matrix[2][1] <= 8'h01;
  matrix[2][2] <= 8'h02;
  matrix[2][3] <= 8'h03;
  matrix[3][0] <= 8'h03;
  matrix[3][1] <= 8'h01;
  matrix[3][2] <= 8'h01;
  matrix[3][3] <= 8'h02;
end

always@(posedge clk)
begin
c1 <= ((matrix[0][0]*r11)^(matrix[0][1]*r21)^(matrix[0][2]*r31)^(matrix[0][3]*r41));
c2 <= ((matrix[1][0]*r11)^(matrix[1][1]*r21)^(matrix[1][2]*r31)^(matrix[1][3]*r41));
c3 <= ((matrix[2][0]*r11)^(matrix[2][1]*r21)^(matrix[2][2]*r31)^(matrix[2][3]*r41));
c4 <= ((matrix[3][0]*r11)^(matrix[3][1]*r21)^(matrix[3][2]*r31)^(matrix[3][3]*r41));

c5<= ((matrix[0][0]*r12)^(matrix[0][1]*r22)^(matrix[0][2]*r32)^(matrix[0][3]*r42));
c6<= ((matrix[1][0]*r12)^(matrix[1][1]*r22)^(matrix[1][2]*r32)^(matrix[1][3]*r42));
c7<= ((matrix[2][0]*r12)^(matrix[2][1]*r22)^(matrix[2][2]*r32)^(matrix[2][3]*r42)); 
c8<= ((matrix[3][0]*r12)^(matrix[3][1]*r22)^(matrix[3][2]*r32)^(matrix[3][3]*r42));

c9<= ((matrix[0][0]*r13)^(matrix[0][1]*r23)^(matrix[0][2]*r33)^(matrix[0][3]*r43));
c10<= ((matrix[1][0]*r13)^(matrix[1][1]*r23)^(matrix[1][2]*r33)^(matrix[1][3]*r43));
c11<= ((matrix[2][0]*r13)^(matrix[2][1]*r23)^(matrix[2][2]*r33)^(matrix[2][3]*r43));
c12<= ((matrix[3][0]*r13)^(matrix[3][1]*r23)^(matrix[3][2]*r33)^(matrix[3][3]*r43));

c13<= ((matrix[0][0]*r14)^(matrix[0][1]*r24)^(matrix[0][2]*r34)^(matrix[0][3]*r44));
c14<= ((matrix[1][0]*r14)^(matrix[1][1]*r24)^(matrix[1][2]*r34)^(matrix[1][3]*r44));
c15<= ((matrix[2][0]*r14)^(matrix[2][1]*r24)^(matrix[2][2]*r34)^(matrix[2][3]*r44));
c16<= ((matrix[3][0]*r14)^(matrix[3][1]*r24)^(matrix[3][2]*r34)^(matrix[3][3]*r44));
end

endmodule
