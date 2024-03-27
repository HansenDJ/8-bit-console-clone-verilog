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


module alu(
    input [7:0] alu_in,
    input [2:0] sel,
    input sub,
    output [7:0] alu_out
    );
endmodule

module full_add(
    input a,
    input b,
    input cin,
    output s,
    output cout
    );
    
    // Sum all inputs by XORing them
    assign s = a ^ b ^ cin;
    // Determine if there is a carry out
    assign cout = (a & b) | (b & cin) | (a & cin);
    
endmodule

module add_8bit(
    input [7:0] A,
    input [7:0] B,
    output [7:0] sum,
    output carry
    );
    
    wire c0,c1,c2,c3,c4,c5,c6,c7,c8;
    
    assign c0 = 0;
    
    full_add FA0(.Cin(c0), .a(sw[0]), .b(sw[8]), .s(led[0]), .cout(c1));
    full_add FA1(.Cin(c1), .a(sw[1]), .b(sw[9]), .s(led[1]), .cout(c2));
    full_add FA2(.Cin(c2), .a(sw[2]), .b(sw[10]), .s(led[2]), .cout(c3));
    full_add FA3(.Cin(c3), .a(sw[3]), .b(sw[11]), .s(led[3]), .cout(c4));
    full_add FA4(.Cin(c4), .a(sw[4]), .b(sw[12]), .s(led[4]), .cout(c5));
    full_add FA5(.Cin(c5), .a(sw[5]), .b(sw[13]), .s(led[5]), .cout(c6));
    full_add FA6(.Cin(c6), .a(sw[6]), .b(sw[14]), .s(led[6]), .cout(c7));
    full_add FA7(.Cin(c7), .a(sw[7]), .b(sw[15]), .s(led[7]), .cout(c8));
    
endmodule
