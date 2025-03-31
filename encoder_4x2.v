
module encoder_4x2(out, in);

output reg [1:0] out;
input [3:0] in;

/* Dataflow model

assign out[0] = in[1] + in[3];
assign out[1] = in[2] + in[3];

*/


/*Structural Model 

or o1(out[0], in[1], in[3]);
or o2(out[1], in[2], in[3]);

*/


/* Behavioral model - output is reg */

always @(in) begin

case(in)

4'b0001: out = 2'b00;
4'b0010: out = 2'b01;
4'b0100: out = 2'b10;
4'b1000: out = 2'b11;

endcase
end 


endmodule


/* Testbench

module testbench;

reg [3:0] in;
wire [1:0] out;

encoder_4x2 enc(out, in);

initial begin

     in = 4'b0001;
#100 in = 4'b0010;
#100 in = 4'b0100;
#100 in = 4'b1000;

end

endmodule

*/

/* New Testbench 

module testbench;

reg [3:0] i;
wire [1:0] o;

encoder_4x2 enc(.out(o), .in(i));

initial begin

     in = 4'b0001;
#100 in = 4'b0010;
#100 in = 4'b0100;
#100 in = 4'b1000;

end

endmodule

*/

