module ALU (

input logic [31:0]inputA,
input logic [31:0]inputB,

input logic ALUsel,

output logic [31:0] ALUresult

);

always_comb 
begin
if(ALUsel)
ALUresult = inputA + inputB;
else 
ALUresult = inputA - inputB;
end 
endmodule

