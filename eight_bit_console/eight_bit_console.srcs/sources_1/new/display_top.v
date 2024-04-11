`timescale 1ns / 1ps

module display_top(
    input clkd,
    input [15:0] mem_in,
    output dp,
    output [3:0] an,
    output [6:0] seg 
    );
    
    wire [3:0] hex;

    digit_selector U1 (.clk(clkd), .digit_sel(an));
    hex_gen U2 (.an(an), .data({mem_in}), .hex(hex));
    display U3 (.data(hex), .seg(seg), .dp(dp));
endmodule