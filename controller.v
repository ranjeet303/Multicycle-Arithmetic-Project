module controller (
input clk,rst,go,

output reg ld_a, ld_b,  ld_out,
output reg done


);

parameter s0_idle= 4'b0000;
parameter s1_ld_ab= 4'b0001;
parameter s2_wait= 4'b0010;
// parameter s3_ld_add= 4'b0011;
//parameter s4_ld_sub= 4'b0100;
//parameter s5_wait= 4'b0101;
//parameter s6_wait= 4'b0110;
parameter s7_wait= 4'b0111;
parameter s8_ld_out= 4'b1000;



reg [3:0] ps,ns;

always @(posedge clk or posedge rst)
begin
    if(rst)
        ps <= s0_idle;
    else
        ps <=ns;
end 

always@(go or ps)
begin
    case(ps)
        s0_idle: ns = (go)? s1_ld_ab:s0_idle;
        s1_ld_ab: ns = s2_wait;
        s2_wait:  ns = s7_wait;
        /*begin
        case(opcode)
              2'b00 : ns = s3_ld_add;
              2'b01 : ns = s4_ld_sub;
              2'b10 : ns = s5_ld_mul;
              2'b11 : ns = s6_ld_div;
              default : ns = s2_wait;
              endcase
              end*/
              
        //s3_ld_add : ns =  s7_wait ;   
        //s4_ld_sub : ns =  s7_wait ; 
       // s5_wait : ns =  s6_wait ; 
       // s6_wait : ns =  s7_wait ; 
        
        s7_wait : ns = s8_ld_out;
        s8_ld_out : ns = s0_idle;
      
    default: ns = s0_idle;
    endcase
end

always @(ps)
begin
    case(ps)
        s0_idle:
                begin
                    ld_a = 0;
                    ld_b =0;
                    
                    ld_out=0;
                    done =0;
                end
        s1_ld_ab:begin
                    ld_a = 1;
                    ld_b =1;
                    
                    ld_out=0;
                    done =0;
                end
        s2_wait:begin
                    ld_a = 0;
                    ld_b =0;
                   
                    ld_out=0;
                    done =0;
                end
 
          /*  s5_wait:begin
                    ld_a = 0;
                    ld_b =0;
                   
                    ld_out=0;
                    done =0;
                end
              s3_ld_add:begin
                    ld_a = 0;
                    ld_b =0;
                    ld_add=1;
                    ld_sub=0;
                    ld_mul=0;
                    ld_div=0;
                    ld_out=0;
                    done =0;
                end
                s4_ld_sub:begin
                    ld_a = 0;
                    ld_b =0;
                    ld_add=0;
                    ld_sub=1;
                    ld_mul=0;
                    ld_div=0;
                    ld_out=0;
                    done =0;
                end
              s5_ld_mul:begin
                    ld_a = 0;
                    ld_b =0;
                    ld_add=0;
                    ld_sub=0;
                    ld_mul=1;
                    ld_div=0;
                    ld_out=0;
                    done =0;
                end  
                s6_wait:begin
                    ld_a = 0;
                    ld_b =0;
                    
                    ld_out=0;
                    done =0;
                end */
              s7_wait:begin
                    ld_a = 0;
                    ld_b =0;
                  
                    ld_out=0;
                    done =0;
                end
               s8_ld_out:begin
                    ld_a = 0;
                    ld_b =0;
                   
                    ld_out=1;
                    done =1;
                end
                 default : begin
                    ld_a = 0;
                    ld_b =0;
                  
                    ld_out=0;
                    done =0;
                end
           endcase
           end
           
endmodule