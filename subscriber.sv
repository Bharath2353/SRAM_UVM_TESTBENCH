class sram_subscriber extends uvm_subscriber#(sram_seq_item);

`uvm_component_utils(sram_subscriber)
sram_seq_item req;

covergroup cvg;
cp1:coverpoint req.addr{bins b1={[0:16]};}
cp2:coverpoint req.rd_en{bins b2=(1=>0);}
cp3:coverpoint req.wr_en{bins b3=(1=>0);}
cp4:coverpoint req.wdata{bins b4={[0:255]};}
endgroup

function new(string name,uvm_component parent);
super.new(name,parent);
cvg=new();
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info("get_full_name()","build phase in subscriber",UVM_NONE)
endfunction

virtual function void write(sram_seq_item t);
req=t;
cvg.sample();
endfunction

endclass
