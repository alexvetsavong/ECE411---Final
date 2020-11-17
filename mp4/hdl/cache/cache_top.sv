import rv32i_types::*;

module cache_top (
    input clk,
    input rst,

    input rv32i_word i_mem_address,
    output rv32i_word i_mem_rdata,
    input rv32i_word i_mem_wdata,
    input logic i_mem_read,
    input logic i_mem_write,
    input [3:0] i_mem_byte_enable,
    output logic i_mem_resp,

    input rv32i_word d_mem_address,
    output rv32i_word d_mem_rdata,
    input rv32i_word d_mem_wdata,
    input logic d_mem_read,
    input logic d_mem_write,
    input [3:0] d_mem_byte_enable,
    output logic d_mem_resp,

    output rv32i_word pmem_address,
    input [63:0] pmem_rdata,
    output [63:0] pmem_wdata,
    output logic pmem_read,
    output logic pmem_write,
    input logic pmem_resp
);

rv32i_word i_pmem_address, d_pmem_address, c_pmem_address;
logic [255:0] i_pmem_rdata, d_pmem_rdata, c_pmem_rdata;
logic [255:0] i_pmem_wdata, d_pmem_wdata, c_pmem_wdata;
logic i_pmem_read, d_pmem_read, c_pmem_read;
logic i_pmem_write, d_pmem_write, c_pmem_write;
logic i_pmem_resp, d_pmem_resp, c_pmem_resp;

cache i_cache (
    .clk(clk),
    .rst(rst),
    .mem_address(i_mem_address),
    .mem_rdata(i_mem_rdata),
    .mem_wdata(i_mem_wdata),
    .mem_read(i_mem_read),
    .mem_write(i_mem_write),
    .mem_byte_enable(i_mem_byte_enable),
    .mem_resp(i_mem_resp),

    .pmem_address(i_pmem_address),
    .pmem_rdata(i_pmem_rdata),
    .pmem_wdata(i_pmem_wdata),
    .pmem_read(i_pmem_read),
    .pmem_write(i_pmem_write),
    .pmem_resp(i_pmem_resp)
);

cache d_cache (
    .clk(clk),
    .rst(rst),
    .mem_address(d_mem_address),
    .mem_rdata(d_mem_rdata),
    .mem_wdata(d_mem_wdata),
    .mem_read(d_mem_read),
    .mem_write(d_mem_write),
    .mem_byte_enable(d_mem_byte_enable),
    .mem_resp(d_mem_resp),

    .pmem_address(d_pmem_address),
    .pmem_rdata(d_pmem_rdata),
    .pmem_wdata(d_pmem_wdata),
    .pmem_read(d_pmem_read),
    .pmem_write(d_pmem_write),
    .pmem_resp(d_pmem_resp)
);

arbiter _arbiter (
	.clk(clk),
    .rst(rst),

    .i_pmem_address(i_pmem_address),
    .i_pmem_rdata(i_pmem_rdata),
    .i_pmem_wdata(i_pmem_wdata),
    .i_pmem_read(i_pmem_read),
    .i_pmem_write(i_pmem_write),
    .i_pmem_resp(i_pmem_resp),

    .d_pmem_address(d_pmem_address),
    .d_pmem_rdata(d_pmem_rdata),
    .d_pmem_wdata(d_pmem_wdata),
    .d_pmem_read(d_pmem_read),
    .d_pmem_write(d_pmem_write),
    .d_pmem_resp(d_pmem_resp),

    .c_pmem_address(c_pmem_address),
    .c_pmem_rdata(c_pmem_rdata),
    .c_pmem_wdata(c_pmem_wdata),
    .c_pmem_read(c_pmem_read),
    .c_pmem_write(c_pmem_write),
    .c_pmem_resp(c_pmem_resp)
);

cacheline_adapter _cacheline_adapter (
	.clk (clk),
	.reset_n (~rst),

	.line_i(c_pmem_wdata),
	.line_o(c_pmem_rdata),
	.address_i(c_pmem_address),
	.read_i(c_pmem_read),
	.write_i(c_pmem_write),
	.resp_o(c_pmem_resp),

	.burst_i(pmem_rdata),
	.burst_o(pmem_wdata),
	.address_o(pmem_address),
	.read_o(pmem_read),
	.write_o(pmem_write),
	.resp_i(pmem_resp)
);