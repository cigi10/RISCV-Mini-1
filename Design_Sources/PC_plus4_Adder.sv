`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module PC_plus4_Adder(input logic [31:0] fromPC, output logic [31:0] nexttoPC);
assign nexttoPC = 4 + fromPC;
endmodule
