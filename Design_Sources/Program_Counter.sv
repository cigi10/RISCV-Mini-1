`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Program Counter or PC for short : 
// Special register that contains the memory address of the next instruction to be performed/executed -> pointer in simple terms
// - if power is 0 -> its all 0; else if power is 1, then it points to the next instruction (acts as a pointer)
// - Branching : PC can point to different memory addresses based on condition ex. Branch if Equal (if the values stored in the 2 registers are the same, it does a specific operation, 
//  else it does something different)
//////////////////////////////////////////////////////////////////////////////////
module Program_Counter(input logic clk, input logic reset, input logic [31:0] PC_in, output logic [31:0] PC_out);

always @(posedge clk or posedge reset)
begin 
if(reset)
    PC_out <= 32'b00;
 else
    PC_out <= PC_in;
end

endmodule
