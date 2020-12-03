// Wallace Reduction Module
module wallace_reduction
#(parameter width = 32)
(
  input logic [(width-1):0][(width*2-1):0] p,
  output logic [(2*width-1):0] f1, f2	// final 64-bit result
);

logic [][] p_out = p;

generate
while (p_out.size < 2) begin
  wallace_reduction_layer(.p_in(p_out), .p_out(p_out))
end
assign f1 = p_out[0];
assign f2 = p_out[1];
endgenerate

endmodule: wallace_reduction