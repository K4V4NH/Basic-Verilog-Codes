module decoder_5x32(out, in);

output [31:0] out;
input [4:0] in;

wire [3:0] w;

decoder_2x4 decoder(w, in[4:3]);

decoder_3x8_enable decoder1(out[7:0], in[2:0], w[0]);
decoder_3x8_enable decoder2(out[15:8], in[2:0], w[1]);
decoder_3x8_enable decoder3(out[23:16], in[2:0], w[2]);
decoder_3x8_enable decoder4(out[31:24], in[2:0], w[3]);

endmodule


/* Testbench

module testbench;

wire [31:0] out;
reg [4:0] in;
integer i;

decoder_5x32(out, in);

initial begin

in = 5'b00000;

for (i = 0; i < 32; i = i + 1) begin
	#100 in = in + 1'b1;
end

end

endmodule

*/