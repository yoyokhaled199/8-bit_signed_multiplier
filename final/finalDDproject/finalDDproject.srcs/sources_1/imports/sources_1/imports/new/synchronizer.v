module synchronizer(input clk,input sig, output reg sig1);
reg meta;
always @(posedge clk) begin
  meta <= sig;
  sig1 <= meta;
end
endmodule
