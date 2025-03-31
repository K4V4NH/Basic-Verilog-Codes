module encoder_8x3(out, in);

output reg [2:0] out;
input [7:0] in;

/* Structural Model 

or o1(out[0], in[1], in[3], in[5], in[7]);
or o2(out[1], in[2], in[3], in[6], in[7]);
or o3(out[2], in[4], in[5], in[6], in[7]);


*/


/* Dataflow Model

assign out[0] = in[1] + in[3] + in[5] + in[7];
assign out[1] = in[2] + in[3] + in[6] + in[7];
assign out[2] = in[4] + in[5] + in[6] + in[7];

*/


/* Behavioral Model */

always @(in) begin

case(in)

8'b00000001: out = 3'b000;
8'b00000010: out = 3'b001;
8'b00000100: out = 3'b010;
8'b00001000: out = 3'b011;
8'b00010000: out = 3'b100;
8'b00100000: out = 3'b101;
8'b01000000: out = 3'b110;
8'b10000000: out = 3'b111;

endcase

end

endmodule



/* Testbench

module testbench;

reg [7:0] in;
wire [2:0] out;

encoder_8x3 enc(out, in);

initial begin

in = 8'b00000001;
#100 in = 8'b00000010;
#100 in = 8'b00000100;
#100 in = 8'b00001000;
#100 in = 8'b00010000;
#100 in = 8'b00100000;
#100 in = 8'b01000000;
#100 in = 8'b10000000;

end

initial begin
$monitor(" In = %b  Out = %b", in, out);
end

endmodule

*/
