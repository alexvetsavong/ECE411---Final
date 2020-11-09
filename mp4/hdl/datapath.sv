`define BAD_MUX_SEL $fatal("%0t %s %0d: Illegal mux select", $time, `__FILE__, `__LINE__)

import rv32i_types::*;

module datapath
(
    input clk,
    input rst,
	 
	 // From Control ROM
	 input logic [2:0] id_immmux_sel,
	 // id_ctl_signals, ex_ctl_signals, mem_ctl_signals, wb_ctl_signals can all be decided by control.sv
	 // Or, we can use registers (# of vars in control vs. # of registers)
	 
	 
	 // To Control ROM
	 output rv32i_opcode if_opcode, 
	 output logic [2:0] if_funct3, 
	 output logic [6:0] if_funct7
);




/**************** Signals ****************/
// IF stage:
// Inputs TODO: ex_alu_out, ex_br_en, ex_alu_mod2, ex_jmp_op/opcode, i_mem_read (I-Cache)
// Outputs TODO:if_i_mem_data (I-Cache)
logic load_pc = 1'b1;	// set pc to be always loading
rv32i_word pcmux1_out, pcmux2_out;
rv32i_word if_pc_out;

// IF/ID:
logic load_ir = 1'b1;	// set ir to be always loading
logic [2:0] if_funct3;	// funct3, 7, opcodes go to control ROM.
logic [6:0] if_funct7;
rv32i_opcode if_opcode;
rv32i_word id_i_imm, id_s_imm, id_b_imm, id_u_imm, id_j_imm;	// Immediate values - go to immmux
logic [4:0] id_rs1, id_rs2, id_rd	// rs1, rs2 are used by regfile; rd needs to be preserved to later stages.
rv32i_word id_pc_out;

// ID stage:
rv32i_word id_rs1_out, id_rs2_out;
rv32i_word id_imm;
// TODO: wb_rd, wb_load_regfile, and wb_regfilemux_out - defined in WB stage

// ID/EX:
rv32i_word ex_pc_out, ex_rs1_out, ex_rs2_out, ex_rd, ex_imm;




/**************** Modules ****************/
// IF Modules
pc_register PC(
	.clk 	(clk), .rst (rst),
	.load (load_pc),
	.in   (pcmux2_out),
	.out  (if_pc_out)
);
// TODO: I-Cache - takes if_pc_out, i_mem_read as input, and outputs if_i_mem_data.

// IF/ID Modules
ir IR(
    .clk  (clk), .rst (rst),
    .load (load_ir),
	 .in (if_i_mem_data),
	 .funct3 (if_funct3), .funct7 (if_funct7),
	 .opcode(if_opcode),
	 .i_imm (id_i_imm), .s_imm (id_s_imm), .b_imm (id_b_imm), .u_imm (id_u_imm), .j_imm (id_j_imm),
	 .rs1 (id_rs1), .rs2 (id_rs2), .rd (id_rd)
);

register if_id_pc_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (if_pc_out), .out  (id_pc_out)
);

// ID Modules
regfile regfile(
    .clk  (clk),	.rst (rst),
    .load (wb_load_regfile),
    .in   (wb_regfilemux_out),
	 .src_a (id_rs1),
	 .src_b (id_rs2),
	 .dest (wb_rd),
    .reg_a (id_rs1_out),
	 .reg_b (id_rs2_out)
);

// ID/EX:
register id_ex_pc_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (id_pc_out), .out  (ex_pc_out)
);

register id_ex_rs1_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (id_rs1), .out  (ex_rs1_out)
);

register id_ex_rs2_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (id_rs2), .out  (ex_rs2_out)
);

register id_ex_rd_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (id_rd), .out  (ex_rd)
);

register id_ex_imm_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (id_imm), .out  (ex_imm)
);



/**************** MUXES ****************/
always_comb begin : 
	 // MUX before PCMUX in the datapath diagram
    unique case (ex_br_en)
        1'b0: pcmux1_out = pc_out + 4;		// Adder in IF stage
		  1'b1: pcmux1_out = ex_alu_out;		// PC <- b_imm + PC if br_en
        default: `BAD_MUX_SEL;
	 endcase
	 
	 // PCMUX
	 unique case (ex_opcode)	// Check naming - was jmp_op in diagram
		  7'b1101111: pcmux2_out = ex_alu_mod2;	// JALR: Target addr <- i_imm + rs1, with LSB set to zero.
        default: `pcmux2_out = pcmux1_out;
	 endcase
	 
	 // IMMMUX
	 unique case (id_immmux_sel)
		  3'b000: id_imm = id_i_imm;
		  3'b001: id_imm = id_s_imm;
		  3'b010: id_imm = id_b_imm;
		  3'b011: id_imm = id_u_imm;
		  3'b100: id_imm = id_j_imm;
        default: `BAD_MUX_SEL;
	 endcase
end

endmodule : datapath