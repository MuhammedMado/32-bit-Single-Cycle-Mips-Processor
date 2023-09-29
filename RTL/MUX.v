module mux # (parameter WIDTH = 32)
(input [WIDTH-1:0] d0, d1,
input s,
output [WIDTH-1:0] OUT);
assign OUT = s ? d1 : d0;
endmodule