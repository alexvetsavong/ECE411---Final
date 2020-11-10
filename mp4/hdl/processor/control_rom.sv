import rv32i_types::*;

module control_rom(
    input rv32i_opcode opcode,
    input logic [2:0] funct3,
    input logic [6:0] funct7,

    output rv32i_ctrl_word ctrl
);
logic [3:0] wmask, rmask;
logic trap;

store_funct3_t store_funct3;
load_funct3_t load_funct3;
branch_funct3_t branch_funct3;

assign branch_funct3 = branch_funct3_t'(funct3);
assign load_funct3 = load_funct3_t'(funct3);
assign store_funct3 = store_funct3_t'(funct3);

always_comb
begin : trap_check
    trap = 0;
    rmask = '0;
    wmask = '0;

    case (opcode)
        op_lui, op_auipc, op_imm, op_reg, op_jal, op_jalr:;

        op_br: begin
            case (branch_funct3)
                beq, bne, blt, bge, bltu, bgeu:;
                default: trap = 1;
            endcase
        end

        op_load: begin
            case (load_funct3)
                lw: rmask = 4'b1111;
                lh, lhu: rmask = 4'b0011;
                lb, lbu: rmask = 4'b0001;
                default: trap = 1;
            endcase
        end

        op_store: begin
            case (store_funct3)
                sw: wmask = 4'b1111;
                sh: wmask = 4'b0011;
                sb: wmask = 4'b0001;
                default: trap = 1;
            endcase
        end

        default: trap = 1;
    endcase
end


function void set_defaults();
    ctrl.mem_read = 1'b0; 
    ctrl.mem_write = 1'b0;
    ctrl.mem_byte_enable = 4'b1111;

    ctrl.immmux_sel = immmux::i_imm;
    ctrl.alumux1_sel = alumux::rs1_out;
    ctrl.alumux2_sel = alumux::imm;
    ctrl.regfilemux_sel = regfilemux::alu_out;
    ctrl.pcmux_sel = pcmux::pc_plus4;
    ctrl.cmpmux_sel = cmpmux::i_imm;
    
    ctrl.jmp_op = 1'b0;
    ctrl.br_op = 1'b0;

    ctrl.aluop = alu_add;
    ctrl.cmpop = beq;
    
    ctrl.load_regfile = 1'b0;
endfunction

