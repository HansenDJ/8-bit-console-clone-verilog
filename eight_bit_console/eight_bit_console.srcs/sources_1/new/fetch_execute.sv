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
    input [7:0] op_part_data,
    output [15:0] op_part_addr,
    output mem_sel,
    output [3:0] alu_sel,
    output [11:0] reg_file_sel,
    output bit_mode
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
    byte op_part [3:0];
    logic [3:0] dirty_pipe;
    
    // Fetch logic
    // addr_t cur_inst_addr = 0;
    
    // Decode logic
    logic [31:0] deco_op_parts = {op_part[0], op_part[1], op_part[2], op_part[3]};
    logic [7:0] deco_cur_flags;
    logic [1:0] deco_op_length;
    logic deco_is_dirty_op;
    logic [3:1] deco_part_dirty;
    logic deco_jump_en;
    logic [15:0] deco_jump_addr;
    logic instr_mem_access;
    logic deco_pause_exec;
    logic [7:0] deco_new_flags;

    instruction_decoder inst_decode (
        .op_parts(deco_op_parts),
        .cur_flags(deco_cur_flags),
        .op_length(deco_op_length),
        .is_dirty_op(deco_is_dirty_op),
        .part_dirty(deco_part_dirty),

        // These are directly routed to the top level
        .sel_reg(reg_file_sel),
        .sel_alu(alu_sel),
        .bit_mode(bit_mode),

        .jump_en(deco_jump_en),
        .jump_addr(deco_jump_addr),
        .mem_access(instr_mem_access),
        .pause_exec(deco_pause_exec),
        .new_flags(deco_new_flags)
    );
    
    
    assign mem_sel = instr_mem_access;
    assign op_part_addr = pc_cur_count;
    assign pc_enable = !instr_mem_access;
    
    
    always @(clk) begin
        if (!instr_mem_access) begin
            op_part[3] <= op_part_data;
            op_part[2] <= op_part[3];
            op_part[1] <= op_part[2];
            op_part[0] <= op_part[1];
        end
        
    end

endmodule
