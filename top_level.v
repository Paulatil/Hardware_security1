`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module top_level(clk, reset,data_in,data_out1, data_out2, data_out3, data_out4, data_out);
 input clk, reset;
 input [127:0] data_in;
 output [127:0] data_out;
 output  [31:0] data_out1;
 output  [31:0] data_out2;
 output  [31:0] data_out3;
 output  [31:0] data_out4;
 
 wire [7:0] s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16;
 wire [31:0] d_out1, d_out2, d_out3, d_out4;
 wire [7:0] s_out1, s_out2, s_out3, s_out4, s_out5, s_out6, s_out7, s_out8, s_out9, s_out10, s_out11, s_out12, s_out13, s_out14, s_out15, s_out16; 
 wire[31:0] sr_out1, sr_out2, sr_out3, sr_out4;
 
assign s1 = data_in[127:120];
assign s2 = data_in[119:112];
assign s3 = data_in[111:104];
assign s4 = data_in[103:96];
assign s5 = data_in[95:88];
assign s6 = data_in[87:80];
assign s7 = data_in[79:72];
assign s8 = data_in[71:64];
assign s9 = data_in[63:56];
assign s10 = data_in[55:48];
assign s11 = data_in[47:40];
assign s12 = data_in[39:32];
assign s13 = data_in[31:24];
assign s14 = data_in[23:16];
assign s15 = data_in[15:8];
assign s16 = data_in[7:0];

assign data_out1 = d_out1;
assign data_out2 = d_out2;
assign data_out3 = d_out3;
assign data_out4 = d_out4;
assign data_out = {d_out1, d_out2, d_out3, d_out4};

S_box sbox1(.clk(clk), .data_in(s1), .data_out(s_out1));
S_box sbox2(.clk(clk), .data_in(s2), .data_out(s_out2));
S_box sbox3(.clk(clk), .data_in(s3), .data_out(s_out3));
S_box sbox4(.clk(clk), .data_in(s4), .data_out(s_out4));
S_box sbox5(.clk(clk), .data_in(s5), .data_out(s_out5));
S_box sbox6(.clk(clk), .data_in(s6), .data_out(s_out6));
S_box sbox7(.clk(clk), .data_in(s7), .data_out(s_out7));
S_box sbox8(.clk(clk), .data_in(s8), .data_out(s_out8));
S_box sbox9(.clk(clk), .data_in(s9), .data_out(s_out9));
S_box sbox10(.clk(clk), .data_in(s10), .data_out(s_out10));
S_box sbox11(.clk(clk), .data_in(s11), .data_out(s_out11));
S_box sbox12(.clk(clk), .data_in(s12), .data_out(s_out12));
S_box sbox13(.clk(clk), .data_in(s13), .data_out(s_out13));
S_box sbox14(.clk(clk), .data_in(s14), .data_out(s_out14));
S_box sbox15(.clk(clk), .data_in(s15), .data_out(s_out15));
S_box sbox16(.clk(clk), .data_in(s16), .data_out(s_out16));

shift_row diffusion1(.clk(clk), .reset(reset), .SB1({s1,s5,s9,s13}), .SB2({s2,s6,s10,s14}), 
                     .SB3({s3,s7,s11,s15}), .SB4({s4,s8,s12,s16}), .SR1(sr_out1), .SR2(sr_out2), 
                     .SR3(sr_out3), .SR4(sr_out4));

mix_column diffusion2(.clk(clk), .r11(sr_out1[31:24]), .r12(sr_out1[23:16]), .r13(sr_out1[15:8]), 
                      .r14(sr_out1[7:0]), .r21(sr_out2[31:24]), .r22(sr_out2[23:16]), .r23(sr_out2[15:8]), 
                      .r24(sr_out2[7:0]), .r31(sr_out3[31:24]), .r32(sr_out3[23:16]), .r33(sr_out3[15:8]), 
                      .r34(sr_out3[7:0]), .r41(sr_out4[31:24]), .r42(sr_out4[23:16]), .r43(sr_out4[15:8]), 
                      .r44(sr_out4[7:0]), .c1(d_out1[31:24]), .c2(d_out1[23:16]), .c3(d_out1[15:8]), .c4(d_out1[7:0]),
                       .c5(d_out2[31:24]), .c6(d_out2[23:16]), .c7(d_out2[15:8]), .c8(d_out2[7:0]), 
                       .c9(d_out3[31:24]), .c10(d_out3[23:16]), .c11(d_out3[15:8]), .c12(d_out3[7:0]),
                       .c13(d_out4[31:24]), .c14(d_out4[23:16]), .c15(d_out4[15:8]), .c16(d_out4[7:0]));


endmodule
