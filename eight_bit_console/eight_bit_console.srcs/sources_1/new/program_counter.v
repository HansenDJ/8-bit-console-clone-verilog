`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2024 10:55:21 AM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input clk,
    input enable,
    input wb,
    input we,
    input [15:0] j_addr,
    input [7:0] j_bank,
    output reg [7:0] cur_bank,
    output [15:0] count
    );
    
    // Uncomment this code to use a synthesized PC
    //reg cur_addr;
    //initial cur_addr = 0;
    
    //always @(clk) begin
    //    if (we) cur_addr <= j_addr;
    //    else
    //        if (enable) begin
    //            cur_addr <= cur_addr + 1;
    //        end
    //end
    
    //assign count = cur_addr;
    
    initial cur_bank = 0;
    
    always @(posedge clk) if (wb) cur_bank <= j_bank;
    
    // Use DSP to save other board resources
    dsp_pc_counter dsp_cnt (clk, enable, we, j_addr, count);
    
endmodule
