class sram_monitor2 extends uvm_monitor;

`uvm_component_utils(sram_monitor2)
virtual sram_interface intf;
sram_seq_item req;

uvm_blocking_put_port#(sram_seq_item) port2;

function new(string name,uvm_component parent);
super.new(name,parent);
port2=new("port2",this);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
req=sram_seq_item::type_id::create("req",this);
if(!uvm_config_db#(virtual sram_interface)::get(this,"","sram_intf",intf))
    `uvm_error(get_full_name(),"data not able to retrive")
`uvm_info(get_full_name(),"message from passive monitor build phase with none",UVM_NONE)
`uvm_info(get_full_name(),"message from passive monitor build phase with low",UVM_LOW)
endfunction

virtual task run_phase(uvm_phase phase);
super.run_phase(phase);
forever begin
@(posedge intf.clk);
req.rdata=intf.rdata;
`uvm_info(get_full_name(),$sformatf("rdata=%0d",req.rdata),UVM_NONE)
`uvm_info(get_full_name(),"message from passive monitor run phase with none",UVM_NONE)
`uvm_info(get_full_name(),"message from passive monitor run phase with LOW",UVM_LOW)

port2.put(req);
end
endtask

endclass
