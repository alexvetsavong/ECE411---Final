// Wallace Tree Multiplier
module wallace(
  input logic [31:0] a,
  input logic [31:0] b,
  output logic [63:0] s
);

// Partial Products [row#][bit#]
logic [31:0][31:0] p1;
logic [21:0][31:0] p2;

// temp array: bits that do not need adders
logic [200:0] t;

// generate full adders
genvar g;

always_comb begin
  int i, j;
  for(i = 0; i < 32; i++)    // pick the i-th bit from b
    for(j = 0; j < 32; j++)  // AND it with all 32 bits in a
	   p1[i][j] = a[j] & b[i];
end

/*
10 * (group of 3 rows) + (group of 2 rows) 
=> 22 rows after reduction => 7 * (group of 3 rows) + (group of 1 row) 
=> 15 rows after reduction => 5 * (group of 3 rows)
=> 10 rows after reduction => 3 * (group of 3 rows) + (group of 1 row) 
=> 7 rows after reduction => 2 * (group of 3 rows) + (group of 1 row) 
=> 5 rows after reduction => 1 * (group of 3 rows) + (group of 2 rows) 
=> 4 rows after reduction => 1 * (group of 3 rows) + (group of 1 row) 
=> 3 rows after reduction => 1 * (group of 3 rows)
=> 2 rows after reduction => Final addition! (64-bit Carry Propagate Adder)
*/

/*
	1st stage:
	     00000000000000000000000000000000
	    10001000100010001000100010001000
	   10001000100010001000100010001000
		
		X100.........................1000X
		00000000000000000000000000000000
		
	  00000000000000000000000000000000
	 10001000100010001000100010001000
	10001000100010001000100010001000
	2 direct assign, 2 half adders, 30 full adders - repeat 10 times.
*/
// Group 1: row 0-2 -> row 0-1
assign t[0] = p1[0][0];
halfadder ha0(.a(p1[0][1]), .b(p1[1][0]), .s(p2[0][0]), .c(p2[1][0]));
generate
  for(g = 2; g <= 31; g++) begin : fa0generator
    fulladder fa0(.a(p1[0][g]), .b(p1[1][g - 1]), .cin(p1[2][g - 2]), .s(p2[0][g - 1]), .c(p2[1][g - 1]));
  end
endgenerate
halfadder ha1(.a(p1[1][31]), .b(p1[2][30]), .s(p2[0][31]), .c(p2[1][31]));
assign t[1] = p1[2][31];

// Group 2: row 3-5 -> row 2-3
assign t[2] = p1[3][0];
halfadder ha2(.a(p1[3][1]), .b(p1[4][0]), .s(p2[2][0]), .c(p2[3][0]));
generate
  for(g = 2; g <= 31; g++) begin : fa1generator
    fulladder fa1(.a(p1[3][g]), .b(p1[4][g - 1]), .cin(p1[5][g - 2]), .s(p2[2][g - 1]), .c(p2[3][g - 1]));
  end
endgenerate
halfadder ha3(.a(p1[4][31]), .b(p1[5][30]), .s(p2[2][31]), .c(p2[3][31]));
assign t[3] = p1[5][31];

// Group 3: row 6-8 -> row 4-5
assign t[4] = p1[6][0];
halfadder ha4(.a(p1[6][1]), .b(p1[7][0]), .s(p2[4][0]), .c(p2[5][0]));
generate
  for(g = 2; g <= 31; g++) begin : fa1generator
    fulladder fa2(.a(p1[6][g]), .b(p1[7][g - 1]), .cin(p1[8][g - 2]), .s(p2[4][g - 1]), .c(p2[5][g - 1]));
  end
endgenerate
halfadder ha5(.a(p1[7][31]), .b(p1[8][30]), .s(p2[4][31]), .c(p2[5][31]));
assign t[5] = p1[8][31];

