import rv32i_types::*;

module mp4(
	 input logic clk,
	 input logic rst
);

// Signals between control & datapath:
rv32i_ctrl_word ctrl;
rv32i_opcode opcode;
logic [2:0] if_funct3;
logic [6:0] if_funct7;

// Keep control named `control` for RVFI Monitor
control_rom control(.opcode(opcode), .funct3(), .funct7(), .ctrl(ctrl));

// Keep datapath named `datapath` for RVFI Monitor
datapath datapath(.clk(clk). .rst(rst), 
	 .id_ctrl(ctrl), .if_opcode(opcode), .if_funct3(), .if_funct7(),
	 .if_i_mem_data(), .i_mem_address(), .i_mem_read(),
	 .wb_d_mem_data(), .d_mem_wdata(), .d_mem_address(), .d_mem_write(), d_mem_read(), d_mem_byte_enable()
);

endmodule : mp4
