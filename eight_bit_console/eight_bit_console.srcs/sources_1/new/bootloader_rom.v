`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2024 04:48:41 PM
// Design Name: 
// Module Name: bootloader_rom
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


module bootloader_rom(
    input oe,
    input [15:0] addr,
    output [7:0] data
    );

    reg [7:0] rom [16'hffff:0];
    
    // Initialize ROM contents
    integer i;
    initial begin
      for (i=0; i<=63; i=i+1)
        rom[i] = 8'h00;
      $readmemb ("rom.bin", rom, 0);
    end
    
    assign data = oe ? rom[addr] : 8'hz;

endmodule