// Group 4: row 9-11 -> row 6-7
assign t[6] = p1[9][0];
halfadder ha6(.a(p1[9][1]), .b(p1[10][0]), .s(p2[6][0]), .c(p2[7][0]));
generate
  for(g = 2; g <= 31; g++) begin : fa1generator
    fulladder fa3(.a(p1[9][g]), .b(p1[10][g - 1]), .cin(p1[11][g - 2]), .s(p2[6][g - 1]), .c(p2[7][g - 1]));
  end
endgenerate
halfadder ha7(.a(p1[10][31]), .b(p1[11][30]), .s(p2[6][31]), .c(p2[7][31]));
assign t[7] = p1[11][31];

// Group 5: row 12-14
// Group 6: row 15-17
// Group 7: row 18-20
// Group 8: row 21-23
// Group 9: row 24-26
// Group 10: row 27-29
// Group 11: row 30-31

/*
	End of 1st stage: pp2[22rows][32bits]
	10 * 32-bit partial product, 10 * 32-bit carry array, 2 * 32-bit unused arrays
	  00000000000000000000000000000000		 10001000100010001000100010001000 sum
	 10001000100010001000100010001000	-> 10001000100010001000100010001000  carry
	10001000100010001000100010001000
*/

/*
	2nd stage:
	2 direct assign, 2 half adders, 30 full adders - repeat 7 times.
*/
// Group 1: row 0-2
// Group 2: row 3-5
// Group 3: row 6-8
// Group 4: row 9-11
// Group 5: row 12-14
// Group 6: row 15-17
// Group 7: row 18-20
// Group 8: row 21

/*
	End of 2nd stage: pp3[15rows][32bits]
	7 * 32-bit partial product, 7 * 32-bit carry array, 1 * 32-bit unused arrays
*/

/*
	3rd stage:
	2 direct assign, 2 half adders, 30 full adders - repeat 5 times.
*/
// Group 1: row 0-2
// Group 2: row 3-5
// Group 3: row 6-8
// Group 4: row 9-11
// Group 5: row 12-14

/*
	End of 3rd stage: pp4[10rows][32bits]
	5 * 32-bit partial product, 5 * 32-bit carry array, 0 * 32-bit unused arrays
*/

/*
	4th stage:
	2 direct assign, 2 half adders, 30 full adders - repeat 3 times.
*/
// Group 1: row 0-2
// Group 2: row 3-5
// Group 3: row 6-8
// Group 4: row 9

/*
	End of 4th stage: pp5[7rows][32bits]
	3 * 32-bit partial product, 3 * 32-bit carry array, 1 * 32-bit unused arrays
*/

/*
	5th stage:
	2 direct assign, 2 half adders, 30 full adders - repeat 2 times.
*/
// Group 1: row 0-2
// Group 2: row 3-5
// Group 3: row 6

/*
	End of 5th stage: pp6[5rows][32bits]
	2 * 32-bit partial product, 2 * 32-bit carry array, 1 * 32-bit unused arrays
*/

/*
	6th stage:
	2 direct assign, 2 half adders, 30 full adders - repeat 1 times.
*/
// Group 1: row 0-2
// Group 2: row 3-4

/*
	End of 6th stage: pp7[4rows][32bits]
	1 * 32-bit partial product, 1 * 32-bit carry array, 2 * 32-bit unused arrays
*/

/*
	7th stage:
	2 direct assign, 2 half adders, 30 full adders - repeat 1 times.
*/
// Group 1: row 0-2
// Group 2: row 3

/*
	End of 7th stage: pp8[3rows][32bits]
	1 * 32-bit partial product, 1 * 32-bit carry array, 1 * 32-bit unused arrays
*/

/*
	8th stage:
	2 direct assign, 2 half adders, 30 full adders - repeat 1 times.
*/
// Group 1: row 0-2

/*
	End of 8th stage: pp9[2rows][32bits] RENAME
	1 * 32-bit partial product, 1 * 32-bit carry array
*/

// Final Stage:
// use 64-bit CLA to add the final results together


endmodule: wallace
