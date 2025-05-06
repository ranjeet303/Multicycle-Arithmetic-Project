module demux_4to1_4bbit (
    input wire [3:0] bdin,       // 4-bit data input
    input wire [1:0] opcode,       // 2-bit select input
    output  [3:0] bdout0,     // 4-bit output 0
    output  [3:0] bdout1,     // 4-bit output 1
    output  [3:0] bdout2,     // 4-bit output 2
    output  [3:0] bdout3      // 4-bit output 3
);

          reg [3:0] r_bdout0;    // 4-bit output 0
          reg [3:0] r_bdout1;     // 4-bit output 1
          reg [3:0] r_bdout2;    // 4-bit output 2
          reg [3:0] r_bdout3 ;


always @(*) begin
    case (opcode)
        2'b00: begin
            r_bdout0 = bdin;
            r_bdout1 = 4'b0000;
            r_bdout2 = 4'b0000;
            r_bdout3 = 4'b0000;
        end
        2'b01: begin
            r_bdout0 = 4'b0000;
            r_bdout1 = bdin;
            r_bdout2 = 4'b0000;
            r_bdout3 = 4'b0000;
        end
        2'b10: begin
            r_bdout0 = 4'b0000;
            r_bdout1 = 4'b0000;
            r_bdout2 = bdin;
            r_bdout3 = 4'b0000;
        end
        2'b11: begin
            r_bdout0 = 4'b0000;
            r_bdout1 = 4'b0000;
            r_bdout2 = 4'b0000;
            r_bdout3 = bdin;
        end
        default: begin
            r_bdout0 = 4'b0000;
            r_bdout1 = 4'b0000;
            r_bdout2 = 4'b0000;
            r_bdout3 = 4'b0000;
        end
    endcase
end
assign bdout0 = r_bdout0;
assign bdout1 = r_bdout1;
assign bdout2 = r_bdout2;
assign bdout3 = r_bdout3;
endmodule

