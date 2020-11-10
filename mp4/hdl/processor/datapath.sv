`define BAD_MUX_SEL $fatal("%0t %s %0d: Illegal mux select", $time, `__FILE__, `__LINE__)

import rv32i_types::*;

module datapath
(
    input clk,
    input rst,
	 
	 /**************** From Control ROM ****************/
	 input rv32i_ctrl_word id_ctrl,
	  
	 /**************** To Control ROM ****************/
	 output rv32i_opcode if_opcode, 
	 output logic [2:0] if_funct3, 
	 output logic [6:0] if_funct7,
	 
	 /**************** From I-Cache ****************/
	 input logic [31:0] if_i_mem_data,
	 
	 /**************** To I-Cache ****************/
	 output logic [31:0] i_mem_address,
	 output logic i_mem_read,
	 
	 /**************** From D-Cache ****************/
	 input logic [31:0] wb_d_mem_data,
	 
	 /**************** To D-Cache ****************/
	 output logic [31:0] d_mem_wdata, d_mem_address,
	 output logic d_mem_write, d_mem_read,
	 output logic [3:0] d_mem_byte_enable
);
/**************** Signals ****************/

// IF stage:
logic load_pc = 1'b1;	// set pc to be always loading
rv32i_word pcmux1_out, pcmux2_out, if_pc_out;

// IF/ID:
logic load_ir = 1'b1;	// set ir to be always loading
rv32i_word id_i_imm, id_s_imm, id_b_imm, id_u_imm, id_j_imm;	// Immediate values - go to immmux
logic [4:0] id_rs1, id_rs2, id_rd;	// rs1, rs2 are used by regfile; rd needs to be preserved to later stages.
rv32i_word id_pc_out;

// ID stage:
rv32i_word id_rs1_out, id_rs2_out;
rv32i_word id_imm;

// ID/EX:
rv32i_word ex_pc_out, ex_rs1_out, ex_rs2_out, ex_rd, ex_imm;
rv32i_ctrl_word ex_ctrl;

// EX stage:
rv32i_word ex_alumux1_out, ex_alumux2_out, ex_cmpmux_out;
logic ex_br_en;
rv32i_word ex_alu_out;

// EX/MEM
rv32i_word mem_pc_out, mem_rs1_out, mem_rs2_out, mem_rd, mem_imm, mem_alu_out;
logic mem_br_en;
rv32i_ctrl_word mem_ctrl;

// MEM/WB:
rv32i_word wb_br_en;		// Note that br_en is zero-extended to 32 bits
rv32i_word wb_pc_out, wb_imm, wb_alu_out;
logic [4:0] wb_rd;

// WB
rv32i_word wb_regfilemux_out;
rv32i_ctrl_word wb_ctrl;

// Datapath <-> Cache
assign i_mem_address = if_pc_out;
assign i_mem_read = 1'b1;
assign d_mem_wdata = mem_rs2_out;
assign d_mem_address = mem_alu_out;
assign d_mem_read = mem_ctrl.mem_read;
assign d_mem_write = mem_ctrl.mem_write;
assign d_mem_byte_enable = mem_ctrl.mem_byte_enable;

/** RVFI Monitor signals here -- need to be set! **/
logic halt;
assign halt = pcmux2_out == if_pc_out ? 1'b1 : 1'b0;

/************* End of RVFImon signals *************/

/**************** Modules ****************/
// IF Modules
pc_register PC(
	.clk 	(clk), .rst (rst),
	.load (load_pc),
	.in   (pcmux2_out),
	.out  (if_pc_out)
);

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
    .load (wb_ctrl.load_regfile),
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

ctrl_reg id_ex_ctrl_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (id_ctrl), .out  (ex_ctrl)
);

// EX stage:
alu ALU(
	 .aluop (ex_ctrl.aluop),
	 .a (ex_alumux1_out),
	 .b (ex_alumux2_out),
	 .f (ex_alu_out)
);

cmp CMP(
    .in_a (ex_rs1_out),
	 .in_b (ex_cmpmux_out),
	 .cmpop (ex_ctrl.cmpop),
	 .out (ex_br_en)
);

// EX/MEM
register ex_mem_pc_reg(		// PC Adder + Reg
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (ex_pc_out + 4), .out  (mem_pc_out)
);

register ex_mem_rd_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (ex_rd), .out  (mem_rd)
);

register ex_mem_alu_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (ex_alu_out), .out  (mem_alu_out)
);

register ex_mem_rs2_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (ex_rs2_out), .out  (mem_rs2_out)
);

register ex_mem_br_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (ex_br_en), .out  (mem_br_en)
);

register ex_mem_imm_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (ex_imm), .out  (mem_imm)
);

ctrl_reg ex_mem_ctrl_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (ex_ctrl), .out  (mem_ctrl)
);


// MEM/WB
register mem_wb_pc_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (mem_pc_out), .out  (wb_pc_out)	// Goes to regfilemux
);

register mem_wb_rd_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (mem_rd), .out  (wb_rd)	// Goes to regfile in ID stage
);

register mem_wb_br_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   ({31'b0, mem_br_en}), .out  (wb_br_en)	// Zero-extend Module here
);

register mem_wb_alu_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (mem_alu_out), .out  (wb_alu_out)
);

register mem_wb_imm_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (mem_imm), .out  (wb_imm)		// Goes to regfilemux
);

ctrl_reg mem_wb_ctrl_reg(
    .clk  (clk), .rst (rst), .load (1'b1),
    .in   (mem_ctrl), .out  (wb_ctrl)
);





/**************** MUXES ****************/
always_comb begin
	 // MUX before PCMUX in the datapath diagram
    unique case (ex_br_en)
        1'b0: pcmux1_out = if_pc_out + 4;	// Adder in IF stage
		1'b1: pcmux1_out = ex_alu_out;		// PC <- b_imm + PC if br_en
        // default: `BAD_MUX_SEL;
	endcase
	 
	 // PCMUX
	 unique case (ex_ctrl.jmp_op)
		1'b1: pcmux2_out = {ex_alu_out[31:1], 1'b0};	// JALR: Target addr <- i_imm + rs1, with LSB set to zero.
        default: pcmux2_out = pcmux1_out;
	endcase
	 
	 // IMMMUX
	unique case (id_ctrl.immmux_sel)
		  immmux::i_imm: id_imm = id_i_imm;
		  immmux::u_imm: id_imm = id_u_imm;
		  immmux::b_imm: id_imm = id_b_imm;
		  immmux::s_imm: id_imm = id_s_imm;
		  immmux::j_imm: id_imm = id_j_imm;
        default: `BAD_MUX_SEL;
	endcase
	 
	// ALUMUX1
	unique case (ex_ctrl.alumux1_sel)
		alumux::rs1_out: ex_alumux1_out = ex_rs1_out;
		alumux::pc_out:  ex_alumux1_out = ex_pc_out;
        default: `BAD_MUX_SEL;
	endcase
	 
	// ALUMUX2 - still uses struct alumux2_sel_t for convenience, although imm values are already selected
	unique case (ex_ctrl.alumux2_sel)
        alumux::imm: ex_alumux2_out = ex_imm;
		alumux::rs2_out: ex_alumux2_out = ex_rs2_out;
        default: `BAD_MUX_SEL;
    endcase
	 
	// CMPMUX
	unique case (ex_ctrl.cmpmux_sel)
		cmpmux::rs2_out: ex_cmpmux_out = ex_rs2_out;
		cmpmux::i_imm: ex_cmpmux_out = ex_imm;
		default: `BAD_MUX_SEL;
	endcase
	 
	// REGFILEMUX
	unique case (wb_ctrl.regfilemux_sel)
        regfilemux::alu_out: wb_regfilemux_out = wb_alu_out;
		regfilemux::br_en: wb_regfilemux_out = wb_br_en;	// already ZEXTed
		regfilemux::u_imm: wb_regfilemux_out = wb_imm;
		regfilemux::lw: wb_regfilemux_out = wb_d_mem_data;	
		regfilemux::pc_plus4: wb_regfilemux_out = wb_pc_out;	// already +4'ed in EX stage
		regfilemux::lb: wb_regfilemux_out = {  {24{wb_d_mem_data[7]}}, wb_d_mem_data[7:0]};  // sign-ext
		regfilemux::lbu: wb_regfilemux_out = { 24'b0, wb_d_mem_data[7:0]};							// zero-ext
		regfilemux::lh: wb_regfilemux_out = {  {16{wb_d_mem_data[15]}}, wb_d_mem_data[15:0]};
		regfilemux::lhu: wb_regfilemux_out = { 16'b0, wb_d_mem_data[15:0]};
        default: `BAD_MUX_SEL;
    endcase
end

endmodule : datapath