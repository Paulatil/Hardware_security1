`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module key_addition(clk, subkey, diff_out, keyadd_out);
input clk;
input [127:0] subkey, diff_out;
output [127:0] keyadd_out;

assign keyadd_out = subkey ^ diff_out;  
endmodule
