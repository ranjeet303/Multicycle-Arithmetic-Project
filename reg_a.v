module reg_a(
input clk, rst,
input [3:0] A,
input ld_a ,
output [3:0] adin
);
 reg [3:0] reg_a;
 
 always @(posedge clk or posedge rst) begin
   if (rst)
   reg_a <= 0;
   else if (ld_a)
   reg_a <= A;
   end
assign adin = reg_a ;
endmodule