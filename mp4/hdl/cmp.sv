import rv32i_types::*;

module cmp
(
    input rv32i_word in_a, in_b,
	input branch_funct3_t cmpop,
	output logic out
);

always_comb
begin
    case (cmpop)
	     beq: begin
		      if (in_a == in_b)
		          out = 1;
				else
				    out = 0;
		  end
		  bne: begin
		      if (in_a != in_b)
		          out = 1;
				else
				    out = 0;
		  end
	     blt: begin
		      if ($signed(in_a) < $signed(in_b))
		          out = 1;
				else
				    out = 0;
		  end
		  bltu: begin
		      if (in_a < in_b)
		          out = 1;
				else
				    out = 0;
		  end
		  bge: begin
		      if ($signed(in_a) >= $signed(in_b))
		          out = 1;
				else
				    out = 0;
		  end
		  bgeu: begin
		      if (in_a >= in_b)
		          out = 1;
				else
				    out = 0;
		  end
	     default: 
		      out = 0;
	 endcase
end

endmodule : cmp