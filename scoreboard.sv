class sram_scoreboard extends uvm_scoreboard;

`uvm_component_utils(sram_scoreboard)
uvm_analysis_imp#(sram_seq_item,sram_scoreboard) port1_imp;
uvm_blocking_put_imp#(sram_seq_item,sram_scoreboard) port2_imp;
sram_seq_item ref_data,dut_data;

function new(string name,uvm_component parent);
super.new(name,parent);
port1_imp=new("port1_imp",this);
port2_imp=new("port2_imp",this);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
ref_data=sram_seq_item::type_id::create("ref_data");
dut_data=sram_seq_item::type_id::create("dut_data");
`uvm_info(get_full_name(),"build phase in scoreboard",UVM_NONE)
endfunction

task write(sram_seq_item ref_data);
this.ref_data=ref_data;
endtask

task put(sram_seq_item dut_data);
this.dut_data=dut_data;

if(ref_data.rdata==dut_data.rdata)begin
    `uvm_info(get_full_name,$sformatf("ref.rdata=%0d,dut.rdata=%0d",ref_data.rdata,dut_data.rdata),UVM_NONE)
    `uvm_info(get_full_name,"---------------------TEST PASSED--------------------",UVM_NONE)
    end
else begin
    `uvm_info(get_full_name,$sformatf("ref.rdata=%0d,dut.rdata=%0d",ref_data.rdata,dut_data.rdata),UVM_NONE)
    `uvm_info(get_full_name,"---------------------TEST FAILED--------------------",UVM_NONE)
end
endtask


virtual task run_phase(uvm_phase phase);
super.run_phase(phase);
`uvm_info(get_full_name(),"message from scoreboard run phase with none",UVM_NONE)
`uvm_info(get_full_name(),"message from scoreboard run phase with LOW",UVM_LOW)
endtask


endclass
