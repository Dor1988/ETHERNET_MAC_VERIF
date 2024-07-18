//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//sequence for wr_rd_test (without regmodel)
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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//sequence for wr_rd_test frontdoor (with regmodel)
class wb_reg_wr_rd_rm_seq extends wb_proc_base_seq;

uvm_reg mac_regs[$]; // queue of uvm_reg
uvm_reg_data_t ref_data; // will be used for compare purpose

rand uvm_reg_data_t data; // will be used for compare purpose
uvm_reg_data_t miicommand_wr_data;
uvm_status_e status;

`uvm_object_utils(wb_reg_wr_rd_rm_seq)
`NEW_OBJ 

task body();
mac_reg_block	reg_block;
string reg_name;
uvm_reg_addr_t addr;
int errors; // used for counting errors
super.body();
uvm_resource_db#(mac_reg_block)::read_by_name("GLOBAL", "MAC_RM", reg_block, this);
reg_block.get_registers(mac_regs); // getting all register handles in mac_regs queue
//mac_regs is a queue of 21 registers handles

	errors =0;//set errors to 0
	
repeat (10) begin
	mac_regs.shuffle(); // this is shuffling the order of the register in the queue of the 21 registers 
	foreach(mac_regs[i]) begin
		if (!this.randomize()) begin
			`uvm_error("body", "randomization error")
		end
		// addr=mac_regs[i].get_address();
		// if (addr==32'hb)begin
			// data[0]=0;
		// end		
		reg_name=mac_regs[i].get_name();
		
		if (reg_name=="miicommand")begin
		//	data[1:0]= 2'b11;
			miicommand_wr_data=data;
		end
		
		if (reg_name=="txbdnum")begin
			if (data> 8'h80) data=8'h7F;
		end
		
	//	if (data[0]==1) // we should make sure that miistatus[1][2] both should be made 1
		
		//update the register model, so that miistatus[2:1]= 2'b11
		
		
		
		mac_regs[i].write(status, data, .parent(this)); // performing write of random data into the register
		// uvm_reg_rw kind of object => adapter
	end
	
	//whenever miicommand_wr_data[0] is made 1 => Nvalid_stat and busy_stat to go high
	if (miicommand_wr_data[0] == 1 ) begin
		reg_block.miistatus.predict(3'b110); // updating the register model value for miistatus, note that the register model value is the expected value and the Dut register value is the Actual value
	end
	mac_regs.shuffle();

	foreach(mac_regs[i]) begin
		ref_data=mac_regs[i].get(); // getting the value stored in the register model
		mac_regs[i].read(status,data, .parent(this));// get the register value from DUT register
		if(ref_data!=data) begin
			`uvm_error("REG_TEST_SEQ:", $sformatf("get/read: Read error for %s: Expected: %0h Actual: %0h", mac_regs[i].get_name(), ref_data,data))
			errors++;
		end
	end
end // 10 time repeat loop
endtask: body
endclass

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// sequence for wr_rd_test backdoor (with regmodel)
class wb_reg_bd_wr_rd_rm_seq extends wb_proc_base_seq;

uvm_reg mac_regs[$]; // queue of uvm_reg
uvm_reg_data_t ref_data; // will be used for compare purpose

rand uvm_reg_data_t data; // will be used for compare purpose
uvm_status_e status;

`uvm_object_utils(wb_reg_bd_wr_rd_rm_seq)
`NEW_OBJ 

task body();
mac_reg_block	reg_block;
int errors; // used for counting errors
super.body();
uvm_resource_db#(mac_reg_block)::read_by_name("GLOBAL", "MAC_RM", reg_block, this);
reg_block.get_registers(mac_regs); // getting all register handles in mac_regs queue
//mac_regs is a queue of 21 registers handles

	errors =0;//set errors to 0

	mac_regs.shuffle(); // this is shuffling the order of the register in the queue of the 21 registers 
	
	foreach(mac_regs[i]) begin
		if (!this.randomize()) begin
			`uvm_error("body", "randomization error")
		end
		mac_regs[i].poke(status, data, .parent(this)); // performing write of random data into the register
		// poke: BackDoor write
	end
	
	mac_regs.shuffle();
	
	foreach(mac_regs[i]) begin
		ref_data=mac_regs[i].get(); // getting the value stored in the register model- this is the expected 
		mac_regs[i].peek(status,data, .parent(this));// peek: BackDoor read, get the register value from DUT register- this is the actual
		if(ref_data!=data) begin
			`uvm_error("REG_TEST_SEQ:", $sformatf("get/read: Read error for %s: Expected: %0h Actual: %0h", mac_regs[i].get_name(), ref_data,data))
			errors++;
		end
		else begin
			`uvm_info("REG_TEST_SEQ:",$psprintf ("register compare passed: %sata=%h", mac_regs[i].get_name(),data),UVM_LOW)
		end
	end

endtask: body

endclass

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//sequence for wr_rd_test frontdoor (with regmodel)
class wb_reg_read_rm_seq extends wb_proc_base_seq;

uvm_reg mac_regs[$]; // queue of uvm_reg
uvm_reg_data_t ref_data; // will be used for compare purpose

rand uvm_reg_data_t data; // will be used for compare purpose
uvm_reg_data_t miicommand_wr_data;
uvm_status_e status;

`uvm_object_utils(wb_reg_read_rm_seq)
`NEW_OBJ 

task body();
mac_reg_block	reg_block;
string reg_name;
uvm_reg_addr_t addr;
int errors; // used for counting errors
super.body();
uvm_resource_db#(mac_reg_block)::read_by_name("GLOBAL", "MAC_RM", reg_block, this);
reg_block.get_registers(mac_regs); // getting all register handles in mac_regs queue
//mac_regs is a queue of 21 registers handles

	errors =0;//set errors to 0
	
repeat (10) begin
	mac_regs.shuffle();
	foreach(mac_regs[i]) begin
		ref_data=mac_regs[i].get_reset(); // getting the reset value stored in the register model, reset value as per spec
		mac_regs[i].read(status,data, .parent(this));// get the Actual reset value from DUT register
		if(ref_data!=data) begin
			`uvm_error("REG_TEST_SEQ:", $sformatf("Read error for %s: Expected: %0h Actual: %0h", mac_regs[i].get_name(), ref_data,data))
			errors++;
		end
	end
