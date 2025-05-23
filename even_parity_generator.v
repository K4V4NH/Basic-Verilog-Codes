module even_parity_generator(parity, a, b, c);

output parity;
input a, b, c;

assign parity = a^b^c;

endmodule

/* 
module testbench;

wire parity;
reg a, b, c;

even_parity_generator op(parity, a, b, c);

initial begin
{a, b, c} = 3'b000;
#100 {a, b, c} = 3'b001;
#100 {a, b, c} = 3'b010;
#100 {a, b, c} = 3'b011;
#100 {a, b, c} = 3'b100;
#100 {a, b, c} = 3'b101;
#100 {a, b, c} = 3'b110;
#100 {a, b, c} = 3'b111;
end

initial begin
$monitor(" a = %b  b = %b  c = %b  parity = %b", a, b, c, parity);
end

endmodule
*/
