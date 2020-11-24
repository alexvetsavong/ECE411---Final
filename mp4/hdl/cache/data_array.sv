/* A special register array specifically for your
data arrays. This module supports a write mask to
help you update the values in the array. */

module data_array #(
    parameter s_offset = 5,
    parameter s_index = 3
)
(
    clk,
    rst,
    read,
    write_en,
    rindex,
    windex,
    datain,
    dataout
);

localparam s_mask   = 2**s_offset;
localparam s_line   = 8*s_mask;
localparam num_sets = 2**s_index;

input clk;
input rst;
input read;
input [31:0] write_en;
input [2:0] rindex;
input [2:0] windex;
input [255:0] datain;
output logic [255:0] dataout;

// logic [s_line-1:0] data [num_sets-1:0] = '{default: '0}; /* synthesis ramstyle = "logic" */

// always_ff @(negedge clk) begin
// for (int i = 0; i < 32; i++)
//     dataout[8*i +: 8] <= (write_en[i] & (rindex == windex)) ? datain[8*i +: 8] : data[rindex][8*i +: 8];
// end

// always_ff @(posedge clk) begin
// for (int i = 0; i < 32; i++)
//     data[windex][8*i +: 8] <= write_en[i] ? datain[8*i +: 8] : data[windex][8*i +: 8];
// end

endmodule : data_array
