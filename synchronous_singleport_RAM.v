module single_port_RAM (
    input [7:0] data,
    input [5:0] addr,
    input we,clk,
    output [7:0] q
    );
    
    reg [7:0] ram [63:0];
    reg [5:0] addr_reg;
    
    always@(posedge clk)
    begin
        if(we)
            ram[addr]<=data;
        else
            addr_reg <=addr;
    end
    
    assign q=ram[addr_reg];
    
endmodule

/*
module testbench;

reg [7:0] data;
reg [5:0] addr;
reg we,clk;
wire [7:0] q;

single_port_RAM ram(data, addr, we, clk, q);

initial begin
clk = 0;
forever #10 clk = ~clk;
end

initial begin
we = 1; addr = 6'b00000; data = 8'b10101010;
#100 we = 0; addr = 6'b00000; data = 7'd0;
end
endmodule
*/
