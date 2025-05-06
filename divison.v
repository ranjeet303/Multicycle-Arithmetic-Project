module division (
    input  [3:0] divisor, dividend,
    output [3:0]  remainder,
    output [7:0]  tdiv
);

    reg [3:0] reg_tdiv, reg_remainder;
    reg [3:0] divisor_copy, dividend_copy;
    reg [3:0] temp;
    integer i;

    always @(*) begin
        
        divisor_copy   = divisor;
        dividend_copy  = dividend;
        temp           = 4'b0000;

        
        for (i = 0; i < 4; i = i + 1) begin
            temp = {temp[2:0], dividend_copy[3]};
            dividend_copy = {dividend_copy[2:0], 1'b0}; 

            temp = temp - divisor_copy;

            if (temp[3] == 1) begin
               
                temp = temp + divisor_copy;
                dividend_copy[0] = 1'b0;
            end else begin
              
                dividend_copy[0] = 1'b1;
            end
        end

        
        reg_tdiv = dividend_copy;
        reg_remainder = temp; 
    end

    assign tdiv     = {4'b0000,reg_tdiv};
    assign remainder = reg_remainder;

endmodule
