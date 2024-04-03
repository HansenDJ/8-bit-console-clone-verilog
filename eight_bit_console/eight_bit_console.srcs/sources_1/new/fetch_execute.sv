`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/02/2024 07:26:16 PM
// Design Name:
// Module Name: fetch_decode
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


module fetch_execute(
    input clk,
    input [3:0] exec_flags,
    input [7:0] op_part_data,
    output [15:0] op_part_addr,
    output [5:0] function_sel,
    output mem_sel
    );
    
    typedef logic [15:0] addr_t;

    wire pc_enable;
    wire pc_we;
    wire pc_j_addr;
    wire pc_cur_count;

    program_counter prog_count (
        .clk(clk),
        .enable(pc_enable),
        .we(pc_we),
        .j_addr(pc_j_addr),
        .count(pc_cur_count)
    );


    // Pipeline
    byte stage_in, int_stage_a, int_stage_b, stage_out;
    
    // Fetch logic
    addr_t cur_inst_addr = 0;
    logic [1:0] to_next_op = 0;
    logic mem_op_pending = 0;
    logic dirty_pipeline = 0;
    
    // Decode logic
    
    
    assign mem_sel = mem_op_pending;
    assign op_part_addr = pc_cur_count;
    assign pc_we = !mem_op_pending;
    
    
    always @(clk) begin
        if (!mem_op_pending) begin
            stage_in <= op_part_data;
            int_stage_a <= stage_in;
            int_stage_b <= int_stage_a;
            stage_out <= int_stage_b;
        end
    end

endmodule
