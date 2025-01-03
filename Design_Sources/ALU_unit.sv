`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// refer to ALU_Control.sv

//////////////////////////////////////////////////////////////////////////////////
module ALU_unit(input logic [31:0] A, input logic [31:0] B, input logic [3:0] Control_in, output reg [31:0] ALU_Result, output reg zero);
 always @(Control_in, A, B) begin
    case (Control_in)
      4'b0000: begin 
        zero <= 0; 
        ALU_Result <= A & B; 
      end
      4'b0001: begin 
        zero <= 0; 
        ALU_Result <= A | B; 
      end
      4'b0010: begin 
        zero <= 0; 
        ALU_Result <= A + B; 
      end
      4'b0110: begin 
        if (A == B) 
          zero <= 1; 
        else 
          zero <= 0; 
        ALU_Result <= A - B;
      end
      default: begin
        zero <= 0;
        ALU_Result <= 32'b0; 
      end
    endcase
  end

endmodule
