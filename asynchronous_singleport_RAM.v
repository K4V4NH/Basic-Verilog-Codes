module async_single_port_RAM (
    input [7:0] data,
    input [5:0] addr,
    input we,
    output [7:0] q
    );
    
    reg [7:0] ram [63:0];
    reg [5:0] addr_reg;
    
    always@(data or addr or we)
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
reg we;
wire [7:0] q;

async_single_port_RAM ram(data, addr, we, q);

initial begin
we = 1; addr = 6'b00000; data = 8'b10101010;
#100 we = 0; addr = 6'b00000; data = 7'd0;
end
endmodule
*/

