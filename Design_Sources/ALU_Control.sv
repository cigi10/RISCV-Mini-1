`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// ALU Control Unit : 
// The ALU Control Unit generates control signals to configure the ALU for specific operations based on instruction type.

// - Inputs : `ALUOp` (operation type), `fun7`, and `fun3` (detailed operation codes).
// - Output : `Control_out` (4-bit signal to the ALU).

// It decodes inputs to determine the ALU operation (e.g., addition, subtraction, bitwise AND/OR) and ensures the ALU performs correctly for load/store, branch, or R-type instructions. 
// It connects the instruction decoder to the ALU, translating instruction fields into actionable control signals.

//////////////////////////////////////////////////////////////////////////////////

module ALU_Control(input logic fun7, input logic [2:0] fun3, input logic [1:0] ALUOp, output reg [3:0] Control_out);

  always @(*) begin
    case ({ALUOp, fun7, fun3})
      6'b00_0_000: Control_out <= 4'b0010;
      6'b01_0_000: Control_out <= 4'b0110;
      6'b10_0_000: Control_out <= 4'b0010;
      6'b10_1_000: Control_out <= 4'b0110;
      6'b10_0_111: Control_out <= 4'b0000;
      6'b10_0_110: Control_out <= 4'b0001;
      default: Control_out <= 4'b1111;
    endcase
  end

endmodule
