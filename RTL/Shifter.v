module Shifter
(
input   [31 : 0]  in ,
output  [31 : 0]  shifted_in
);

assign shifted_in = in << 2 ;

endmodule
