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
    // Processor side interface
    input cpu_mem_req,
    input switch_dev,
    input clr_data_ready,
    input clr_op_ready,
    input [1:0] mem_op,
    input [15:0] addr,
    input [7:0] dev_sel,
    input [7:0] new_data,
    output reg [7:0] fetched_data,
    output reg data_ready = 0,
    // Bus goes directly to instruction pipeline
    output reg op_ready = 0,
    output reg [7:0] op_part,
    // I/O bus side interface
    inout [7:0] io_bus,
    output [15:0] dev_addr,
    output reg [255:0] dev_oe,
    output reg [255:0] dev_we
    );
    
    // Memory operations
    parameter INSTR_LOAD = 0, LOAD = 1, STORE = 2;
    
    reg [7:0] data_dev_sel = 0;
    reg [15:0] stored_addr = 0;
    
    assign dev_addr = stored_addr;
    assign io_bus = (mem_op == STORE && cpu_mem_req) ? new_data : 8'hz;
    
    always @(posedge clr_data_ready) data_ready <= 0;
    always @(posedge clr_op_ready) op_ready <= 0;
    
    always @(posedge switch_dev) data_dev_sel <= dev_sel;
    
    always @(posedge cpu_mem_req) begin
        case (mem_op)
            INSTR_LOAD: begin
                stored_addr <= addr;
                dev_oe[data_dev_sel] <= 1;
                op_part = io_bus;
                op_ready = 1;
            end
            LOAD: begin
                stored_addr <= addr;
                dev_oe[data_dev_sel] <= 1;
                fetched_data = io_bus;
                data_ready = 1;
            end
            STORE: begin
                stored_addr <= addr;
                dev_we[data_dev_sel] <= 1;
                data_ready = 1;
            end
        endcase
        dev_oe = 0;
        dev_we = 0;
    end

 
endmodule
