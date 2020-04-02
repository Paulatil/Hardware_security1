`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module RC(rc1, rc2, rc3, rc4, rc5, rc6, rc7, rc8, rc9, rc10);

 output [7:0] rc1, rc2, rc3, rc4, rc5, rc6, rc7, rc8, rc9, rc10;
 
 assign rc1 = 8'b00000001;
 assign rc2 = 8'b00000010;
 assign rc3 = 8'b00000100;
 assign rc4 = 8'b00001000;
 assign rc5 = 8'b00010000;
 assign rc6 = 8'b00100000;
 assign rc7 = 8'b01000000;
 assign rc8 = 8'b10000001;
 assign rc9 = 8'b00011011;
 assign rc10 = 8'b00110110;
 
endmodule
