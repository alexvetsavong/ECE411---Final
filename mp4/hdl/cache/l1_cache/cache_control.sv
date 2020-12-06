/* MODIFY. The cache controller. It is a state machine
that controls the behavior of the cache. */

module cache_control (
	input clk,
	input rst,
	input logic mem_read,
	input logic mem_write,
	output logic mem_resp,
	input logic [1:0] cache_hit,
	input logic write_back,
	input logic way_reg,
	input logic way,
	output logic [1:0] load_dirty,
	output logic set_dirty,
	output logic load_lru,
	output logic set_lru,
	output logic way_sel,
	input logic pmem_resp,
	output logic pmem_write,
	output logic pmem_read,
	output logic [1:0] write_sel,
	output logic [1:0] load_valid,
	output logic set_valid,
	output logic [1:0] load_tag,
	output logic load_way_reg,
	output logic [1:0] read_data_array
);

logic read_reg;
logic write_reg;
logic read_reg_next;
logic write_reg_next;

enum int unsigned {
    /* List of states */
    idle, writeback, allocate, serve
} state, next_states;

function void set_defaults();
	load_dirty = 2'b0;
	set_dirty = 1'b0;
	load_lru = 1'b0;
	set_lru = 1'b0;
	way_sel = way_reg;
	pmem_read = 1'b0;
	pmem_write = 1'b0;
	write_sel = 2'b00;
	load_valid = 2'b0;
	set_valid = 1'b0;
	load_tag = 2'b0;
	load_way_reg = 1'b0;
	read_data_array = 2'b00;
        mem_resp = 1'b0;
endfunction

function void set_idle();
	load_way_reg = 1'b1;
	if(mem_read || mem_write) begin
		way_sel = way;
    	if (cache_hit != 2'b0) begin
    		if (mem_write) begin
    			load_dirty[way] = 1'b1;
    			set_dirty = 1'b1;
			write_sel = 2'b10;
    		end
    		read_data_array[way] = mem_read ? 1'b1 : 1'b0;
    		load_lru = 1'b1;
    		set_lru = ~way;
			mem_resp = 1'b1;
    	end
    	else if (write_back != 1'b0) begin
    		load_dirty[way] = 1'b1;
    		set_dirty = 1'b0;
    		read_data_array[way] = 1'b1;
    	end
    	else begin
		write_sel = 2'b01;
		load_valid[way] = 1'b1;
		set_valid = 1'b1;
		load_tag[way] = 1'b1;
    	end
    end
endfunction


function void set_writeback();
    	pmem_write = 1'b1;
    	load_dirty[way_reg] = 1'b1;
    	set_dirty = 1'b0;
    	read_data_array[way_reg] = 1'b1;
	if(pmem_resp == 1'b1)
		load_tag[way_reg] = 1'b1;
endfunction

function void set_allocate();
	pmem_read = 1'b1;
	write_sel = 2'b01;
	load_valid[way_reg] = 1'b1;
	set_valid = 1'b1;
	load_tag[way_reg] = 1'b1;
endfunction

function void set_serve();
    if (write_reg) begin
        load_dirty[way_reg] = 1'b1;
        set_dirty = 1'b1;
        write_sel = 2'b10;
    end
    read_data_array[way_reg] = read_reg ? 1'b1 : 1'b0;
    load_lru = 1'b1;
    set_lru = ~way_reg;
    mem_resp = 1'b1;
endfunction

always_comb
begin : state_actions
    /* Default output assignments */
    set_defaults();
    	unique case (state)
    		idle: begin
			set_idle();
			end
    		writeback: begin
			set_writeback();
			end
    		allocate: begin
			set_allocate();
			end
            serve: begin
            set_serve();
            end
    	endcase
end

always_comb
begin : next_state_logic
    /* Next state information and conditions (if any)
     * for transitioning between states */
    read_reg_next = read_reg;
    write_reg_next = write_reg;
    unique case (state)
    	idle: begin
    		if(mem_read || mem_write) begin
    			if (cache_hit != 2'b0)
    				next_states = idle;
    			else if (write_back != 1'b0) begin
    				next_states = writeback;
                    read_reg_next = mem_read;
                    write_reg_next = mem_write;
                end
    			else begin
    				next_states = allocate;
                    read_reg_next = mem_read;
                    write_reg_next = mem_write;
                end
    		end else
				next_states = idle;
    	end
    	writeback: begin
    		if(pmem_resp == 0)
    			next_states = writeback;
    		else
    			next_states = allocate;
    	end
    	allocate: begin
    		if(pmem_resp == 0)
    			next_states = allocate;
    		else begin
    			next_states = serve;
            end
    	end
        serve: begin
            next_states = serve;
            read_reg_next = 1'b0;
            write_reg_next = 1'b0;
        end
        default: next_states = idle;
    endcase
end

always_ff @(posedge clk)
begin: next_state_assignment
    /* Assignment of next state on clock edge */
    if(!rst) begin
        state <= next_states;
        read_reg <= read_reg_next;
        write_reg <= write_reg_next;
    end
    else begin
        state <= idle;
        read_reg <= 1'b0;
        write_reg <= 1'b0;
    end
end

endmodule : cache_control
