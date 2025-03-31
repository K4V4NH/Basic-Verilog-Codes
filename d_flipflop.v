module d_flipflop(q, qbar, d, clk);

output q, qbar;
input d, clk;

/* Behavioral
reg q, qbar;
always @(posedge clk) begin
case (d)
0: q = 0;
1: q = 1;
endcase
assign qbar = ~q;
end
*/

/* Dataflow 
reg q, qbar;
always @(posedge clk) begin
q = d;
qbar = ~q;
end
*/

/* Structural */

wire dbar, out1, out2;
not n0(dbar, d);
nand n1(out1, d, clk);
nand n2(out2, dbar, clk);
nand n3(q, out1, qbar);
nand n4(qbar, out2, q);

endmodule




/* Testbench 
module testbench;

reg clk, d;
wire q, qbar;

d_flipflop ff(q, qbar, d, clk);

initial begin
clk = 1'b0;
forever #10 clk = ~clk;
end

initial begin
     d = 0; 
#100 d = 1;
end

initial begin
$monitor(" D = %b  Q = %b  Qbar = %b", d, q, qbar);
end

endmodule
*/