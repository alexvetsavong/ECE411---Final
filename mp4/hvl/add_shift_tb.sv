// add shift 64 tb
import mult_types::*;

module add_shift_tb;

logic clk, reset_n, start, rdy, done;
logic [31:0] multiplicand, multiplier;
logic [63:0] product;
logic correct = 1'b1;

// generate clock
always begin
  clk = 0;
  #10;
  clk = 1;
  #10;
end
add_shift_multiplier dut (
    .clk_i          ( clk          ),
    .reset_n_i      ( reset_n      ),
    .multiplicand_i ( multiplicand ),
    .multiplier_i   ( multiplier   ),
    .start_i        ( start        ),
    .ready_o        ( rdy          ),
    .product_o      ( product      ),
    .done_o         ( done         )
);

// Resets the multiplier
task reset();
    reset_n <= 1'b0;
    #100;
    reset_n <= 1'b1;
    #1;
endtask : reset

initial begin
    reset_n <= 1'b0;
    #100;
    reset_n <= 1'b1;
    #1;
	 // after the first reset, rdy should be 1
	
    for (int i = 2; i <= 32'hFF; ++i) begin
			for (int j = 2; j <= 32'hFF; ++j) begin
				multiplicand <= i[31:0];
				multiplier <= j[31:0];
				// assert start_i from READY state
				start <= 1'b1;
				#10;
				start <= 1'b0;
				
				while (done == 1'b0) begin
				  #10;
				end
				// check output
				assert (product == multiplicand * multiplier)
				    else begin
						correct = 1'b0;
				    end
				#10;	 
			end
	 end
end


endmodule
