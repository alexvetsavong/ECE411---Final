module mp4(
	input clk,
	input rst,

	input logic [31:0] i_mem_data,

	output logic [31:0] i_mem_address,
	output logic i_mem_read,

	input logic [31:0] d_mem_data,
	 
	output logic [31:0] d_mem_wdata, d_mem_address,
	output logic d_mem_write, d_mem_read,
	output logic [3:0] d_mem_byte_enable
);

rv32i_opcode opcode; 
logic [2:0] funct3; 
logic [6:0] funct7;
rv32i_ctrl_word ctrl;

datapath i_datapath(
    .clk(clk),
    .rst(rst),

	.id_ctrl(ctrl),

	.if_opcode(opcode), 
	.if_funct3(funct3), 
	.if_funct7(funct7),

	.if_i_mem_data(i_mem_data),

	.i_mem_address(i_mem_address),
	.i_mem_read(i_mem_read),

	.wb_d_mem_data(d_mem_data),

	.d_mem_wdata(d_mem_wdata), 
	.d_mem_address(d_mem_address),
	.d_mem_write(d_mem_write), 
	.d_mem_read(d_mem_read),
	.d_mem_byte_enable(d_mem_byte_enable)
);

control_rom i_control_rom(
    .opcode(opcode),
    .funct3(funct3),
    .funct7(funct7),
    .ctrl(ctrl)
);

endmodule : mp4
