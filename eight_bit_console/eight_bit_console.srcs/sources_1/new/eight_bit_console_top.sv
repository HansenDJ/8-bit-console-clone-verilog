`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2024 12:36:00 AM
// Design Name: 
// Module Name: eight_bit_console_top
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


module eight_bit_console_top(
    input hw_clk,
    input [15:0] switches,
    output disp_mem
    );
    
    logic [7:0] cpu_din;
    logic [7:0] cpu_dout;
    logic [15:0] mem_addr;
    wire mem_write_en;
    
    cpu core1 (
        .clk(hw_clk),
        .mem_data_in(cpu_din),
        .mem_data_out(cpu_dout),
        .mem_addr(mem_addr),
        .mem_we(mem_write_en)
    );
    
//    logic [15:0] disp_mem;
    
    ram mem1 (
        .clk(hw_clk),
        .we(mem_write_en),
        .addr(mem_addr),
        .data_in(cpu_dout),
        .data_out(cpu_din),
        .sw_in(switches),
        .sseg_out(disp_mem)
    );
    
endmodule
