// divider testbench

module divider_tb;

logic clk, reset, start, rdy, done;
logic [31:0] dividend, divisor;
logic [31:0] quotient, remainder;
logic correct = 1'b1;

// generate clock
always begin
  clk = 0;
  #10;
  clk = 1;
  #10;
end

divider dut (
    .clk_i          ( clk          ),
    .reset_i      ( reset      ),
    .dividend_i ( dividend ),
    .divisor_i   ( divisor   ),
    .start_i        ( start        ),
    //.ready_o        ( rdy          ),
    .quotient_o      ( quotient      ),
	 .remainder_o  (remainder),
    .done_o         ( done         )
);

// Resets the divider
task reset_divider();
    reset <= 1'b1;
    #100;
    reset <= 1'b0;
    #1;
endtask : reset_divider

initial begin
    reset_divider();
	 // after the first reset, rdy should be 1 (unused in divider)
	 
	 // TODO: test division by 0 
	 
    for (int i = 1; i <= 32'hFFFF; ++i) begin
			for (int j = 1; j <= 32'hFFFF; ++j) begin
				dividend <= i[31:0];
				divisor <= j[31:0];
				// assert start_i from READY state
				start <= 1'b1;
				#10;
				start <= 1'b0;
				
				while (done == 1'b0) begin
				  #1;
				end
				// check output
				assert (quotient == int'(dividend / divisor)) 
				    else begin
						correct = 1'b0;
				    end
				assert (remainder == dividend % divisor) 
				    else begin
						correct = 1'b0;
				    end
				#10;	 
			end
	 end
end

endmodule
