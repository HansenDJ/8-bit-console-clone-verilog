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
    output reg [7:0] alu8_out,
    output reg [7:0] flags_out // o, p, s, z, c flags
    );
    
    // ALU function outputs
    wire [7:0] add8_out;
    wire [7:0] sub8_out = add8_out;
    wire [7:0] mul8_out;
    wire [7:0] div8_out;
    wire [7:0] xor8_out;
    wire [7:0] or8_out;
    wire [7:0] and8_out;
    wire [7:0] not8_out;
    wire [7:0] inc8_out;
    wire [7:0] dec8_out;
    wire [7:0] lsl8_out;
    wire [7:0] lsr8_out;
    wire [7:0] asl8_out;
    wire [7:0] asr8_out;
    
    // Flag outputs from functions
    wire [4:0] add_flags_out;
    wire [4:0] mul_flags_out;
    wire [4:0] div_flags_out;
    wire [4:0] xor_flags_out;
    wire [4:0] or_flags_out;
    wire [4:0] and_flags_out;
    wire [4:0] not_flags_out;
    wire [4:0] inc_flags_out;
    wire [4:0] dec_flags_out;
    wire [4:0] lsl_flags_out;
    wire [4:0] lsr_flags_out;
    wire [4:0] asl_flags_out;
    wire [4:0] asr_flags_out;
    wire [4:0] cmp_flags_out;
    
    // Dirty hack for add/sub
    reg sub = 0;
    
    // Instantiate function modules
    add_8bit add8 (alu8_in_a, alu8_in_b, sub, add8_out, add_flags_out);
    mul_8bit mul8 (alu8_in_a, alu8_in_b, mul8_out, mul_flags_out);
    div_8bit div8 (alu8_in_a, alu8_in_b, div8_out, div_flags_out);
    xor_8bit xor8 (alu8_in_a, alu8_in_b, xor8_out, xor_flags_out);
    or_8bit or8 (alu8_in_a, alu8_in_b, or8_out, or_flags_out);
    and_8bit and8 (alu8_in_a, alu8_in_b, and8_out, and_flags_out);
    not_8bit not8 (alu8_in_a, not8_out, not_flags_out);
    inc_8bit inc8 (alu8_in_a, inc8_out, inc_flags_out);
    dec_8bit dec8 (alu8_in_a, dec8_out, dec_flags_out);
    lsl_8bit lsl8 (alu8_in_a, lsl8_out, lsl_flags_out);
    lsr_8bit lsr8 (alu8_in_a, lsr8_out, lsr_flags_out);
    asl_8bit asl8 (alu8_in_a, asl8_out, asl_flags_out);
    asr_8bit asr8 (alu8_in_a, asr8_out, asr_flags_out);
    cmp_8bit cmp8 (alu8_in_a, alu8_in_b, cmp_flags_out);
    
    // Demultiplexer: Connect function output to ALU output
    always @ (*) begin
        case (alu8_sel) // Addition function
            4'h0: begin
                alu8_out <= add8_out;
                sub <= 0;
                flags_out <= {3'h0, add_flags_out};
            end
            4'h1: begin
                alu8_out <= sub8_out;
                sub <= 1;
                flags_out <= {3'h0, add_flags_out};
            end
            4'h2: begin
                alu8_out <= mul8_out;
                flags_out <= {3'h0, mul_flags_out};
            end
            4'h3: begin
                alu8_out <= div8_out;
                flags_out <= {3'h0, div_flags_out};
            end
            4'h4: begin
                alu8_out <= xor8_out;
                flags_out <= {3'h0, xor_flags_out};
            end
            4'h5: begin
                alu8_out <= or8_out;
                flags_out <= {3'h0, or_flags_out};
            end
            4'h6: begin
                alu8_out <= and8_out;
                flags_out <= {3'h0, and_flags_out};
            end
            4'h7: begin
                alu8_out <= not8_out;
                flags_out <= {3'h0, not_flags_out};
            end
            4'h8: begin
                alu8_out <= inc8_out;
                flags_out <= {3'h0, inc_flags_out};
            end
            4'h9: begin
                alu8_out <= dec8_out;
                flags_out <= {3'h0, dec_flags_out};
            end
            4'ha: begin
                alu8_out <= lsl8_out;
                flags_out <= {3'h0, lsl_flags_out};
            end
            4'hb: begin
                alu8_out <= lsr8_out;
                flags_out <= {3'h0, lsr_flags_out};
            end
            4'hc: begin
                alu8_out <= asl8_out;
                flags_out <= {3'h0, asl_flags_out};
            end
            4'hd: begin
                alu8_out <= asr8_out;
                flags_out <= {3'h0, asr_flags_out};
            end
            4'he: begin
                flags_out <= {3'h0, cmp_flags_out};
            end
        endcase
    end
endmodule

// Addition and subtraction
module add_8bit(
    input [7:0] a,
    input [7:0] b,
    input sub,
    output [7:0] add8_out,
    output [4:0] add_flags_out // o, p, s, z, c flag bits
    );
    
    wire o, p, s, z, c; // Flag bits
    wire [8:0] add_extra; // msb for carry out, 8-bit result
    
    assign add_extra = sub ? a + (~b + 1) : a + b;
    assign add8_out = add_extra[7:0];
    
    assign o = (add8_out < a | add8_out < b) ? 1 : 0; // Overflow flag
    assign p = add8_out[0]; // Parity flag, LSB or result
    assign s = add8_out[7]; // Sign flag, MSB of result
    assign z = (add8_out == 0) ? 1 : 0; // Zero flag, check if values equal
    assign c = add_extra[8]; // Carry flag
    
    assign add_flags_out = {o, p, s, z, c}; // Flags bitmask to be ANDed with flag register
endmodule

// Multiply
module mul_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] mul8_out,
    output [4:0] mul_flags_out // o, p, s, z, c flag bits
    );

    wire o, p, s, z, c; // Flag bits
    wire [8:0] mul_extra; // msb for carry out, 8-bit result

    assign mul_extra = a * b;
    assign mul8_out = mul_extra[7:0];
    
    assign o = (mul8_out < a | mul8_out < b) ? 1 : 0; // Overflow flag
    assign p = mul8_out[0]; // Parity flag, LSB or result
    assign s = mul8_out[7]; // Sign flag, MSB of result
    assign z = (mul8_out == 0) ? 1 : 0; // Zero flag, check if values equal
    assign c = mul_extra[8]; // Carry flag
    
    assign mul_flags_out = {o, p, s, z, c}; // Flags bitmask to be ANDed with flag register
endmodule

// Divide
module div_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] div8_out,
    output [4:0] div_flags_out // o, p, s, z, c flag bits
    );
    
    wire o, p, s, z, c; // Flag bits

    assign div8_out = a / b;
    
    assign o = 0; // Overflow flag: non relevant so overwrite
    assign p = div8_out[0]; // Parity flag, LSB or result
    assign s = div8_out[7]; // Sign flag, MSB of result
    assign z = (div8_out == 0) ? 1 : 0; // Zero flag, check if values equal
    assign c = 0; // Carry flag: non relevant so overwrite
    
    assign div_flags_out = {o, p, s, z, c}; // Flags bitmask to be ANDed with flag register
endmodule

// Bitwise Exclusive-OR operation
module xor_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] xor8_out,
    output [4:0] xor_flags_out // o, p, s, z, c flag bits
    );
    
    wire o, p, s, z, c; // Flag bits

    assign xor8_out = a ^ b;
    
    assign o = 0; // Overflow flag: non relevant so overwrite
    assign p = xor8_out[0]; // Parity flag, LSB or result
    assign s = xor8_out[7]; // Sign flag, MSB of result
    assign z = (xor8_out == 0) ? 1 : 0; // Zero flag, check if values equal
    assign c = 0; // Carry flag: non relevant so overwrite
    
    assign xor_flags_out = {o, p, s, z, c}; // Flags bitmask to be ANDed with flag register
endmodule

// Bitwise OR operation
module or_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] or8_out,
    output [4:0] or_flags_out // o, p, s, z, c flag bits
    );
    
    wire o, p, s, z, c; // Flag bits

    assign or8_out = a | b;
    
    assign o = 0; // Overflow flag: non relevant so overwrite
    assign p = or8_out[0]; // Parity flag, LSB or result
    assign s = or8_out[7]; // Sign flag, MSB of result
    assign z = (or8_out == 0) ? 1 : 0; // Zero flag, check if values equal
    assign c = 0; // Carry flag: non relevant so overwrite
    
    assign or_flags_out = {o, p, s, z, c}; // Flags bitmask to be ANDed with flag register
endmodule

// AND binary operation
module and_8bit(
    input [7:0] a,
    input [7:0] b,
    output [7:0] and8_out,
    output [4:0] and_flags_out // o, p, s, z, c flag bits
    );
    
    wire o, p, s, z, c; // Flag bits

    assign and8_out = a & b;
    
    assign o = 0; // Overflow flag: non relevant so overwrite
    assign p = and8_out[0]; // Parity flag, LSB or result
    assign s = and8_out[7]; // Sign flag, MSB of result
    assign z = (and8_out == 0) ? 1 : 0; // Zero flag, check if values equal
    assign c = 0; // Carry flag: non relevant so overwrite
    
    assign and_flags_out = {o, p, s, z, c}; // Flags bitmask to be ANDed with flag register
endmodule

// Bitwise NOT operation
module not_8bit(
    input [7:0] a,
    output [7:0] not8_out,
    output [4:0] not_flags_out // o, p, s, z, c flag bits
    );
    
    wire o, p, s, z, c; // Flag bits

    assign not8_out = ~a;
    
    assign o = 0; // Overflow flag: non relevant so overwrite
    assign p = not8_out[0]; // Parity flag, LSB or result
    assign s = not8_out[7]; // Sign flag, MSB of result
    assign z = (not8_out == 0) ? 1 : 0; // Zero flag, check if values equal
    assign c = 0; // Carry flag: non relevant so overwrite
    
    assign not_flags_out = {o, p, s, z, c}; // Flags bitmask to be ANDed with flag register
endmodule

// Increment
module inc_8bit(
    input [7:0] a,
    output [7:0] inc8_out,
    output [4:0] inc_flags_out // o, p, s, z, c flag bits
    );
    
    wire o, p, s, z, c; // Flag bits
    
    assign inc8_out = a + 1;
    
    assign o = 0; // Overflow flag: non relevant so overwrite
    assign p = inc8_out[0]; // Parity flag, LSB or result
    assign s = inc8_out[7]; // Sign flag, MSB of result
    assign z = (inc8_out == 0) ? 1 : 0; // Zero flag, check if values equal
    assign c = 0; // Carry flag: non relevant so overwrite
    
    assign inc_flags_out = {o, p, s, z, c}; // Flags bitmask to be ANDed with flag register
endmodule

// Decrement
module dec_8bit(
    input [7:0] a,
    output [7:0] dec8_out,
    output [4:0] dec_flags_out // o, p, s, z, c flag bits
    );
    
    wire o, p, s, z, c; // Flag bits
    
    assign dec8_out = a - 1;
    
    assign o = 0; // Overflow flag: non relevant so overwrite
    assign p = dec8_out[0]; // Parity flag, LSB or result
    assign s = dec8_out[7]; // Sign flag, MSB of result
    assign z = (dec8_out == 0) ? 1 : 0; // Zero flag, check if values equal
    assign c = 0; // Carry flag: non relevant so overwrite
    
    assign dec_flags_out = {o, p, s, z, c}; // Flags bitmask to be ANDed with flag register
endmodule

// Logical shift left
module lsl_8bit(
    input [7:0] a,
    output [7:0] lsl8_out,
    output [4:0] lsl_flags_out // o, p, s, z, c flag bits
    );
    
    wire o, p, s, z, c; // Flag bits
    
    assign lsl8_out = a << 1;
    
    assign o = 0; // Overflow flag: non relevant so overwrite
    assign p = lsl8_out[0]; // Parity flag, LSB or result
    assign s = lsl8_out[7]; // Sign flag, MSB of result
    assign z = (lsl8_out == 0) ? 1 : 0; // Zero flag, check if values equal
    assign c = 0; // Carry flag: non relevant so overwrite
    
    assign lsl_flags_out = {o, p, s, z, c}; // Flags bitmask to be ANDed with flag register
endmodule

// Logical shift right
module lsr_8bit(
    input [7:0] a,
    output [7:0] lsr8_out,
    output [4:0] lsr_flags_out // o, p, s, z, c flag bits
    );
    
    wire o, p, s, z, c; // Flag bits
    
    assign lsr8_out = a >> 1;
    
    assign o = 0; // Overflow flag: non relevant so overwrite
    assign p = lsr8_out[0]; // Parity flag, LSB or result
    assign s = lsr8_out[7]; // Sign flag, MSB of result
    assign z = (lsr8_out == 0) ? 1 : 0; // Zero flag, check if values equal
    assign c = 0; // Carry flag: non relevant so overwrite
    
    assign lsr_flags_out = {o, p, s, z, c}; // Flags bitmask to be ANDed with flag register
endmodule

// Arithmetic shift left
module asl_8bit(
    input [7:0] a,
    output [7:0] asl8_out,
    output [4:0] asl_flags_out // o, p, s, z, c flag bits
    );
    
    wire o, p, s, z, c; // Flag bits
    
    assign asl8_out = a <<< 1;
    
    assign o = 0; // Overflow flag: non relevant so overwrite
    assign p = asl8_out[0]; // Parity flag, LSB or result
    assign s = asl8_out[7]; // Sign flag, MSB of result
    assign z = (asl8_out == 0) ? 1 : 0; // Zero flag, check if values equal
    assign c = 0; // Carry flag: non relevant so overwrite
    
    assign asl_flags_out = {o, p, s, z, c}; // Flags bitmask to be ANDed with flag register
endmodule

// Arithmetic shift right
module asr_8bit(
    input [7:0] a,
    output [7:0] asr8_out,
    output [4:0] asr_flags_out // o, p, s, z, c flag bits
    );
    
    wire o, p, s, z, c; // Flag bits
    
    assign asr8_out = a >>> 1;
    
    assign o = 0; // Overflow flag: non relevant so overwrite
    assign p = asr8_out[0]; // Parity flag, LSB or result
    assign s = asr8_out[7]; // Sign flag, MSB of result
    assign z = (asr8_out == 0) ? 1 : 0; // Zero flag, check if values equal
    assign c = 0; // Carry flag: non relevant so overwrite
    
    assign asr_flags_out = {o, p, s, z, c}; // Flags bitmask to be ANDed with flag register
endmodule

// Compare - sets o, p, s, z, c flags to a 1 or 0
module cmp_8bit(
    input [7:0] a,
    input [7:0] b,
    output [4:0] cmp_flags_out // o, p, s, z, c flag bits
    );

    wire o, p, s, z, c; // Flag bits

    wire [7:0] cmp8_out = a - b;
    
    assign o = (cmp8_out < a | cmp8_out < b) ? 1 : 0; // Overflow flag
    assign p = cmp8_out[0]; // Parity flag, LSB or result
    assign s = cmp8_out[7]; // Sign flag, MSB of result
    assign z = (cmp8_out == 0) ? 1 : 0; // Zero flag, check if values equal
    assign c = (a > b) ? 1 : 0; // Carry flag
    
    assign cmp_flags_out = {o, p, s, z, c}; // Flags bitmask to be ANDed with flag register
endmodule
