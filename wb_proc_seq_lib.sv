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




