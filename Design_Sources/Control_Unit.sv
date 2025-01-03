`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Control Unit :
// The Control Unit (CU) in a CPU manages the execution of instructions by generating control signals that direct the processor's components (e.g., ALU, registers, memory). 
// It fetches, decodes, and executes instructions, coordinating data flow and operations within the CPU. 
// There are two types of CU: Hardwired, which uses fixed logic circuits, and Micro programmed, which uses a program to generate control signals.

//////////////////////////////////////////////////////////////////////////////////
module Control_Unit(input [6:0] instruction, output reg Branch, output reg MemRead, output reg MemtoReg, output reg MemWrite, output reg ALUSrc, output reg RegWrite, output reg [1:0] ALUOp);

always @(*) begin
    case (instruction)
        7'b0110011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = {1'b0, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 2'b01};   // ALU operation for R-type (register-register)
        7'b0000011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = {1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0, 2'b00};  // Load instruction (immediate to register)
        7'b0100011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = {1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 2'b00};  // Store instruction (memory write)
        7'b1100011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 2'b01};  // Branch instruction (conditional branch)
        default: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 2'b00};  // Default case (no operation)
    endcase
end

endmodule
