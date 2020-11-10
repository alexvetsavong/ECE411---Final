import rv32i_types::*;

module control_rom(
    input rv32i_opcode opcode,
    input logic [2:0] funct3,
    input logic [6:0] funct7,

    output rv32i_ctrl_word ctrl
);
logic [3:0] wmask, rmask;

always_comb begin
    case(load_funct3_t'(funct3))
        lb, lbu: rmask = 4'b0001;
        lh, lhu: rmask = 4'b0011;
        lw: rmask = 4'b1111;
        default: rmask = 4'b1111;
    endcase
    
    case(store_funct3_t'(funct3))
        sb: wmask = 4'b0001;
        sh: wmask = 4'b0011;
        sw: wmask = 4'b1111;
        default: wmask = 4'b1111;
    endcase
end


always_comb begin
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

    endcase
end

endmodule