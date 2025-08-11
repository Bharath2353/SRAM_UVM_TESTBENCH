class sram_seq extends uvm_sequence#(sram_seq_item);
	sram_seq_item req;
`uvm_object_utils(sram_seq)

function new(string name="sram_seq");
super.new(name);
endfunction

virtual task body();
repeat(15) begin
	`uvm_do(req);
    end
endtask


endclass


/*class sram_seq extends uvm_sequence#(sram_seq_item);
	sram_seq_item req;
	`uvm_object_utils(sram_seq)
	function new(string name="sram_seq");
		super.new(name);
	endfunction
	virtual task body();
	`uvm_do_with(req,{req.wr_en==1;})
endtask 
endclass 

class sram_seq extends uvm_sequence#(sram_seq_item);
	sram_seq_item req;
	`uvm_object_utils(sram_seq)
	function new(string name="sram_seq");
		super.new(name);
	endfunction
	virtual task body();
	`uvm_create(req)
	assert(req.randomize());
	`uvm_send(req)
endtask
endclass 

class sram_seq extends uvm_sequence#(sram_seq_item);
	sram_seq_item req;
	`uvm_object_utils(sram_seq)
	function new(string name="sram_seq");
		super.new(name);
	endfunction
	task body();
		`uvm_create(req)
		`uvm_rand_send(req)

	endtask
endclass


class sram_seq extends uvm_sequence#(sram_seq_item);
	sram_seq_item req;
	`uvm_object_utils(sram_seq)
	function new(string name="sram_seq");
		super.new(name);
	endfunction
	virtual task body();
	req=sram_seq_item::type_id::create("req");
	start_item(req);
	assert(req.randomize());
	finish_item(req);
endtask
endclass
*/
