module full_adder(s, c, x, y, z);

input x, y, z;
output s, c;


/* Gate Level Modelling */

wire w1, w2, w3;

xor x1(s, x, y, z);

and a1(w1, x, y);
and a2(w2, y, z);
and a3(w3, z, x);

or o1(c, w1, w2, w3);



/* Structural Model using half adders
wire s1, c1, c2;

half_adder ha1(s1, c1, x, y);
half_adder ha2(s, c2, s1, z);
or(c, c1, c2);
*/


/* Dataflow Model

assign s = x^y^z;
assign c = x&y + y&z + z&x;
*/


/* Behavioural Model (use reg in output) In case, use either {x, y, z} (preferable) or x|y|z

reg s, c;


always @(x or y or z) begin

case(x|y|z)

3'b000: begin
s = 0; c = 0;
end

3'b001: begin
s = 1; c = 0;
end

3'b010: begin
s = 1; c = 0;
end

3'b011: begin
s = 0; c = 1;
end

3'b100: begin
s = 1; c = 0;
end

3'b101: begin
s = 0; c = 1;
end

3'b110: begin
s = 0; c = 1;
end

3'b111: begin
s = 1; c = 1;
end

endcase

end
*/


/*
module testbench;

reg x, y, z;
wire s, c;

full_adder fa(s, c, x, y, z);

initial begin

x = 0; y = 0; z = 0;
#100 x = 0; y = 0; z = 1;
#100 x = 0; y = 1; z = 0;
#100 x = 0; y = 1; z = 1;
#100 x = 1; y = 0; z = 0;
#100 x = 1; y = 0; z = 1;
#100 x = 1; y = 1; z = 0;
#100 x = 1; y = 1; z = 1;

end
*/

endmodule