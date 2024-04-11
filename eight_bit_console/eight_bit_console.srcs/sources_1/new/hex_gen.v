`timescale 1ns / 1ps

module hex_gen(
    input [3:0] an,
    input [15:0] data,
    output reg [3:0] hex
    );
    
    //generade hexadecimal values to be displayed
    always @ (an)
    case (an)
        4'b1110: hex = data [3:0];
        4'b1101: hex = data [7:4];
        4'b1011: hex = data [11:8];
        4'b0111: hex = data [15:12];
    endcase
            
endmodule