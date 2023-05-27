module pushButtonDetector(
  input clk,
  input reset,
  input x,
 
  output  z
  
);

  wire newclk, postDebounce, postSynch;
  
  clockDivider  #(25000) c(.clk(clk), .clk_out(newclk));
  
  debouncer d(.clk(newclk), .in(x), .out(postDebounce));
  synchronizer s(.clk(newclk), .sig(postDebounce), .sig1(postSynch));
  risingEdgeDetector r(.clk(newclk), .level(postSynch), .tick(z));
  
endmodule