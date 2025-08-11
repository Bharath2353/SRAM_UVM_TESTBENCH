class sram_agent1 extends uvm_agent;

`uvm_component_utils(sram_agent1)

function new(string name,uvm_component parent);
super.new(name,parent);
endfunction

sram_driver drv;
sram_sequencer seqr;
sram_monitor1 mon;

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
drv=sram_driver::type_id::create("drv",this);
seqr=sram_sequencer::type_id::create("seqr",this);
mon=sram_monitor1::type_id::create("mon",this);
`uvm_info(get_full_name(),"msg from active agent build phase with none",UVM_NONE)
`uvm_info(get_full_name(),"msg from active agent build phase with low",UVM_LOW)
endfunction

virtual task run_phase(uvm_phase phase);
super.run_phase(phase);
`uvm_info(get_full_name(),"message from active agent run phase with none",UVM_NONE)
`uvm_info(get_full_name(),"message from active agent run phase with LOW",UVM_LOW)
endtask

virtual function void connect_phase(uvm_phase phase);
 super.connect_phase(phase);
 drv.seq_item_port.connect(seqr.seq_item_export);
`uvm_info(get_full_name(),"message from active monitor connect phase with none",UVM_NONE)
`uvm_info(get_full_name(),"message from active monitor connect phase with LOW",UVM_LOW)
endfunction

endclass
