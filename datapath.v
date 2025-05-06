module datapath(
input clk, rst,
input [3:0] A,B,
input [1:0] opcode,

input ld_a, ld_b,  ld_out,

output [7:0] out,
output [3:0] remainder_out


);
          wire [3:0] adin;
          wire [3:0] bdin;
          wire [3:0] adout0;    // 4-bit output 0
          wire [3:0] adout1;     // 4-bit output 1
          wire [3:0] adout2;    // 4-bit output 2
          wire[3:0] adout3 ;
          
          wire [3:0] bdout0;    // 4-bit output 0
          wire [3:0] bdout1;     // 4-bit output 1
          wire [3:0] bdout2;    // 4-bit output 2
          wire[3:0] bdout3 ;


wire [7:0] tmul,tadd , tout , tdiv  ,tsub;

reg_a Ra (.clk(clk),.rst(rst),.A(A),.ld_a(ld_a),.adin(adin));
reg_b Rb (.clk(clk),.rst(rst),.B(B),.ld_b(ld_b),.bdin(bdin));

adder_m adder1 (.adout0(adout0),.bdout0(bdout0),.tadd(tadd));
division div1 (.dividend(adout3),.divisor(bdout3),.tdiv(tdiv),.remainder(remainder_out)); 
subtractor sub1 (.A(adout2),.B(bdout2),.tsub(tsub));
mul multi1 (.A(adout1),.B(bdout1),.tmul(tmul));



reg_out Rout (.clk(clk),.rst(rst),.tout(tout),.ld_out(ld_out),.out(out));


demux_4to1_4bit  demux1 (.adin(adin),.opcode(opcode),.adout0(adout0),.adout1(adout1),.adout2(adout2),.adout3(adout3));
demux_4to1_4bbit demux2 (.bdin(bdin),.opcode(opcode),.bdout0(bdout0),.bdout1(bdout1),.bdout2(bdout2),.bdout3(bdout3));


mux_4to1_8bit mux41 (.in0(tadd),.in1(tmul),.in2(tsub),.in3(tdiv),.tout(tout),.opcode(opcode));

endmodule