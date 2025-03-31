module async_dual_port_ram(
input [7:0] data_a,data_b,
input [5:0] addr_a,addr_b,
input we_a, we_b,
output reg [7:0] q_a,q_b
);
    reg [7:0] ram[63:0]; //64 * 8 bit
    
    always @ (data_a or addr_a or we_a)
    begin
        if(we_a)
        begin
            ram[addr_a]<=data_a; //write
        end
        else
        begin
            q_a<=ram[addr_a]; //read
        end
    end
    
    always @ (data_b or addr_b or we_b)
    begin
        if(we_b)
        begin
            ram[addr_b]<=data_b; //write
        end
        else
        begin
            q_b<=ram[addr_b]; //read
        end
    end
endmodule


/*
module testbench;

reg [7:0] data_a,data_b;
reg [5:0] addr_a,addr_b;
reg we_a, we_b;
wire [7:0] q_a,q_b;

async_dual_port_ram ram(data_a, data_b, addr_a, addr_b, we_a, we_b, q_a, q_b);

initial begin
we_a = 1; addr_a = 6'b00000; data_a = 8'b10101010;
#100 we_a = 0; addr_a = 6'b00000; data_a = 7'd0;

#100 we_b = 1; addr_b = 6'b00000; data_b = 8'b01010101; we_a = 1'bx; data_a = 8'bx; addr_a = 6'bx;
#100 we_b = 0; addr_b = 6'b00000; data_b = 7'd0;

#100 $finish;
end

endmodule
*/
