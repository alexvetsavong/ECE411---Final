import rv32i_types::*;

module arbiter (
	input clk,
    input rst,

    input rv32i_word i_pmem_address,
    output logic [255:0] i_pmem_rdata,
    input logic [255:0] i_pmem_wdata,
    input logic i_pmem_read,
    input logic i_pmem_write,
    output logic i_pmem_resp,

    input rv32i_word d_pmem_address,
    output logic [255:0] d_pmem_rdata,
    input logic [255:0] d_pmem_wdata,
    input logic d_pmem_read,
    input logic d_pmem_write,
    output logic d_pmem_resp,

    output rv32i_word c_pmem_address,
    input logic [255:0] c_pmem_rdata,
    output logic [255:0] c_pmem_wdata,
    output logic c_pmem_read,
    output logic c_pmem_write,
    input logic c_pmem_resp
);