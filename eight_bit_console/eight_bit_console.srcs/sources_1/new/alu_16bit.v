`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2024 05:37:59 PM
// Design Name: 
// Module Name: alu_16bit
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


module alu_16bit(
    input [7:0] alu16_in_a,
    input [7:0] alu16_in_a_w,
    input [7:0] alu16_in_b,
    input [7:0] alu16_in_b_w,
    input [3:0] alu16_sel, // Selector of ALU function
    input sub,
    output [7:0] alu16_out,
    output [7:0] alu16_out_w,
    output [7:0] flags_out // o, p, s, z, c flags
    );
    
    wire alu_in_a_full;
    wire alu_in_b_full;
    wire alu_out_full; // alu16_out and alu16_out_w concatenated
    
    wire add_out;
    wire sub_out;
    wire inc_out;
    wire dec_out;
    wire cmp_out;
    wire lea_out;
    
    assign alu_in_a_full = {alu16_in_a, alu16_in_a_w};
    assign alu_in_b_full = {alu16_in_b, alu16_in_b_w};
    
    add_16bit add16 (alu16_in_a, alu16_in_b, sub, add_out);
endmodule

module add_16bit(
    input [15:0] a,
    input [15:0] b,
    input sub,
    output [16:0] add16_extra,    // msb for carry out, 16-bit sum
    output [15:0] add16_out,
    output cout,
    output c, z, s, p   // flag values
    );
    
    assign add16_extra = sub ? a + (~b + 1) : a + b;
    assign add16_out = add16_extra[7:0];
    
    // Overflow flag
    assign o = (add16_out < a | add16_out < b) ? 1 : 0;
    // Parity flag, LSB or result
    assign p = add16_out[0];
    // Sign flag, MSB of result
    assign s = add16_out[15];
    // Zero flag, check if values equal
    assign z = (add16_out == 0) ? 1 : 0;
    // Carry flag
    assign c = add16_extra[16];
endmodule

// Increment
module inc_16bit(
    input [15:0] a,
    output [15:0] inc16_out
    );
    assign inc16_out = a + 1;
endmodule

// Decrement
module dec_16bit(
    input [15:0] a,
    output [15:0] dec16_out
    );
    assign dec16_out = a - 1;
endmodule

// Sets c, z, s, or p flags to a 0 or 1
module cmp_16bit(
    input [15:0] a,
    input [15:0] b,
    output [15:0] cmp16_out,
    output c, z, s, p   // flag values
    );

    assign cmp16_out = a - b;
    // Zero flag, check if values equal
    assign z = (cmp16_out == 0) ? 1 : 0;
    // Carry flag, unsigned greater than or less than (a > b = 1, a < b = 0)
    assign c = (a > b) ? 1 : 0;
    // Overflow flag, 
    assign o = (cmp16_out < a | cmp16_out < b) ? 1 : 0;
    // Sign flag, MSB of result
    assign s = (cmp16_out[15] == 1) ? 1 : 0;
    // Parity flag, LSB or result
    assign p = (cmp16_out % 2 == 0) ? 1 : 0;  
endmodule

module lea_16bit(
    input wire [15:0] base_address, // 16-bit LEA instruction
    input wire [15:0] index, // Base address (from register)
    input wire [3:0] i_multiplier, // Index Shift Multiplier
    input wire [7:0] offset, // Offset
    output wire [15:0] lea16_out // Computed effective address
    );

    // Compute effective address
    assign lea16_out = base_address + (index << i_multiplier) + offset; // Multiply offset by 4
endmodule