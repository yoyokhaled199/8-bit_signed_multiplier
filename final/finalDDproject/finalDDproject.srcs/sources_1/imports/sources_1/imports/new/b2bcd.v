`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/24/2023 01:46:39 PM
// Design Name: 
// Module Name: b2bcd
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


module b2bcd(
    binary,units,tens,hunds,thus,t_thus
    );
    input [15:0] binary; 
    output [3:0] units,tens,hunds,thus,t_thus;
    reg [19:0] temp;
    integer i;
            
    always @(binary) begin
        temp=0;		 	
        for (i=0;i<16;i=i+1) begin
           if (temp[3:0] >= 5) temp[3:0] = temp[3:0] + 3;
           if (temp[7:4] >= 5) temp[7:4] = temp[7:4] + 3;
           if (temp[11:8] >= 5) temp[11:8] = temp[11:8] + 3;
           if (temp[15:12] >= 5) temp[15:12] = temp[15:12] + 3;
           if (temp[19:16] >= 5) temp[19:16] = temp[19:16] + 3;
           temp = {temp[18:0],binary[15-i]};
         end                             
     end
        
     assign units = temp[3:0];
     assign tens = temp[7:4];
     assign hunds = temp[11:8];
     assign thus = temp[15:12];
     assign t_thus = temp[19:16];
endmodule
