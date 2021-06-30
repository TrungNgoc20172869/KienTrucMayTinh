module Datapath (
 input logic RWen,
 input logic memRW,
 input logic bne_control,
 input logic beq_control,
 input logic jump,
 input logic clk, 
 input logic ALUsel,
 input logic [1:0] Immsel,
 input logic Asel,
 input logic Bsel,
 input logic [1:0] WBsel,
 input logic reset,
 
 output logic [31:0] instruction
);
logic [31:0] dataD;
 logic [31:0] pc_next;
 logic [31:0] dataR;
 logic [31:0]  pc;
 logic [4:0]    addrD; 
 logic [4:0]    addrA;
 logic [31:0]   dataA;
 logic [4:0]    addrB;
 logic [31:0]   dataB;
 logic [31:0]   Immediate;
 logic [31:0]  ALUresult;
 logic beq,bne;
 logic [31:0] jump_shift; 
 logic [31:0] inputA,inputB;
 /*
 initial begin 
 dataR = 32'd0;
 pc = 32'd0;
 addrA = 5'd0;
 addrB = 5'd0;
 addrD = 5'd0;
 dataA = 32'd0;
 dataB = 32'd0;
 dataD = 32'd0;
 Immediate = 32'd0;
 ALUresult = 32'd0;
 beq = 1'b0;
 bne = 1'b0;
 jump_shift = 32'd0;
 inputA = 32'd0;
 inputB = 32'd0;
 end
 */ 
assign jump_shift = {13'd0,instruction[31],instruction[19:12],instruction[30:21]};

assign Immediate = (Immsel == 2'b00 /*I type*/)?{{21 {instruction[31]}},instruction[30:20]}:(Immsel == 2'b01 /* S type*/)
 ?{{21{instruction[31]}},instruction[30:25],instruction[11:8],instruction[7]}:(Immsel == 2'b10)?
 /* B type*/{{20{instruction[31]}},instruction[7],instruction[30:25],instruction[11:8],1'b0}:jump_shift;
 
 assign inputA = (Asel == 1'b1)?pc:dataA;
 
 assign inputB = (Bsel == 1'b1)?Immediate:dataB;
 // Branch Comp 
 Branch_Comp BranchComp (.inputA(dataA),.inputB(dataB),.beq(beq),.bne(bne));
 
 // GENERAL PURPOSE REGISTERs
 Register Register
   (.RWen(RWen),
    .dataD(dataD),
    .dataB(dataB),
    .dataA(dataA),
	 .addrA(addrA),
	 .addrB(addrB),
	 .addrD(addrD)
	
   );
// instruction memory

IMEM  IMEM(.pc(pc),.instruction(instruction)/*,.reset(reset)*/);

// Data memory
DMEM DMEM 
 (
 
 .memRW(memRW),// =0 thi Read, = 1 thi Write
 .addr(ALUresult), // address to read data
 .DataW(dataB),// store word
 .DataR(dataR)
 );
  // ALU 
 ALU alu_unit(.inputA(inputA),.inputB(inputB),.ALUsel(ALUsel),.ALUresult(ALUresult));
 

 
 assign addrD = instruction [11:7];
 assign addrB = instruction[24:20];
 assign addrA = instruction[19:15];
 

 
 logic beq_jump;
 logic bne_jump;
 assign beq_jump = beq_control & beq;
 assign bne_jump = bne_control & bne;
 
 assign dataD = (WBsel == 2'b01)?ALUresult:((WBsel == 2'b00)?dataR:(pc+32'd4));
 
 always @(posedge clk or posedge reset)
 begin 
 if(reset) pc = 32'b0;
 else 
 pc = pc_next;
 end
 
 assign pc_next = reset?pc:((jump == 1'b1)?pc - Immediate:((beq_jump == 1'b1)?ALUresult:((bne_jump == 1'b1)?ALUresult:pc+32'd4)));
 
 
endmodule