import rv32i_types::*;

module ctrl_reg
(
    input clk,
    input rst,
    input load,
    input rv32i_ctrl_word in,
    output rv32i_ctrl_word out
);

rv32i_ctrl_word data = '0;

always_ff @(posedge clk)
begin
    if (rst)
    begin
        data <= '0;
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
    out = data;
end

endmodule : ctrl_reg