`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module mix_column_testbench();
reg clk; 
reg [7:0] b0, b4, b8, b12;
reg [7:0] b5, b9, b13, b1;
reg [7:0] b10, b14, b2, b6;
reg [7:0] b15, b3, b7, b11;

wire[7:0] c1, c5, c9, c13;
wire[7:0] c2, c6, c10, c14;
wire[7:0] c3, c7, c11, c15;
wire[7:0] c4, c8, c12, c16;

mix_column DUT(.clk(clk), .r11(b0), .r12(b4), .r13(b8), .r14(b12), .r21(b5), .r22(b9), .r23(b13), .r24(b1), .r31(b10), .r32(b14), .r33(b2), .r34(b6), .r41(b15), .r42(b3), .r43(b7), .r44(b11), .c1(c1), .c2(c2), .c3(c3), .c4(c4), .c5(c5), .c6(c6), .c7(c7), .c8(c8), .c9(c9), .c10(c10), .c11(c11), .c12(c12), .c13(c13), .c14(c14), .c15(c15), .c16(c16));

always #10 clk = ~clk;

initial begin

clk = 0;
#20
 b0<= 8'h01;
 b1<= 8'h11;
 b2<= 8'hD1;
 b3<= 8'hAB;
 b4<= 8'hE3;
 b5<= 8'hB2;
 b6<= 8'hC8;
 b7<= 8'hE9;
 b8<= 8'hD0;
 b9<= 8'hCA;
 b10<= 8'hB7;
 b11<= 8'h1A;
 b12<= 8'h5C;
 b13<= 8'h6A;
 b14<= 8'h89;
 b15<= 8'hD4;
 
 #20
 b0<= 8'h23;
 b1<= 8'hc4;
 b2<= 8'hc7;
 b3<= 8'he1;
 b4<= 8'hbe;
 b5<= 8'hc7;
 b6<= 8'h9a;
 b7<= 8'h1a;
 b8<= 8'h46;
 b9<= 8'hc5;
 b10<= 8'h42;
 b11<= 8'h04;
 b12<= 8'h18;
 b13<= 8'hc2;
 b14<= 8'h5d;
 b15<= 8'h3a;
end
endmodule
