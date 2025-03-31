/* Using two 4x1 mux and 2x1 mux */

module mux_8x1(out, i, s);

output out;

input [7:0] i;
input [2:0] s;

wire out1, out2;

mux_4x1 m1(out1, i[3:0], s[1:0]);
mux_4x1 m2(out2, i[7:4], s[1:0]);
mux_2x1 m3(out, out1, out2, s[2]);

endmodule


/*
module testbench;

reg [7:0] i;
reg [2:0] s;
wire out;

mux_8x1 m1(out, i, s);

initial begin

s = 3'b000; i = 8'b00000001;
#100 s = 3'b001; i = 8'b00000010;
#100 s = 3'b010; i = 8'b00000100;
#100 s = 3'b011; i = 8'b00001000;
#100 s = 3'b100; i = 8'b00010000;
#100 s = 3'b101; i = 8'b00100000;
#100 s = 3'b110; i = 8'b01000000;
#100 s = 3'b111; i = 8'b10000000;

end

endmodule
*/