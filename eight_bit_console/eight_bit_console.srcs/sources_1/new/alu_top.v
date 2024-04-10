`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2024 12:58:55 AM
// Design Name: 
// Module Name: alu_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_top(
    input wide_enable,
    input [3:0] alu_sel,
    input [7:0] alu_in_a,
    input [7:0] alu_in_a_w, // Wide mode: 1st register pair
    input [7:0] alu_in_b,
    input [7:0] alu_in_b_w, // Wide mode: 2nd register pair
    output [7:0] alu_out, // Lower 8-bits of output
    input [7:0] alu_out_w // Upper 8-bits of output
    );
endmodule
