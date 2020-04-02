`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////
module Top_level_bench();

reg clk, reset;
reg [127:0] data_in;
wire [31:0] data_out1;
wire [31:0] data_out2;
wire [31:0] data_out3;
wire [31:0] data_out4;
wire [127:0] data_out;

 top_level DUT(.clk(clk), .reset(reset), .data_in(data_in) ,
               .data_out1(data_out1), .data_out2(data_out2), 
                .data_out(data_out),.data_out3(data_out3), .data_out4(data_out4));
 
 always #10 clk = ~clk;
 
 initial begin
 clk = 0;
 
 #10 reset = 1;
 #20 reset = 0;
 #10
 data_in <= 128'hAB348DF80C51984E2790436287AB34D1;
 #20
 data_in <= 128'hAB348DF80C5234CDE790436287AB34D1;
 #20
 data_in <= 128'hACD670231AB1984E2790436287AB34D1;
 #20
 data_in <= 128'h3243f6a8885a308d313198a2e0370734;
 
end
endmodule
