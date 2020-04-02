`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module round_transform(clk,subkey, roundkey, RC_in);

input clk;
input [7:0] RC_in;
input [127:0] roundkey;
output [127:0] subkey;

wire [31:0] g_in, g_out;
wire [7:0] rc_in;
wire [127:0] rndkey, sub_key;

assign rndkey = roundkey;
assign subkey = sub_key;
assign g_in = roundkey[31:0];
assign rc_in = RC_in;

G_function g_module (.clk(clk), .W4(g_in), .rc_in(rc_in), .g_out(g_out));
key_scheduler key_sch (.clk(clk), .roundkey(rndkey), .g(g_out), .Wout1(subkey[127:96]), .Wout2(subkey[95:64]), .Wout3(subkey[63:32]), .Wout4(subkey[31:0]));

endmodule
