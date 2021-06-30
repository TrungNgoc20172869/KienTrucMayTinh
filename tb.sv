`timescale 1ns/1ns
module tb;

logic clk;
logic reset;

RiscV_core DUT(.clk(clk),.reset(reset));
initial begin 
clk = 0;
forever #5 clk = ~clk;
end 

initial begin 
reset = 0;
#5 reset = 1;
#2 reset = 0;
end

endmodule