module asynchronous_counter_4bit(out, clk, reset, sel);

input clk, reset, sel;
output reg [3:0] out;

initial out = 4'b0000;

always @(posedge clk) begin

if (sel == 0) begin
if (out <= 15) begin
out = out + 1;
end
end

if(sel == 1) begin
if (out >= 0) begin
out = out - 1;
end
end

if (reset == 1) out = 4'b0000;

end

endmodule


/* Testbench
module testbench;

reg clk, reset, sel;
wire [3:0]out;

asynchronous_counter_4bit counter1(out, clk, reset, sel);

initial begin
clk = 0;
forever #10 clk = ~clk;
end

initial begin
reset = 0; sel = 0;
#320
reset = 0; sel = 1;
#320
reset = 1;
end

endmodule
*/