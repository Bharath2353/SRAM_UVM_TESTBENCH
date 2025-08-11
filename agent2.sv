class sram_agent2 extends uvm_agent;

`uvm_component_utils(sram_agent2)

function new(string name,uvm_component parent);
super.new(name,parent);
endfunction

sram_monitor2 moni;

function void build_phase(uvm_phase phase);
super.build_phase(phase);
moni=sram_monitor2::type_id::create("moni",this);
`uvm_info(get_full_name(),"msg from passive agent build phase with none",UVM_NONE)
`uvm_info(get_full_name(),"msg from passive agent build phase with low",UVM_LOW)
endfunction

virtual task run_phase(uvm_phase phase);
super.run_phase(phase);
`uvm_info(get_full_name(),"message from passive agent run phase with none",UVM_NONE)
`uvm_info(get_full_name(),"message from passive agent run phase with LOW",UVM_LOW)
endtask

virtual function void connect_phase(uvm_phase phase);
 super.connect_phase(phase);
`uvm_info(get_full_name(),"message from passive monitor connect phase with none",UVM_NONE)
`uvm_info(get_full_name(),"message from passive monitor connect phase with LOW",UVM_LOW)
endfunction

endclass
