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

// TODO: 32-bit Carry Propagate Adder or CLA for the last stage