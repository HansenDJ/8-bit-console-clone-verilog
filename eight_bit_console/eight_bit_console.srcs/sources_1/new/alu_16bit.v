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
    input [15:0] alu16_in_a,
    input [15:0] alu16_in_b,
    input [4:0] alu16_sel,
    input sub,
    output [15:0] alu16_out
    );
endmodule

module add_16bit(
    input [15:0] a,
    input [15:0] b,
    input sub,
    output [16:0] add16_out,    // msb for carry out, 16-bit sum
    output cout,
    output c, z, s, p   // flag values
    );
    
    assign sum = sub ? a + (~b + 1) : a + b;
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
module compare_16bit(
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