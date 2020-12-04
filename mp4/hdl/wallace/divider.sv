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


logic [63:0] dd, ds, dd_in, ds_in;
logic [31:0] q;
logic [5:0] counter, counter_in;	// counts # of times shifted
logic load_q, load_dd, load_ds, load_counter;
logic [31:0] q_in;

assign quotient_o = q;
assign remainder_o = dd[31:0];

enum int unsigned {init, subtract, shift, done} state, next_state;

register reg_q (
    .clk  (clk_i), .rst (reset_i), .load (load_q),
    .in   (q_in), .out  (q)
);
register #(.width(64)) reg_dd (
    .clk  (clk_i), .rst (reset_i), .load (load_dd),
    .in   (dd_in), .out  (dd)
);
register #(.width(64)) reg_ds (
    .clk  (clk_i), .rst (reset_i), .load (load_ds),
    .in   (ds_in), .out  (ds)
);
register #(.width(5)) reg_counter (
    .clk  (clk_i), .rst (reset_i), .load (load_counter),
    .in   (counter_in), .out  (counter)
);


function void set_defaults();
    done_o = 1'b0;
	 load_dd = 1'b0;
	 load_ds = 1'b0;
	 load_q = 1'b0;
	 load_counter = 1'b0;
	 q_in = q;
	 ds_in = ds;
	 dd_in = dd;
	 counter_in = counter;
endfunction

// if divisor == 0, error bit?

always_comb begin : state_actions
set_defaults();
  case(state)
    // initially, have 64bit 0000dividend and divisor0000, 32 bit quotient = 0, done_o = 0
    init: begin
	   dd_in = {32'b0, dividend_i};
		load_dd = 1'b1;
		ds_in = {divisor_i, 32'b0};
		load_ds = 1'b1;
		q_in = 32'b0;
		load_q = 1'b0;
		counter_in = 0;
		load_counter = 1'b1;
		done_o = 1'b0;
	 end
	 // subtract state: if ds <= dd, then: dd = dd - ds, q += 1
    // else: do nothing. shift.
	 subtract: begin
	   done_o = 1'b0;
		load_ds = 1'b0;
	   if(ds <= dd) begin
		  dd_in = dd - ds;
		  load_dd = 1'b1;
		  q_in = q + 1;
		  load_q = 1'b1;
		end
	 end
	 // shift state: quotient << 1, ds >> 1;
	 shift: begin
	   if (counter < 32) begin
	     q_in = q << 1;
		  load_q = 1'b1;
		  ds_in = ds >> 1;
		  load_ds = 1'b1;
		end
		counter_in = counter + 1;
		load_counter = 1'b1;
		done_o = 1'b0;
	 end
	 done: begin
	   done_o = 1'b1;
	 end
  endcase
end

always_comb begin : next_state_logic
  case(state)
    init:
	   next_state = subtract;
	 subtract: begin
	   if (counter < 32)
	     next_state = shift;
		else
		  next_state = done;
	 end
	 shift: begin
	     next_state = subtract;
	 end
	 done: 
	   next_state = done;
  endcase
end


always_ff @(posedge clk_i) begin: next_state_assignment
  if(reset_i || ((start_i) && state == done) )
    state <= init;
  else
    state <= next_state;
end

endmodule: divider
