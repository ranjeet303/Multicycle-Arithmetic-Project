module adder_m (
    input  wire [3:0] adout0, bdout0,  // 4-bit inputs
    output wire [7:0] tadd             // 8-bit total sum output
);

    wire [3:0] A, B;
    wire [3:0] S;                      // Sum bits
    wire [3:0] G, P;                   // Generate and Propagate
    wire [4:0] C;                      // Carry bits

    assign A = adout0;
    assign B = bdout0;

    assign G = A & B;
    assign P = A ^ B;

    assign C[0] = 1'b0;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);

    assign S[0] = P[0] ^ C[0];
    assign S[1] = P[1] ^ C[1];
    assign S[2] = P[2] ^ C[2];
    assign S[3] = P[3] ^ C[3];

    assign tadd = {3'b000, C[4], S};  // Output is 8-bit: 2 MSB zeros + carry + 4-bit sum

endmodule
