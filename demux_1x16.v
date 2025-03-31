/* using two 1x8 demux and one 1x2 demux*/

module demux_1x16(out, i, s);

output [15:0] out;

input [3:0] s;
input i;

/* Using 1x8 and 1x2
wire [1:0] w;

demux_1x2 d1(w, i, s[3]);
demux_1x8 d2(out[7:0], w[0], s[2:0]);
demux_1x8 d3(out[15:8], w[1], s[2:0]);

endmodule
*/

/* Using 1x4 demux */

wire [3:0] w;

demux_1x4 demux1(w, i, s[3:2]);

demux_1x4 demux2(out[3:0], w[0], s[1:0]);
demux_1x4 demux3(out[7:4], w[1], s[1:0]);
demux_1x4 demux4(out[11:8], w[2], s[1:0]);
demux_1x4 demux5(out[15:12], w[3], s[1:0]);

endmodule

/* Testbench

module testbench;

wire [15:0] out;

reg [3:0] s;
reg i;

demux_1x16 d1(out, i, s);

initial begin

i = 1;

     s = 4'b0000;
#100 s = 4'b0001;
#100 s = 4'b0010;
#100 s = 4'b0011;
#100 s = 4'b0100;
#100 s = 4'b0101;
#100 s = 4'b0110;
#100 s = 4'b0111;
#100 s = 4'b1000;
#100 s = 4'b1001;
#100 s = 4'b1010;
#100 s = 4'b1011;
#100 s = 4'b1100;
#100 s = 4'b1101;
#100 s = 4'b1110;
#100 s = 4'b1111;

end

endmodule
*/
