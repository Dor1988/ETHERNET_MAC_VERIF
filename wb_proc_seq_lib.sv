class wb_proc_base_seq extends uvm_sequence#(wb_tx);
uvm_phase	phase;
`uvm_object_utils(wb_proc_base_seq) // factory
`NEW_OBJ

task pre_body();
phase = get_starting_phase();
if(phase !=null)phase.raise_objection(this);
endtask


task post_body();
if(phase!=null) phase.drop_objection(this);
endtask
endclass


class wb_reg_read_seq extends wb_proc_base_seq;
`uvm_object_utils(wb_reg_read_seq)
`NEW_OBJ 

task body();
// There are 21 registers, to read 21 registers we have loop of 21 iteration
for(int i=0; i<21;i++) begin
	$display("i=%0d",i);
	`uvm_do_with(req,{req.wr_rd==0;req.addr==i;})
end
endtask
endclass



class wb_reg_write_read_seq extends wb_proc_base_seq;
`uvm_object_utils(wb_reg_write_read_seq)
`NEW_OBJ 

task body();
bit [31:0] data_t;
//writing all registers
for(int i=0; i<21;i++) begin
	data_t= $random & ethmac_common::regmaskA[i];// making sure reserved bits are 0's by doing bitwise masking to the data we are  going to write to register
	`uvm_do_with(req,{req.wr_rd==1;req.addr==i; req.data==data_t;})
end
// Reading all registers
for(int i=0; i<21;i++) begin
//	$display("i=%0d",i);
	`uvm_do_with(req,{req.wr_rd==0;req.addr==i;})
end
endtask
endclass


class wb_reg_write_read_reg_model_seq extends wb_proc_base_seq;

uvm_reg mac_regs[$]; // queue of uvm_reg
uvm_reg_data_t ref_data[$]; // will be used for compare purpose

`uvm_object_utils(wb_reg_write_read_reg_model_seq)
`NEW_OBJ 

task body();
mac_reg_block	mac_rm;
int [31:0] errors; // used for counting errors
super.body;
uvm_resource_db#(mac_reg_block)::read_by_name("GLOBAL", "MAC_RM", mac_rm, this);
mac_rm.get_registers(mac_regs); // getting all register handles in mac_regs queue

//set errors to 0
errors =0;

	mac_regs.shuffle();
	foreach(mac_regs[i]) begin
		if (this.randomize()) begin
			`uvm_error("body", "randomization error")
		end
		mac_regs[i].write(status, data, .parent(this)); // performing write 
	end
	mac_regs.shuffle();
	foreach(mac_regs[i]) begin
		ref_data=mac_regs[i].get(); // the data from the register model
		mac_regs[i].read(status,data, .parent(this));// get the register value from DUT register
		if(ref_data!=data) begin
			``uvm_error("REG_TEST_SEQ:", $sformatf("get/read: Read error for %s: Expected: %0h Actual: %0h", mac_regs[i].get_name(), ref_data,data))
			errors++;
		end
	end
end

endtask: body
endclass
