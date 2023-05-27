`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 01:35:40 PM
// Design Name: 
// Module Name: sign
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module sign(input [7:0]in1, in2, input clk, start, output reg [7:0] in1_abs, in2_abs, output reg sign);
always@(posedge clk)
begin
    if (start)
    sign <= in1[7] ^ in2[7];
    else
    sign = sign;
    in1_abs <= (in1[7] == 0)? in1: ~in1 +1;
    in2_abs <= (in1[7] == 0)? in2: ~in2 +1;
end
endmodule
