`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2024 10:02:49 AM
// Design Name: 
// Module Name: io_controller_tb
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


module io_controller_tb();

    // Processor side interface
    reg cpu_mem_req;
    reg switch_dev;
    reg clr_data_ready;
    reg clr_op_ready;
    reg [1:0] mem_op;
    reg [15:0] addr;
    reg [7:0] dev_sel;
    reg [7:0] new_data;
    wire [7:0] fetched_data;
    wire data_ready;
    // Bus goes directly to instruction pipeline
    wire op_ready;
    wire [7:0] op_part;
    // I/O bus side interface
    wire [7:0] io_bus;
    wire [15:0] dev_addr;
    wire [255:0] dev_oe;
    wire [255:0] dev_we;

    io_controller io1 (
        // Processor side interface
        .cpu_mem_req(cpu_mem_req),
        .switch_dev(switch_dev),
        .clr_data_ready(clr_data_ready),
        .clr_op_ready(clr_op_ready),
        .mem_op(mem_op),
        .addr(addr),
        .dev_sel(dev_sel),
        .new_data(new_data),
        .fetched_data(fetched_data),
        .data_ready(data_ready),
        // Bus goes directly to instruction pipeline
        .op_ready(op_ready),
        .op_part(op_part),
        // I/O bus side interface
        .io_bus(io_bus),
        .dev_addr(dev_addr),
        .dev_oe(dev_oe),
        .dev_we(dev_we)
    );

    // Testbench stimulus
    initial begin
        // Case 1: Testing INSTR_LOAD operation
        $display("---- Test Case 1: INSTR_LOAD ----");
        cpu_mem_req = 1;
        mem_op = 0; // INSTR_LOAD
        addr = 16'h1234;
        dev_sel = 8'b00000001;
        clr_op_ready = 1;
        #10;
        clr_op_ready = 0;
        #10;
        // Verify results
        if (op_ready && fetched_data === io_bus && data_ready === 0)
            $display("Test Case 1 PASSED");
        else
            $display("Test Case 1 FAILED");
        
        // Case 2: Testing LOAD operation
        $display("---- Test Case 2: LOAD ----");
        cpu_mem_req = 1;
        mem_op = 1; // LOAD
        addr = 16'h5678;
        dev_sel = 8'b00000010;
        clr_data_ready = 1;
        #10;
        clr_data_ready = 0;
        #10;
        // Verify results
        if (data_ready && fetched_data === io_bus && op_ready === 0)
            $display("Test Case 2 PASSED");
        else
            $display("Test Case 2 FAILED");

        // Case 3: Testing STORE operation
        $display("---- Test Case 3: STORE ----");
        cpu_mem_req = 1;
        mem_op = 2; // STORE
        addr = 16'hABCD;
        dev_sel = 8'b00000100;
        new_data = 8'hFF;
        clr_data_ready = 1;
        #10;
        clr_data_ready = 0;
        #10;
        // Verify results
        if (data_ready && op_ready && io_bus === 8'hFF)
            $display("Test Case 3 PASSED");
        else
            $display("Test Case 3 FAILED");

        // Case 4: Testing unstable state with conflicting operations
        $display("---- Test Case 4: Unstable State ----");
        cpu_mem_req = 1;
        mem_op = 0; // INSTR_LOAD
        addr = 16'h1111;
        dev_sel = 8'b00000001;
        clr_data_ready = 1;
        clr_op_ready = 1;
        #5;
        clr_data_ready = 0;
        clr_op_ready = 0;
        #5;
        // Verify results (expecting no stable output due to conflicting operations)
        if (!op_ready && !data_ready)
            $display("Test Case 4 PASSED");
        else
            $display("Test Case 4 FAILED");

        // Case 5: Testing metastability with asynchronous signals
        $display("---- Test Case 5: Metastability ----");
        cpu_mem_req = 1;
        mem_op = 1; // LOAD
        addr = 16'h2222;
        dev_sel = 8'b00000010;
        clr_data_ready = 1;
        clr_op_ready = 1;
        #100; // Wait for a longer time to potentially encounter metastability
        // Verify results (expecting potential metastability, may need to rerun test)
        if (!op_ready && !data_ready)
            $display("Test Case 5 PASSED (Potential Metastability)");
        else
            $display("Test Case 5 FAILED (Potential Metastability)");
        
        // End simulation
        $finish;
    end

endmodule
