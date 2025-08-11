class sram_test extends uvm_test;

`uvm_component_utils(sram_test)

function new(string name,uvm_component parent );
super.new(name,parent);
endfunction

sram_seq seq;
sram_env env;

function void build_phase(uvm_phase phase);
super.build_phase(phase);
env=sram_env::type_id::create("env",this);
`uvm_info(get_full_name(),"msg from test build phase with none",UVM_NONE)
`uvm_info(get_full_name(),"msg from test build phase with low",UVM_LOW)
endfunction

virtual task run_phase(uvm_phase phase);
super.run_phase(phase);
seq=sram_seq::type_id::create("seq",this);
`uvm_info(get_full_name(),"message from test run phase with none",UVM_NONE)
`uvm_info(get_full_name(),"message from test run phase with LOW",UVM_LOW)
phase.raise_objection(this);
seq.start(env.ag1.seqr);
phase.drop_objection(this);
endtask


endclass
