`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module Adder(input logic [31:0] in_1, input logic [31:0] in_2, output logic [31:0] Sum_out);
assign Sum_out = in_1 + in_2;
endmodule