end //   repeat loop
endtask: body
endclass


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// full duplex sequence
class mac_fd_tx_seq extends wb_proc_base_seq;

uvm_status_e status;
rand uvm_reg_data_t moder_data; // will be used for compare purpose

`uvm_object_utils(mac_fd_tx_seq)
`NEW_OBJ 

task body();
mac_reg_block	reg_block;
bit [31:0] data_t;
string reg_name;
uvm_reg_addr_t addr;
int errors; // used for counting errors
// super.body();
//we need register model handle
uvm_resource_db#(mac_reg_block)::read_by_name("GLOBAL", "MAC_RM", reg_block, this);
//`uvm_do_with(req,{req.addr==13'h0; req.data=data_t;req.write==1;})


//////////////////////////////////////////////////////////
// Register programming  :
//////////////////////////////////////////////////////////

moder_data[16]=0; // RECSMALL
moder_data[15]=0;// PADEN
moder_data[14]=0;// HUGEN
moder_data[13]=0;// CRCEN
moder_data[12]=0;// DLYCRCEN
moder_data[11]=0;// RSVD
moder_data[10]=1;// FD mode
moder_data[9]=0;// EXDFREN
moder_data[8]=0; // NOBCKOF
moder_data[7]=0; // LOOPBCK
moder_data[6]=0; // IFG
moder_data[5]=0; // PRO – Promiscuous
moder_data[4]=0; // IAM – Individual Address Mode
moder_data[3]=0; // BRO – Broadcast Address
moder_data[2]=0; // NOPRE – No Preamble
moder_data[1]=0; // TXEN – Transmit Enable. TxEN=o for now 
moder_data[0]=0; // RXEN – Receive Enable

// we are performing write to the moder register by using register model
reg_block.moder.write(status,moder_data); // configure the Mac to work in FULL DUPLEX MODE 
/////////////////////////////////
// Finish Register programming 
/////////////////////////////////



//////////////////////////////////////////////////////////
// Start Loading the TX_BD(transmit buffer descriptors) :
//////////////////////////////////////////////////////////

// A total of 512 bytes will be transmitted
// we can't load these tx_bd using register model because my register model only contain the 21 registers and not the buffer descriptors
// so we load it using `uvm_do_with

// data_t= {[31:16] it is LEN length,[15] RD,[14] IRQ, [13]WR, [12]PAD,[11]CRC en,[10:9] reserved, and more... }
data_t= {16'h200,1'b1,1'b1,1'b1,1'b0,1'b0,2'b0,1'b0,4'b0,1'b0,1'b0,1'b0,1'b0}; // 32 bits that are 4 bytes
// sending 8 bytes so we need two 31 bits(4 bytes) wisbone transactions
// 400 is an actual addrees, but do'nt drive 400, drive only 100
`uvm_do_with(req,{req.addr==13'h100; req.data==data_t; req.wr_rd==1'b1;}) // write to the descriptor data of 4 bytes : {[31:16] LEN, [15] RD,[14] IRQ,, [13]WR, [12]PAD,[11]CRC,[10:9] reserved,[8]UR,[7:4] RTRY,[3] RL, LC [2], [1] DF, [0] cs}
data_t=32'h1000_0000; // this will tell us from whice address at the External memory the MAC's DMA controller should read, the 512 bytes be present From this address (32'h1000_0000) onwards
// 404=> 101
`uvm_do_with(req,{req.addr==13'h101; req.data==data_t; req.wr_rd==1'b1;}) //

///////////////////////////////////////////////////////////
// Finish of Loading the TX_BD(transmit buffer descriptors)
///////////////////////////////////////////////////////////

// rest all fields are same, only write TXEN=1
moder_data[1]= 1; // TXEN=1
reg_block.moder.write(status, moder_data);

endtask: body
endclass
