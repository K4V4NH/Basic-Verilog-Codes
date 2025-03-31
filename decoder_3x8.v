module decoder_3x8(out, in);

output [7:0] out;
input [2:0] in;


/* Dataflow Model

wire [2:0] w;

assign w = ~in;

assign out[0] = w[2]*w[1]*w[0];
assign out[1] = w[2]*w[1]*in[0];
assign out[2] = w[2]*in[1]*w[0];
assign out[3] = w[2]*in[1]*in[0];
assign out[4] = in[2]*w[1]*w[0];
assign out[5] = in[2]*w[1]*in[0];
assign out[6] = in[2]*in[1]*w[0];
assign out[7] = in[2]*in[1]*in[0];
*/


/* Structural Model

wire [2:0] w;
assign w = ~in;

and a1(out[0], w[2], w[1], w[0]);
and a2(out[1], w[2], w[1], in[0]);
and a3(out[2], w[2], in[1], w[0]);
and a4(out[3], w[2], in[1], in[0]);
and a5(out[4], in[2], w[1], w[0]);
and a6(out[5], in[2], w[1], in[0]);
and a7(out[6], in[2], in[1], w[0]);
and a8(out[7], in[2], in[1], in[0]);
*/

/* Behavioral Model */

reg [7:0] out;

always @(in) begin

case(in)

3'b000: out = 8'b00000001;
3'b001: out = 8'b00000010;
3'b010: out = 8'b00000100;
3'b011: out = 8'b00001000;
3'b100: out = 8'b00010000;
3'b101: out = 8'b00100000;
3'b110: out = 8'b01000000;
3'b111: out = 8'b10000000;

endcase
end

endmodule


/*Testbench

module testbench;

reg [2:0] in;
wire [7:0] out;

decoder_3x8 decoder(out, in);

initial begin

in = 3'b000;
#100 in = 3'b001;
#100 in = 3'b010;
#100 in = 3'b011;
#100 in = 3'b100;
#100 in = 3'b101;
#100 in = 3'b110;
#100 in = 3'b111;

end

initial begin
$monitor("In = %b  Out = %b", in, out);
end

endmodule
*/

