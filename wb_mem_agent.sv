class wb_mem_agent extends uvm_agent;

`uvm_component_utils(wb_mem_agent)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

endclass
