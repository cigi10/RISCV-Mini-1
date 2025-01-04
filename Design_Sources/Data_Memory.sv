`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Data Memory :
// Data memory in micro controllers stores data during execution and includes volatile SRAM for temporary storage and non-volatile EEPROM for persistent data. 
// SRAM is fast but loses data when powered off, while EEPROM retains data and supports byte-level read/write. 
// Sizes vary by model, with PIC16F offering up to 368 bytes of SRAM and 256 bytes of EEPROM.

//////////////////////////////////////////////////////////////////////////////////
    module Data_Memory(input logic clk, input logic reset, input logic MemWrite, input logic MemRead, input logic [31:0] read_address, input logic [31:0] Write_data, output logic [31:0] MemData_out);
      reg [31:0] D_Memory [63:0];
      integer i;
      always @(posedge clk or posedge reset) begin
        if (reset) begin
          for (i = 0; i < 64; i = i + 1) begin
            D_Memory[i] <= 32'hEEEEEEEE; 
          end
        end else if (MemWrite) begin
          D_Memory[read_address] <= Write_data; 
        end
      end
    
      assign MemData_out = (MemRead) ? D_Memory[read_address] : 32'b00;
    
    endmodule
