module RiscV_core(
input logic clk,
input logic reset);

logic bne_control;
logic beq_control;
logic jump;
logic RWen;
logic memRW;
logic ALUsel;
logic [1:0] Immsel;
logic Asel;
logic Bsel;
logic [1:0]WBsel;
logic [31:0] instruction;


Datapath DU(
 .RWen(RWen),
 .memRW(memRW),
 .bne_control(bne_control),
 .beq_control(beq_control),
 .jump(jump),
 .clk(clk),
 .reset(reset), 
 .ALUsel(ALUsel),
 .Immsel(Immsel),
 .Asel(Asel),
 .Bsel(Bsel),
 .WBsel(WBsel),
 .instruction(instruction)
 );
Control Ctrl(
 .memRW(memRW),
 .RWen(RWen),
 .bne_control(bne_control),
 .beq_control(beq_control),
 .jump(jump), 
 .ALUsel(ALUsel),
 .Immsel(Immsel),
 .Asel(Asel),
 .Bsel(Bsel),
 .WBsel(WBsel),
 .instruction(instruction)
);

endmodule
