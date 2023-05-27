module Scroller(
  input clk, rst, left, right,
  input [3:0] units, tens, hunds, thus, t_thus,
  output reg [3:0] st1, st2, st3
);
  reg [1:0] state, nextState;
  parameter [1:0] A = 2'b00, B = 2'b01, C = 2'b10; // States Encoding
  
  // Next state generation (combinational logic)
  always @(left or right or state) begin
    case (state)
      A:
      begin
        st1 <= units;
        st2 <= tens;
        st3 <= hunds;
        if (right == 1) nextState = B;
        else if (left == 1) nextState = C;
        else nextState = A;
      end
      
      B:
      begin
        st1 <= tens;
        st2 <= hunds;
        st3 <= thus;
        if (right == 1) nextState = C;
        else if (left == 1) nextState = A;
        else nextState = B;
      end
      
      C:
      begin
        st1 <= hunds;
        st2 <= thus;
        st3 <= t_thus;
        if (right == 1) nextState = A;
        else if (left == 1) nextState = B;
        else nextState = C;
      end
      
      default: nextState = A;
    endcase
  end
  
  // State register
  always @(posedge clk or posedge rst) begin
    if (rst) state <= A;
    else state <= nextState;
  end
  
endmodule
