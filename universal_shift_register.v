module universal_shift_register(out, in, sir, sil, s, clk);
input [3:0] in;
input [1:0] s;
input sir, sil, clk;
output [3:0] out;

wire [3:0] w;
wire temp;

// s = 00 -> latch
// s = 01 -> right shift
// s = 10 -> left shift
// s = 11 -> parallel load

mux_4x1 m1(w[3], {in[3], out[2], sir, out[3]}, s);
mux_4x1 m2(w[2], {in[2], out[1], out[3], out[2]}, s);
mux_4x1 m3(w[1], {in[1], out[0], out[2], out[1]}, s);
mux_4x1 m4(w[0], {in[0], sil, out[1], out[0]}, s);

d_flipflop d1(out[3], temp, w[3], clk);
d_flipflop d2(out[2], temp, w[2], clk);
d_flipflop d3(out[1], temp, w[1], clk);
d_flipflop d4(out[0], temp, w[0], clk);

endmodule

/* Testbench

module testbench;

reg [3:0] in;
reg [1:0] s;
reg sir, sil, clk;
wire [3:0] out;

universal_shift_register us1(out, in, sir, sil, s, clk);

initial begin
clk = 0;
forever #10 clk = ~clk;
end

initial begin

// serial left shift
s = 2'b10; sil = 1; sir = 0;

// serial right shift
#100 s = 2'b01; sil = 1; sir = 0;

// parallel load
#100 in = 4'b1010; s = 2'b11; sil = 0; sir = 0;

// latch
#100 s = 2'b00; sil = 0; sir = 0;

end

initial begin
$monitor(" In = %b  Out = %b  Sel = %b  SIR = %b  SIL = %b ", in, out, s, sir, sil);
end

endmodule

*/

