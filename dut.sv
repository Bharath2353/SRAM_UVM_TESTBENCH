/*module sram_design(clk,rst,wr_en,rd_en,addr,wdata,rdata);
input [7:0]wdata;
input [3:0]addr;
input wr_en,rd_en,clk,rst;
output reg [7:0]rdata;
reg [7:0]mem[127:0];

always @(posedge clk)
if(rst==1)
    rdata<=0;
    always @(addr,wr_en,rd_en,wdata)begin
    if(wr_en==1)
        mem[addr]<=wdata;
        else if(rd_en==1)
            rdata<=mem[addr];
            end
endmodule*/


module sram_design (
    input clk,
    input rst,
    input [7:0] wdata,
    input [3:0] addr,
    input wr_en,
    input rd_en,
    output reg [7:0] rdata
);

    reg [7:0] mem [0:15];  // 128 x 8-bit memory

    always @(posedge clk) begin
        if (rst) begin
            rdata <= 8'h0;
        end else begin
            if (wr_en)begin
                mem[addr] <= wdata;
                end
            if (rd_en)begin
                rdata <= mem[addr];
        end
        end
        end

endmodule
