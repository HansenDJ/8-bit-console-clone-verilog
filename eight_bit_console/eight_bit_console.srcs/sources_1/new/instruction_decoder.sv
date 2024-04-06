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
    OP_RET_CTRL = 7'h01,  // Jump back to popped address from stack

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
    ALU_COM = 4'ha,
    ALU_INC = 4'hb,
    ALU_DEC = 4'hc,
    ALU_CP = 4'hd
} AluOp;

module instruction_decoder(
    input [31:0] op_parts,
    input [7:0] cur_flags,
    input cur_op_dirty,
    output [3:1] part_dirty,
    output [3:0] dest_sel_reg,
    output [3:0] a_sel_reg,
    output [3:0] b_sel_reg,
    output [3:0] sel_alu,
    output bit_mode,
    output jump_en,
    output [15:0] jump_addr,
    output data_mem_access,
    output pause_exec,
    output no_op,
    output enable_int,
    output disable_int
    );
    
    logic cond_inverse = op_parts[31];
    logic [2:0] cond_code = op_parts[30:28];
    logic op_type = op_parts[27];
    logic [2:0] min_op_code = op_parts[26:24];
    logic [6:0] full_op_code = op_parts[26:20];
    logic [3:0] dest_reg_sel = op_parts[19:16];
    logic [3:0] operand_a_reg_sel = op_parts[15:12];
    logic [3:0] operand_b_reg_sel = op_parts[11:8];
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
    
    assign no_op = cur_op_dirty | !cond_met | (min_op_code == MIN_OP_NOP);
    
    // Operation to output decoding
    always_comb begin
        if (op_type == OPTYPE_MIN)
            case (min_op_code)
                MIN_OP_RET:
                MIN_OP_EI: enable_int = 1;
                MIN_OP_DI: disable_int = 1;
                MIN_OP_WAIT: pause_exec = 1;
                MIN_OP_INC_R5: begin
                    sel_alu = ALU_INC;
                    dest_sel_reg = 5;
                    a_sel_reg = 5;
                    bit_mode = 0;
                end
            endcase
    end
    
    
    
endmodule

