class sram_driver extends uvm_driver#(sram_seq_item);

`uvm_component_utils(sram_driver)

virtual sram_interface intf;

function new(string name,uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info(get_full_name(),"msg from old driver build phase with none",UVM_NONE)
`uvm_info(get_full_name(),"msg from old driver build phase with low",UVM_LOW)

if(!uvm_config_db#(virtual sram_interface)::get(this,"","sram_intf",intf))
    `uvm_error("driver","data not retrived")
endfunction

virtual task run_phase(uvm_phase phase);
super.run_phase(phase);
forever begin
seq_item_port.get_next_item(req);
//#1;
req.print();
@(posedge intf.clk);
intf.rd_en=req.rd_en;
intf.wdata=req.wdata;
intf.addr=req.addr;
intf.wr_en=req.wr_en;
`uvm_info("DRV",$sformatf("wdata=%0d,rd_en=%0d,wr_en=%0d,addr=%0d",intf.wdata,intf.rd_en,intf.wr_en,intf.addr),UVM_NONE)
//req.print();

`uvm_info(get_type_name(),$sformatf("%s",req.sprint),UVM_NONE)
seq_item_port.item_done();
`uvm_info(get_type_name(),"msg from old driver run phase with none",UVM_NONE)
`uvm_info(get_type_name(),"msg from old driver run phase with medium",UVM_MEDIUM)
end
endtask



endclass

