`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module Encryption_module(CLK, AESKEY, RESET, PLAIN_TXT, CIPHER_TXT);

input CLK, RESET;
input [127:0] PLAIN_TXT, AESKEY;
output [127:0] CIPHER_TXT;

wire [127:0] plain_txt, cipher_txt, aeskey, subkey1, subkey2, subkey3;
wire [127:0] subkey4, subkey5, subkey6, subkey7, subkey8, subkey9, subkey10, keyadd0, keyadd1, keyadd2;
wire[127:0] keyadd3, keyadd4, keyadd5, keyadd6, keyadd7, keyadd8, keyadd9, keyadd10;
wire[127:0] l1, l2, l3, l4, l5, l6, l7, l8, l9, l10; 

assign plain_txt = PLAIN_TXT;
assign aeskey = AESKEY;
assign CIPHER_TXT = cipher_txt;

key_gen_module subkey (.clk(CLK), .aeskey(aeskey), .subkey1(subkey1), .subkey2(subkey2), .subkey3(subkey3), .subkey4(subkey4),
                       .subkey5(subkey5),.subkey6(subkey6), .subkey7(subkey7), .subkey8(subkey8), .subkey9(subkey9), .subkey10(subkey10));

key_addition key_add0 (.clk(CLK), .subkey(aeskey), .diff_out(plain_txt), .keyadd_out(keyadd0));
top_level level1 (.clk(CLK), .reset(RESET), .data_in(keyadd0), .data_out(l1));
key_addition key_add1 (.clk(CLK), .subkey(subkey1), .diff_out(l1), .keyadd_out(keyadd1));

top_level level2 (.clk(CLK), .reset(RESET), .data_in(keyadd1), .data_out(l2));
key_addition key_add2 (.clk(CLK), .subkey(subkey2), .diff_out(l2), .keyadd_out(keyadd2));

top_level level3 (.clk(CLK), .reset(RESET), .data_in(keyadd2), .data_out(l3));
key_addition key_add3 (.clk(CLK), .subkey(subkey3), .diff_out(l3), .keyadd_out(keyadd3));

top_level level4 (.clk(CLK), .reset(RESET), .data_in(keyadd3), .data_out(l4));
key_addition key_add4 (.clk(CLK), .subkey(subkey4), .diff_out(l4), .keyadd_out(keyadd4));

top_level level5 (.clk(CLK), .reset(RESET), .data_in(keyadd4), .data_out(l5));
key_addition key_add5 (.clk(CLK), .subkey(subkey5), .diff_out(l5), .keyadd_out(keyadd5));

top_level level6 (.clk(CLK), .reset(RESET), .data_in(keyadd5), .data_out(l6));
key_addition key_add6 (.clk(CLK), .subkey(subkey6), .diff_out(l6), .keyadd_out(keyadd6));

top_level level7 (.clk(CLK), .reset(RESET), .data_in(keyadd6), .data_out(l7));
key_addition key_add7 (.clk(CLK), .subkey(subkey7), .diff_out(l7), .keyadd_out(keyadd7));

top_level level8 (.clk(CLK), .reset(RESET), .data_in(keyadd7), .data_out(l8));
key_addition key_add8 (.clk(CLK), .subkey(subkey8), .diff_out(l8), .keyadd_out(keyadd8));

top_level level9 (.clk(CLK), .reset(RESET), .data_in(keyadd8), .data_out(l9));
key_addition key_add9 (.clk(CLK), .subkey(subkey9), .diff_out(l9), .keyadd_out(keyadd9));

last_round level10 (.clk(CLK), .reset(RESET), .data_in(keyadd9), .shift_out(l10));
key_addition key_add10 (.clk(CLK), .subkey(subkey10), .diff_out(l10), .keyadd_out(cipher_txt));

endmodule
