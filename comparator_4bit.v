module comparator_4bit(agb, alb, aeb, a, b);

output agb, alb, aeb;
input [3:0] a, b;

wire agb1, alb1, aeb1, agb2, alb2, aeb2;

comparator_2bit comp1(agb1, alb1, aeb1, a[3:2], b[3:2]);
comparator_2bit comp2(agb2, alb2, aeb2, a[1:0], b[3:2]);

assign agb = agb1 | aeb1&agb2;
assign alb = alb1 | aeb1&alb2;
assign aeb = aeb1 & aeb2;

endmodule


/* 
module testbench;

wire agb, alb, aeb;
reg [3:0] a, b;

comparator_4bit compt(agb, alb, aeb, a, b);

initial begin
a = 4'b1111; b = 4'b1111;
#100 a = 4'b1111; b = 4'b0000;
#100 a = 4'b0000; b = 4'b1111;
end

initial begin
$monitor(" A = %b  B = %b  A=B = %b  A>B = %b  A<B = %b",a, b, aeb, agb, alb);
end

endmodule
*/