module aoi_4(a,b,c,d,Y);
input a,b,c,d;
output Y;

assign Y=~c&~d&(a~^b)+~c&d&(a^b)+c&~d&(a&b)+c&d&~(a&b);

endmodule

