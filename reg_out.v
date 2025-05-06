module reg_out(
input clk, rst,
input [7:0] tout ,
input  ld_out ,
output [7:0] out
);
 reg [7:0] reg_out;
 
 always @(posedge clk or posedge rst) begin
   if (rst)
   reg_out <= 0 ;
   else if ( ld_out )
   reg_out <= tout ;
   end
assign out = reg_out ;
endmodule