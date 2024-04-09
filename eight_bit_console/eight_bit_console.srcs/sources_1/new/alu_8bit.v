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
    input [3:0] alu8_sel, // Selector of ALU function
    input sub,
    output reg [7:0] alu8_out,
    output reg [7:0] flags_out // o, p, s, z, c flags
    );
    
    // ALU function outputs
    wire add_out;
    wire sub_out;
    wire mul_out;
    wire div_out;
    wire xor_out;
    wire or_out;
    wire and_out;
    wire not_out;
    wire inc_out;
    wire dec_out;
    wire lsl_out;
    wire lsr_out;
    wire asl_out;
    wire asr_out;
    wire cmp_out;
    
    // Flag outputs from functions
    wire add_flags_out;
    wire sub_flags_out;
    wire mul_flags_out;
    wire div_flags_out;
    wire xor_flags_out;
    wire or_flags_out;
    wire and_flags_out;
    wire not_flags_out;
    wire inc_flags_out;
    wire dec_flags_out;
    wire lsl_flags_out;
    wire lsr_flags_out;
    wire asl_flags_out;
    wire asr_flags_out;
    
    // Instantiate function modules
    add_8bit add8 (alu8_in_a, alu8_in_b, sub, add8_out, add_flags_out);
    mul_8bit mul8 (alu8_in_a, alu8_in_b, sub, mul8_out, sub_flags_out);
    div_8bit div8 (alu8_in_a, alu8_in_b, sub, div8_out);
    xor_8bit xor8 (alu8_in_a, alu8_in_b, sub, xor8_out);
    or_8bit or8 (alu8_in_a, alu8_in_b, sub, or8_out);
    and_8bit and8 (alu8_in_a, alu8_in_b, sub, and8_out);
    not_8bit not8 (alu8_in_a, sub, not8_out);
    inc_8bit inc8 (alu8_in_a, sub, inc8_out);
    dec_8bit dec8 (alu8_in_a, sub, dec8_out);
    lsl_8bit lsl8 (alu8_in_a, sub, lsl8_out);
    lsr_8bit lsr8 (alu8_in_a, sub, lsr8_out);
    asl_8bit asl8 (alu8_in_a, sub, asl8_out);
    asr_8bit asr8 (alu8_in_a, sub, asr8_out);
    cmp_8bit cmp8 (alu8_in_a, alu8_in_b, sub, cmp8_out);
    
    // Demultiplexer: Connect function wires to ALU output
    always @ (*) begin
        case (alu8_sel) // Addition function
            4'h0: alu8_out = add_out;
            4'h1: alu8_out = sub_out;
            4'h2: alu8_out = mul_out;
            4'h3: alu8_out = div_out;
            4'h4: alu8_out = xor_out;
            4'h5: alu8_out = or_out;
            4'h6: alu8_out = and_out;
            4'h7: alu8_out = not_out;
            4'h8: alu8_out = inc_out;
            4'h9: alu8_out = dec_out;
            4'ha: alu8_out = lsl_out;
            4'hb: alu8_out = lsr_out;
            4'hc: alu8_out = asl_out;
            4'hd: alu8_out = asr_out;
            4'he: flags_out = cmp_out;
        endcase
    end
endmodule

// Addition and subtraction
module add_8bit(
    input [7:0] a,
    input [7:0] b,
    input sub,
    output [7:0] add8_out,
    output cout,
    output add_flags_out
    );
    
    wire [8:0] add8_extra; // msb for carry out, 8-bit sum
    wire o, p, s, z, c;   // flag values
    
    assign add8_extra = sub ? a + (~b + 1) : a + b; // Addition operation
    assign add8_out = add8_extra[7:0];
    
    assign o = (add8_out < a | add8_out < b) ? 1 : 0; // Overflow flag
    assign p = add8_out[0]; // Parity flag, LSB or result
    assign s = add8_out[7]; // Sign flag, MSB of result
    assign z = (add8_out == 0) ? 1 : 0; // Zero flag, check if values equal
    assign c = add8_extra[8]; // Carry flag
    assign add_flags_out = {o, p, s, z, c}; // Flags bitmask to be ANDed with flag register
endmodule

// Multiply
module mul_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] mul8_out
    );

    assign mul8_out = a * b;
    
    // Overflow flag, 
    assign o = (mul8_out < a | mul8_out < b) ? 1 : 0;
    // Parity flag, LSB or result
    assign p = mul8_out[0];
    // Sign flag, MSB of result
    assign s = mul8_out[7];
    // Zero flag, check if values equal
    assign z = (mul8_out == 0) ? 1 : 0;
    // Carry flag
    assign c = mul8_out[8];
    // Flags bitmask to be ANDed with flag register
    assign mul_flags_out = {o, p, s, z, c};
endmodule

// Divide
module div_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] div8_out    
    );

    assign div8_out = a / b;
endmodule

// Bitwise Exclusive-OR operation
module xor_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] xor8_out 
    );

    assign xor8_out = a ^ b;
endmodule

// Bitwise OR operation
module or_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] or8_out
    );

    assign or8_out = a | b;
endmodule

// AND binary operation
module and_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] and8_out
    );

    assign and8_out = a & b;
endmodule

// Bitwise NOT operation
module not_8bit(
    input [7:0] a,
    output [7:0] not8_out
    );

    assign not8_out = ~a;
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

// Compare - sets o, p, s, z, or c flags to a 1 or 0
module cmp_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] cmp8_out,
    output o, p, s, z, c   // flag values
    );

    assign cmp8_out = a - b;
    
    // Overflow flag
    assign o = (cmp8_out < a | cmp8_out < b) ? 1 : 0;
    // Parity flag, LSB or result
    assign p = cmp8_out[0];
    // Sign flag, MSB of result
    assign s = cmp8_out[7];
    // Zero flag, check if values equal
    assign z = (cmp8_out == 0) ? 1 : 0;
    // Carry flag, unsigned greater than or less than (a > b = 1, a < b = 0)
    assign c = (a > b) ? 1 : 0;

    // Flags bitmask to be ANDed with flag register
    assign cmp8_out = {o, p, s, z, c};
endmodule
