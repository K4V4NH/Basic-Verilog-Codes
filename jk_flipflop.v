module jk_flipflop(q, qbar, j, k, clk);
output reg q, qbar;
input j, k, clk;
assign q = 0;

/* Behavioral 
always @(posedge clk) begin
case ({j, k})
2'b00: q = q;
2'b01: q = 0;
2'b10: q = 1;
2'b11: q = ~q;
endcase
assign qbar = ~q;
end
*/

/* Dataflow */
always @(posedge clk) begin
q = j*~q | ~k*q;
qbar = ~q;
end

endmodule


/* Testbench 

module testbench;

reg clk, j, k;
wire q, qbar;

jk_flipflop ff(q, qbar, j, k, clk);

initial begin
clk = 1'b0;
forever #10 clk = ~clk;
end

initial begin
 j = 0; k = 0; 
#100 j = 0; k = 1;
#100 j = 1; k = 0; 
#100 j = 1; k = 1;
end  

initial begin
$monitor(" J = %b  K = %b  Q = %b  Qbar = %b", j, k, q, qbar);
end

endmodule

*/