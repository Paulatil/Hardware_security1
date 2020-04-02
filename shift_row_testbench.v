`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module shift_row_testbench();

reg clk, reset;
reg [31:0] sb1;
reg [31:0] sb2;
reg [31:0] sb3;
reg [31:0] sb4;

wire [31:0] sr1;
wire [31:0] sr2;
wire [31:0] sr3;
wire [31:0] sr4;

shift_row DUT(.clk(clk), .reset(reset), .SB1(sb1), .SB2(sb2), .SB3(sb3), .SB4(sb4), .SR1(sr1), .SR2(sr2), .SR3(sr3), .SR4(sr4));
always #10 clk = ~clk;

initial begin
clk = 0;
#10 reset = 1;
#10 reset = 0;

sb1 <= 32'h23c4c7e1;  //expected sr1 = ACF2
sb2 <= 32'h1abec79a;  // expected sr2 = 4BA3
sb3 <= 32'h420446c5;  // expected sr3 = B5A36
sb4 <= 32'hc25d3a18;  //expected sr4 = E7BD
end
endmodule
