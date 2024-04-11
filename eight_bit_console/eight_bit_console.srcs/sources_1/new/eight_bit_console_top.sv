`timescale 1ns / 1ps

module eight_bit_console_top(
    input hw_clk,
    input [15:0] switches,
    input btnC,
    input btnU,
    input btnL,
    input btnR,
    input btnD,
    output dp,
    output [3:0] an,
    output [6:0] seg
    );
    
    logic [7:0] input_a = {2'h0, switches[5:0]};
    logic [7:0] input_b = {2'h0, switches[11:6]};
    logic [7:0] alu_out;
    logic [3:0] alu_sel = switches[15:12];
    reg [7:0] mem_addr;
    
    initial mem_addr <= 0;
    
    wire mem_write_en = btnC;
    
    wire clkd;
    wire debounce;
    reg [25:0] cnt = 0;
    
    always @ (posedge hw_clk)
        cnt <= cnt + 1;
        
    assign clkd = cnt[18];
    assign debounce = cnt[22];
    
    always @(posedge debounce)
    begin
        if (btnR)
            mem_addr <= mem_addr + 1;
        else if (btnD)
            mem_addr <= mem_addr - 1;
    end

//    always @(posedge btnR) mem_addr <= mem_addr + 1;

    alu_8bit alu_data (
        .alu8_in_a(input_a),
        .alu8_in_b(input_b),
        .alu8_sel(alu_sel),
        .alu8_out(alu_out)
    );
    
    logic [15:0] disp_mem;
    
    assign disp_mem[15:8] = mem_addr;
    
    ram mem1 (
        .clk(hw_clk),
        .we(mem_write_en),
        .addr(mem_addr),
        .data_in(alu_out),
        .data_out(disp_mem[7:0])
    );
        
    display_top disp (
        .clkd(clkd),
        .mem_in(disp_mem),
        .dp(dp),
        .an(an),
        .seg(seg)
    );
    
endmodule
