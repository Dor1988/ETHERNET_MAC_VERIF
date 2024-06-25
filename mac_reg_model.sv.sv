


/* Field Configuration:

explaination of The configure method parameters:

1.Parent (parent):
Specifies the parent register block to which the field belongs.

2)Size (size):
Indicates the width of the field in bits.

3)LSB Position (lsb_pos):
Defines the position of the least significant bit (LSB) of the field relative to the LSB of the entire register.

4)Access (access): Specifies the access policy of the field, such as "RW" (Read/Write), "RO" (Read-Only), "WO" (Write-Only), etc.
If using a predefined policy, this dictates the field's access behavior.

5)Volatile (volatile):
Indicates whether the field’s value can change unexpectedly due to hardware conditions (1 for volatile) or remains stable (0 for non-volatile).

6)Reset (reset):Specifies the initial value of the field upon reset.
This is the hard reset value that the field assumes when the register is reset.

7)Has Reset (has_reset):
Indicates whether the field value is reset upon a system reset (1 if reset occurs, 0 if not).

8)Is Rand (is_rand):
Specifies whether the field value can be randomized during testing (1 for randomizable) or should remain fixed (0 for non-randomizable).
Ignored if the access policy precludes writing ("RO", "WRC", "WRS", "W1", "WO1").

9) 
Individually Accessible (individually_accessible):
Indicates whether the field occupies a byte lane exclusively (1 if yes, 0 if not).
This is used when configuring fields that align with specific byte boundaries in the register.

 */


