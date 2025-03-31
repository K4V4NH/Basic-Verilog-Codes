/* using two 1x4 demux and one 1x2 demux */

module demux_1x8(out, i, s);

input i;
input [2:0] s;

output [7:0] out;

wire [1:0] w;

demux_1x2 d1(w, i, s[2]);
demux_1x4 d2(out[3:0], w[0], s[1:0]);
demux_1x4 d3(out[7:4], w[1], s[1:0]);

endmodule

/*
module testbench;

reg i;
reg [2:0] s;
wire [7:0] w;

demux_1x8 d1(out, i, s);

initial begin

     i = 1; s = 3'b000;
#100 i = 1; s = 3'b001;
#100 i = 1; s = 3'b010;
#100 i = 1; s = 3'b011;
#100 i = 1; s = 3'b100;
#100 i = 1; s = 3'b101;
#100 i = 1; s = 3'b110;
#100 i = 1; s = 3'b111;
end

*/