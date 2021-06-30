module IMEM (
//input logic reset,
input logic [31:0]pc,

output logic [31:0] instruction);

logic [31:0] imem[0:7];// 8 instruction

initial begin 
imem[0] = 32'b000000000000_01100_010_01010_0000011;//lw x10,0(x12)
//x10 = dmem[0] = 0
imem[1] = 32'b000000000100_01100_010_01101_0000011;//lw x13,4(x12); 
//x13 = 16
imem[2] = 32'b000000000100_01010_000_01010_0010011;//Loops: addi x10, x10,4 
//x10 = x10 + 4 = 4/8/12/16/
imem[3] = 32'b0000000_01101_01010_000_01000_1100011;// beq x13,x10,End
// if x13 = x10, pc_next = pc + Immediate
// Immediate = 8
// else pc = pc + 4
imem[4] = 32'b0_0000001000_0_00000000_00101_1101111; // jal x5, Loop
//x5 = pc +4 = 20
// Immediate = 8 bytes
// pc = pc - Immediate
imem[5] = 32'b0000000_01010_01100_010_00001_0100011;	//	End:sw x10,1(x12) 
//dmem[0] = x10 
end

always @ (*)
begin 
//if(reset) instruction = imem[0];
//else 
instruction = imem[pc/4];// 1 lenh 4 byte
end 

endmodule