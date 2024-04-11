`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2024 02:07:57 PM
// Design Name: 
// Module Name: register_file_tb
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


module register_file_tb();

    reg clk, wide_mode, we, we_flags;
    reg [3:0] dest_sel, src_a_sel, src_b_sel;
    reg [7:0] data, data_wide, new_flags;
    wire [7:0] port_a, port_b, port_a_wide, port_b_wide, flags;
    
    register_file rfile (clk, wide_mode, we, data, data_wide,
        dest_sel, src_a_sel, src_b_sel, port_a, port_b,
        port_a_wide, port_b_wide, we_flags, new_flags, flags);
    
    always #5 clk = ~clk;
    
    initial begin
        // Initial states
        clk = 0; wide_mode = 0; we = 0; we_flags = 0;
        dest_sel = 0; src_a_sel = 0; src_b_sel = 0;
        data = 0; data_wide = 0; new_flags = 0;
        // Writes (should fail)
        #10 dest_sel = 4'ha; data = 8'haa; new_flags = 8'h33;
        #10 dest_sel = 4'hb; data = 8'hbb;
        #10 dest_sel = 4'hc; data = 8'hcc;
        #10 dest_sel = 4'hd; data = 8'hdd;
        #10 dest_sel = 4'he; data = 8'hee;
        #10 dest_sel = 4'hf; data = 8'hff; new_flags = 8'h88;
        // Double wide write (should fail)
        #10 dest_sel = 4'ha; data = 8'haa; new_flags = 8'h33;
        wide_mode = 1;
        #10 dest_sel = 4'hb; data = 8'hbb;
        #10 dest_sel = 4'hc; data = 8'hcc;
        #10 dest_sel = 4'hd; data = 8'hdd;
        #10 dest_sel = 4'he; data = 8'hee;
        #10 dest_sel = 4'hf; data = 8'hff; new_flags = 8'h88;
        // Writes
        #10 dest_sel = 4'ha; data = 8'haa; new_flags = 8'h33;
        we = 1;
        #10 dest_sel = 4'hb; data = 8'hbb;
        #10 dest_sel = 4'hc; data = 8'hcc;
        #10 dest_sel = 4'hd; data = 8'hdd;
        #10 dest_sel = 4'he; data = 8'hee;
        #10 dest_sel = 4'hf; data = 8'hff; new_flags = 8'h88;
        // Double wide write
        #5 dest_sel = 4'ha; data = 8'haa; new_flags = 8'h33;
        wide_mode = 1; we_flags = 1; data_wide = 8'h11;
        #10 dest_sel = 4'hb; data = 8'hbb; data_wide = 8'h22;
        #10 dest_sel = 4'hc; data = 8'hcc; data_wide = 8'h33;
        #10 dest_sel = 4'hd; data = 8'hdd; data_wide = 8'h44;
        #10 dest_sel = 4'he; data = 8'hee; data_wide = 8'h55;
        #10 dest_sel = 4'hf; data = 8'hff; new_flags = 8'h88;
        data_wide = 8'h66;
        // Reads
        #5 we = 0;
        #5 src_a_sel = 4'ha; src_b_sel = 4'hb;
        #10 src_a_sel = 4'hc; src_b_sel = 4'hd;
        #10 src_a_sel = 4'he; src_b_sel = 4'hf;
        #10 src_a_sel = 4'ha; src_b_sel = 4'hf;
        #10 src_a_sel = 4'hc; src_b_sel = 4'he;
        #10 $finish;
    end

endmodule
