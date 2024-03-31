`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2024 05:04:18 PM
// Design Name: 
// Module Name: io_controller
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


module io_controller(
    input clk,
    // Processor side interface
    input cpu_mem_req,
    input clr_data_ready,
    input clr_op_ready,
    input [1:0] mem_op,
    input [15:0] addr,
    input [7:0] dev_sel,
    inout [7:0] next_data,
    output reg [23:0] next_op = 0,
    output reg [15:0] next_op_addr = 0,
    output reg data_ready = 0,
    output reg op_ready = 0,
    // I/O bus side interface
    inout [7:0] io_bus,
    output [15:0] dev_addr,
    output [255:0] dev_oe,
    output [255:0] dev_we
    );
    
    // Memory operations
    parameter INSTR_LOAD = 0, LOAD = 1, STORE = 2, PRIORITY_INSTR_LOAD = 3;
    
    // Memory controller states
    parameter I_CACHING = 0, READ = 1, WRITE = 2, I_LOADING = 3;
    
    // Save selectors for the in between instruction and data reads
    reg [1:0] cur_op_segment = 0;
    reg [7:0] instr_dev_sel = 0;
    
    reg [7:0] data_cache = 0, data_dev_sel = 0;
    reg [15:0] data_addr = 0;
    
    // State machine - Caching instructions by default
    reg [1:0] control_state = I_CACHING;
    
    always @(posedge clr_data_ready) data_ready <= 0;
    always @(posedge clr_op_ready) begin
        op_ready <= 0;
        
    end
    
    always @(posedge cpu_mem_req) begin
        case (mem_op)
            INSTR_LOAD: begin
                
            end
            LOAD: begin
                
            end
            STORE: begin
                
            end
            PRIORITY_INSTR_LOAD: begin
                
            end
        endcase
    end
    
    always @(posedge clk) begin
        case (control_state)
            I_CACHING: begin
                if (!op_ready) begin
                    case (cur_op_segment)
                        0: begin
                            next_op[23:16] <= io_bus;
                            cur_op_segment <= 1;
                        end
                        1: begin
                            next_op[15:8] <= io_bus;
                            cur_op_segment <= 2;
                        end
                        2: begin
                            next_op[7:0] <= io_bus;
                            cur_op_segment <= 0;
                            op_ready <= 1;
                        end
                    endcase
                end
            end
            I_LOADING: begin
                
            end
            READ: begin
                
            end
            WRITE: begin
                
            end
        endcase
    end    
 
endmodule
