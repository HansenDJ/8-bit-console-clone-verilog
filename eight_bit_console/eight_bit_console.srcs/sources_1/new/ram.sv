`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2024 02:44:07 PM
// Design Name: 
// Module Name: ram
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


module ram(
    input clk,
    input we,
    input [7:0] addr,
    input [7:0] data_in,
    output [7:0] data_out
    );

    reg [7:0] ram_mem [256];
    
    // Initialize RAM contents
//    initial begin
//      $readmemh ("ram.mem", ram_mem, 0);
//      ram_mem[8'hff] = 8'hff;
//    end
    
    always_ff @(posedge clk) begin
        if (we) begin
            ram_mem[addr] <= data_in;
        end
    end
    
    assign data_out = ram_mem[addr];

endmodule