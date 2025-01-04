`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//Instruction Memory or IM for short :
// -> The Instruction Memory (IM) is a part of the CPU that holds all the instructions the processor needs to execute.
// -> It works like a factory assembly line where the PC tells the system what to fetch, the PC Decoder translates the request, INBUF ensures smooth input, IM Storage retrieves the requested instruction, and OUTBUF delivers it to the CPU.
// -> - All memory-related elements (like registers and buffers) operate based on a clock signal (clka).
//    - This clock synchronizes operations, ensuring all components work in harmony.

//////////////////////////////////////////////////////////////////////////////////
module Instruction_Memory(
    input logic clk,
    input logic reset,
    input logic [31:0] read_address,
    output logic [31:0] instruction_out
);
    // Instruction memory array
    reg [31:0] I_Mem[63:0];
    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Initialize memory to zero on reset
            for (i = 0; i < 64; i = i + 1) begin
                I_Mem[i] <= 32'b0;
            end

            // Load instructions into memory
            I_Mem[0]  <= 32'b00000000000000000000000000000000; // No operation (NOP)
            // R-type: add x13, x16, x25
            I_Mem[4]  <= 32'b0000000_11001_10000_000_01101_0110011; 
            // R-type: sub x5, x8, x3
            I_Mem[8]  <= 32'b0100000_00011_01000_000_00101_0110011; 
            // R-type: and x1, x2, x3
            I_Mem[12] <= 32'b0000000_00011_00010_111_00001_0110011; 
            // R-type: or x4, x3, x5
            I_Mem[16] <= 32'b0000000_00101_00011_110_00100_0110011; 
            // I-type: addi x22, x21, 3
            I_Mem[20] <= 32'b000000000011_10101_000_10110_0010011; 
            // I-type: ori x9, x8, 1
            I_Mem[24] <= 32'b000000000001_01000_110_01001_0010011; 
            // L-type: lw x8, 15(x5)
            I_Mem[28] <= 32'b0000000001111_00101_010_01000_0000011; 
            // L-type: lw x9, 3(x3)
            I_Mem[32] <= 32'b000000000011_00011_010_01001_0000011; 
            // S-type: sw x15, 12(x5)
            I_Mem[36] <= 32'b0000000_01111_00101_010_01100_0100011; 
            // S-type: sw x14, 10(x6)
            I_Mem[40] <= 32'b0000000_01110_00110_010_01010_0100011; 
            // SB-type: beq x9, x9, 12
            I_Mem[44] <= 32'b0000000_01001_01001_000_01100_1100011;
        end
    end
    // Output the instruction at the given read address
    always @(posedge clk) begin
        instruction_out <= I_Mem[read_address[31:2]]; // Address divided by 4 (word-aligned)
    end
endmodule

