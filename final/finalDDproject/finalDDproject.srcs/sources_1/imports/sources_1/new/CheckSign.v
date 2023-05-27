`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2023 09:01:40 PM
// Design Name: 
// Module Name: CheckSign
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


module CheckSign(
  input [15:0] number1, number2,
  output reg isNegative
);

  wire xorResult;
  
  assign xorResult = number1[7] ^ number2[7];

  always @(xorResult) begin
    if (xorResult == 1) 
      isNegative = 1'b1; // Negative
    else
      isNegative = 1'b0; // Positive
  end

endmodule
