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
    output 
    );

endmodule

module divide_8bit(
    
    );

endmodule

module xor_8bit(
    
    );

endmodule

module or_8bit(
    
    );

endmodule

module and_8bit(
    
    );

endmodule

module compliment_8bit(
    
    );

endmodule

// Increment
module inc_8bit(
    
    );

endmodule

// Decrement
module dec_8bit(
    
    );

endmodule

// Logical shift left
module lsl_8bit(
    
    );

endmodule

// Logical shift right
module lsr_8bit(
    
    );

endmodule

// Arithmetic shift left
module asl_8bit(
    
    );

endmodule

// Arithmetic shift right
module asr_8bit(
    
    );

endmodule

// Sets c, z, s, or p flags to a 0 or 1
module compare_8bit(
    
    );

endmodule