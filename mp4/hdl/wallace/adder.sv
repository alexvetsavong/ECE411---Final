// Adder.sv - full adder and half adder
// ^ == XOR
module halfadder(
  input logic a,
  input logic b,
  output logic s,
  output logic c
);
assign s = a ^ b;
assign c = a & b;

endmodule: halfadder

module fulladder(
  input logic a,
  input logic b,
  input logic cin,
  output logic s,
  output logic c
);
assign s = a ^ b ^ cin;
assign c = (a & b) | (a & cin) | (a & cin);

endmodule: fulladder

module wallace_3_to_2(
  input logic a1[],
  input logic a2[],
  input logic a3[],
  output logic [] b1,
  output logic [] b2,
);

genvar g;
byte width = a1.size;
generate: full_adders_layer
  for(g = 0; g < a1.size - 1; g++) begin
    fulladder(.a(a1[g]), .b(a2[g]), .cin(a3[g]), .s(b1[g]), .c(b2[g + 1]));
  end
endgenerate: full_adders_layer

fulladder(.a(a1[width - 1]), .b(a2[width - 1]), .cin(a3[width - 1]), .s(b1[width - 1]), .c());

endmodule: wallace_3_to_2

// TODO: 32-bit Carry Propagate Adder or CLA for the last stage
