`timescale 1ns / 1ps 
//////////////////////////////////////////////////////////////////////////////////
module shift_row(SB1, SB2, SB3, SB4,SR1, SR2, SR3, SR4, clk, reset);

input clk, reset;
input [31:0] SB1;  // holds {b0, b4, b8, b12}
input [31:0] SB2;   // holds {b1, b5, b9, b13}
input [31:0] SB3;   // holds {b2, b6, b10, b14}
input [31:0] SB4;   // holds {b3, b7, b11, b15}
  
output reg [31:0] SR1;  // holds {b0, b4, b8, b12}
output reg [31:0] SR2;   // holds {b5, b9, b13, b1}
output reg [31:0] SR3;   // holds {b10, b14, b2, b6}
output reg [31:0] SR4;   // holds {b15, b3, b7, b11}

always@(posedge clk)
begin
if (reset == 1)
begin
   SR1 <= 0;
   SR2 <= 0;
   SR3 <= 0;
   SR4 <= 0;
  end    

else
 begin
 SR1 <= SB1;
   SR2[31:24] <= SB2[23:16];
   SR2[23:16] <= SB2[15:8];
   SR2[15:8] <= SB2[7:0];
   SR2[7:0] <= SB2[31:24];
   
   SR3[31:24] <= SB3[15:8];
   SR3[23:16] <= SB3[7:0];
   SR3[15:8] <= SB3[31:24];
   SR3[7:0] <= SB3[23:16];
   
   SR4[31:24] <= SB4[7:0];
   SR4[23:16] <= SB4[31:24];
   SR4[15:8] <= SB4[23:16];
   SR4[7:0] <= SB4[15:8];
  end
end
endmodule
