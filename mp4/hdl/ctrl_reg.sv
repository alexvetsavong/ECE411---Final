import rv32i_types::*;

import pcmux::*;
import marmux::*;
import cmpmux::*;
import alumux::*;
import regfilemux::*;

module ctrl_reg
(
    input clk,
    input rst,
    input load,
    input rv32i_ctrl_word in,
    output rv32i_ctrl_word out
);

rv32i_ctrl_word data = '0;

rv32i_ctrl_word reset_val;

function void set_defaults();
    reset_val.mem_read = 1'b0; 
    reset_val.mem_write = 1'b0;

    reset_val.immmux_sel = immmux::i_imm;
    reset_val.alumux1_sel = alumux::rs1_out;
    reset_val.alumux2_sel = alumux::imm;
    reset_val.regfilemux_sel = regfilemux::alu_out;
    reset_val.pcmux_sel = pcmux::pc_plus4;
    reset_val.cmpmux_sel = cmpmux::i_imm;
    
    reset_val.jmp_op = 1'b0;
    reset_val.br_op = 1'b0;

    reset_val.aluop = alu_add;
    reset_val.cmpop = beq;
    
    reset_val.load_regfile = 1'b0;

    reset_val.opcode = rv32i_opcode::op_imm;
    reset_val.funct3 = 3'b000;
endfunction


always_ff @(posedge clk)
begin
    if (rst)
    begin
        data <= reset_val;
    end
    else if (load)
    begin
        data <= in;
    end
    else
    begin
        data <= data;
    end
end

always_comb
begin
    set_defaults();
    out = data;
end

endmodule : ctrl_reg