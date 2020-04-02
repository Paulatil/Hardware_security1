`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
 module key_scheduler(clk, roundkey, g, Wout1, Wout2, Wout3, Wout4);

input clk;
input [127:0] roundkey;
input [31:0] g;
reg [31:0] W1, W2, W3, W4;
output [31:0] Wout1, Wout2, Wout3, Wout4;

always@(posedge clk)
begin
W1 <= roundkey[127:96];
W2 <= roundkey[95:64];
W3 <= roundkey[63:32];
W4 <= roundkey[31:0];
end
assign Wout1 = W1 + g;
assign Wout2 = Wout1 + W2;
assign Wout3 = Wout2 + W3;
assign Wout4 = Wout3 + W4;


endmodule