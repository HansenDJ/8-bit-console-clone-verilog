`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2024 05:05:31 PM
// Design Name: 
// Module Name: instruction_decoder
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


module instruction_decoder(
    input [31:0] op_parts,
    input [7:0] cur_flags,
    input [1:0] op_length,
    input is_dirty_op,
    output [3:1] part_dirty,
    output [11:0] sel_reg,
    output [3:0] sel_alu,
    output bit_mode,
    output jump_en,
    output [15:0] jump_addr,
    output mem_access,
    output pause_exec,
    output [7:0] new_flags
    );
endmodule
