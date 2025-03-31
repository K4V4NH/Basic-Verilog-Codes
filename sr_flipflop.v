module sr_flipflop(q, qbar, s, r, clk);

output reg q, qbar;
input s, r, clk;


/* Behavioral Model 

always @(posedge clk) begin

case({s, r})
2'b00: q = q;
2'b01: q = 0;
2'b10: q = 1;
2'b11: q = 1'bx;
endcase
qbar = ~q;
end
*/

/* Dataflow */
assign q = 0;
always @(posedge clk) begin
q = s | (~r)*q;  //If you use +, it will take 1 + 1 = 10, and MSB will be rejected. So, use bitwise or "|".
qbar = ~q;
end

endmodule



/* Testbench

module testbench;
reg clk, s, r;
wire q, qbar;
sr_flipflop ff(q, qbar, s, r, clk);
initial begin
clk = 1'b0;
forever #10 clk = ~clk;
end
initial begin
     s = 0; r = 0; 
#100 s = 0; r = 1;
#100 s = 1; r = 0; 
#100 s = 1; r = 1;
end
initial begin
$monitor(" S = %b  R = %b  Q = %b  Qbar = %b", s, r, q, qbar);
end
endmodule

*/
