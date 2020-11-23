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

assign rvfi.commit = (((dut.i_datapath.wb_ctrl.load_regfile) & (dut.i_datapath.load_wb)) && (dut.i_datapath.wb_rd != 5'b0)); //|| (dut.i_datapath.is_br && !dut.i_datapath.force_pcplus4); // Set high when a valid instruction is modifying regfile or PC
initial rvfi.order = 0;
always @(posedge itf.clk iff rvfi.commit) rvfi.order <= rvfi.order + 1; // Modify for OoO
always @(posedge itf.clk iff should_halt) counter <= counter + 1;

assign should_halt = dut.i_datapath.halt;

assign rvfi.halt = counter >= 2 ? should_halt : 1'b0;   // Set high when you detect an infinite loop

// Instruction and Trap:
assign rvfi.inst = dut.i_datapath.wb_i_mem_data;
assign rvfi.trap = dut.i_datapath.wb_trap;
// Regfile:
assign rvfi.rs1_addr = dut.i_datapath.wb_rs1;
assign rvfi.rs2_addr = dut.i_datapath.wb_rs2;
assign rvfi.rs1_rdata = dut.i_datapath.wb_rs1_out;
assign rvfi.rs2_rdata = dut.i_datapath.wb_rs2_out;
assign rvfi.load_regfile = dut.i_datapath.wb_ctrl.load_regfile;
assign rvfi.rd_addr = dut.i_datapath.wb_rd;
assign rvfi.rd_wdata = dut.i_datapath.wb_regfilemux_out;

// PC:
assign rvfi.pc_rdata = dut.i_datapath.wb_pc_out;
assign rvfi.pc_wdata = dut.i_datapath.mem_pc_out;

// Memory:
assign rvfi.mem_addr = dut.i_datapath.wb_d_mem_address;
assign rvfi.mem_rmask = dut.i_datapath.wb_rmask;
assign rvfi.mem_wmask = dut.i_datapath.wb_wmask;
assign rvfi.mem_rdata = dut.i_datapath.wb_regfilemux_out;
assign rvfi.mem_wdata = dut.i_datapath.wb_rs2_out;

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

dcache signals:
    itf.data_read
    itf.data_write
    itf.data_mbe
    itf.data_addr
    itf.data_wdata
    itf.data_resp
    itf.data_rdata

Please refer to tb_itf.sv for more information.
*/

// Shadow memory: 
assign itf.inst_read = dut.i_mem_read;
assign itf.inst_addr = dut.i_mem_address;
assign itf.inst_resp = dut.i_mem_resp;
assign itf.inst_rdata = dut.i_mem_rdata;

assign itf.data_read = dut.d_mem_read;
assign itf.data_write = dut.d_mem_write;
assign itf.data_mbe = dut.d_mem_byte_enable;
assign itf.data_addr = dut.d_mem_address;
assign itf.data_wdata = dut.d_mem_wdata;
assign itf.data_resp = dut.d_mem_resp;
assign itf.data_rdata = dut.d_mem_rdata;
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
    
    .pmem_address(itf.mem_addr),
    .pmem_rdata(itf.mem_rdata),
    .pmem_wdata(itf.mem_wdata), 
    .pmem_read(itf.mem_read), 
    .pmem_write(itf.mem_write),
    .pmem_resp(itf.mem_resp)
);
/***************************** End Instantiation *****************************/

endmodule
