// wallace reduction layer
module wallace_reduction_layer
// #(parameter width = 32)
(
  input logic [][] p_in,
  output logic [][] p_out
);

byte num_lines = p_in.size;
byte width = p_in[0].size;
/*
             width
	XXXXXXXXXXXXXXXXXXXXXXXX
	XXXXXXXXXXXXXXXXXXXXXXXX num_lines
	XXXXXXXXXXXXXXXXXXXXXXXX
*/
byte num_3_to_2 = int(num_lines / 3);
byte new_num_lines = 2 * num_3_to_2 + (num_lines % 3);

logic [new_num_lines][width] p_new;

genvar i, j;
for(j = 0; j < (num_lines % 3); j++) begin
  p_new[new_num_lines - 1 - j] = p_in[num_lines - 1 - j];
end
  
generate: reduction_layer begin
  for(i = 0; i < num_3_to_2; i++) begin
    //take p_in 3i, 3i+1, 3i+2, output to p_new 2i, 2i+1.
    wallace_3_to_2(.a1(p_in[3*i]), 
	                .a2(p_in[3*i + 1]), 
						 .a3(p_in[3*i + 2]), 
						 .b1(p_new[2*i]), 
						 .b2(p_new[2*i + 1]));
  end
end
endgenerate: reduction_layer

assign p_out = p_new;

endmodule: wallace_reduction_layer