module clock_divider(clkout, clkin);

output reg clkout;
input clkin;

initial clkout = 0;
integer n; initial n = 100000000; // n * 10nano = time in seconds in FPGA for 100MHz clk.
integer counter; initial counter = 0;

always @(posedge clkin) begin

if (counter == n) begin
clkout = ~clkout;
counter = 1'b0;
end

else if (counter <= n) begin
counter = counter + 1;
end

end

endmodule

/*
module testbench;
reg clk, n;
wire out;

clock_divider clkdvd(out, clk, 100);

initial begin
clk = 1'b0;
forever #100 clk = ~clk;
end

initial begin
n = 2;
end

endmodule

*/