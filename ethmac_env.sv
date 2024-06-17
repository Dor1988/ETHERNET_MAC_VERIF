class ethmac_env extents uvm_env;
ethmac_env	env;
`uvm_component_utils(ethmac_env)
NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction
endclass