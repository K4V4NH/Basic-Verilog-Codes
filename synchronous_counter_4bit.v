module synchronous_counter_4bit(out, clk, sel);

input clk, sel;
output reg [3:0] out;

initial out = 4'b0000;

always @(posedge clk) begin
case(sel)

0: if(out < 4'b1111) out = out + 1'b1;

1: if(out > 4'b0000) out = out - 1'b1;

endcase
end

endmodule


/* Testbench
module testbench;

reg clk, sel;
wire [3:0]out;

asynchronous_counter_4bit counter1(out, clk, sel);

initial begin
clk = 0;
forever #10 clk = ~clk;
end

initial begin
sel = 0;
#320
sel = 1;
#320
end

endmodule
*/
