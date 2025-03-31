module comparator_2bit(agb, alb, aeb, a, b);

output reg agb, aeb, alb;
input [1:0] a,b;
integer out;
/*
always @(a or b) begin
if(a>b) begin agb = 1; alb = 0; aeb = 0; end
if(a<b) begin alb = 1; agb = 0; aeb = 0; end
if(a==b)begin aeb = 1; alb = 0; agb = 0;end 
end
*/

always @(a or b) begin
alb = a<b?1:0;
agb = a>b?1:0;
aeb = a==b?1:0;
end

endmodule

/* 
module testbench;
reg [1:0] a, b;
wire agb, aeb, alb;

comparator_2bit comp(agb, alb, aeb, a, b);

initial begin
a = 2'b11; b = 2'b10;
#100 a = 2'b11; b = 2'b11;
#100 a = 2'b10; b = 2'b11;
#100 $finish;
end
endmodule

*/
