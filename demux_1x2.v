module demux_1x2(out, i, s);

output [1:0] out;
input i, s;

/* Structural Model - Gate level */

wire s1;

not n1(s1, s);
and a1(out[0], s1, i);
and a2(out[1], s, i);

/* Dataflow Model

assign out[0] = (!s)&i;
assign out[1] = s&i;
*/


/* Behavioral Model

always @(s) begin

case(s) 

1'b0: begin
out[0] = i;
out[1] = 0;
end

1'b1: begin
out[1] = i; 
out[0] = 0;
end

endcase

end
*/

endmodule



/*
module testbench;

reg i, s;
wire [1:0] out;

demux_1x2 dm1(out, i, s);

initial begin

i = 1; s = 0;
#100 s = 1;

end

endmodule
*/