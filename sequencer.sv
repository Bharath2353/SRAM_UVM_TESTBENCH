class sram_sequencer extends uvm_sequencer#(sram_seq_item);

`uvm_component_utils(sram_sequencer)

function new(string name,uvm_component parent);
super.new(name,parent);
endfunction

/*function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info("get_full_name()","build phase in sequencer",UVM_NONE)
endfunction*/

endclass