always_comb begin
    set_defaults();
    case (opcode)
        op_lui:
        begin
            ctrl.immmux_sel = immmux::u_imm;
            ctrl.regfilemux_sel = regfilemux::u_imm; 
            ctrl.load_regfile = 1'b1;
        end
        op_auipc: 
        begin
            ctrl.immmux_sel = immmux::u_imm;
            ctrl.aluop = alu_add;
            ctrl.alumux1_sel = alumux::pc_out;
            ctrl.alumux2_sel = alumux::imm;
            ctrl.regfilemux_sel = regfilemux::alu_out;
            ctrl.load_regfile = 1'b1;
        end
        
        op_jal: 
        begin
            ctrl.immmux_sel = immmux::j_imm;
            ctrl.jmp_op = 1'b1;
            ctrl.aluop = alu_add;
            ctrl.alumux1_sel = alumux::pc_out;
            ctrl.alumux2_sel = alumux::imm;
            ctrl.regfilemux_sel = regfilemux::pc_plus4;
            ctrl.load_regfile = 1'b1;
        end
        
        op_jalr: 
        begin
            ctrl.immmux_sel = immmux::i_imm;
            ctrl.jmp_op = 1'b1;
            ctrl.aluop = alu_add;
            ctrl.alumux1_sel = alumux::rs1_out;
            ctrl.alumux2_sel = alumux::imm;
            ctrl.regfilemux_sel = regfilemux::pc_plus4;
            ctrl.load_regfile = 1'b1;
        end
        op_br: 
        begin
            ctrl.br_op = 1'b1;
            ctrl.immmux_sel = immmux::b_imm;
            ctrl.cmpop = branch_funct3_t'(funct3);
            ctrl.cmpmux_sel = cmpmux::i_imm;
            ctrl.aluop = alu_add;
            ctrl.alumux1_sel = alumux::pc_out;
            ctrl.alumux2_sel = alumux::imm;
        end
        op_load: 
        begin
            ctrl.immmux_sel = immmux::i_imm;
            ctrl.alumux1_sel = alumux::rs1_out;
            ctrl.alumux2_sel = alumux::imm;
            
            // memory stuff needs to be looked at
            // ctrl.mem_address = alu_out; // figure this out
            ctrl.mem_read = 1'b1;
            ctrl.mem_byte_enable = rmask;// figure this out;
            
            // put case statements in whenever we figure out alignment
            ctrl.regfilemux_sel = regfilemux::lw;
            ctrl.load_regfile = 1'b1;
        end
        op_store:
        begin 
            ctrl.immmux_sel = immmux::s_imm;
            ctrl.alumux1_sel = alumux::rs1_out;
            ctrl.alumux2_sel = alumux::imm;
            
            // memory stuff
            // ctrl.mem_address = alu_out; // figure this out
            // ctrl.wdata = rs2_out;
            ctrl.mem_write = 1'b1;
            ctrl.mem_byte_enable = wmask;// figure this out;

            ctrl.load_regfile = 1'b0;
        end
        op_imm: 
        begin
            ctrl.immmux_sel = immmux::i_imm;
            ctrl.alumux1_sel = alumux::rs1_out;
            ctrl.alumux2_sel = alumux::imm;
            ctrl.load_regfile = 1'b1;
            case (funct3)
                slt: 
                begin 
                    ctrl.cmpmux_sel = cmpmux::i_imm;
                    ctrl.cmpop = blt;
                    ctrl.regfilemux_sel = regfilemux::br_en;
                end
                sltu: 
                begin 
                    ctrl.cmpmux_sel = cmpmux::i_imm;
                    ctrl.cmpop = bltu; 
                    ctrl.regfilemux_sel = regfilemux::br_en;
                end
                sr: 
                begin 
                    case(funct7[5])
                        1'b0: ctrl.aluop = alu_srl;
                        1'b1: ctrl.aluop = alu_sra;
                    endcase
                    ctrl.regfilemux_sel = regfilemux::alu_out;
                end
                default: 
                begin 
                    ctrl.regfilemux_sel = regfilemux::alu_out;
                    ctrl.aluop = alu_ops'(funct3);
                end
            endcase
        end
        op_reg: 
        begin
            ctrl.immmux_sel = immmux::i_imm;
            ctrl.alumux1_sel = alumux::rs1_out;
            ctrl.alumux2_sel = alumux::rs2_out;
            ctrl.load_regfile = 1'b1;
            case (funct3)
                slt: 
                begin 
                    ctrl.cmpmux_sel = cmpmux::rs2_out;
                    ctrl.cmpop = blt;
                    ctrl.regfilemux_sel = regfilemux::br_en;
                end
                sltu: 
                begin 
                    ctrl.cmpmux_sel = cmpmux::rs2_out;
                    ctrl.cmpop = bltu; 
                    ctrl.regfilemux_sel = regfilemux::br_en;
                end
                sr: 
                begin 
                    ctrl.regfilemux_sel = regfilemux::alu_out;
                    case(funct7[5])
                        1'b0: ctrl.aluop = alu_srl;
                        1'b1: ctrl.aluop = alu_sra;
                    endcase
                end
                default: 
                begin 
                    ctrl.regfilemux_sel = regfilemux::alu_out;
                    ctrl.aluop = alu_ops'(funct3);
                end
            endcase
        end
        op_csr:
        begin
            /* not going to handle anything with csr (for now) */
        end

        default: set_defaults();
    endcase
end

endmodule