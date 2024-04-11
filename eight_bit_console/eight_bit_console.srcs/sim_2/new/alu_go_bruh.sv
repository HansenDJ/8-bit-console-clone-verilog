`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2024 07:59:23 PM
// Design Name: 
// Module Name: alu_go_bruh
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


module alu_go_bruh();

    reg [7:0] alu8_in_a, alu8_in_b;
    reg [3:0] alu8_sel;
    wire [7:0] alu8_out, flags_out;
    
    alu_8bit bruh (alu8_in_a, alu8_in_b, alu8_sel, alu8_out, flags_out);
    
    initial begin
        alu8_in_a = 0; alu8_in_b = 0; alu8_sel = 0;
        #10 alu8_in_a = 20; alu8_in_b = 5;
        #10 alu8_sel = 1;
        #10 alu8_sel = 2;
        #10 alu8_sel = 3;
        #10 alu8_sel = 4;
        #10 alu8_sel = 5;
        #10 alu8_sel = 6;
        #10 alu8_sel = 7;
        #10 alu8_sel = 8;
        #10 alu8_sel = 9;
        #10 alu8_sel = 10;
        #10 alu8_sel = 11;
        #10 alu8_sel = 12;
        #10 alu8_sel = 13;
        #10 alu8_sel = 14;
        #10 alu8_sel = 15;
        #10 alu8_in_a = 5; alu8_sel = 0;
        #10 alu8_sel = 1;
        #10 alu8_sel = 2;
        #10 alu8_sel = 3;
        #10 alu8_sel = 4;
        #10 alu8_sel = 5;
        #10 alu8_sel = 6;
        #10 alu8_sel = 7;
        #10 alu8_sel = 8;
        #10 alu8_sel = 9;
        #10 alu8_sel = 10;
        #10 alu8_sel = 11;
        #10 alu8_sel = 12;
        #10 alu8_sel = 13;
        #10 alu8_sel = 14;
        #10 alu8_sel = 15;
        #10 $finish;
    end

endmodule
