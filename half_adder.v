module half_adder(s, c, a, b);

input a, b;
output s, c;


/* Dataflow Model */

assign s = a^b;
assign c = a&b;


/* Behavioural Model - output should be output reg

always @(a or b) begin

if(a == 0 && b == 0) begin
assign s = 0; 
assign c = 0; end

else if(a == 0 && b == 1) begin
assign s = 1;
assign c = 0; end

else if(a == 1 && b == 0) begin
assign s = 1;
assign c = 0; end

else begin
assign s = 0;
assign c = 1; end

end

*/


/*Structural Model

xor(s, a, b);
and(c, a, b);

*/


endmodule

/*
module testbench;

reg a, b; 
wire s, c;

half_adder ha(s, c, a, b);

initial begin

a = 0; b = 0; 
#100 a = 0; b = 1;
#100 a = 1; b = 0; 
#100 a = 1; b = 1;

end

initial begin
$monitor("A=%b, B=%b, S=%b, C=%b",a,b,s,c);
end

endmodule
*/
