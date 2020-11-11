module mp4_tb;
`timescale 1ns/10ps

/********************* Do not touch for proper compilation *******************/
// Instantiate Interfaces
tb_itf itf();
rvfi_itf rvfi(itf.clk, itf.rst);

// Instantiate Testbench
source_tb tb(
    .magic_mem_itf(itf),
    .mem_itf(itf),
    .sm_itf(itf),
    .tb_itf(itf),
    .rvfi(rvfi)
);

// For local simulation, add signal for Modelsim to display by default
// Note that this signal does nothing and is not used for anything
bit f;

/****************************** End do not touch *****************************/

/************************ Signals necessary for monitor **********************/
// This section not required until CP2

logic [2:0] counter = 3'b000;
logic should_halt;

assign rvfi.commit = 0; // Set high when a valid instruction is modifying regfile or PC
initial rvfi.order = 0;
always @(posedge itf.clk iff rvfi.commit) rvfi.order <= rvfi.order + 1; // Modify for OoO
always @(posedge itf.clk iff should_halt) counter <= counter + 1;

assign should_halt = dut.i_datapath.is_br & 
(dut.i_datapath.pcmux2_out + 8 == dut.i_datapath.if_pc_out) & 
(dut.i_datapath.if_pc_out == dut.i_datapath.id_pc_out + 4) &
(dut.i_datapath.if_pc_out == dut.i_datapath.ex_pc_out + 8);

assign rvfi.halt = counter >= 2 ? should_halt : 1'b0;   // Set high when you detect an infinite loop

/*
The following signals need to be set:
Instruction and trap:
    rvfi.inst
    rvfi.trap

Regfile:
    rvfi.rs1_addr
    rvfi.rs2_add
    rvfi.rs1_rdata
    rvfi.rs2_rdata
    rvfi.load_regfile
    rvfi.rd_addr
    rvfi.rd_wdata

PC:
    rvfi.pc_rdata
    rvfi.pc_wdata

Memory:
    rvfi.mem_addr
    rvfi.mem_rmask
    rvfi.mem_wmask
    rvfi.mem_rdata
    rvfi.mem_wdata

Please refer to rvfi_itf.sv for more information.
*/

// Instruction and Trap:
assign rvfi.inst = dut.i_datapath.IR.data;
assign rvfi.trap = dut.i_control_rom.trap;
// Regfile:
assign rvfi.rs1_addr = dut.i_datapath.regfile.src_a;
assign rvfi.rs2_addr = dut.i_datapath.regfile.src_b;
assign rvfi.rs1_rdata = dut.i_datapath.regfile.reg_a;
assign rvfi.rs2_rdata = dut.i_datapath.regfile.reg_b;
assign rvfi.load_regfile = dut.i_datapath.regfile.load;
assign rvfi.rd_addr = dut.i_datapath.regfile.dest;
assign rvfi.rd_wdata = dut.i_datapath.regfile.in;

// PC:
assign rvfi.pc_rdata = dut.i_datapath.PC.out;
assign rvfi.pc_wdata = dut.i_datapath.PC.in;

// Memory:
assign rvfi.mem_addr = dut.i_mem_address;
assign rvfi.mem_rmask = dut.i_control_rom.rmask;
assign rvfi.mem_wmask = dut.i_control_rom.wmask;
assign rvfi.mem_rdata = dut.d_mem_data;
assign rvfi.mem_wdata = dut.d_mem_wdata;

/**************************** End RVFIMON signals ****************************/

/********************* Assign Shadow Memory Signals Here *********************/
// This section not required until CP2
/*
The following signals need to be set:
icache signals:

    itf.inst_read
    itf.inst_addr
    itf.inst_resp
    itf.inst_rdata

//dcache signals:
    itf.data_read
    itf.data_write
    itf.data_mbe
    itf.data_addr
    itf.data_wdata
    itf.data_resp
    itf.data_rdata

Please refer to tb_itf.sv for more information.
*/

/*********************** End Shadow Memory Assignments ***********************/

// Set this to the proper value
assign itf.registers = dut.i_datapath.regfile.data;

/*********************** Instantiate your design here ************************/
/*
The following signals need to be connected to your top level:
Clock and reset signals:

    itf.clk
    itf.rst

Burst Memory Ports:
    itf.mem_read
    itf.mem_write
    itf.mem_wdata
    itf.mem_rdata
    itf.mem_addr
    itf.mem_resp

Please refer to tb_itf.sv for more information.
*/

mp4 dut(
    .clk(itf.clk),
    .rst(itf.rst),
    
    .i_mem_data(itf.inst_rdata),

    .i_mem_address(itf.inst_addr),
    .i_mem_read(itf.inst_read),

    .d_mem_data(itf.data_rdata),
    .d_mem_wdata(itf.data_wdata), 
    .d_mem_address(itf.data_addr),
    .d_mem_write(itf.data_write), 
    .d_mem_read(itf.data_read),
    .d_mem_byte_enable(itf.data_mbe)
);
/***************************** End Instantiation *****************************/

endmodule
