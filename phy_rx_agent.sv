class phy_rx_agent extends uvm_agent;
phy_rx_drv drv;
`uvm_component_utils(phy_rx_agent)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	drv=phy_rx_drv::type_id::create("drv",this);
endfunction

endclass
