`timescale 1ns / 1ps

module display_top(
    input clk,
    input [15:0] mem_in,
    output dp,
    output [3:0] an,
    output [6:0] seg 
    );
    
    wire clkd;
    wire [3:0] hex;
    reg [25:0] cnt = 0;
    
    always @ (posedge clk)
        cnt <= cnt + 1;
        
    assign clkd = cnt[18];
    
    digit_selector U1 (.clk(clkd), .digit_sel(an));
    hex_gen U2 (.an(an), .data({mem_in}), .hex(hex));
    display U3 (.data(hex), .seg(seg), .dp(dp));
endmodule