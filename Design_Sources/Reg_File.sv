`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Register File
// Simply put, a collection of registers is a register file. Registers are small, fast memory storage units that hold data.
// A register file allows the CPU to quickly read from or write to any of the registers.

//////////////////////////////////////////////////////////////////////////////////


module Reg_File(input logic clk, input logic reset, input logic RegWrite, input logic [4:0] Rs1, input logic [4:0] Rs2, input logic [4:0] Rd, input logic [31:0] Write_data, output logic [31:0] read_data1, output logic [31:0] read_data2);
reg [31:0] Registers [31:0];
integer i;
always @(posedge clk or posedge reset)
begin
if(reset)
begin 
    for(i =0; i<32; i=i+1)
    begin
    Registers[i] <= 32'b00;
    end
end
else if(RegWrite)
begin
    Registers[Rd] <= Write_data;
end
end
assign read_data1 = Registers[Rs1];
assign read_data2 = Registers[Rs2];
endmodule
