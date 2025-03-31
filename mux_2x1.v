/* Using Dataflow Model */

module mux_2x1(out, a, b, s);

output out;
input a, b, s;

assign out = s ? b : a;

endmodule

/*
module testbench;

reg a, b, s;
wire out;

mux_2x1 m1(out, a, b, s);

initial begin

s = 0; a = 1; b = 0;
#100 s = 1; a = 0; b = 1;

end

endmodule 
*/
