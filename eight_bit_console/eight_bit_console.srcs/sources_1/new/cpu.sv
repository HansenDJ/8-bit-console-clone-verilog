`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2024 10:41:07 PM
// Design Name: 
// Module Name: cpu
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


module cpu(
    input clk,
    input [7:0] mem_data_in,
    output [7:0] mem_data_out,
    output [15:0] mem_addr,
    output mem_we
    );
    
    wire rfile_wide_mode;
    wire rfile_we;
    wire rfile_data_in;
    wire rfile_data_in_wide;
    wire rfile_write_sel;
    wire rfile_sel_a;
    wire rfile_sel_b;
    wire rfile_output_a;
    wire rfile_output_a_wide;
    wire rfile_output_b;
    wire rfile_output_b_wide;
    wire rfile_flags_we;
    wire rfile_new_flags;
    wire rfile_cur_flags;
    
    
    register_file rfile (
        .clk(clk),
        .wide_mode(rfile_wide_mode),
        .we(rfile_we),
        .data(rfile_data_in),
        .data_wide(rfile_data_in_wide),
        .dest_sel(rfile_write_sel),
        .src_a_sel(rfile_sel_a),
        .src_b_sel(rfile_sel_b),
        .port_a(rfile_output_a),
        .port_a_wide(rfile_output_a_wide),
        .port_b(rfile_output_b),
        .port_b_wide(rfile_output_b_wide),
        .we_flags(rfile_flags_we),
        .new_flags(rfile_new_flags),
        .flags(rfile_cur_flags)
    );
    
    
    wire alu_selector;
    
    
    alu_8bit alu_data (
        rfile_output_a,
        rfile_output_b,
        alu_selector,
        rfile_data_in,
        rfile_new_flags
    );
    
    
endmodule
