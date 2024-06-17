class ethmac_base_test extents uvm_test;
ethmac_env	env;
`uvm_component_utils(ethmac_base_test)
NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	env= ethmac_env::type_id::create("env", this);
endfunction



function void end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction

endclass