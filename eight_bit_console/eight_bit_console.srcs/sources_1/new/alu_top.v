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
    input [3:0] alu_sel,
    input [7:0] alu_in_a,
    input [7:0] alu_in_a_w,
    input [7:0] alu_in_b,
    input [7:0] alu_in_b_w,
    input alu_wide_sel,
    output [7:0] alu_out,
    input alu_out_w
    );
endmodule
