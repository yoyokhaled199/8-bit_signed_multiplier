`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 12:00:22 PM
// Design Name: 
// Module Name: Multiplier
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
module Multiplier_e(input [7:0]a, b, input clk, reset, start, output reg finish, output reg [15:0]result, output reg result_mul);
reg [15:0]a_shifted_reg; //the value of the multiplier ad other 8 bits added so that it could be shifted
reg [7:0] b_reg;
reg [15:0] result_reg;

always @ (posedge clk, posedge reset)
begin
    if (reset)
    begin
        a_shifted_reg <= 16'b0;
        b_reg <= 8'b0;
        result_reg <= 16'b0;
    end
    else
    begin
        if(start)
        begin // we will load all the inputs into teh registers now
            a_shifted_reg <= {8'b0 , a};
            b_reg <= b;
            result_reg <= 16'b0; 
        end
        else
            if(b_reg != 8'b0)
            begin
                if(b_reg[0] == 1'b1) begin
                    result_reg <= result_reg + a_shifted_reg;
                    end
                 a_shifted_reg <= a_shifted_reg <<1; //left shift a
                 b_reg <= b_reg >>1;                 //right shift b
            end
            else
            begin 
                result <= result_reg;
            end
     end       
end
//for the case of finishing
always @(*)
    begin
    if (start)
        begin
            finish = 1'b0;  
        end
     else
     if (b_reg == 8'b0)
        begin
            finish = 1'b1;  // all finished
        end
     end      

endmodule