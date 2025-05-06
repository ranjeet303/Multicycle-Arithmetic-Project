`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2025 14:59:15
// Design Name: 
// Module Name: subtractor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module subtractor(
  input  [3:0] A,
  input  [3:0] B,
  output [7:0] tsub

);

reg [3:0] reg_tsub;

  always @(*) begin
    if (A >= B) begin
      reg_tsub = A - B;
   
    end else 
      reg_tsub = B - A;  
        
  end
  assign tsub = {4'b0000 , reg_tsub};
endmodule
