class phy_rx_drv extends uvm_driver;

virtual phy_intf vif;
real clk_tp;

`uvm_component_utils(phy_rx_drv)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	 uvm_resource_db#(virtual phy_intf)::read_by_name("GLOBAL", "PHY_VIF", vif, this);
	 uvm_resource_db#(int)::read_by_name("GLOBAL", "PHY_CLK_TP", clk_tp, this);
	 
endfunction

 task run_phase(uvm_phase phase);

 forever begin
	#(clk_tp/2.0) vif.mrx_clk_pad_i= ~vif.mrx_clk_pad_i; // clk of 10MHZ is getting generated here
 end


 endtask

endclass
