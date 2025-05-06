module top_alu(
    input clk, rst, go,
    input [3:0] A, B,
    input [1:0] opcode,
    output [6:0] seg,
    output [3:0] an,
    output [4:0] LED 
);
    wire [7:0] out;
    wire [3:0] remainder;
    wire done;

    wire ld_a, ld_b,  ld_out;

    datapath datapath1(
        .clk(clk),
        .rst(rst),
        .opcode(opcode),
        .A(A),
        .B(B),
        .ld_a(ld_a),
        .ld_b(ld_b),
       
        .ld_out(ld_out),
        .out(out),
        .remainder_out(remainder)
    );

    controller controller1(
        .clk(clk),
        .rst(rst),
        .go(go),
      
        .ld_a(ld_a),
        .ld_b(ld_b),
    
        .ld_out(ld_out),
        .done(done)
    );

  
    wire [3:0] digit3, digit2, digit1, digit0;

    bin_to_bcd conv(
        .binary(out[7:0]),
        .digit3(digit3),
        .digit2(digit2),
        .digit1(digit1),
        .digit0(digit0)
    );

    seven_seg_display ssd(
        .clk(clk),
        .rst(rst),
        .digit3(digit3),
        .digit2(digit2),
        .digit1(digit1),
        .digit0(digit0),
        .seg(seg),
        .an(an)
    );

   
    assign LED[3:0] = remainder;
       
   

    assign LED[4] = done;

endmodule


module bin_to_bcd(
    input [7:0] binary,
    output reg [3:0] digit3, digit2, digit1, digit0
);
    always @(*) begin
        digit3 = (binary / 1000) % 10;
        digit2 = (binary / 100) % 10;
        digit1 = (binary / 10) % 10;
        digit0 = binary % 10;
    end
endmodule


module seven_seg_display(
    input clk, rst,
    input [3:0] digit3, digit2, digit1, digit0,
    output reg [6:0] seg,
    output reg [3:0] an
);
    reg [15:0] refresh_counter = 0;
    wire [1:0] refresh_tick = refresh_counter[15:14];

    reg [3:0] current_digit;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            refresh_counter <= 0;
           
        end else begin
            refresh_counter <= refresh_counter + 1;
         
             
        end
    end

    always @(*) begin
        case (refresh_tick)
            2'b00: begin an = 4'b1110; current_digit = digit0; end
            2'b01: begin an = 4'b1101; current_digit = digit1; end
             2'b10: begin an = 4'b1011; current_digit = digit2; end 
             2'b11: begin an = 4'b0111; current_digit = digit3; end
            default: begin an = 4'b1111; current_digit = 4'b0000; end
        endcase
    end

    always @(*) begin
        case (current_digit)
            4'h0: seg = 7'b1000000;
            4'h1: seg = 7'b1111001;
            4'h2: seg = 7'b0100100;
            4'h3: seg = 7'b0110000;
            4'h4: seg = 7'b0011001;
            4'h5: seg = 7'b0010010;
            4'h6: seg = 7'b0000010;
            4'h7: seg = 7'b1111000;
            4'h8: seg = 7'b0000000;
            4'h9: seg = 7'b0010000;
         
            default: seg = 7'b1111111;
        endcase
    end
endmodule
