class memory extends uvm_component;
bit [31:0] mem[int]; // each location has 4 byte, 512 bytes need 128 locations(locations it is addresses at the external memory)
virtual wb_mem_intf vif;
`uvm_component_utils(memory) // register the memory to the factory
`NEW_COMP

function void build_phase(uvm_phase phase);
	uvm_resource_db#(virtual wb_mem_intf)::read_by_name("GLOBAL", "MEM_VIF", vif, this);
endfunction


function void start_of_simulation_phase(uvm_phase phase);
	// pre-load the memory
	for(int i=0;i<512/4;i++) begin
		mem[32'h1000_0000+i]= $random;
	end
endfunction

task run_phase(uvm_phase phase);
	// if its an output that come out of the design the mark will be with "o", if it is an input to the design the signal will be marked with "i"
	// All direction markings are relative to the design "i" for input is input for the design and "o" as output is output from the design
	forever begin
		@(posedge vif.wb_clk);
		if (vif.m_wb_cyc_o && vif.m_wb_stb_o) begin // when the memory gets valid request
		vif.m_wb_ack_i= 1'b1; // the memory drive an acknoledgment
		if ( vif.m_wb_we_o==1'b1) begin // if it is a write request 
			mem[vif.m_wb_adr_o]=vif.m_wb_dat_o; // store the data into the memory
		end
		else begin // if it is a read request 
			vif.m_wb_dat_i=mem[vif.m_wb_adr_o]; 
		end
	end
	else begin
		// m_wb_ack_i=0 is not done is the culprit
		vif.m_wb_ack_i=1'b0;
		vif.m_wb_dat_i=1'b0;
	end	
end
endtask	
	

endclass