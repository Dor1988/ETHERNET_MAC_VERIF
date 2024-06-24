class ethmac_env extends uvm_env;
wb_proc_agent	proc_agent_i;
wb_mem_agent	mem_agent_i;
phy_tx_agent	phy_tx_agent_i;
phy_rx_agent	phy_rx_agent_i;
mii_agent		mii_agent_i;

`uvm_component_utils(ethmac_env)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	proc_agent_i	=wb_proc_agent::type_id::create("proc_agent_i",this);
	mem_agent_i		=wb_mem_agent::type_id::create("mem_agent_i",this);
	phy_tx_agent_i	=phy_tx_agent::type_id::create("phy_tx_agent_i",this);
	phy_rx_agent_i	=phy_rx_agent::type_id::create("phy_rx_agent_i",this);
	mii_agent_i		=mii_agent::type_id::create("mii_agent_i",this);
endfunction



endclass
