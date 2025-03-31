module Aoi(a1,a2,b1,b2,o);
input a1,a2,b1,b2;
output  reg o;
always@(a1 or a2 or b1 or b2) begin
case({a1,a2,b1,b2})
4'b0000: o=1;
4'b0001: o=1;
4'b0010: o=1;
4'b0011: o=0;
4'b0100: o=1;
4'b0101: o=1;
4'b0110: o=1;
4'b0111: o=0;
4'b1000: o=1;
4'b1001: o=1;
4'b1010: o=1;
4'b1011: o=0;
4'b1100: o=0;
4'b1101: o=0;
4'b1110: o=0;
4'b1111: o=0;
endcase
end 
endmodule

