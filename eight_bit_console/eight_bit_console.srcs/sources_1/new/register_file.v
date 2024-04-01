`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2024 11:14:25 AM
// Design Name: 
// Module Name: register_file
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


module register_file(
    input clk,
    input wide_mode,
    input we,
    input [7:0] data,
    input [7:0] data_wide,
    input [3:0] dest_sel,
    input [3:0] src_a_sel,
    input [3:0] src_b_sel,
    output [7:0] port_a,
    output [7:0] port_a_wide,
    output [7:0] port_b,
    output [7:0] port_b_wide,
    input we_flags,
    input [7:0] new_flags,
    output reg [7:0] flags
    );
    
    // See wiki for exact register order
    // 17x8 register file
    reg [7:0] registers [15:0];
    
    // For wide mode register pairing logic
    wire [3:0] dest_pair, src_a_pair, src_b_pair;
    wide_pair dp_logic (dest_sel, dest_pair);
    wide_pair sap_logic (src_a_sel, src_a_pair);
    wide_pair sbp_logic (src_b_sel, src_b_pair);
    
    always @(posedge clk) begin
        if (we) begin
            registers[dest_sel] <= data;
            if (wide_mode) registers[dest_pair] <= data_wide;
        end
        if (we_flags) begin
            flags <= new_flags;
        end
    end
    
    assign port_a = registers[src_a_sel];
    assign port_b = registers[src_b_sel];
    assign port_a_wide = registers[src_a_pair];
    assign port_b_wide = registers[src_b_pair];
    
endmodule


module wide_pair(input [3:0] high_pair, output [3:0] low_pair);
    assign low_pair = (high_pair == 4'hf) ? 4'b0000 : (high_pair + 1);
endmodule

