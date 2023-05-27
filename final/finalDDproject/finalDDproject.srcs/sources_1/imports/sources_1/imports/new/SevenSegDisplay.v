module SevenSegDisplay(
  input clk,
  input reset,
  input start,
  input si,
  input [3:0] units,
  input [3:0] tens,
  input [3:0] hunds,
  input [3:0] thus,
  input [3:0] t_thus,
  input Left, Right,
  output reg [3:0] anode_active,
  output reg [6:0] segments
);



    wire clk_out;
    wire [3:0] st1, st2, st3;
    
    wire [1:0] all;
    reg [3:0] sevenseg;
    clockDivider #(25000) c(.clk(clk),.clk_out(clk_out));
    counter #(2,4) count(.clk(clk_out), .count(all));
    
       Scroller sc(.clk(clk), .rst(reset), .left(Left), .right(Right),.units(units), .tens(tens), .hunds(hunds), .thus(thus), .t_thus(t_thus), .st1(st1), .st2(st2), .st3(st3));

   
      always@(*)begin
      case(all)
        0: sevenseg <=  st1;
        1: sevenseg <=  st2;
        2: sevenseg <=  st3;
        3: sevenseg <= (si == 1)? 4'b1010 : 4'b1011; 
      endcase 
   end 
    always @(*) begin
        case(all)
            2'b00: anode_active = 4'b1110;
            2'b01: anode_active = 4'b1101;
            2'b10: anode_active = 4'b1011;
            2'b11: anode_active = 4'b0111;
        endcase
    end
    always @(*) begin
      case(sevenseg )
        0: segments = 7'b0000001;
        1: segments = 7'b1001111;
        2: segments = 7'b0010010;
        3: segments = 7'b0000110;
        4: segments = 7'b1001100;
        5: segments = 7'b0100100;
        6: segments = 7'b0100000;
        7: segments = 7'b0001111;
        8: segments = 7'b0000000;
        9: segments = 7'b0000100;
        10: segments = 7'b1111110;
        11: segments = 7'b1111111;
      endcase
    end
endmodule