class moder_reg extends uvm_reg;
  `uvm_object_utils(moder_reg)
  // Register fields
  uvm_reg_field recsmall;
  uvm_reg_field pad;
  uvm_reg_field hugen;
  uvm_reg_field crcen;
  uvm_reg_field dlycrcen;
  uvm_reg_field fulld;
  uvm_reg_field exdfren;
  uvm_reg_field nobkoff;
  uvm_reg_field loopback;
  uvm_reg_field ifg;
  uvm_reg_field pro;
  uvm_reg_field iam;
  uvm_reg_field bro;
  uvm_reg_field nopre;
  uvm_reg_field txen;
  uvm_reg_field rxen;

  // Constructor
  function new(string name = "moder_reg");
    super.new(name, 17, UVM_NO_COVERAGE);// upper 15 bits are reserved
  endfunction
  
  // Build function
  virtual function void build();
    recsmall = uvm_reg_field::type_id::create("recsmall");
    pad = uvm_reg_field::type_id::create("pad");
    hugen = uvm_reg_field::type_id::create("hugen");
    crcen = uvm_reg_field::type_id::create("crcen");
    dlycrcen = uvm_reg_field::type_id::create("dlycrcen");
    fulld = uvm_reg_field::type_id::create("fulld");
    exdfren = uvm_reg_field::type_id::create("exdfren");
    nobkoff = uvm_reg_field::type_id::create("nobkoff");
    loopback = uvm_reg_field::type_id::create("loopback");
    ifg = uvm_reg_field::type_id::create("ifg");
    pro = uvm_reg_field::type_id::create("pro");
    iam = uvm_reg_field::type_id::create("iam");
    bro = uvm_reg_field::type_id::create("bro");
    nopre = uvm_reg_field::type_id::create("nopre");
    txen = uvm_reg_field::type_id::create("txen");
    rxen = uvm_reg_field::type_id::create("rxen");

    recsmall.configure(	this, 1, 16, "RW", 1, 1'b0, 1, 1, 0);
    pad.configure(		this, 1, 15, "RW", 1, 1'b1, 1, 1, 0);
    hugen.configure(	this, 1, 14, "RW", 1, 1'b0, 1, 1, 0);
    crcen.configure(	this, 1, 13, "RW", 1, 1'b1, 1, 1, 0);
    dlycrcen.configure(	this, 1, 12, "RW", 1, 1'b0, 1, 1, 0);
    fulld.configure(	this, 1, 10, "RW", 1, 1'b0, 1, 1, 0);
    exdfren.configure(	this, 1, 9,  "RW", 1, 1'b0, 1, 1, 0);
    nobkoff.configure(	this, 1, 8,  "RW", 1, 1'b0, 1, 1, 0);
    loopback.configure(	this, 1, 7,  "RW", 1, 1'b0, 1, 1, 0);
    ifg.configure(		this, 1, 6,  "RW", 1, 1'b0, 1, 1, 0);
    pro.configure(		this, 1, 5,  "RW", 1, 1'b0, 1, 1, 0);
    iam.configure(		this, 1, 4,  "RW", 1, 1'b0, 1, 1, 0);
    bro.configure(		this, 1, 3,  "RW", 1, 1'b0, 1, 1, 0);
    nopre.configure(	this, 1, 2,  "RW", 1, 1'b0, 1, 1, 0);
    txen.configure(		this, 1, 1,  "RW", 1, 1'b0, 1, 1, 0);
    rxen.configure(		this, 1, 0,  "RW", 1, 1'b0, 1, 1, 0);
  endfunction
endclass


class intsrc_reg extends uvm_reg;
  `uvm_object_utils(intsrc_reg)

  // Register fields
  uvm_reg_field rxc;
  uvm_reg_field txc;
  uvm_reg_field busy;
  uvm_reg_field rxe;
  uvm_reg_field rxb;
  uvm_reg_field txe;
  uvm_reg_field txb;

  // Constructor
  function new(string name = "intsrc_reg");
    super.new(name, 7, UVM_NO_COVERAGE);//upper 15 bits reserved
  endfunction

  // Build function
  virtual function void build();
    rxc = uvm_reg_field::type_id::create("rxc");
    txc = uvm_reg_field::type_id::create("txc");
    busy = uvm_reg_field::type_id::create("busy");
    rxe = uvm_reg_field::type_id::create("rxe");
    rxb = uvm_reg_field::type_id::create("rxb");
    txe = uvm_reg_field::type_id::create("txe");
    txb = uvm_reg_field::type_id::create("txb");

    rxc.configure(this, 1, 6, "W1C", 1, 1'b0, 1, 1, 0);
    txc.configure(this, 1, 5, "W1C", 1, 1'b0, 1, 1, 0);
    busy.configure(this,1, 4, "W1C", 1, 1'b0, 1, 1, 0);
    rxe.configure(this, 1, 3, "W1C", 1, 1'b0, 1, 1, 0);
    rxb.configure(this, 1, 2, "RW",  1,  1'b0, 1, 1,0);
    txe.configure(this, 1, 1, "RW",  1,  1'b0, 1, 1,0);
    txb.configure(this, 1, 0, "RW",  1,  1'b0, 1, 1,0);
  endfunction
endclass



class intmask_reg extends uvm_reg;
  `uvm_object_utils(intmask_reg)

  // Register fields
  uvm_reg_field rxc_m;
  uvm_reg_field txc_m ;
  uvm_reg_field busy_m;
  uvm_reg_field rxe_m;
  uvm_reg_field rxf_m;
  uvm_reg_field txe_m;
  uvm_reg_field txb_m;

  // Constructor
  function new(string name = "intmask_reg");
    super.new(name, 7, UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    rxc_m  = uvm_reg_field::type_id::create("rxc_m");
    txc_m = uvm_reg_field::type_id::create("txc_m");
    busy_m = uvm_reg_field::type_id::create("busy_m");
    rxe_m = uvm_reg_field::type_id::create("rxe_m");
    rxf_m = uvm_reg_field::type_id::create("rxf_m");
    txe_m = uvm_reg_field::type_id::create("txe_m");
    txb_m = uvm_reg_field::type_id::create("txb_m");

    rxc_m.configure(this, 1, 6, "RW", 1, 1'b0, 1, 1, 0);
    txc_m.configure(this, 1, 5, "RW", 1, 1'b0, 1, 1, 0);
    busy_m.configure(this, 1, 4,"RW", 1, 1'b0, 1, 1, 0);
    rxe_m.configure(this, 1, 3, "RW", 1, 1'b0, 1, 1, 0);
    rxf_m.configure(this, 1, 2, "RW", 1, 1'b0, 1, 1, 0);
    txe_m.configure(this, 1, 1, "RW", 1, 1'b0, 1, 1, 0);
    txb_m.configure(this, 1, 0, "RW", 1, 1'b0, 1, 1, 0);
  endfunction
endclass



class ipgt_reg extends uvm_reg;
  `uvm_object_utils(ipgt_reg)

  // Register field
  uvm_reg_field ipgt;

  // Constructor
  function new(string name = "ipgt_reg");
    super.new(name, 7, UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    ipgt = uvm_reg_field::type_id::create("ipgt");
    ipgt.configure(this, 7, 0, "RW", 1, 7'h12, 1, 1, 0);
    // 7 bits wide, from bit 0 to bit 6
    // RW: Read/Write access
    // Reset value: 0x12 (default for half duplex)
    // Recommended default value: 0x12
  endfunction
endclass



class ipgr1_reg extends uvm_reg;
  `uvm_object_utils(ipgr1_reg)

  // Register field
  uvm_reg_field ipgr1;

  // Constructor
  function new(string name = "ipgr1_reg");
    super.new(name, 7, UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    ipgr1 = uvm_reg_field::type_id::create("ipgr1");
    ipgr1.configure(this, 7, 0, "RW", 1, 7'hC, 1, 1, 0);
    // 7 bits wide, from bit 0 to bit 6
    // RW: Read/Write access
    // Reset value: 0x0C (recommended/default value)
    // Recommended default value: 0x0C
  endfunction
endclass



class ipgr2_reg extends uvm_reg;
  `uvm_object_utils(ipgr2_reg)

  // Register field
  uvm_reg_field ipgr2;

  // Constructor
  function new(string name = "ipgr2_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    ipgr2 = uvm_reg_field::type_id::create("ipgr2");
    ipgr2.configure(this, 7, 0, "RW", 1, 7'h12, 1, 1, 0);
    // 7 bits wide, from bit 0 to bit 6
    // RW: Read/Write access
    // Reset value: 0x12 (recommended/default value)
    // Recommended default value: 0x12
  endfunction
endclass

class packetlen_reg extends uvm_reg;
  `uvm_object_utils(packetlen_reg)

  // Register fields
  uvm_reg_field minfl;
  uvm_reg_field maxfl;

  // Constructor
  function new(string name = "packetlen_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    minfl = uvm_reg_field::type_id::create("minfl");
    maxfl = uvm_reg_field::type_id::create("maxfl");

    minfl.configure(this, 16, 16, "RW", 1, 16'h40, 1, 1, 0);

    maxfl.configure(this, 16, 0, "RW", 1, 16'h0600, 1, 1, 0);

  endfunction
endclass


class collconf_reg extends uvm_reg;
  `uvm_object_utils(collconf_reg)

  // Register fields
  uvm_reg_field maxret;
  uvm_reg_field collvalid;

  // Constructor
  function new(string name = "collconf_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    // Create MAXRET field
    maxret = uvm_reg_field::type_id::create("maxret");
    // Configure MAXRET field
    maxret.configure(this,4,16,"RW",1,4'hf,1,1,0);
	// Parent register block
	// Size: 4 bits wide
	// LSB position: starts at bit 16
	// Access policy: Read/Write
	// Volatile: field value can change unpredictably
	// Reset value: default MAXRET value (0xf)
	// Has reset: field value is reset on system reset
	// Is rand: field value can be randomized during testing
	// Individually accessible: field occupies its byte lane
	
	
    // Create COLLVALID field
    collvalid = uvm_reg_field::type_id::create("collvalid");
    // Configure COLLVALID field
    collvalid.configure(this,6,0,"RW",1,6'h3f,1,1,0);       
		
// Parent register block
 // Size: 6 bits wide
 // LSB position: starts at bit 0
 // Access policy: Read/Write
 // Volatile: field value can change unpredictably
 // Reset value: default COLLVALID value (0x3f)
 // Has reset: field value is reset on system reset
 // Is rand: field value can be randomized during testing
 // Individually accessible: field occupies its byte lane
						
  endfunction
  // Explanation for COLLCONF Register Fields:

// MAXRET Field (Bit 19-16):
// Size: 4 bits
// LSB Position: 16
// Access: Read/Write
// Reset Value: 0xf (15, maximum retry attempts after collision)
// Volatile: Yes (1)
// Has Reset: Yes (1)
// Is Rand: Yes (1)
// Individually Accessible: Yes (1)

// COLLVALID Field (Bit 5-0):
// Size: 6 bits
// LSB Position: 0
// Access: Read/Write
// Reset Value: 0x3f (63, collision valid time window)
// Volatile: Yes (1)
// Has Reset: Yes (1)
// Is Rand: Yes (1)
// Individually Accessible: Yes (1)
endclass




class txbdnum_reg extends uvm_reg;
  `uvm_object_utils(txbdnum_reg)

  // Register fields
  uvm_reg_field txbdnum;

  // Constructor
  function new(string name = "txbdnum_reg");
    super.new(name, 8, UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    // Create TX_BD_NUM field
    tx_bd_num = uvm_reg_field::type_id::create("tx_bd_num");
    // Configure TX_BD_NUM field
    tx_bd_num.configure(this,      // Parent register block
                         8,         // Size: 8 bits wide
                         0,         // LSB position: starts at bit 0
                         "RW",      // Access policy: Read/Write
                         1,         // Volatile: field value can change unpredictably
                         8'h40,     // Reset value: default TX_BD_NUM value (0x40)
                         1,         // Has reset: field value is reset on system reset
                         1,         // Is rand: field value cannot be randomized during testing
                         0);        // Individually accessible: field occupies its byte lane
  endfunction
endclass




class ctrlmoder_reg extends uvm_reg;
  `uvm_object_utils(ctrlmoder_reg)

  // Register fields
  uvm_reg_field txflow;
  uvm_reg_field rxflow;
  uvm_reg_field passall;

  // Constructor
  function new(string name = "ctrlmoder_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    // Create TXFLOW field
    txflow = uvm_reg_field::type_id::create("txflow");
    // Configure TXFLOW field
    txflow.configure(this,      // Parent register block
                     1,         // Size: 1 bit wide
                     2,         // LSB position: starts at bit 2
                     "RW",      // Access policy: Read/Write
                     1,         // Volatile: field value can change unpredictably
                     1'h0,      // Reset value: default TXFLOW value (0)
                     1,         // Has reset: field value is reset on system reset
                     1,         // Is rand: field value can be randomized during testing
                     0);        // Individually accessible: field occupies its byte lane

    // Create RXFLOW field
    rxflow = uvm_reg_field::type_id::create("rxflow");
    // Configure RXFLOW field
    rxflow.configure(this,      // Parent register block
                     1,         // Size: 1 bit wide
                     1,         // LSB position: starts at bit 1
                     "RW",      // Access policy: Read/Write
                     1,         // Volatile: field value can change unpredictably
                     1'h0,      // Reset value: default RXFLOW value (0)
                     1,         // Has reset: field value is reset on system reset
                     1,         // Is rand: field value can be randomized during testing
                     0);        // Individually accessible: field occupies its byte lane

    // Create PASSALL field
    passall = uvm_reg_field::type_id::create("passall");
    // Configure PASSALL field
    passall.configure(this,      // Parent register block
                       1,         // Size: 1 bit wide
                       0,         // LSB position: starts at bit 0
                       "RW",      // Access policy: Read/Write
                       1,         // Volatile: field value can change unpredictably
                       1'h0,      // Reset value: default PASSALL value (0)
                       1,         // Has reset: field value is reset on system reset
                       1,         // Is rand: field value can be randomized during testing
                       0);        // Individually accessible: field occupies its byte lane
  endfunction
  // Explanation for CTRLMODER Register Fields:

// TXFLOW Field (Bit 2):
// Size: 1 bit
// LSB Position: 2
// Access: Read/Write
// Reset Value: 0 (PAUSE control frames are blocked)
// Volatile: Yes (1)
// Has Reset: Yes (1)
// Is Rand: Yes (1)
// Individually Accessible: Yes (1)

// RXFLOW Field (Bit 1):
// Size: 1 bit
// LSB Position: 1
// Access: Read/Write
// Reset Value: 0 (Received PAUSE control frames are ignored)
// Volatile: Yes (1)
// Has Reset: Yes (1)
// Is Rand: Yes (1)
// Individually Accessible: Yes (1)

// PASSALL Field (Bit 0):
// Size: 1 bit
// LSB Position: 0
// Access: Read/Write
// Reset Value: 0 (Control frames are not passed to the host)
// Volatile: Yes (1)
// Has Reset: Yes (1)
// Is Rand: Yes (1)
// Individually Accessible: Yes (1)
endclass





















/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class mac_reg_block extends uvm_reg_block;

endclass