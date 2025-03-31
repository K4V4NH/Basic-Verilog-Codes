module half_subtractor(d, b, x, y); //x-y

input x, y;
output d, b;

wire x1;

/* Dataflow Model */

assign d = x^y;
assign b = (!x)&y;

endmodule

/*
module testbench;

reg x, y;
wire d, b;

half_subtractor hs(d, b, x, y);

initial begin

x = 0; y = 0; 
#100 x = 0; y = 1;
#100 x = 1; y = 0; 
#100 x = 1; y = 1;


end

endmodule
*/