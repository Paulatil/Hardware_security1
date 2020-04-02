`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module round1_bench( );

reg clk, reset;
reg [127:0] plain_txt, masterkey;
wire [127:0] round1_out;

Round1 DUT (.clk(clk), .reset(reset), .plain_txt(plain_txt), .subkey0(masterkey), .round1_out(round1_out));

always #10 clk = ~clk;

initial 
begin
 clk = 0;
 reset = 0;
 #10
 reset = 1;
 #10
 reset = 0;
 #20
 masterkey <= 128'h2b7e151628aed2a6abf7158809cf4f3c;
 plain_txt <= 128'h3243f6a8885a308d313198a2e0370734; 
 #60
masterkey <= 128'h1ac76d4f3809db6ea555df8213dc6ae9;
plain_txt <= 128'hb34d56f78a90c2b1094cd62b0e3445cb; 
end 

endmodule
