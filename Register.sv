`timescale 1ns/1ns
module Register 
(input logic [4:0] addrA,// dia chi ghi du lieu dataB vao
input logic [4:0] addrB,// dia chi ghi du lieu dataA vao

input logic [31:0] dataD,// du lieu ghi vao addrD
input logic [4:0] addrD, // dia chi ghi du lieu dataD vao

input logic RWen,// = 1 thi co ghi du lieu vao thanh ghi


output logic [31:0] dataA,// du lieu ghi vao addrA
output logic [31:0] dataB// du lieu ghi vao addrB

)
;
// 32 thanh ghi x0-x31 32bit
logic [31:0] x0;
logic [31:0] x1;
logic [31:0] x2;
logic [31:0] x3;
logic [31:0] x4;
logic [31:0] x5;
logic [31:0] x6;
logic [31:0] x7;
logic [31:0] x8;
logic [31:0] x9;
logic [31:0] x10;
logic [31:0] x11;
logic [31:0] x12;
logic [31:0] x13;
logic [31:0] x14;
logic [31:0] x15;
logic [31:0] x16;
logic [31:0] x17;
logic [31:0] x18;
logic [31:0] x19;
logic [31:0] x20;
logic [31:0] x21;
logic [31:0] x22;
logic [31:0] x23;
logic [31:0] x24;
logic [31:0] x25;
logic [31:0] x26;
logic [31:0] x27;
logic [31:0] x28;
logic [31:0] x29;
logic [31:0] x30;
logic [31:0] x31;

initial begin 
x1 = 32'd0;
x2 = 32'd0;
x3 = 32'd0;
x4 = 32'd0;
x5 = 32'd0;
x6 = 32'd0;
x7 = 32'd0;
x8 = 32'd0;
x9 = 32'd0;
x10 = 32'd0;
x11 = 32'd0;
x12 = 32'd0;
x13 = 32'd0;
x14 = 32'd0;
x15 = 32'd0;
x16 = 32'd0;
x17 = 32'd0;
x18 = 32'd0;
x19 = 32'd0;
x20 = 32'd0;
x21 = 32'd0;
x22 = 32'd0;
x23 = 32'd0;
x24 = 32'd0;
x25 = 32'd0;
x26 = 32'd0;
x27 = 32'd0;
x28 = 32'd0;
x29 = 32'd0;
x30 = 32'd0;
x31 = 32'd0;
x0 = 32'd0;
end

always @ (*)
begin 
if(RWen) begin 
#2
case(addrD)
5'd0:x0 = 0;
5'd1:x1 = dataD;
5'd2:x2 = dataD;
5'd3:x3 = dataD;
5'd4:x4 = dataD;
5'd5:x5 = dataD;
5'd6:x6 = dataD;
5'd7:x7 = dataD;
5'd8:x8 = dataD;
5'd9:x9 = dataD;
5'd10:x10 = dataD;
5'd11:x11 = dataD;
5'd12:x12 = dataD;
5'd13:x13 = dataD;
5'd14:x14 = dataD;
5'd15:x15 = dataD;
5'd16:x16 = dataD;
5'd17:x17 = dataD;
5'd18:x18 = dataD;
5'd19:x19 = dataD;
5'd20:x20 = dataD;
5'd21:x21 = dataD;
5'd22:x22 = dataD;
5'd23:x23 = dataD;
5'd24:x24 = dataD;
5'd25:x25 = dataD;
5'd26:x26 = dataD;
5'd27:x27 = dataD;
5'd28:x28 = dataD;
5'd29:x29 = dataD;
5'd30:x30 = dataD;
5'd31:x31 = dataD;
endcase
end
end 

always @(*)
begin 
case(addrA)
5'd0:dataA = x0;
5'd1:dataA = x1;
5'd2:dataA = x2;
5'd3:dataA = x3;
5'd4:dataA = x4;
5'd5:dataA = x5;
5'd6:dataA = x6;
5'd7:dataA = x7;
5'd8:dataA = x8;
5'd9:dataA = x9;
5'd10:dataA = x10;
5'd11:dataA = x11;
5'd12:dataA = x12;
5'd13:dataA = x13;
5'd14:dataA = x14;
5'd15:dataA = x15;
5'd16:dataA = x16;
5'd17:dataA = x17;
5'd18:dataA = x18;
5'd19:dataA = x19;
5'd20:dataA = x20;
5'd21:dataA = x21;
5'd22:dataA = x22;
5'd23:dataA = x23;
5'd24:dataA = x24;
5'd25:dataA = x25;
5'd26:dataA = x26;
5'd27:dataA = x27;
5'd28:dataA = x28;
5'd29:dataA = x29;
5'd30:dataA = x30;
5'd31:dataA = x31;	
endcase
end

always@(*)
begin 
case(addrB)
5'd0:dataB = x0;
5'd1:dataB = x1;
5'd2:dataB = x2;
5'd3:dataB = x3;
5'd4:dataB = x4;
5'd5:dataB = x5;
5'd6:dataB = x6;
5'd7:dataB = x7;
5'd8:dataB = x8;
5'd9:dataB = x9;
5'd10:dataB = x10;
5'd11:dataB = x11;
5'd12:dataB = x12;
5'd13:dataB = x13;
5'd14:dataB = x14;
5'd15:dataB = x15;
5'd16:dataB = x16;
5'd17:dataB = x17;
5'd18:dataB = x18;
5'd19:dataB = x19;
5'd20:dataB = x20;
5'd21:dataB = x21;
5'd22:dataB = x22;
5'd23:dataB = x23;
5'd24:dataB = x24;
5'd25:dataB = x25;
5'd26:dataB = x26;
5'd27:dataB = x27;
5'd28:dataB = x28;
5'd29:dataB = x29;
5'd30:dataB = x30;
5'd31:dataB = x31;	
endcase
end

endmodule


 