`timescale 1ns / 1ps

module digit_selector(
    input clk,
    output reg [3:0] digit_sel 
    );
    
    reg [1:0] cnt = 2'b00;
    initial
        digit_sel = 4'b0111;
    
    //reset if button is pressed
    always @ (posedge clk)
        cnt <= cnt + 1;
    
    //this uses the generated slower clock to select which digit is currently displaying which value
    always @ (cnt)
    case (cnt)
        2'b00: digit_sel = 4'b1110;
        2'b01: digit_sel = 4'b1101;
        2'b10: digit_sel = 4'b1011;
        2'b11: digit_sel = 4'b0111;
        default: digit_sel = 4'b1110;
    endcase
endmodule