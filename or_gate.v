module or_gate(a,b,y);

input a,b;
output y;

assign y = a|b;

endmodule

/*
module or_gate_testbench_new;

reg a, b;
wire y;

or_gate inst(a, b, y);

initial begin
a = 0; b = 0;
#100 a = 0; b = 1;
#100 a = 1; b = 0;
#100 a = 1; b = 1;
end

endmodule
*/