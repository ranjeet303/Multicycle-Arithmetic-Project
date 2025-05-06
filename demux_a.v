module demux_4to1_4bit (
    input wire [3:0] adin,       // 4-bit data input
    input wire [1:0] opcode,       // 2-bit select input
    output  [3:0] adout0,     // 4-bit output 0
    output  [3:0] adout1,     // 4-bit output 1
    output  [3:0] adout2,     // 4-bit output 2
    output  [3:0] adout3      // 4-bit output 3
);

          reg [3:0] r_adout0;    // 4-bit output 0
          reg [3:0] r_adout1;     // 4-bit output 1
          reg [3:0] r_adout2;    // 4-bit output 2
          reg [3:0] r_adout3 ;

always @(*) begin
    case (opcode)
        2'b00: begin
            r_adout0 = adin;
            r_adout1 = 4'b0000;
            r_adout2 = 4'b0000;
            r_adout3 = 4'b0000;
        end
        2'b01: begin
            r_adout0 = 4'b0000;
            r_adout1 = adin;
            r_adout2 = 4'b0000;
            r_adout3 = 4'b0000;
        end
        2'b10: begin
            r_adout0 = 4'b0000;
            r_adout1 = 4'b0000;
            r_adout2 = adin;
            r_adout3 = 4'b0000;
        end
        2'b11: begin
            r_adout0 = 4'b0000;
            r_adout1 = 4'b0000;
            r_adout2 = 4'b0000;
            r_adout3 = adin;
        end
        default: begin
            r_adout0 = 4'b0000;
            r_adout1 = 4'b0000;
            r_adout2 = 4'b0000;
            r_adout3 = 4'b0000;
        end
    endcase
end

assign adout0 = r_adout0;
assign adout1 = r_adout1;
assign adout2 = r_adout2;
assign adout3 = r_adout3;

endmodule