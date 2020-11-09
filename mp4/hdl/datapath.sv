`define BAD_MUX_SEL $fatal("%0t %s %0d: Illegal mux select", $time, `__FILE__, `__LINE__)

import rv32i_types::*;

module datapath
(
    input clk,
    input rst,
    input load_mdr,
    input rv32i_word mem_rdata,
    output rv32i_word mem_wdata
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
logic [4:0] id_rs1, id_rs2, id_rd	// used by regfile
rv32i_word id_pc_out;




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
    .clk  (clk), .rst (rst),
    .load (1'b1),
    .in   (if_pc_out),
    .out  (id_pc_out)
);




/**************** MUX ****************/
always_comb begin : MUXES
	 // MUX before PCMUX in the datapath diagram
    unique case (ex_br_en)
        1'b0: pcmux1_out = pc_out + 4;		// Adder in IF stage
		  1'b1: pcmux1_out = ex_alu_out;		// PC <- b_imm + PC if br_en
        default: `BAD_MUX_SEL;
	 endcase
	 
	 // PCMUX
	 unique case (ex_opcode)	// Check naming - was jmp_op in diagram
		  7'b1101111: pcmux2_out = ex_alu_mod2;	// JALR: Target addr <- i_imm + rs1, with LSB set to zero.
        default: `pcmux2_out = pcmux1_out;;
	 endcase
	  
end

endmodule : datapath