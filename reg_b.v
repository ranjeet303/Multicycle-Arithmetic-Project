module reg_b(
input clk, rst,
input [3:0] B,
input ld_b ,
output [3:0] bdin
);
 reg [3:0] reg_b;
 
 always @(posedge clk or posedge rst) begin
   if (rst)
   reg_b <= 0;
   else if (ld_b)
   reg_b <= B;
   end
assign bdin = reg_b ;
endmodule