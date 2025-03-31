module mux_4x1(out, i, s);

input [3:0] i;
input [1:0] s;
output out;

wire s00, s11;
wire [3:0] a;

/* Structural or Gate level */

not n1(s00, s[0]);
not n2(s11, s[1]);

and a1(a[0], s00, s11, i[0]);
and a2(a[1], s[0], s11, i[1]);
and a3(a[2], s00, s[1], i[2]);
and a4(a[3], s[0], s[1], i[3]);

or o1(out, a[0], a[1], a[2], a[3]);


/* Structural Level using two 2x1 mux

wire out1, out2;

mux_2x1 m1(out1, i[0], i[1], s[0]);
mux_2x1 m2(out2, i[2], i[3], s[0]);
mux_2x1 m3(out, out1, out2, s[1]);

*/


/* Dataflow Model

assign s00 = !s[0];
assign s11 = !s[1];

assign out = s11&s00&i[0] + s11&s[0]&i[1] + s[1]&s11&i[2] + s[1]&s[0]&i[3];

/*


/* Dataflow Model using conditional statement

assign out = s[1]?s[0]?i[3]:i[2]:s[0]?i[1]:i[0];

*/


/* Behavioural Model - use reg for output

always @(s) begin

case(s)
2'b00: assign out = i[0];
2'b01: assign out = i[1];
2'b10: assign out = i[2];
2'b11: assign out = i[3];
endcase

end
*/


/* Using 2x1 mux
*/

endmodule



/*
module testbench;

reg [3:0] i;
reg [1:0] s;
wire out;

mux_4x1 m1(out, i, s);

initial begin

s = 2'b00; i = 4'b0001;
#100 s = 2'b01; i = 4'b0010;
#100 s = 2'b10; i = 4'b0100;
#100 s = 2'b11; i = 4'b1000;

end

endmodule
*/
