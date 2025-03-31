module t_flipflop(q, qbar, t, clk);

output reg q, qbar;
input t, clk;

assign q = 0;

/* Behavioral model

always @(posedge clk) begin 
case (t)
0: q = q;
1: q = ~q;
endcase
assign qbar = ~q;
end
/*

/* Dataflow */
always @(posedge clk) begin
q = t^q;
qbar = ~q;
end

endmodule



/* Testbench

module testbench;

reg clk, t;
wire q, qbar;

t_flipflop ff(q, qbar, t, clk);

initial begin
clk = 1'b0;
forever #10 clk = ~clk;
end

initial begin
t = 0; 
#100 t = 1;
#100 t = 0;
#100 t = 1;
end

initial begin
$monitor(" T = %b  Q = %b  Qbar = %b", t, q, qbar);
end

endmodule
*/
