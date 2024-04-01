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
    output [8:0] add8_out,    // msb for carry out, 8-bit sum
    output cout,
    output c, z, s, p   // flag values
    );
    
    assign sum = sub ? a + (~b + 1) : a + b;
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

endmodule

module xor_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] xor8_out 
    );

endmodule

module or_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] or8_out
    );

endmodule

module and_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] and8_out
    );

endmodule

// One's compliment (flip bits)
module compliment_8bit(
    input [7:0] a,
    output [7:0] comp8_out
    );

endmodule

// Increment
module inc_8bit(
    input [7:0] a,
    output [7:0] inc8_out
    );

endmodule

// Decrement
module dec_8bit(
    input [7:0] a,
    output [7:0] dec8_out
    );

endmodule

// Logical shift left
module lsl_8bit(
    input [7:0] a,
    output [7:0] lsl8_out
    );

endmodule

// Logical shift right
module lsr_8bit(
    input [7:0] a,
    output [7:0] lsr8_out
    );

endmodule

// Arithmetic shift left
module asl_8bit(
    input [7:0] a,
    output [7:0] asl8_out
    );

endmodule

// Arithmetic shift right
module asr_8bit(
    input [7:0] a
    output [7:0] asr8_out
    );

endmodule

// Sets c, z, s, or p flags to a 0 or 1
module compare_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] cmp8_out
    );

endmodule