module center(input [7:0] a,b, input clk, reset, start,left, right, output finish, output [3:0] anode_active,output [6:0] segments );
wire [15:0]result;
wire [7:0] in1_abs,in2_abs;
wire [15:0] result_mul;
wire [3:0]units, tens, hunds ,thus, t_thus  ;
wire sign,S,R,l,r;
wire clk_out;



clockDivider ck(.clk(clk), .clk_out(clk_out));
pushButtonDetector Start(.clk(clk),.x(start),.z(S));
pushButtonDetector Reset(.clk(clk),.x(reset),.z(R));
pushButtonDetector pushl(.clk(clk),.x(left),.z(Left));
pushButtonDetector pushr(.clk(clk),.x(right),.z(Right));
//sign s(.in1(a), .in2(b), .clk(clk), .start(S), .in1_abs(in1_abs), .in2_abs(in2_abs), .sign(sign));
Multiplier_e mul(.a(a), .b(b), .clk(clk), .reset(R), .start(S), .finish(finish), .result(result_mul));
b2bcd convert( .binary(result_mul), .units(units), .tens(tens), .hunds(hunds), .thus(thus), .t_thus(t_thus));
SevenSegDisplay display( .clk(clk),.si(sign),.start(S),.units(units),.tens(tens),.hunds(hunds),.thus(thus),.t_thus(t_thus),.Left(Left),.Right(Right),.anode_active(anode_active),.segments(segments));
CheckSign(.number1(a),.number2(b),.isNegative(sign));

endmodule
