module mul (
  input  [3:0] A,
  input  [3:0] B,
  output [7:0] tmul
);

  wire [6:0] pp0, pp1, pp2, pp3;

 
  assign pp0 = (B[0]) ? {3'b000, A}       : 7'b0000000;  // A << 0
  assign pp1 = (B[1]) ? {2'b00, A, 1'b0}  : 7'b0000000;  // A << 1
  assign pp2 = (B[2]) ? {1'b0, A, 2'b00}  : 7'b0000000;  // A << 2
  assign pp3 = (B[3]) ? { A, 3'b000}  : 7'b0000000;      // A << 3

  assign tmul = pp0 + pp1 + pp2 + pp3;

endmodule
