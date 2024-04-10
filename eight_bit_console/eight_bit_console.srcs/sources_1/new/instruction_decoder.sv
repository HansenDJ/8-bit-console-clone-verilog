`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2024 05:05:31 PM
// Design Name: 
// Module Name: instruction_decoder
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
    CC_NONE = 3'h0,       // No condition applied
    CC_CARRY = 3'h1,      // Handle carryout
    CC_ZERO = 3'h2,       // Check if equal
    CC_SIGN = 3'h3,       // Check negative signed
    CC_PARITY = 3'h4,     // Check odd
    CC_OVERFLOW = 3'h5   // Handle overflow
} ConditionCode;

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
    OP_MOVW = 7'h03,      // Moves values between registers in wide bit mode
    OP_LDI = 7'h04,       // Load immediate into register
    OP_STI = 7'h05,       // Load immediate into memory location
    OP_PUSH = 7'h06,      // Pushes contents of a register onto the stack
    OP_POP = 7'h07,       // Pop contents of the stack into a register

    // Control Flow Operations
    OP_JP = 7'h08,        // Jump to a given immediate address
    OP_JMP = 7'h09,       // Jump to address pointed to by a register pair
    OP_CALL = 7'h0A,      // Push next instruction location onto the stack, jump to given immediate address
    OP_CALR = 7'h0B,      // Push next instruction location onto the stack, jump to address pointed to by a register pair

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
    OP_ADDW = 7'h1A,      // d <= op1 + op2 (16-bit)
    OP_SUBW = 7'h1B,      // d <= op1 - op2 (16-bit)

    // Special Operations
    OP_COM = 7'h1C,       // r <= ~r
    OP_INC = 7'h1D,       // r <= r + 1
    OP_DEC = 7'h1E,       // r <= r - 1
    OP_INCW = 7'h1F,      // r <= r + 1
    OP_DECW = 7'h20,      // r <= r - 1
    OP_CP = 7'h21,        // Set flags based on comparison
    OP_CPW = 7'h22,       // Set flags based on comparison
    OP_LEA = 7'h23       // Load effective address
} Opcode;

typedef enum logic {
    OPTYPE_MIN = 0,
    OPTYPE_MAX = 1
} OpType;

typedef enum logic [3:0] {
    ALU_ADD = 4'h0,
    ALU_SUB = 4'h1,
    ALU_MUL = 4'h2,
    ALU_DIV = 4'h3,
    ALU_XOR = 4'h4,
    ALU_OR = 4'h5,
    ALU_AND = 4'h6,
    ALU_LSL = 4'h7,
    ALU_ASL = 4'h7,
    ALU_LSR = 4'h8,
    ALU_ASR = 4'h9,
    ALU_NOT = 4'ha,
    ALU_INC = 4'hb,
    ALU_DEC = 4'hc,
    ALU_CP = 4'hd
} AluOp;

typedef enum logic [3:0] {
    REG_R0 = 4'h0,
    REG_R1 = 4'h1,
    REG_R2 = 4'h2,
    REG_R3 = 4'h3,
    REG_R4 = 4'h4,
    REG_R5 = 4'h5,
    REG_R6 = 4'h6,
    REG_R7 = 4'h7,
    REG_R8 = 4'h8,
    REG_R9 = 4'h9,
    REG_RA = 4'ha,
    REG_RB = 4'hb,
    REG_RC = 4'hc,
    REG_RD = 4'hd,
    REG_RE = 4'he,
    REG_RF = 4'hf,
    REG_RIH = 4'hc,
    REG_RIL = 4'hd,
    REG_RSH = 4'he,
    REG_RSL = 4'hf,
    REG_RIP = 4'hc,
    REG_RSP = 4'he
} RegSelect;

typedef enum logic {
    SEL_MEM_EXEC = 0,
    SEL_MEM_REG = 1
} MemSelect;

module instruction_decoder(
    input [31:0] op_parts,
    input [7:0] cur_flags,
    input cur_op_dirty,
    output logic reg_we,
    output logic [3:0] dest_sel_reg,
    output logic [3:0] a_sel_reg,
    output logic [3:0] b_sel_reg,
    output logic [3:0] sel_alu,
    output logic bit_mode,
    output logic jump_en,
    output logic [15:0] jump_addr,
    output logic data_mem_read,
    output logic data_mem_write,
    output logic no_op,
    output logic pop_jump,
    output logic enable_int,
    output logic disable_int,
    output logic stop_exec,
    output logic ld_immediate,
    output logic [7:0] immediate
    );
    
    logic cond_inverse = op_parts[31];
    logic [2:0] cond_code = op_parts[30:28];
    logic op_type = op_parts[27];
    logic [2:0] min_op_code = op_parts[26:24];
    logic [6:0] full_op_code = op_parts[26:20];
    logic [3:0] dest_reg_sel = op_parts[19:16];
    logic [3:0] operand_a_reg_sel = op_parts[15:12];
    logic [3:0] operand_b_reg_sel = op_parts[11:8];
    logic [7:0] immed_mem_src = op_parts[15:8];
    logic [3:0] lea_shift_mul = op_parts[7:4];
    logic [7:0] immed_offset = op_parts[7:0];
    logic [15:0] jump_target = op_parts[15:0];
    
    // Condition checking logic
    logic cond_met;
    
    always_comb begin
        if (cond_inverse)
            case (cond_code)
                CC_NONE: cond_met = 0;
                CC_CARRY: cond_met = !cur_flags[0];
                CC_ZERO: cond_met = !cur_flags[1];
                CC_SIGN: cond_met = !cur_flags[2];
                CC_PARITY: cond_met = !cur_flags[3];
                CC_OVERFLOW: cond_met = !cur_flags[4];
                default: cond_met = 0;
            endcase
        else
            case (cond_code)
                CC_NONE: cond_met = 1;
                CC_CARRY: cond_met = cur_flags[0];
                CC_ZERO: cond_met = cur_flags[1];
                CC_SIGN: cond_met = cur_flags[2];
                CC_PARITY: cond_met = cur_flags[3];
                CC_OVERFLOW: cond_met = cur_flags[4];
                default: cond_met = 1;
            endcase
    end
    
    logic do_no_op = 0;
    
    assign no_op = cur_op_dirty | !cond_met | (do_no_op);
    
    // Operation to output decoding
    always_comb begin
        reg_we = 0;
        dest_sel_reg = 0;
        a_sel_reg = 0;
        b_sel_reg = 0;
        sel_alu = 0;
        bit_mode = 0;
        jump_en = 0;
        jump_addr = 0;
        data_mem_read = 0;
        data_mem_write = 0;
        do_no_op = 0;
        pop_jump = 0;
        enable_int = 0;
        disable_int = 0;
        stop_exec = 0;
        ld_immediate = 0;
        immediate = 0;
        if (op_type == OPTYPE_MIN)
            case (min_op_code)
                MIN_OP_NOP: do_no_op = 1;
                MIN_OP_RET: pop_jump = 1;
                MIN_OP_EI: enable_int = 1;
                MIN_OP_DI: disable_int = 1;
                MIN_OP_WAIT: stop_exec = 1;
                MIN_OP_INC_R5: begin
                    dest_sel_reg = 4'h5;
                    a_sel_reg = 4'h5;
                    sel_alu = ALU_INC;
                    reg_we = 1;
                end
                MIN_OP_PUSH_R5: begin
                    data_mem_write = SEL_MEM_REG;
                    a_sel_reg = 4'h5;
                end
                MIN_OP_POP_R5: begin
                    data_mem_read = SEL_MEM_REG;
                    a_sel_reg = 4'h5;
                end
                default: do_no_op = 1;
            endcase
        else
             case (full_op_code)
                OP_MOV: begin
                    dest_sel_reg = dest_reg_sel;
                    a_sel_reg = operand_a_reg_sel;
                    reg_we = 1;
                end
                OP_LD: begin
                    dest_sel_reg = dest_reg_sel;
                    a_sel_reg = operand_a_reg_sel;
                    data_mem_read = SEL_MEM_REG;
                    reg_we = 1;
                end
                OP_STR: begin
                    a_sel_reg = dest_reg_sel;
                    b_sel_reg = operand_a_reg_sel;
                    data_mem_write = SEL_MEM_REG;
                end
                OP_MOVW: begin
                    dest_sel_reg = dest_reg_sel;
                    a_sel_reg = operand_a_reg_sel;
                    reg_we = 1;
                    bit_mode = 1;
                end
                OP_LDI: begin
                    dest_sel_reg = dest_reg_sel;
                    ld_immediate = 1;
                    reg_we = 1;
                    immediate = immed_mem_src;
                end
                OP_PUSH: begin
                    a_sel_reg = dest_reg_sel;
                    b_sel_reg = REG_RSP;
                    data_mem_write = SEL_MEM_REG;
                end
                OP_POP: begin
                    dest_sel_reg = dest_reg_sel;
                    a_sel_reg = REG_RSP;
                    data_mem_read = SEL_MEM_REG;
                    reg_we = 1;
                end
                OP_JP: begin

                end
                OP_JMP: begin

                end
                OP_CALL: begin

                end
                OP_CALR: begin

                end
                OP_ADD: begin

                end
                OP_SUB: begin

                end
                OP_MUL: begin

                end
                OP_DIV: begin

                end
                OP_XOR: begin

                end
                OP_OR: begin

                end
                OP_AND: begin

                end
                OP_LSL: begin

                end
                OP_ASL: begin

                end
                OP_LSR: begin

                end
                OP_ASR: begin

                end
                OP_ADDW: begin

                end
                OP_SUBW: begin

                end
                OP_COM: begin

                end
                OP_INC: begin

                end
                OP_DEC: begin

                end
                OP_INCW: begin

                end
                OP_DECW: begin

                end
                OP_CP: begin

                end
                OP_CPW: begin

                end
                OP_LEA: begin

                end
             endcase
    end

endmodule

