module risingEdgeDetector(input clk,level,output tick);
    reg [1:0] state, nextState;
    parameter [1:0] Z=2'b00, E=2'b01, O =2'b10;
    always @ (level or state)
    case (state)
        Z: if (level==0) nextState = Z;
            else nextState = E;
        E: if (level==0) nextState = Z;
            else nextState = O;
        O: if (level==0) nextState = Z;
            else nextState = O;
        default: nextState = Z;
    endcase
    
    always @ (posedge clk ) begin
        state <= nextState;
    end
    
    assign tick = (state==E);
endmodule