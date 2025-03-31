module decoder_2x4(out, in);

output reg [3:0] out;
input [1:0] in;

assign out = 4'b0000;

always @(in) begin

case(in)

2'b00: out = 4'b0001;
2'b01: out = 4'b0010;
2'b10: out = 4'b0100;
2'b11: out = 4'b1000;

endcase

end

endmodule


/* Testbech

module testbench;

wire [3:0] out;
reg [1:0] in;

decoder_2x4 decoder(out, in);

initial begin

in = 2'b00;
in = 2'b01;
in = 2'b10;
in = 2'b11;

end

initial begin
$monitor("In = %b  Out = %b", in, out);
end

endmodule
*/
