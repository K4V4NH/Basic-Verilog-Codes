module full_subtractor(diff, b, x, y, z); /* x - y - z */

input x, y, z;
output diff, b;


/* Structural using two Half Subtractors */

wire diff1, b1, b2;

half_subtractor hs1(diff1, b1, x, y);
half_subtractor hs2(diff, b2, diff1, z);

or o1(b, b1, b2);



/* Gate Level

wire x11, w1, w2, w3;

xor x1(diff, x, y, z);
not n1(x11, x);
and a1(w1, x11, y);
or o1(w2, x11, y);
and a2(w3, z, w2);
or o2(b, w1, w3);

*/


/* Dataflow Model

assign diff = x^y^z;
assign b = (!x)&y | y&z | (!x)&z;

*/


/* Behavioural Model - prefer {s, y, z} in case. Output is reg as usual.

always @(x or y or z) begin

case({x, y, z})

3'b000: begin 
diff = 0; 
b = 0;
end

3'b001: begin 
diff = 1; 
b = 1;
end 

3'b010: begin 
diff = 1; 
b = 1;
end 

3'b011: begin 
diff = 0; 
b = 1;
end

3'b100: begin 
diff = 1; 
b = 0;
end

3'b101: begin 
diff = 0; 
b = 0;
end

3'b110: begin 
diff = 0; 
b = 0;
end 

3'b111: begin 
diff = 1; 
b = 1;
end

endcase
end
*/

endmodule




/*
module testbench;

reg x, y, z;
wire diff, b;

full_subtractor fs1(diff, b, x, y, z);

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

endmodule
*/