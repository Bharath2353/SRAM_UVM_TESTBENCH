class sram_monitor1 extends uvm_monitor;

`uvm_component_utils(sram_monitor1)
uvm_analysis_port#(sram_seq_item) port1;

function new(string name,uvm_component parent);
super.new(name,parent);
port1=new("port1",this);
endfunction

virtual sram_interface intf;
sram_seq_item req;
reg [7:0] mem [0:15]; 

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
if(!uvm_config_db#(virtual sram_interface)::get(this,"","sram_intf",intf))
    `uvm_error(get_full_name,"not able to  get data")
req=sram_seq_item::type_id::create("req",this);
`uvm_info(get_full_name(),"message from active monitor build phase with none",UVM_NONE)
`uvm_info(get_full_name(),"message from active monitor build phase with low",UVM_LOW)
endfunction

virtual task run_phase(uvm_phase phase);
super.run_phase(phase);
forever begin
@(posedge intf.clk);
req.rdata = intf.rdata;
req.wdata = intf.wdata;
req.rd_en = intf.rd_en;
req.wr_en = intf.wr_en;
req.addr = intf.addr;
`uvm_info("act_mon",$sformatf("wdata=%0d,rd_en=%0d,wr_en=%0d,addr=%0d,rdata=%0d",req.wdata,req.rd_en,req.wr_en,req.addr,req.rdata),UVM_NONE)

`uvm_info(get_full_name(),"message from active monitor run phase with none",UVM_NONE)
`uvm_info(get_full_name(),"message from active monitor run phase with LOW",UVM_LOW)

  if (intf.rst) begin
            req.rdata <= 8'h0;
        end else begin
            if (req.wr_en)begin
                mem[req.addr] <= req.wdata;
                end
            if (req.rd_en)begin
                req.rdata <= mem[req.addr];
end
port1.write(req);
end
end 
endtask

endclass
