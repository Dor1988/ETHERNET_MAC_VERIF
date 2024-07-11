class ethmac_base_test extends uvm_test;
ethmac_env	env;
`uvm_component_utils(ethmac_base_test)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	env= ethmac_env::type_id::create("env", this);
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction
endclass
//test_reg_reset
class ethmac_reg_read_test extends ethmac_base_test;
`uvm_component_utils(ethmac_reg_read_test)
`NEW_COMP


// we did raise objection in prebody also
//function void build_phase(uvm_phase phase);
//uvm_config_db#(uvm_object_wrapper)::set(this,"env.proc_agent_i.sqr.run_phase","default_sequece",wb_reg_read_seq::get_type());
//endfunction


task run_phase(uvm_phase phase);
wb_reg_read_seq	read_seq=wb_reg_read_seq::type_id::create("read_seq");
phase.raise_objection(this);
phase.phase_done.set_drain_time(this,100);
read_seq.start(env.proc_agent_i.sqr);
phase.drop_objection(this);
endtask

endclass

// //test
// class ethmac_reg_write_read_test extends ethmac_base_test;
// `uvm_component_utils(ethmac_reg_write_read_test)
// `NEW_COMP


// task run_phase(uvm_phase phase);
// wb_reg_wr_rd_rm_seq	write_read_seq=wb_reg_wr_rd_seq::type_id::create("read_seq");
// phase.raise_objection(this);
// phase.phase_done.set_drain_time(this,100);
// write_read_seq.start(env.proc_agent_i.sqr);
// phase.drop_objection(this);
// endtask

// endclass

// //test
class mac_reg_wr_rd_rm_test extends ethmac_base_test;
`uvm_component_utils(mac_reg_wr_rd_rm_test)
`NEW_COMP


task run_phase(uvm_phase phase);
wb_reg_wr_rd_rm_seq  write_read_seq=wb_reg_wr_rd_rm_seq::type_id::create("read_seq");
phase.raise_objection(this);
phase.phase_done.set_drain_time(this,100);
write_read_seq.start(env.proc_agent_i.sqr);
phase.drop_objection(this);
endtask
endclass

// //test
class mac_reg_bd_wr_rd_rm_test extends ethmac_base_test;
`uvm_component_utils(mac_reg_bd_wr_rd_rm_test)
`NEW_COMP


task run_phase(uvm_phase phase);
wb_reg_bd_wr_rd_rm_seq  write_read_seq=wb_reg_bd_wr_rd_rm_seq::type_id::create("read_seq");
phase.raise_objection(this);
phase.phase_done.set_drain_time(this,100);
write_read_seq.start(env.proc_agent_i.sqr);
phase.drop_objection(this);
endtask

endclass
////////////////////////////////////////////////////////////////////////////////////////////////

// //test
class mac_reg_read_rm_test extends ethmac_base_test;
`uvm_component_utils(mac_reg_read_rm_test)
`NEW_COMP


task run_phase(uvm_phase phase);
wb_reg_read_rm_seq  read_seq=wb_reg_read_rm_seq::type_id::create("read_seq");
phase.raise_objection(this);
phase.phase_done.set_drain_time(this,100);
read_seq.start(env.proc_agent_i.sqr);
phase.drop_objection(this);
endtask

endclass



////////////////////////////////////////////////////////////////////////////////////////////////

// //test
class mac_10mbps_fd_tx_test extends ethmac_base_test;
`uvm_component_utils(mac_10mbps_fd_tx_test)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	// 10mbps will come from 10 MHZ clk=> TP in ns=100ns
	uvm_resource_db#(int)::set("GLOBAL", "PHY_CLK_TP", 100, this);	
endfunction



task run_phase(uvm_phase phase);
mac_10mbps_fd_tx_seq  fd_tx_seq=mac_10mbps_fd_tx_seq::type_id::create("fd_tx_seq"); //create the sequence


phase.raise_objection(this);
phase.phase_done.set_drain_time(this,100);
fd_tx_seq.start(env.proc_agent_i.sqr); // runing the sequence
// I should wait till tx completes, only then end simulation
#100000;// todo
phase.drop_objection(this);
endtask

endclass
