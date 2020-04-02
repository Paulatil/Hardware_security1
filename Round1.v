`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module Round1(
          input clk, reset,
          input [127:0] plain_txt, subkey0,
          output [127:0] round1_out);
 
  wire[127:0] subkey_0, subkey_1, plaintxt, rnd_out, key_add, level_out;
  
  assign plaintxt = plain_txt;
  assign subkey_0 = subkey0;
  assign round1_out = rnd_out;
  
  key_addition key_add0 (.clk(clk), .subkey(subkey_0), .diff_out(plaintxt), .keyadd_out(key_add));
  top_level level1 (.clk(clk), .reset(reset), .data_in(key_add), .data_out(level_out));
  key_gen_module subkey (.clk(clk), .aeskey(subkey_0), .subkey1(subkey_1));
  key_addition key_add1 (.clk(clk), .subkey(subkey_1), .diff_out(level_out), .keyadd_out(rnd_out));
           
endmodule
