`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module encryption_testbench();
reg clk, reset;
reg[127:0] plain_txt, AES_key;
wire[127:0] cipher_txt;

Encryption_module DUT ( .CLK(clk), .RESET(reset), .PLAIN_TXT(plain_txt), .AESKEY(AES_key), .CIPHER_TXT(cipher_txt));

always #10 clk = ~clk;

initial 
begin
 clk <= 0;
 reset <= 0;
 #10
 reset <= 1;
 #10
 reset <= 0;
 #20
 AES_key <= 128'h2b7e151628aed2a6abf7158809cf4f3c;
 plain_txt <= 128'h3243f6a8885a308d313198a2e0370734;
 #60 reset <= 1; 
 #100 reset <= 0;
 #40
AES_key <= 128'h1ac76d4f3809db6ea555df8213dc6ae9;
plain_txt <= 128'hb34d56f78a90c2b1094cd62b0e3445cb; 
end 

endmodule
