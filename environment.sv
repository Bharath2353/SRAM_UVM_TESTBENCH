class sram_env extends uvm_env;

`uvm_component_utils(sram_env)

function new(string name,uvm_component parent);
super.new(name,parent);
endfunction

sram_agent1 ag1;
sram_agent2 ag2;
sram_scoreboard scbd;
sram_subscriber subr;

function void build_phase(uvm_phase phase);
super.build_phase(phase);
ag1=sram_agent1::type_id::create("ag1",this);
ag2=sram_agent2::type_id::create("ag2",this);
scbd=sram_scoreboard::type_id::create("scbd",this);
subr=sram_subscriber::type_id::create("subr",this);
`uvm_info(get_full_name(),"msg from environment build phase with none",UVM_NONE)
`uvm_info(get_full_name(),"msg from environment build phase with low",UVM_LOW)
endfunction

virtual function void end_of_elaboration_phase(uvm_phase phase);
super. end_of_elaboration_phase(phase);
uvm_top.print_topology();
`uvm_info(get_full_name(),"msg from environment end of eloboration phase with none",UVM_NONE)
`uvm_info(get_full_name(),"msg from environment end of eloboration phase with low",UVM_LOW)
endfunction


virtual task run_phase(uvm_phase phase);
super.run_phase(phase);
`uvm_info(get_full_name(),"message from environment run phase with none",UVM_NONE)
`uvm_info(get_full_name(),"message from environment run phase with LOW",UVM_LOW)
endtask

virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
ag1.mon.port1.connect(scbd.port1_imp);
ag2.moni.port2.connect(scbd.port2_imp);
ag1.mon.port1.connect(subr.analysis_export);
endfunction

endclass
