`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2024 01:14:52 AM
// Design Name: 
// Module Name: alu
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


module alu_8bit(
    input [7:0] alu8_in_a,
    input [7:0] alu8_in_b,
    input [2:0] alu8_sel,
    input sub,
    output [7:0] alu8_out
    );
endmodule

module add_8bit(
    input [7:0] a,
    input [7:0] b,
    input sub,
    output [8:0] add8_extra,    // msb for carry out and 8-bit sum
    output [7:0] add8_out,
    output cout,
    output c, z, s, p   // flag values
    );
    
    assign add8_extra = sub ? a + (~b + 1) : a + b;
    assign add8_out = add8_extra[7:0];
endmodule

module multiply_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] mul8_out
    );

    assign mul8_out = a * b;
endmodule

module divide_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] div8_out    
    );

    assign div8_out = a / b;
endmodule

module xor_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] xor8_out 
    );

    assign xor8_out = a ^ b;
endmodule

module or_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] or8_out
    );

    assign or8_out = a | b;
endmodule

module and_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] and8_out
    );

    assign and8_out = a & b;
endmodule

// One's compliment (flip bits)
module compliment_8bit(
    input [7:0] a,
    output [7:0] comp8_out
    );

    assign comp8_out = ~a;
endmodule

// Increment
module inc_8bit(
    input [7:0] a,
    output [7:0] inc8_out
    );
    assign inc8_out = a + 1;
endmodule

// Decrement
module dec_8bit(
    input [7:0] a,
    output [7:0] dec8_out
    );
    assign dec8_out = a - 1;
endmodule

// Logical shift left
module lsl_8bit(
    input [7:0] a,
    output [7:0] lsl8_out
    );
    assign lsl8_out = a << 1;
endmodule

// Logical shift right
module lsr_8bit(
    input [7:0] a,
    output [7:0] lsr8_out
    );
    assign lsr8_out = a >> 1;
endmodule

// Arithmetic shift left
module asl_8bit(
    input [7:0] a,
    output [7:0] asl8_out
    );
    assign asl8_out = a <<< 1;
endmodule

// Arithmetic shift right
module asr_8bit(
    input [7:0] a,
    output [7:0] asr8_out
    );
    assign asr8_out = a >>> 1;
endmodule

// Sets c, z, s, or p flags to a 0 or 1
module compare_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] cmp8_out,
    output z, c, o, s, p   // flag values
    );

    assign cmp8_out = a - b;
    // Zero flag, check if values equal
    assign z = (cmp8_out == 0) ? 1 : 0;
    // Carry flag, unsigned greater than or less than (a > b = 1, a < b = 0)
    assign c = (a > b) ? 1 : 0;
    // Overflow flag, 
    assign o = (cmp8_out < a | cmp8_out < b) ? 1 : 0;
    // Sign flag, MSB of result
    assign s = (cmp8_out[7] == 1) ? 1 : 0;
    // Parity flag, LSB or result
    assign p = (cmp8_out % 2 == 0) ? 1 : 0;    
endmodule