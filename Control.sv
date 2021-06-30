`timescale 1ns / 1ns
module Control(
input logic [31:0] instruction,

output logic beq_control,
output logic bne_control,

output logic jump, // =1 nếu là lệnh jump
output logic ALUsel,// dieu khien khoi ALU
output logic memRW,// dieu khien DMEM
output logic RWen,// register write enable
output logic Asel, // branch thì Asel = 0 else Asel = 1
Bsel, // Immediate thì Bsel = 1 else Bsel = 0
output logic [1:0] Immsel, // I là 00, S là 01, B là 10, J là 11
output logic [1:0] WBsel // 01 la ALU 00 là dataR 10 là Jump nên PC+4
);
logic [6:0]opcode;
assign opcode = instruction [6:0];
logic [2:0] funct3;
logic [6:0] funct7;
assign funct7 = instruction [31:25];
assign funct3 = instruction [14:12];
/*
initial begin 
opcode = 7'd0;
funct3 = 3'd0;
funct7 = 7'd0;
end*/ 
always @(*)
begin 
case(opcode)
7'b0110011: begin 
  if (funct7 == 0100000) begin // lệnh Add
		ALUsel = 1'b1; // add
		memRW = 1'b0; //tùy
		RWen = 1'b1; // có ghi dữ liệu vào rd
		Asel = 1'b0; // input A = dataA
		Bsel = 1'b0; // input B = dataB
		Immsel = 2'b11;// tùy ý
		jump = 1'b0;//
		beq_control = 1'b0;
		bne_control = 1'b0;
		WBsel = 2'b01;// addrD = ALUresult
		end
  else begin // lệnh Sub
		ALUsel = 1'b0; // sub 
		memRW = 1'b0; //tùy
		RWen = 1'b1; // có ghi dữ liệu vào rd
		Asel = 1'b0;//input A = dataA
		Bsel = 1'b0;//input B = dataB
		Immsel = 2'b11;// tùy ý
		jump = 1'b0;
		beq_control = 1'b0;
		bne_control = 1'b0;
		WBsel = 2'b01;// addrD = ALUresult
end
end
7'b0010011: begin // lệnh addi
      ALUsel = 1'b1; //add
		memRW = 1'b0; //tùy
		RWen = 1'b1; // có ghi dữ liệu vào rd
		#1 RWen = 1'b0;
		Asel = 1'b0;//input A = dataA
		Bsel = 1'b1;//input B = Immediate
		Immsel = 2'b00;// I-type
		jump = 1'b0;
		beq_control = 1'b0;
		bne_control = 1'b0;
		WBsel = 2'b01;// addrD = ALUresult
end
7'b0000011: begin // lw
		ALUsel = 1'b1; //add
		memRW = 1'b0; // read
		RWen = 1'b1; // có ghi dữ liệu vào rd
		Asel = 1'b0; //input A = dataA 
		Bsel = 1'b1; //input B = Immediate
		Immsel = 2'b00;// I type
		jump = 1'b0;
		beq_control = 1'b0;
		bne_control = 1'b0;
		WBsel = 2'b00;// addrD = dataR
end 
7'b0100011: begin  // sw
		ALUsel = 1'b1; //add
		memRW  = 1'b1; // write
		RWen   = 1'b0; // không ghi dữ liệu vào rd
		Asel = 1'b0; // inputA = dataA
		Bsel = 1'b1; // input B = Immediate
		Immsel = 2'b01;// S type
		jump = 1'b0;
		beq_control = 1'b0;
		bne_control = 1'b0;
		WBsel = 2'b01;// don't care
end
7'b1100011: begin 
if(funct3 == 3'b000 ) //beq
begin 
		ALUsel = 1'b1; //add
		memRW = 1'b1; // tùy
      RWen = 1'b0; // không ghi dữ liệu vào rd
		Asel = 1'b1; // inputA = pc 
		Bsel = 1'b1; // inputB = Immediate
		Immsel = 2'b10;// B-type
		jump = 1'b0; 
		beq_control = 1'b1;
		bne_control = 1'b0;
		WBsel = 2'b01;// don't care
end 
else begin  //bne
		ALUsel = 1'b1; //add
		memRW = 1'b1; // tùy
		RWen = 1'b0; // không ghi dữ liệu vào rd
		Asel = 1'b1; // inputA = pc
		Bsel = 1'b1;// inputB = Immediate
		Immsel = 2'b10;// B-type
		jump = 1'b0;
		beq_control = 1'b0;
		bne_control = 1'b1;
		WBsel = 2'b01;// don't care
end
end 
7'b1101111: begin // jal
		ALUsel = 1'b0; // sub
		memRW = 1'b0; // read
		RWen = 1'b1; // có ghi dữ liệu vào rd
		Asel = 1'b1; // inputA = pc
		Bsel = 1'b0; // input B = Immediate
		jump = 1'b1; //
		Immsel = 2'b11;
		beq_control = 1'b0;
		bne_control = 1'b0;
		WBsel = 2'b10;// dataD = PC + 4 
end
default: begin 
	ALUsel = 1'b1; // add
		memRW = 1'b0; //tùy
		RWen = 1'b1; // có ghi dữ liệu vào rd
		Asel = 1'b0; // input A = dataA
		Bsel = 1'b0; // input B = dataB
		Immsel = 2'b11;// tùy ý
		jump = 1'b0;//
		beq_control = 1'b0;
		bne_control = 1'b0;
		WBsel = 2'b01;// addrD = ALUresult
		end
endcase 
end 
endmodule 

  
