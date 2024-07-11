


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








class miimoder_reg extends uvm_reg;
  `uvm_object_utils(miimoder_reg)

  // Register fields
  uvm_reg_field miinopre;
  uvm_reg_field clkdiv;

  // Constructor
  function new(string name = "miimoder_reg");
    super.new(name, , UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    // Create MIINOPRE field
    miinopre = uvm_reg_field::type_id::create("miinopre");
    // Configure MIINOPRE field
    miinopre.configure(this,      // Parent register block
                       1,         // Size: 1 bit wide
                       8,         // LSB position: starts at bit 8
                       "RW",      // Access policy: Read/Write
                       1,         // Volatile: field value can change unpredictably
                       1'h0,      // Reset value: default MIINOPRE value (0)
                       1,         // Has reset: field value is reset on system reset
                       1,         // Is rand: field value can be randomized during testing
                       0);        // Individually accessible: field occupies its byte lane

    // Create CLKDIV field
    clkdiv = uvm_reg_field::type_id::create("clkdiv");
    // Configure CLKDIV field
    clkdiv.configure(this,      // Parent register block
                     8,         // Size: 8 bits wide
                     0,         // LSB position: starts at bit 0
                     "RW",      // Access policy: Read/Write
                     1,         // Volatile: field value can change unpredictably
                     8'h64,     // Reset value: default CLKDIV value (0x64)
                     1,         // Has reset: field value is reset on system reset
                     1,         // Is rand: field value can be randomized during testing
                     0);        // Individually accessible: field occupies its byte lane
  endfunction
endclass



class miicommand_reg extends uvm_reg;
  `uvm_object_utils(miicommand_reg)

  // Register fields
  uvm_reg_field wctrldata;
  uvm_reg_field rstat;
  uvm_reg_field scanstat;

  // Constructor
  function new(string name = "miicommand_reg");
    super.new(name, 8, UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    // Create fields
    wctrldata = uvm_reg_field::type_id::create("wctrldata");
    rstat = uvm_reg_field::type_id::create("rstat");
    scanstat = uvm_reg_field::type_id::create("scanstat");

    // Configure fields
    wctrldata.configure(this, 1, 2, "RW", 1, 1'h0, 1, 1, 0);  // 1 bit wide, LSB position 2
    rstat.configure(this, 1, 1, "RW", 1, 1'h0, 1, 1, 0);        // 1 bit wide, LSB position 1
    scanstat.configure(this, 1, 0, "RW", 1, 1'h0, 1, 1, 0);     // 1 bit wide, LSB position 0
  endfunction
endclass

class miiaddress_reg extends uvm_reg;
  `uvm_object_utils(miiaddress_reg)

  // Register fields
  uvm_reg_field rgad;
  uvm_reg_field fiad;

  // Constructor
  function new(string name = "miiaddress_reg");
    super.new(name, 13, UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    // Create fields
    rgad = uvm_reg_field::type_id::create("rgad");
    fiad = uvm_reg_field::type_id::create("fiad");

    // Configure fields
    // Configure RGAD field
    rgad.configure(this, 5, 8, "RW", 1, 5'h0, 1, 1, 0);   // 5 bits wide, LSB position 8

    // Configure FIAD field
    fiad.configure(this, 5, 0, "RW", 1, 5'h0, 1, 1, 0);   // 5 bits wide, LSB position 0
  endfunction
endclass


class miitx_data_reg extends uvm_reg;
  `uvm_object_utils(miitx_data_reg)

  // Register fields
  uvm_reg_field ctrldata;

  // Constructor
  function new(string name = "miitx_data_reg");
    super.new(name, 16, UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    // Create field
    ctrldata = uvm_reg_field::type_id::create("ctrldata");

    // Configure field
    ctrldata.configure(this, 16, 0, "RW", 1, 16'h0, 1, 1, 0);   // 16 bits wide, LSB position 0
  endfunction
endclass



class miirx_data_reg extends uvm_reg;
  `uvm_object_utils(miirx_data_reg)

  // Register fields
  uvm_reg_field prsd;

  // Constructor
  function new(string name = "miirx_data_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    // Create field
    prsd = uvm_reg_field::type_id::create("prsd");

    // Configure field
    prsd.configure(this, 16, 0, "RO", 0, 16'h0, 1, 1, 0);   // 16 bits wide, LSB position 0
  endfunction
endclass


class miistatus_reg extends uvm_reg;
  `uvm_object_utils(miistatus_reg)

  // Register fields
  uvm_reg_field nvalid;
  uvm_reg_field busy;
  uvm_reg_field linkfail;

  // Constructor
  function new(string name = "miistatus_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    // Create fields
    nvalid = uvm_reg_field::type_id::create("nvalid");
    busy = uvm_reg_field::type_id::create("busy");
    linkfail = uvm_reg_field::type_id::create("linkfail");

    // Configure fields
    nvalid.configure(this, 1, 2, "RO", 1, 1'h0, 1, 1, 0);   // 1 bit wide, LSB position 2
    busy.configure(this, 1, 1, "RO", 1, 1'h0, 1, 1, 0);     // 1 bit wide, LSB position 1
    linkfail.configure(this, 1, 0, "RO", 1, 1'h0, 1, 1, 0); // 1 bit wide, LSB position 0
  endfunction
endclass




class macaddr0_reg extends uvm_reg;
  `uvm_object_utils(macaddr0_reg)

  // Register fields
  uvm_reg_field byte2;
  uvm_reg_field byte3;
  uvm_reg_field byte4;
  uvm_reg_field byte5;

  // Constructor
  function new(string name = "macaddr0_reg");
    super.new(name, 8, UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    // Create fields
    byte2 = uvm_reg_field::type_id::create("byte2");
    byte3 = uvm_reg_field::type_id::create("byte3");
    byte4 = uvm_reg_field::type_id::create("byte4");
    byte5 = uvm_reg_field::type_id::create("byte5");

    // Configure fields
    byte2.configure(this, 8, 24, "RW", 1, 8'h00, 1, 1, 0);  // 8 bits wide, LSB position 24
    byte3.configure(this, 8, 16, "RW", 1, 8'h00, 1, 1, 0);  // 8 bits wide, LSB position 16
    byte4.configure(this, 8, 8, "RW", 1, 8'h00, 1, 1, 0);   // 8 bits wide, LSB position 8
    byte5.configure(this, 8, 0, "RW", 1, 8'h00, 1, 1, 0);   // 8 bits wide, LSB position 0
  endfunction
endclass


class macaddr1_reg extends uvm_reg;
  `uvm_object_utils(macaddr1_reg)

  // Register fields
  uvm_reg_field byte0;
  uvm_reg_field byte1;

  // Constructor
  function new(string name = "macaddr1_reg");
    super.new(name, 16, UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    // Create fields
    byte0 = uvm_reg_field::type_id::create("byte0");
    byte1 = uvm_reg_field::type_id::create("byte1");

    // Configure fields
    byte0.configure(this, 8, 8, "RW", 1, 8'h0, 1, 1, 0);   // 8 bits wide, LSB position 8
    byte1.configure(this, 8, 0, "RW", 1, 8'h0, 1, 1, 0);   // 8 bits wide, LSB position 0
  endfunction
endclass


class hash0_reg extends uvm_reg;
  `uvm_object_utils(hash0_reg)

  // Register fields
  uvm_reg_field hash0;

  // Constructor
  function new(string name = "hash0_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    // Create field
    hash0 = uvm_reg_field::type_id::create("hash0");

    // Configure field
    hash0.configure(this, 8, 32, "RW", 1, 32'h0, 1, 1, 0);   // 32 bits wide, LSB position 0
  endfunction
endclass


class hash1_reg extends uvm_reg;
  `uvm_object_utils(hash1_reg)

  // Register fields
  uvm_reg_field hash1;

  // Constructor
  function new(string name = "hash1_reg");
    super.new(name, 32, UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    // Create field
    hash1 = uvm_reg_field::type_id::create("hash1");

    // Configure field
    hash1.configure(this,32, 0, "RW", 1, 32'h0, 1, 1, 0);   // 32 bits wide, LSB position 0
  endfunction
endclass



class txctrl_reg extends uvm_reg;
  `uvm_object_utils(txctrl_reg)

  // Register fields
  uvm_reg_field txpauserq;
  uvm_reg_field txpausetv;

  // Constructor
  function new(string name = "txctrl_reg");
    super.new(name, , UVM_NO_COVERAGE);
  endfunction

  // Build function
  virtual function void build();
    // Create fields
    txpauserq = uvm_reg_field::type_id::create("txpauserq");
    txpausetv = uvm_reg_field::type_id::create("txpausetv");

    // Configure fields
	txpausetv.configure(this, 16, 0, "RW", 1, 16'h0, 1, 1, 0); // 16 bits wide, LSB position 0
    txpauserq.configure(this, 1, 16, "RW", 1, 1'h0, 1, 1, 0);    // 1 bit wide, LSB position 16
  endfunction
endclass







/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class mac_reg_block extends uvm_reg_block;
  `uvm_object_utils(mac_reg_block)

  // Register instances
  moder_reg moder;
  intsrc_reg intsrc;
  intmask_reg intmask;
  ipgt_reg ipgt;
  ipgr1_reg ipgr1;
  ipgr2_reg ipgr2;
  packetlen_reg packetlen;
  collconf_reg collconf;
  txbdnum_reg txbdnum;
  ctrlmoder_reg ctrlmoder;
  miimoder_reg miimoder;
  miicommand_reg miicommand;
  miiaddress_reg miiaddress;
  miitx_data_reg miitx_data;
  miirx_data_reg miirx_data;
  miistatus_reg miistatus;
  macaddr0_reg macaddr0;
  macaddr1_reg macaddr1;
  hash0_reg hash0;
  hash1_reg hash1;
  txctrl_reg txctrl;

  uvm_reg_map wb_map; //registers are accessing using WB interface.

  // Constructor
  function new(string name = "mac_reg_block");
    super.new(name,build_coverage (UVM_CVR_ADDR_MAP));
  endfunction

  // Build function
  virtual function void build();
  
  string s;
  
  moder=csr_reg::type_id::create("moder");
  moder.configure(this, null,"");
  moder.build();
  
  for(int i= 0; i<17; i++) begin // for backdoor access
	$sformat(s, "MODERout[%0d]",i);
	moder.add_hdl_path_slice(s,i,1);
  end
  
  
  intsrc=csr_reg::type_id::create("intsrc");
  intsrc.configure(this, null,"");
  intsrc.build();
  
  // for backdoor access///////////////
  for(int i= 0; i<17; i++) begin 
	$sformat(s, "INT_SOURCEOut[%0d]",i);
	intsrc.add_hdl_path_slice(s,i,1);
  end
  /////////////////////////////////////
  int_mask=int_msk_reg::type_id::create("int_mask");
  int_mask.configure(this, null,"");
  int_mask.build( );
  
  // for backdoor access///////////////
  for(int i= 0; i<7; i++) begin 
	$sformat(s, "INT_MASKOut[%0d]",i);
	int_mask.add_hdl_path_slice(s,i,1);
  end
  /////////////////////////////////////
  
  ipgt=ipgt_reg::type_id::create("ipgt");
  ipgt.configure(this, null,"");
  ipgt.build( );
  // for backdoor access///////////////
  for(int i= 0; i<7; i++) begin 
	$sformat(s, "IPGTOut[%0d]",i);
	ipgt.add_hdl_path_slice(s,i,1);
  end
  /////////////////////////////////////
  
  
  ipgr1=ipgr1_reg::type_id::create("ipgr1");
  ipgr1.configure(this, null,"");
  ipgr1.build( );
  
    // for backdoor access///////////////
  for(int i= 0; i<7; i++) begin 
	$sformat(s, "IPGR1Out[%0d]",i);
	ipgr1.add_hdl_path_slice(s,i,1);
  end
  /////////////////////////////////////
  
  ipgr2=ipgr2_reg::type_id::create("ipgr2");
  ipgr2.configure(this, null,"");
  ipgr2.build( );
  
    // for backdoor access///////////////
  for(int i= 0; i<7; i++) begin 
	$sformat(s, "IPGR2Out[%0d]",i);
	ipgr2.add_hdl_path_slice(s,i,1);
  end
  /////////////////////////////////////
  
  
  packetlen=packetlen_reg::type_id::create("packetlen");
  packetlen.configure(this, null,"");
  packetlen.build( );
  
    // for backdoor access///////////////
  for(int i= 0; i<7; i++) begin 
	$sformat(s, "PACKETLENOut[%0d]",i);
	packetlen.add_hdl_path_slice(s,i,1);
  end
  /////////////////////////////////////
  
  
  collconf=collconf_reg::type_id::create("collconf");
  collconf.configure(this, null,"");
  collconf.build( );
  
  // for backdoor access///////////////
  for(int i= 0; i<7; i++) begin 
	$sformat(s, "COLLCONFOut[%0d]",i);
	packetlen.add_hdl_path_slice(s,i,1);
  end
  /////////////////////////////////////
  
  txbdnum=txbdnum_reg::type_id::create("txbdnum");
  txbdnum.configure(this, null,"");
  txbdnum.build( );
  // for backdoor access///////////////
  for(int i= 0; i<7; i++) begin 
	$sformat(s, "TX_BD_NUMOut[%0d]",i);
	packetlen.add_hdl_path_slice(s,i,1);
  end
   
  /////////////////////////////////////
  
  ctrlmoder=ctrlmoder_reg::type_id::create("ctrlmoder");
  ctrlmoder.configure(this, null,"");
  ctrlmoder.build( );
  // for backdoor access///////////////
  for(int i= 0; i<7; i++) begin 
	$sformat(s, "CTRLMODEROut[%0d]",i);
	ctrlmoder.add_hdl_path_slice(s,i,1);
  end
  /////////////////////////////////////  
  
  miimoder=miimoder_reg::type_id::create("miimoder");
  miimoder.configure(this, null,"");
  miimoder.build( );
  // for backdoor access///////////////
  for(int i= 0; i<7; i++) begin 
	$sformat(s, "MIIMODEROut[%0d]",i);
	packetlen.add_hdl_path_slice(s,i,1);
  end
  /////////////////////////////////////  
  miicommand=miicommand_reg::type_id::create("miicommand");
  miicommand.configure(this, null,"");
  miicommand.build( );
  // for backdoor access///////////////
  for(int i= 0; i<7; i++) begin 
	$sformat(s, "MIICOMMANDOut[%0d]",i);
	miicommand.add_hdl_path_slice(s,i,1);
  end
  /////////////////////////////////////
  
  
  miitx_data=miitx_data_reg::type_id::create("miitx_data");
  miitx_data.configure(this, null,"");
  miitx_data.build( );
  // for backdoor access///////////////
  for(int i= 0; i<7; i++) begin 
	$sformat(s, "MIITX_DATAOut[%0d]",i);
	miitx_data.add_hdl_path_slice(s,i,1);
  end
  /////////////////////////////////////
  
  miirx_data=miirx_data_reg::type_id::create("miirx_data");
  miirx_data.configure(this, null,"");
  miirx_data.build( );
  // for backdoor access///////////////
  for(int i= 0; i<7; i++) begin 
	$sformat(s, "MIIRX_DATAOut[%0d]",i);
	miirx_data.add_hdl_path_slice(s,i,1);
  end
  /////////////////////////////////////  
  
  miistatus=miistatus_reg::type_id::create("miistatus");
  miistatus.configure(this, null,"");
  miistatus.build( );
  // for backdoor access///////////////
  for(int i= 0; i<7; i++) begin 
	$sformat(s, "MIISTATUSOut[%0d]",i);
	miistatus.add_hdl_path_slice(s,i,1);
  end
  /////////////////////////////////////  
  
  macaddr0=macaddr0_reg::type_id::create("macaddr0");
  macaddr0.configure(this, null,"");
  macaddr0.build( );
  // for backdoor access///////////////
  for(int i= 0; i<7; i++) begin 
	$sformat(s, "MAC_ADDR0Out[%0d]",i);
	macaddr0.add_hdl_path_slice(s,i,1);
  end
  /////////////////////////////////////  
  
  macaddr1=macaddr1_reg::type_id::create("macaddr1");
  macaddr1.configure(this, null,"");
  macaddr1.build( );
  // for backdoor access///////////////
  for(int i= 0; i<7; i++) begin 
	$sformat(s, "MAC_ADDR1Out[%0d]",i);
	macaddr1.add_hdl_path_slice(s,i,1);
  end
  /////////////////////////////////////  
  
  hash0=hash0_reg::type_id::create("hash0");
  hash0.configure(this, null,"");
  hash0.build( );
  // for backdoor access///////////////
  for(int i= 0; i<7; i++) begin 
	$sformat(s, "HASH0Out[%0d]",i);
	hash0.add_hdl_path_slice(s,i,1);
  end
  /////////////////////////////////////


  
  hash1=hash1_reg::type_id::create("hash1");
  hash1.configure(this, null,"");
  hash1.build( );

  // for backdoor access///////////////
  for(int i= 0; i<7; i++) begin 
	$sformat(s, "HASH1Out[%0d]",i);
	hash1.add_hdl_path_slice(s,i,1);
  end
  /////////////////////////////////////


  
  txctrl=txctrl_reg::type_id::create("txctrl");
  txctrl.configure(this, null,"");
  txctrl.build( );
  // for backdoor access///////////////
  for(int i= 0; i<7; i++) begin 
	$sformat(s, "TXCTRLOut[%0d]",i);
	txctrl.add_hdl_path_slice(s,i,1);
  end
  /////////////////////////////////////


  
  wb_map= create_map("wb_map", 'h0,4,UVM_LITTLE_ENDIAN);
  wb_map= create_map(moder, 32'h0,"RW");
  wb_map= create_map(intsrc, 32'h1,"RW");
  wb_map= create_map(int_mask, 32'h2,"RW");
  
  wb_map= create_map(ipgt, 32'h3,"RW");
  wb_map= create_map(ipgr1, 32'h4,"RW");
  wb_map= create_map(ipgr2, 32'h5,"RW");
  
  wb_map= create_map(packetlen, 32'h6,"RW");
  wb_map= create_map(collconf, 32'h7,"RW");
  wb_map= create_map(txbdnum, 32'h8,"RW");
  
  wb_map= create_map(ctrlmoder, 32'h9,"RW");
  wb_map= create_map(miimoder, 32'hA,"RW");
  wb_map= create_map(miicommand, 32'hB,"RW");
  wb_map= create_map(miiaddress, 32'hC,"RW");
  
  wb_map= create_map(miitx_data, 32'hD,"RW");
  wb_map= create_map(miirx_data, 32'hE,"RW");
  wb_map= create_map(miistatus, 32'hF,"RW");
  wb_map= create_map(macaddr0, 32'h10,"RW");
  
  wb_map= create_map(macaddr1, 32'h11,"RW");
  wb_map= create_map(hash0, 32'h12,"RW");
  wb_map= create_map(hash1, 32'h13,"RW");
  wb_map= create_map(txctrl, 32'h14,"RW");
  
  
  add_hdl_path("top_tb.dut.ethreg1", "RTL");
  
  lock_model();
  
  endfunction
endclass
