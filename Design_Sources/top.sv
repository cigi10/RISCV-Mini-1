`timescale 1ns / 1ps 

//////////////////////////////////////////////////////////////////////////////////

//All modules instantiate here

module top(input logic clk, input logic reset);
wire [31:0] PC_top;
wire [31:0] instruction_top;
wire [31:0] Rd1_top;
wire [31:0] Rd2_top;
wire [31:0] ImmExt_top;
wire [31:0] mux1_top;
wire [31:0] Sum_out_top;
wire [31:0] nexttoPC_top;
wire [31:0] PCin_top;
wire [31:0] address_top;
wire [31:0] Memdata_top;
wire [31:0] writeBack_top;
wire RegWrite_top;
wire ALUSrc_top;
wire zero_top;
wire branch_top;
wire sel2_top;
wire MemtoReg_top;
wire MemWrite_top;
wire MemRead_top;
wire [1:0] ALUOp_top;
wire [3:0] control_top;

//Program Counter
Program_Counter PC(.clk(clk), .reset(reset), .PC_in(PCin_top), .PC_out(PC_top));
//+4 Adder
PC_plus4_Adder PC_Adder(.fromPC(PC_top) , .nexttoPC(nexttoPC_top));
//Instruction Memory
Instruction_Memory Inst_Memory(.clk(clk), .reset(reset), .read_address(PC_top), .instruction_out());
//Register File
Reg_File Reg_File(.clk(clk), .reset(reset), .RegWrite(RegWrite_top), .Rs1(instruction_top[19:15]), .Rs2(instruction_top[24:20]), .Rd(instruction_top[11:7]), .Write_data(writeBack_top), .read_data1(Rd1_top), .read_data2(Rd2_top));
//Immediate Generator
ImmGen ImmGen(.Opcode(instruction_top[6:0]), .instruction(instruction_top) , .ImmExt(ImmExt_top));
//Control Unit
Control_Unit Control_Unit(.instruction(instruction_top[6:0]), .Branch(branch_top), .MemRead(MemRead_top), .MemtoReg(MemtoReg_top), .MemWrite(MemWrite_top), .ALUSrc(ALUSrc_top), .RegWrite(),.ALUOp(ALUOp_top));
//ALU Control
ALU_Control ALU_Control(.fun7(instruction_top[30]), .fun3(instruction_top[14:12]), .ALUOp(ALUOp_top) , .Control_out());
//ALU
ALU_unit ALU(.A(Rd1_top), .B(mux1_top), .Control_in() , .ALU_Result(address_top), .zero(zero_top));
//ALU Mux
Mux1 ALU_mux1(.sel1(ALUSrc_top), .A1(Rd2_top) , .B1(ImmExt_top) , .Mux1_out(mux1_top));
//Adder
Adder Adder(.in_1(PC_top) , .in_2(ImmExt_top), .Sum_out(Sum_out_top));
//And Gate
AND_logic AND(.branch(branch_top), .zero(zero_top), .and_out(sel2_top));
//Adder Mux 
Mux2 Adder_mux(.sel2(sel2_top), .A2(nexttoPC_top) , .B2(Sum_out_top) , .Mux2_out(PCin_top));
// Data Memory
Data_Memory Data_mem(.clk(clk), .reset(reset), .MemWrite(MemWrite_top), .MemRead(MemRead_top), .read_address(address_top), .Write_data(Rd2_top) , .MemData_out(Memdata_top));
//Memory Mux
Mux3 Memory_mux(.sel3(MemtoReg_top), .A3(address_top) , .B3(Memdata_top) , .Mux3_out(writeBack_top));

endmodule
