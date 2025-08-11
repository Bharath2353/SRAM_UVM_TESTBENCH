 `include "uvm_macros.svh"
import uvm_pkg::*;
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent1.sv"
`include "monitor2.sv"
`include "agent2.sv"
`include "scoreboard.sv"
`include "subscriber.sv"
`include "environment.sv"
`include "test.sv"
`include "dut.sv"
`include "interface.sv"

module top;
bit clk,rst;
always #5 clk=~clk;
sram_interface intf(.clk(clk),.rst(rst));
sram_design dut(.clk(clk),.rst(rst),.wdata(intf.wdata),.rdata(intf.rdata),.addr(intf.addr),.wr_en(intf.wr_en),.rd_en(intf.rd_en));
initial begin;
uvm_config_db#(virtual sram_interface)::set(null,"*","sram_intf",intf);
clk=0;
rst=1;
#10;
rst=0;
#500;
$finish;
end

initial begin
run_test("sram_test");
end
endmodule
