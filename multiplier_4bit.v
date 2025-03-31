
module multiplier_4bit(out, a, b);

output reg [7:0] out;
input [3:0] a, b;

/*
wire [7:0] temp1;
integer i;

assign temp1 = b;

always @(a or b) begin
out = 8'd0;

for(i = 0; i<4; i=i+1) begin
out = out + (temp1<<i)*a[i];
end
end
*/


/* Dataflow */
wire [7:0] pro1, pro2, pro3, pro4;
assign out = 8'd0;

assign pro1 = {4'b0000, a[3]&b[0], a[2]&b[0], a[1]&b[0], a[0]&b[0]};
assign pro2 = {3'b000, a[3]&b[1], a[2]&b[1], a[1]&b[1], a[0]&b[1], 1'b0};
assign pro3 = {2'b00, a[3]&b[2], a[2]&b[2], a[1]&b[2], a[0]&b[2], 2'b00};
assign pro4 = {1'b0, a[3]&b[3], a[2]&b[3], a[1]&b[3], a[0]&b[3], 3'b000};

assign out = pro1 + pro2 + pro3 + pro4;

endmodule


/* 
module testbench;

reg [3:0] a, b;
wire [7:0] out;

multiplier_4bit mul(out, a, b);

initial begin
a = 4'b1011;
b = 4'b0110;
end

endmodule
*/
