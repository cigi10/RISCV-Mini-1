`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//Instruction Memory or IM for short :
// -> The Instruction Memory (IM) is a part of the CPU that holds all the instructions the processor needs to execute.
// -> It works like a factory assembly line where the PC tells the system what to fetch, the PC Decoder translates the request, INBUF ensures smooth input, IM Storage retrieves the requested instruction, and OUTBUF delivers it to the CPU.
// -> - All memory-related elements (like registers and buffers) operate based on a clock signal (clka).
//    - This clock synchronizes operations, ensuring all components work in harmony.

//////////////////////////////////////////////////////////////////////////////////


module Instruction_Memory(input logic clk, input logic reset, input logic [31:0] read_address, output logic [31:0] instruction_out);
reg [31:0] I_Mem[63:0];
integer i;
always @(posedge clk or posedge reset)
begin 
if(reset)
    begin 
        for(i=0; i<64; i=i+1)
            begin
            I_Mem[i] <= 32'b00;
            end
end
else 
instruction_out <= I_Mem[read_address];
end
endmodule
