// Ddmem
// contain data dmem
module DMEM (
input 	logic 			memRW,// =0 thi Read, = 1 thi Write
input 	logic [31:0]	addr, // address to read data
input 	logic [31:0] 	DataW,// data to write into dmem

output 	logic [31:0]	DataR // data read from dmem
);

logic [31:0] dmem[0:7]; // dmem, 8 index,32-bit

initial begin // initial value in dmem
dmem[0] =  32'd0;
dmem[1] =  32'd4;
dmem[2] =  32'd8;
dmem[3] =  32'd12;
dmem[4] =  32'd16;
dmem[5] =  32'd20;
dmem[6] =  32'd24;
dmem[7] =  32'd28;
end 

always@(*)
begin 
	if (memRW)// Write,store
		dmem[addr] = DataW;
	else // Read
		DataR     = dmem[addr];
	end
endmodule	


