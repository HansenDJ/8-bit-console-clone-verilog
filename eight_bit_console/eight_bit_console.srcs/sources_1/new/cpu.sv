`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2024 10:41:07 PM
// Design Name: 
// Module Name: cpu
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

typedef enum logic [2:0] {
    S_FETCH_1 = 1,
    S_FETCH_2 = 2,
    S_FETCH_3 = 3,
    S_FETCH_4 = 4,
    S_JUMP_1 = 5,
    S_JUMP_2 = 6,
    S_EXECUTE = 7
} FetchExecState;

typedef enum logic [1:0] {
    INS_ONE = 0,
    INS_TWO = 1,
    INS_THREE = 2,
    INS_FOUR = 3
} InstructionSizes;

typedef enum logic [4:0] {
    ALU_ADD = 0,
    ALU_SUB = 1,
    ALU_MUL = 2,
    ALU_DIV = 3,
    ALU_XOR = 4,
    ALU_OR = 5,
    ALU_AND = 6,
    ALU_NOT = 7,
    ALU_INC = 8,
    ALU_DEC = 9,
    ALU_LSL = 10,
    ALU_LSR = 11,
    ALU_ASL = 12,
    ALU_ASR = 13,
    ALU_CP = 14
} AluOp;

typedef enum logic [2:0] {
    MIN_OP_NOP = 3'h0,         // No operation
    MIN_OP_INC_R5 = 3'h5       // Increment accumulator
} MinOpcode;

typedef enum logic [6:0] {
    // Memory Operations
    OP_MOV = 7'h00,       // Moves values between registers
    OP_LD = 7'h01,        // Fetch data from memory at a given address
    OP_STR = 7'h02,       // Store data to memory at a given address
    OP_LDI = 7'h04,       // Load immediate into register

    // Control Flow Operations
    OP_JP = 7'h08,        // Jump to a given immediate address
    OP_JMP = 7'h09,       // Jump to address pointed to by a register pair

    // ALU Operations
    OP_ADD = 7'h10,       // d <= op1 + op2
    OP_SUB = 7'h11,       // d <= op1 - op2
    OP_MUL = 7'h12,       // d <= op1 * op2
    OP_DIV = 7'h13,       // d <= op1 / op2
    OP_XOR = 7'h14,       // d <= op1 xor op2
    OP_OR = 7'h15,        // d <= op1 or op2
    OP_AND = 7'h16,       // d <= op1 and op2
    OP_LSL = 7'h17,       // d <= op1 << op2
//    OP_ASL = 7'h17,       // d <= op1 << op2
    OP_LSR = 7'h18,       // d <= op1 >> op2 (Logical)
    OP_ASR = 7'h19,       // d <= op1 >> op2 (Arithmetic)

    // Single Parameter ALU Operations
    OP_NOT = 7'h1C,       // r <= ~r
    OP_INC = 7'h1D,       // r <= r + 1
    OP_DEC = 7'h1E,       // r <= r - 1
    OP_CP = 7'h21         // Set flags based on comparison
} FullOpcode;

module cpu(
    input clk,
    input [7:0] mem_data_in,
    output logic [7:0] mem_data_out,
    output logic [15:0] mem_addr,
    output logic mem_we
    );
    
    initial mem_we = 0;
    
    logic alu_selector;
    wire [7:0] alu_out;
    
    logic rfile_wide_mode = 0;
    logic rfile_we = 0;
    logic [7:0] rfile_data_in = alu_out;
    wire [7:0] rfile_data_in_wide = 0;
    logic [3:0] rfile_write_sel = 0;
    logic [3:0] rfile_sel_a = 0;
    logic [3:0] rfile_sel_b = 0;
    wire [7:0] rfile_output_a;
    wire [7:0] rfile_output_a_wide;
    wire [7:0] rfile_output_b;
    wire [7:0] rfile_output_b_wide;
    logic rfile_flags_we = 0;
    wire [7:0] rfile_new_flags;
    wire [7:0] rfile_cur_flags;
    
    
    register_file rfile (
        .clk(clk),
        .wide_mode(rfile_wide_mode),
        .we(rfile_we),
        .data(rfile_data_in),
        .data_wide(rfile_data_in_wide),
        .dest_sel(rfile_write_sel),
        .src_a_sel(rfile_sel_a),
        .src_b_sel(rfile_sel_b),
        .port_a(rfile_output_a),
        .port_a_wide(rfile_output_a_wide),
        .port_b(rfile_output_b),
        .port_b_wide(rfile_output_b_wide),
        .we_flags(rfile_flags_we),
        .new_flags(rfile_new_flags),
        .flags(rfile_cur_flags)
    );
    
    
    alu_8bit alu_data (
        rfile_output_a,
        rfile_output_b,
        alu_selector,
        alu_out,
        rfile_new_flags
    );
    
    
    logic pc_enable = 1;
    logic pc_write = 0;
    logic [15:0] pc_target_addr = 0;
    logic [15:0] pc_cur_addr;
    
//    logic [15:0] instruction_pointer;
    
    program_counter prog_count (
        clk,
        pc_enable,
        pc_write,
        pc_target_addr,
        pc_cur_addr
    );
    
    // Fetcher and executor (emphasis on the fetcher)
    logic [7:0] op_parts [4];
    
    wire [6:0] op_byte = {op_parts[0][2:0], op_parts[1][7:4]};
    wire [2:0] min_op = op_parts[0][2:0];
    wire [3:0] dest_bits = op_parts[1][3:0];
    wire [3:0] src_bits = op_parts[2][7:4];
    wire [3:0] op1_bits = op_parts[2][7:4];
    wire [3:0] op2_bits = op_parts[2][3:0];
    wire [7:0] immed_bits = op_parts[2];
    wire [15:0] op_dest_addr = {op_parts[2], op_parts[3]};

    logic is_min_op = op_parts[0][3];
    logic cond_met;
    logic [1:0] inst_size;
    
    cond_check op_cond_check (op_parts[0][7:4], rfile_cur_flags, cond_met);
    instruction_size_decoder ins_size_decode (op_byte, inst_size);
    
    FetchExecState fe_state = S_FETCH_1;
    
    // State transitions
    always @(posedge clk) begin
        case (fe_state)
            S_FETCH_1: begin
                if (is_min_op & cond_met) fe_state <= S_EXECUTE;
                if (!is_min_op) fe_state <= S_FETCH_2;
            end
            S_FETCH_2: begin
                if ((inst_size == INS_TWO) & cond_met) fe_state <= S_EXECUTE;
                if ((inst_size == INS_TWO) & !cond_met) fe_state <= S_FETCH_1;
                if (((inst_size == INS_THREE) | (inst_size == INS_FOUR)) & cond_met) fe_state <= S_FETCH_3;
                if ((inst_size == INS_THREE) & !cond_met) fe_state <= S_JUMP_1;
                if ((inst_size == INS_FOUR) & !cond_met) fe_state <= S_JUMP_2;
            end
            S_FETCH_3: begin
                if (inst_size == INS_FOUR) fe_state <= S_FETCH_4;
                else fe_state <= S_EXECUTE;
            end
            S_FETCH_4: fe_state <= S_EXECUTE;
            S_JUMP_1: fe_state <= S_FETCH_1;
            S_JUMP_2: fe_state <= S_FETCH_1;
            S_EXECUTE:  fe_state <= S_FETCH_1;
        endcase
    end
    
    // Combinational state logic
    always_latch begin
        case (fe_state)
            S_FETCH_1: begin
                op_parts[0] <= mem_data_in;
                mem_addr = pc_cur_addr;
                pc_enable = 1;
                rfile_we = 0;
                mem_we = 0;
                pc_write = 0;
                alu_selector = 2;
            end
            S_FETCH_2: begin
                op_parts[1] <= mem_data_in;
                mem_addr = pc_cur_addr;
                pc_enable = 1;
                alu_selector = 2;
            end
            S_FETCH_3: begin
                op_parts[2] <= mem_data_in;
                mem_addr = pc_cur_addr;
                pc_enable = 1;
                alu_selector = 2;
            end
            S_FETCH_4: begin
                op_parts[3] <= mem_data_in;
                mem_addr = pc_cur_addr;
                pc_enable = 1;
                alu_selector = 2;
            end
            S_JUMP_1: begin
                // Same as incrementing program counter by 1
                pc_enable = 1;
                alu_selector = 2;
            end
            S_JUMP_2: begin
                // Loading this will override the +1 increment into a +2 increment
                pc_enable = 1;
                pc_write = 1;
                pc_target_addr = pc_cur_addr + 2;
                alu_selector = 2;
            end
            S_EXECUTE: begin
                pc_enable = 0;
                if (is_min_op) begin
                    case (min_op)
                        MIN_OP_INC_R5: begin
                            rfile_data_in = alu_out;
                            rfile_write_sel = 4'h5;
                            rfile_sel_a = 4'h5;
                            alu_selector = ALU_INC;
                            rfile_we = 1;
                        end
                        // All other cases act as NOP
                        // This is left as a switch-case for future expansion
                    endcase
                end
                else
                    case (op_byte)
                        OP_MOV: begin
                            rfile_data_in = rfile_output_a;
                            rfile_write_sel = dest_bits;
                            rfile_sel_a = src_bits;
                            rfile_we = 1;
                        end
                        OP_LD: begin
                            rfile_data_in = mem_data_in;
                            rfile_write_sel = dest_bits;
                            rfile_sel_a = src_bits;
                            mem_addr = {rfile_output_a, rfile_output_a_wide};
                            rfile_we = 1;
                        end
                        OP_STR: begin
                            rfile_sel_a = dest_bits;
                            rfile_sel_b = src_bits;
                            mem_addr = {rfile_output_a, rfile_output_a_wide};
                            mem_data_out = rfile_output_b;
                            mem_we = 1;
                        end
                        OP_LDI: begin
                            rfile_data_in = immed_bits;
                            rfile_write_sel = dest_bits;
                            rfile_we = 1;
                        end
                        OP_JP: begin
                            pc_target_addr = op_dest_addr;
                            pc_write = 1;
                        end
                        OP_JMP: begin
                            rfile_sel_a = dest_bits;
                            pc_target_addr = {rfile_output_a, rfile_output_a_wide};
                            pc_write = 1;
                        end
                        OP_ADD: begin
                            rfile_data_in = alu_out;
                            rfile_write_sel = dest_bits;
                            rfile_sel_a = op1_bits;
                            rfile_sel_b = op2_bits;
                            alu_selector = ALU_ADD;
                            rfile_we = 1;
                        end
                        OP_SUB: begin
                            rfile_data_in = alu_out;
                            rfile_write_sel = dest_bits;
                            rfile_sel_a = op1_bits;
                            rfile_sel_b = op2_bits;
                            alu_selector = ALU_SUB;
                            rfile_we = 1;
                        end
                        OP_MUL: begin
                            rfile_data_in = alu_out;
                            rfile_write_sel = dest_bits;
                            rfile_sel_a = op1_bits;
                            rfile_sel_b = op2_bits;
                            alu_selector = ALU_MUL;
                            rfile_we = 1;
                        end
                        OP_DIV: begin
                            rfile_data_in = alu_out;
                            rfile_write_sel = dest_bits;
                            rfile_sel_a = op1_bits;
                            rfile_sel_b = op2_bits;
                            alu_selector = ALU_DIV;
                            rfile_we = 1;
                        end
                        OP_XOR: begin
                            rfile_data_in = alu_out;
                            rfile_write_sel = dest_bits;
                            rfile_sel_a = op1_bits;
                            rfile_sel_b = op2_bits;
                            alu_selector = ALU_XOR;
                            rfile_we = 1;
                        end
                        OP_OR: begin
                            rfile_data_in = alu_out;
                            rfile_write_sel = dest_bits;
                            rfile_sel_a = op1_bits;
                            rfile_sel_b = op2_bits;
                            alu_selector = ALU_OR;
                            rfile_we = 1;
                        end
                        OP_AND: begin
                            rfile_data_in = alu_out;
                            rfile_write_sel = dest_bits;
                            rfile_sel_a = op1_bits;
                            rfile_sel_b = op2_bits;
                            alu_selector = ALU_AND;
                            rfile_we = 1;
                        end
                        OP_LSL: begin
                            rfile_data_in = alu_out;
                            rfile_write_sel = dest_bits;
                            rfile_sel_a = op1_bits;
                            rfile_sel_b = op2_bits;
                            alu_selector = ALU_LSL;
                            rfile_we = 1;
                        end
//                        OP_ASL: begin
//                            rfile_data_in = alu_out;
//                            rfile_write_sel = dest_bits;
//                            rfile_sel_a = op1_bits;
//                            rfile_sel_b = op2_bits;
//                            alu_selector = ALU_ASL;
//                            rfile_we = 1;
//                        end
                        OP_LSR: begin
                            rfile_data_in = alu_out;
                            rfile_write_sel = dest_bits;
                            rfile_sel_a = op1_bits;
                            rfile_sel_b = op2_bits;
                            alu_selector = ALU_LSR;
                            rfile_we = 1;
                        end
                        OP_ASR: begin
                            rfile_data_in = alu_out;
                            rfile_write_sel = dest_bits;
                            rfile_sel_a = op1_bits;
                            rfile_sel_b = op2_bits;
                            alu_selector = ALU_ASR;
                            rfile_we = 1;
                        end
                        OP_NOT: begin
                            rfile_data_in = alu_out;
                            rfile_write_sel = dest_bits;
                            rfile_sel_a = dest_bits;
                            alu_selector = ALU_NOT;
                            rfile_we = 1;
                        end
                        OP_INC: begin
                            rfile_data_in = alu_out;
                            rfile_write_sel = dest_bits;
                            rfile_sel_a = dest_bits;
                            alu_selector = ALU_INC;
                            rfile_we = 1;
                        end
                        OP_DEC: begin
                            rfile_data_in = alu_out;
                            rfile_write_sel = dest_bits;
                            rfile_sel_a = dest_bits;
                            alu_selector = ALU_DEC;
                            rfile_we = 1;
                        end
                        OP_CP: begin
                            rfile_sel_a = dest_bits;
                            alu_selector = ALU_CP;
                            rfile_flags_we = 1;
                        end
                    endcase
            end
        endcase
    end
    
endmodule


typedef enum logic [2:0] {
    CC_NONE = 3'h0,       // No condition applied
    CC_CARRY = 3'h1,      // Handle carryout
    CC_ZERO = 3'h2,       // Check if equal
    CC_SIGN = 3'h3,       // Check negative signed
    CC_PARITY = 3'h4,     // Check odd
    CC_OVERFLOW = 3'h5   // Handle overflow
} ConditionCode;

module cond_check(
    input [3:0] cond_bits,
    input [7:0] flags,
    output logic cond_met
    );
    
    always_comb begin
        if (cond_bits[3])
            case (cond_bits[2:0])
                CC_NONE: cond_met = 0;
                CC_CARRY: cond_met = !flags[0];
                CC_ZERO: cond_met = !flags[1];
                CC_SIGN: cond_met = !flags[2];
                CC_PARITY: cond_met = !flags[3];
                CC_OVERFLOW: cond_met = !flags[4];
                default: cond_met = 0;
            endcase
        else
            case (cond_bits[2:0])
                CC_NONE: cond_met = 1;
                CC_CARRY: cond_met = flags[0];
                CC_ZERO: cond_met = flags[1];
                CC_SIGN: cond_met = flags[2];
                CC_PARITY: cond_met = flags[3];
                CC_OVERFLOW: cond_met = flags[4];
                default: cond_met = 1;
            endcase
    end
    
endmodule


module instruction_size_decoder(
    input [6:0] opcode,
    output logic [1:0] size
    );
    
    logic two_byte_op = (opcode == OP_CP) | (opcode == OP_NOT) | (opcode == OP_INC) | (opcode == OP_DEC) | (opcode == OP_JMP);
    logic three_byte_op = (opcode == OP_MOV) | (opcode == OP_LD) | (opcode == OP_STR) | (opcode == OP_ADD) | (opcode == OP_SUB) | (opcode == OP_MUL) | (opcode == OP_DIV) | (opcode == OP_XOR) | (opcode == OP_OR) | (opcode == OP_AND) | (opcode == OP_LSL) | (opcode == OP_LSR) | (opcode == OP_ASR);
    logic four_byte_op = (opcode == OP_JP);
    
    // Two and four byte operations set this bit
    assign size[0] = two_byte_op | four_byte_op;
    assign size[1] = three_byte_op | four_byte_op;
    
endmodule
