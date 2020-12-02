// 32 bit divider
module divider
(
    input logic clk_i,
    input logic reset_i,
    input logic [31:0] dividend_i,
    input logic [31:0] divisor_i,
    input logic start_i,
    //output logic ready_o,
    output logic [31:0] quotient_o,
	 output logic [31:0] remainder_o,
    output logic done_o
);


logic [63:0] dd, ds;
logic [31:0] q;
logic [5:0] counter;	// counts # of times shifted

assign quotient_o = q;
assign remainder_o = dd;

enum int unsigned {init, subtract, shift, done} state, next_state;

// if divisor == 0, error bit?

always_comb begin : state_actions
  case(state)
    // initially, have 64bit 0000dividend and divisor0000, 32 bit quotient = 0, done_o = 0
    init: begin
	   dd = {32'b0, dividend_i};
		ds = {divisor_i, 32'b0};
		q = 0;
		done_o = 1'b0;
		counter = 0;
	 end
	 // subtract state: if ds < dd, then: dd = dd - ds, q += 1
    // else: do nothing. shift.
	 subtract: begin
	   done_o = 1'b0;
	   if(ds < dd) begin
		  dd = dd - ds;
		  q = q + 1;
		end
		//else begin dd = dd; q = q; counter = counter; end
	 end
	 // shift state: quotient << 1, ds >> 1;
	 shift: begin
	   if (counter < 32) begin
	     q = q << 1;
		  ds = ds >> 1;
		end
		counter = counter + 1;
		done_o = 1'b0;
	 end
	 done:
	   done_o = 1'b1;
  endcase
end

always_comb begin : next_state_logic
  case(state)
    init:
	   next_state = subtract;
	 subtract:
	   next_state = shift;
	 shift: begin
	   if (counter < 32)
	     next_state = subtract;
		else
		  next_state = done;
	 end
	 done: 
	   next_state = done;
  endcase
end

always_ff @(posedge clk_i) begin: next_state_assignment
  if(reset_i | start_i)
    state <= init;
  else
    state <= next_state;
end

endmodule: divider
