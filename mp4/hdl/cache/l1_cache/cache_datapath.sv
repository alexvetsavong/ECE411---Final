/* MODIFY. The cache datapath. It contains the data,
valid, dirty, tag, and LRU arrays, comparators, muxes,
logic gates and other supporting logic. */

import rv32i_types::*;

module cache_datapath #(
    parameter s_offset = 5,
    parameter s_index  = 3,
    parameter s_tag    = 32 - s_offset - s_index,
    parameter s_mask   = 2**s_offset,
    parameter s_line   = 8*s_mask,
    parameter num_sets = 2**s_index
)
(
	input clk,
	input rst,
	input rv32i_word mem_address,
	output rv32i_word pmem_address,
	input logic [255:0] pmem_rdata,
	input logic [255:0] mem_wdata256,
	input logic [31:0] mem_byte_enable256,
	output logic [255:0] pmem_wdata,
	output logic [1:0] cache_hit,
	output logic write_back,
	output logic way_reg,
	output logic way,
	input logic [1:0] load_dirty,
	input logic set_dirty,
	input logic load_lru,
	input logic set_lru,
	input logic way_sel,
	input logic [1:0] write_sel,
	input logic [1:0] load_valid,
	input logic set_valid,
	input logic [1:0] load_tag,
	input logic load_way_reg,
	input logic [1:0] read_data_array
);

logic [2:0] index;
assign index = mem_address[7:5];
logic [23:0] tag;
assign tag = mem_address[31:8];

logic [31:0] write_mask, write_mask1, write_mask2;
logic write_en, write_en1, write_en2;
logic [255:0] datain, dataout1, dataout2;
logic comp1, comp2;

/********************************* Arrays ************************************/

ram_array data_array1 (
	.byteena_a(write_mask1),
	.data(datain),
	.rdaddress(index),
	.rdclock(~clk),
	.rden(read_data_array[0]),
	.wraddress(index),
	.wrclock(~clk),
	.wren(write_en1),
	.q(dataout1)
	);

ram_array data_array2 (
	.byteena_a(write_mask2),
	.data(datain),
	.rdaddress(index),
	.rdclock(~clk),
	.rden(read_data_array[1]),
	.wraddress(index),
	.wrclock(~clk),
	.wren(write_en2),
	.q(dataout2)
	);

/*****************************************************************************/

/***************************** Registers *************************************/

logic [7:0] lru_array;
logic lru;
assign lru = lru_array[index];

logic [7:0] dirty_array1;
logic [1:0] dirty_out;
assign dirty_out[0] = dirty_array1[index];
logic [7:0] dirty_array2;
assign dirty_out[1] = dirty_array2[index];

logic [7:0] valid_array1;
logic [1:0] valid_out;
assign valid_out[0] = valid_array1[index];
logic [7:0] valid_array2;
assign valid_out[1] = valid_array2[index];

logic [7:0][23:0] tag_array1;
logic [23:0] tag_out1;
logic [23:0] tag_out2;
assign tag_out1 = tag_array1[index];
logic [7:0][23:0] tag_array2;
assign tag_out2 = tag_array2[index];

logic [31:0] zext_tag1, zext_tag2;
assign zext_tag1 = {tag_out1, index, 5'b0};
assign zext_tag2 = {tag_out2, index, 5'b0};

always_ff @(posedge clk) begin
	if(rst) begin
	way_reg <= 1'b0;
	lru_array <= 8'b0;
	dirty_array1 <= 8'b0;
	dirty_array2 <= 8'b0;
	valid_array1 <= 8'b0;
	valid_array2 <= 8'b0;
	tag_array1 <= 192'bX;
	tag_array2 <= 192'bX;
	end
	else begin
		if(load_way_reg)
			way_reg <= way;
	   if(load_lru)
			lru_array[index] <= set_lru;
		if(load_dirty[0])
			dirty_array1[index] <= set_dirty;
		if(load_dirty[1])
			dirty_array2[index] <= set_dirty;
		if(load_valid[0])
			valid_array1[index] <= set_valid;
		if(load_valid[1])
			valid_array2[index] <= set_valid;
		if(load_tag[0])
			tag_array1[index] <= tag;
		if(load_tag[1])
			tag_array2[index] <= tag;
	end
end

/*****************************************************************************/

/******************************* AND and CMP *********************************/

assign comp1 = (tag === tag_out1) ? 1'b1 : 1'b0;
assign comp2 = (tag === tag_out2) ? 1'b1 : 1'b0;
assign cache_hit[0] = (comp1 && valid_out[0]) ? 1'b1 : 1'b0;
assign cache_hit[1] = (comp2 && valid_out[1]) ? 1'b1 : 1'b0;
assign write_back = lru ? dirty_out[1] : dirty_out[0];
always_comb begin
    if (cache_hit[0])
        way = 1'b0;
    else if (cache_hit[1])
        way = 1'b1;
    else
        way = lru;
end

/*****************************************************************************/

/******************************** Muxes **************************************/
always_comb begin : MUXES

    unique case (write_sel)
    	2'b00: begin 
			datain = mem_wdata256;
			write_mask = 32'hffffffff;
			write_en = 1'b0;
		end
    	2'b01: begin
			datain = pmem_rdata;
			write_mask = 32'hffffffff;
			write_en = 1'b1;
		end
		2'b10: begin
			datain = mem_wdata256;
			write_mask = mem_byte_enable256;
			write_en = 1'b1;
		end
		default: begin
			datain = mem_wdata256;
			write_mask = 32'hffffffff;
			write_en = 1'b0;
		end
    endcase
    unique case (way_sel)
    	1'b0: begin
    		pmem_address = zext_tag1;
    		pmem_wdata = dataout1;
			write_mask1 = write_mask;
			write_mask2 = 32'b0;
			write_en1 = write_en;
			write_en2 = 1'b0;
    	end
    	1'b1: begin
    		pmem_address = zext_tag2;
    		pmem_wdata = dataout2;
			write_mask1 = 32'b0;
			write_mask2 = write_mask;
			write_en1 = 1'b0;
			write_en2 = write_en;
    	end
		default: begin
			pmem_address = zext_tag1;
    		pmem_wdata = dataout1;
			write_mask1 = write_mask;
			write_mask2 = 32'b0;
			write_en1 = write_en;
			write_en2 = 1'b0;
		end
    endcase
end
/*****************************************************************************/

endmodule : cache_datapath
