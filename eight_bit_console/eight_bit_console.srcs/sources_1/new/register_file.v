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
    input we,
    input [7:0] data,
    input [3:0] dest_sel,
    input [3:0] src_a_sel,
    input [3:0] src_b_sel,
    output [7:0] port_a,
    output [7:0] port_b,
    input we_flags,
    input [7:0] new_flags,
    output reg [7:0] flags
    );
    
    // See wiki for exact register order
    // 17x8 register file
    reg [7:0] registers [15:0];
    
    always @(posedge clk) begin
        if (we) begin
            registers[dest_sel] <= data;
        end
        if (we_flags) begin
            flags <= new_flags;
        end
    end
    
    assign port_a = registers[src_a_sel];
    assign port_b = registers[src_b_sel];
    
endmodule
