/* Using three 1x2 demux */

module demux_1x4(out, i, s);

input i;
input [1:0] s;

output [3:0] out;

wire [1:0] w;

demux_1x2 d1(w, i, s[1]);
demux_1x2 d2(out[1:0], w[0], s[0]);
demux_1x2 d3(out[3:2], w[1], s[0]);

endmodule


/*

module testbench;

reg i;
reg [1:0] s;

wire [3:0] out;

demux_1x4 d1(out, i, s);

initial begin
     i = 1; s = 2'b00;
#100 i = 1; s = 2'b01;
#100 i = 1; s = 2'b10;
#100 i = 1; s = 2'b11;

end

endmodule

*/