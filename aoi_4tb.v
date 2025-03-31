module test4;
reg a,b,c,d;
wire Y;
aoi_4 tb(a,b,c,d,Y);
initial begin 
{a,b,c,d}=4'b0001;
#100 {a,b,c,d}=4'b0010;
#100{a,b,c,d}=4'b0100; 
#100 {a,b,c,d}=4'b1000;
#100{a,b,c,d}=4'b0011;
#100{a,b,c,d}=4'b0101;
#100{a,b,c,d}=4'b1001;
#100{a,b,c,d}=4'b0110;
#100{a,b,c,d}=4'b0111;
#100{a,b,c,d}=4'b1011;
#100{a,b,c,d}=4'b1100;
#100{a,b,c,d}=4'b1001;
#100{a,b,c,d}=4'b1010;
#100{a,b,c,d}=4'b1110;
#100{a,b,c,d}=4'b1111;
end
endmodule
