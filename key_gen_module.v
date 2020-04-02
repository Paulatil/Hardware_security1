`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module key_gen_module(
  input clk, 
  input [127:0] aeskey, 
   output [127:0] subkey1, subkey2, subkey3, subkey4, 
   output[127:0] subkey5, subkey6, subkey7, subkey8, subkey9, subkey10);
   
wire [7:0] rc1, rc2, rc3, rc4, rc5, rc6, rc7, rc8, rc9, rc10;
wire [127:0] sub_key1, sub_key2, sub_key3, sub_key4, sub_key5, sub_key6, sub_key7, sub_key8, sub_key9,sub_key10, aes_key;
  
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
 
 assign aes_key = aeskey;
 assign subkey1 = sub_key1;
 assign subkey2 = sub_key2;
 assign subkey3 = sub_key3;
 assign subkey4 = sub_key4;
 assign subkey5 = sub_key5;
 assign subkey6 = sub_key6;
 assign subkey7 = sub_key7;
 assign subkey8 = sub_key8;
 assign subkey9 = sub_key9;
 assign subkey10 = sub_key10;
 
 round_transform round1 (.clk(clk), .RC_in(rc1), .roundkey(aes_key), .subkey(sub_key1));
 round_transform round2 (.clk(clk), .RC_in(rc2), .roundkey(sub_key1), .subkey(sub_key2));
 round_transform round3 (.clk(clk), .RC_in(rc3), .roundkey(sub_key2), .subkey(sub_key3));
 round_transform round4 (.clk(clk), .RC_in(rc4), .roundkey(sub_key3), .subkey(sub_key4));
 round_transform round5 (.clk(clk), .RC_in(rc5), .roundkey(sub_key4), .subkey(sub_key5));
 round_transform round6 (.clk(clk), .RC_in(rc6), .roundkey(sub_key5), .subkey(sub_key6));
 round_transform round7 (.clk(clk), .RC_in(rc7), .roundkey(sub_key6), .subkey(sub_key7));
 round_transform round8 (.clk(clk), .RC_in(rc8), .roundkey(sub_key7), .subkey(sub_key8));
 round_transform round9 (.clk(clk), .RC_in(rc9), .roundkey(sub_key8), .subkey(sub_key9));
 round_transform round10 (.clk(clk), .RC_in(rc10), .roundkey(sub_key9), .subkey(sub_key10));

endmodule
