/* Filename: queue.sv
 * Author: Alex Vetsavong
 * Date Updated: 12/3/2020
 * Description: HW-based queue being used to implement 
 *              stream buffers
 */
module stream_buffer #(
    parameter depth = 2,
    parameter data_width = 256,
    parameter tag_width = 24
)
(
    input clk, rst,
    input logic [31:0] mem_addr,
    input logic mem_read, pmem_resp,
    input logic [data_width-1:0] data_in,

    output logic [31:0] pmem_addr,
    output logic buffer_hit, pmem_read,
    output logic [data_width-1:0] data_out // send out to L1 cache
    // output logic [tag_width-1:0] tag_out    // send to L1 cache (probably)
);

/* arrays to hold the data and tags */
logic [depth-1:0][data_width-1:0] data = '0;
logic [depth-1:0][tag_width-1:0] tag = '0;

logic should_read; // use as a way to only hold read for one cycle
logic [tag_width-1:0] tag_in;
logic [2:0] offset;

/* assign the mem addr for the stream buffer for prefetching */
assign tag_in = mem_addr[31:8];
assign offset = mem_addr[7:5];

int idx = 1;
int tail = depth + 1;

enum int {
    idle,
    prefetch,
    refresh
} next_state, state;

/* state actions */
always_comb begin
    case(state)
    idle: 
    begin
        /* check all tags for a hit */
        for (int i = 0; i < depth; i++) begin
            if (tag[i] == tag_in) begin
                buffer_hit = 1'b1;  // let cpu know we have buffer hit
                data_out = data[i]; // combinational read out
                pmem_addr = {tag_in + tail, offset, 0}; // set the address for reading the refresh
                pmem_read = 1'b1;   // figure out the read signal
            end
        end
    end

    refresh: 
    begin
        for (int i = 0; i < depth; i++) begin
            if (tag[i] == tag_in) begin
                if (pmem_resp) begin
                    data[i] = data_in;
                end
            end
        end
    end

    // we missed, so we need to make a bunch of requests
    prefetch: 
    begin
        pmem_read = 1'b1 & should_read;
        pmem_addr = {tag_in + idx, offset, 0};
        tag[idx] = tag_in + idx;
        if (pmem_resp) 
            data[idx] = data_in;
        else 
            data[idx] = 0;
    end

    default: 
    begin     
        data_out = data[0];
        buffer_hit = 1'b0;
        idx = 0;
        pmem_addr = {mem_addr[31:5], 5'b0};
        pmem_read = 1'b0;
    end
    endcase
end

/* next_state transition */
always_comb begin
    case(state)
    idle: 
    begin 
        if (buffer_hit & mem_read) 
            next_state = refresh; 
        else if (mem_read) 
            next_state = prefetch;
        else next_state = idle;
    end

    prefetch: 
    begin
        if (idx == depth)
            next_state = idle; 
        else next_state = state;
    end
    
    refresh: 
    begin 
        if (pmem_resp)
            next_state = idle;
        else 
            next_state = refresh;
    end
    default: next_state = state; 
    endcase
end

always_ff @(posedge clk) begin
    
    if (rst) begin
        state <= idle;
        data <= '0;
        tag <= '0;
        idx <= 0;
        tail <= depth + 1;
    end

    else state <= next_state;

    if (state == prefetch) begin
        if (pmem_resp) begin
            idx <= idx + 1;
            should_read <= 1;
        end
        else begin 
            if (idx <= depth) 
                idx <= idx; 
            else 
                idx <= 1;
            should_read <= 0; 
        end
        tail <= depth + 1;
    end

    if (pmem_resp & (state == refresh)) begin
        tail <= tail + 1;
    end

end
endmodule