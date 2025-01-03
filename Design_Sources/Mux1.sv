`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module Mux1(input logic sel1, input logic [31:0] A1,input logic [31:0] B1,output logic [31:0] Mux1_out);
assign Mux1_out = (sel1==1'b0) ? A1: B1;
endmodule
