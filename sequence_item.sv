class sram_seq_item extends uvm_sequence_item;
rand bit [7:0]wdata;
bit [3:0]addr;
rand bit wr_en;
rand bit rd_en;
bit [7:0]rdata;

`uvm_object_utils_begin(sram_seq_item)
`uvm_field_int(addr,UVM_DEC|UVM_ALL_ON)
`uvm_field_int(wr_en,UVM_BIN|UVM_ALL_ON)
`uvm_field_int(rd_en,UVM_BIN|UVM_ALL_ON)
`uvm_field_int(wdata,UVM_DEC|UVM_ALL_ON)
`uvm_field_int(rdata,UVM_DEC|UVM_ALL_ON)
`uvm_object_utils_end

function new(string name="sram_seq_item");
super.new(name);
endfunction

endclass
