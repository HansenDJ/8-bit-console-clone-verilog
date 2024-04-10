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

typedef enum logic [2:0] {
    MIN_OP_NOP = 4'h0,         // No operation
    MIN_OP_RET = 4'h1,         // Jump back to popped address from stack
    MIN_OP_EI = 4'h2,          // Enable interrupt
    MIN_OP_DI = 4'h3,          // Disable interrupt
    MIN_OP_WAIT = 4'h4,        // CPU in wait mode (stop execution)
    MIN_OP_INC_R5 = 4'h5,      // Increment accumulator
    MIN_OP_PUSH_R5 = 4'h6,    // Push accumulator to stack
    MIN_OP_POP_R5 = 4'h7      // Pop accumulator from stack
} MinOpcode;

typedef enum logic [6:0] {
    // Memory Operations
    OP_MOV = 7'h00,       // Moves values between registers
    OP_LD = 7'h01,        // Fetch data from memory at a given address
    OP_STR = 7'h02,       // Store data to memory at a given address

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
    OP_ASL = 7'h17,       // d <= op1 << op2
    OP_LSR = 7'h18,       // d <= op1 >> op2 (Logical)
    OP_ASR = 7'h19,       // d <= op1 >> op2 (Arithmetic)

    // Special Operations
    OP_NOT = 7'h1C,       // r <= ~r
    OP_INC = 7'h1D,       // r <= r + 1
    OP_DEC = 7'h1E,       // r <= r - 1
    OP_CP = 7'h21         // Set flags based on comparison
} FullOpcode;

module cpu(
    input clk,
    input [7:0] mem_data_in,
    output [7:0] mem_data_out,
    output [15:0] mem_addr,
    output mem_we
    );
    
    wire rfile_wide_mode;
    wire rfile_we;
    wire rfile_data_in;
    wire rfile_data_in_wide;
    wire rfile_write_sel;
    wire rfile_sel_a;
    wire rfile_sel_b;
    wire rfile_output_a;
    wire rfile_output_a_wide;
    wire rfile_output_b;
    wire rfile_output_b_wide;
    wire rfile_flags_we;
    wire rfile_new_flags;
    wire rfile_cur_flags;
    
    
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
    
    
    wire alu_selector;
    
    
    alu_8bit alu_data (
        rfile_output_a,
        rfile_output_b,
        alu_selector,
        rfile_data_in,
        rfile_new_flags
    );
    
    
    wire pc_enable;
    wire pc_write;
    wire [15:0] target_addr;
    wire cur_addr;
    
    logic [15:0] instruction_pointer;
    
    program_counter prog_count (
        clk,
        pc_enable,
        pc_write,
        target_addr,
        cur_addr
    );
    
    // Fetcher and executor (emphasis on the fetcher)
    logic [7:0] op_parts [4];
    
    wire op_byte;
    assign op_byte = {op_parts[0][2:0], op_parts[1][7:4]};
    
    logic min_op = op_parts[0][3];
    logic cond_met;
    logic inst_size;
    
    cond_check op_cond_check (op_parts[0][7:4], rfile_cur_flags, cond_met);
    instruction_size_decoder ins_size_decode (op_byte, inst_size);
    
    logic fe_state = S_FETCH_1;
    
    // State transitions
    always @(posedge clk) begin
        case (fe_state)
            S_FETCH_1: begin
                if (min_op & cond_met) fe_state <= S_EXECUTE;
                if (!min_op) fe_state <= S_FETCH_2;
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
