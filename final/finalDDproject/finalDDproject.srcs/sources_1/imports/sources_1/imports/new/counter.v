module counter #(parameter x = 4, n = 3) (input clk, output reg [x-1:0] count);


    always @(posedge clk) 
    begin
        if(count == n-1)
            begin
                count <= 0;
            end else
            begin 
                count <= count + 1;
            end
        end
    

endmodule
