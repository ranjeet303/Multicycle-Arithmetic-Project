module mux_4to1_8bit (
    input  wire [7:0] in0,
    input  wire [7:0] in1,
    input  wire [7:0] in2,
    input  wire [7:0] in3,
    input  wire [1:0] opcode,     // Select line
    output   [7:0] tout         // Output
);
     reg [7:0] out;
    always @(*) begin
        case (opcode)
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            2'b11: out = in3;
            default: out = 8'b00000000;
        endcase
    end
    assign tout = out ;

endmodule
