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
    input [15:0] addr,
    input [7:0] data_in,
    output [7:0] data_out,
    // Hack for memory mapped IO
    input [15:0] sw_in,
    output [15:0] sseg_out
    );

    reg [7:0] ram_mem [256];
    
    // Initialize RAM contents
    initial begin
      $readmemh ("ram.mem", ram_mem, 0);
      ram_mem[16'hff] = 8'hff;
      ram_mem[16'hfe] = 8'hff;
    end
    
    always_ff @(posedge clk) begin
        if (we) begin
            ram_mem[addr] <= data_in;
        end
        ram_mem[16'hfd] <= sw_in[15:8];
        ram_mem[16'hfc] <= sw_in[7:0];
    end
    
    assign data_out = ram_mem[addr];
    assign sseg_out[15:8] = ram_mem[16'hff];
    assign sseg_out[7:0] = ram_mem[16'hfe];

endmodule