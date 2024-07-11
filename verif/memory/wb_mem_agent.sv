class wb_mem_agent extends uvm_agent;
memory memory_i;
`uvm_component_utils(wb_mem_agent)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	memory_i=memory::type_id::create("memory_i",this);
endfunction

endclass
