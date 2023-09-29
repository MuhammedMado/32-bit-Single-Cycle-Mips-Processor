`timescale 1ns/1ps
module MIPS_TB();


reg CLK, RST;
wire   [15:0]  test_value ;

MIPS32Bit DUT (
.CLK(CLK),
.RST(RST),
.test_value(test_value)
);


always #10 CLK=!CLK;
    initial
    begin
    CLK=1;
    RST=0;
    #20
    RST=1;
    #800
    $stop;
    
    end

endmodule
