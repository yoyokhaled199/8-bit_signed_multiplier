module counterModN #(parameter x = 4, n = 11)(

input clk, reset, enable, output [x-1:0]count);


reg [x:0] count;
always @(posedge clk, posedge reset) begin

if (enable ==1)
 if (reset == 1 || count == n-1)
 count <= 3'd0; // non-blocking assignment
 // initialize flip flop here
 
 else
 count <= count + 1; // non-blocking assignment
 // normal operation

end

endmodule

