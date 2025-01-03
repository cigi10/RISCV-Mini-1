`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Immediate Generator or ImmGen in this case :
// Immediate Generator is responsible for extracting and processing immediate values from the instruction format. 
// Immediate values are constants that are encoded directly within machine instructions, and they can be used in various operations such as arithmetic or logical operations.

// The Immediate Generator interprets the opcode (operation code) and extracts the appropriate immediate value (often from specific bits in the instruction). 
// It also processes this immediate value, such as performing sign extension, before passing it on to other parts of the processor.

//////////////////////////////////////////////////////////////////////////////////


module ImmGen(input logic [6:0] Opcode, input logic [31:0] instruction, output logic [31:0] ImmExt);
always @(*)
begin 
case(Opcode)
7'b000_0011 : ImmExt = {{20{instruction[31]}}, instruction[31:20]}; // make 20 copies of the MSB, snd then concatinate it w the next : go down to 20 , why? check I-type figure immediate is till 20
// how did we get 000_0011 you ask? Id I[0] to I[6] check the values : you get 000_0011
7'b010_0011 : ImmExt = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
7'b110_0011 : ImmExt = {{19{instruction[31]}}, instruction[31], instruction[30:25], instruction[11:8], 1'b0}; // if 4:0 ~ 11:7, then 4:1 ~ 11:8 
endcase
end
endmodule   
