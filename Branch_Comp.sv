module Branch_Comp(
input logic [31:0] inputA,inputB,
output logic beq,bne);

always_comb
begin 
if(inputA == inputB) begin 
beq = 1'b1; bne = 1'b0;
end 

else begin 
beq = 1'b0; bne = 1'b1;
end 
end 
endmodule
