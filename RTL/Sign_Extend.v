module Sign_Extend(
  
  input[15:0] DATA_IN,
  output reg [31:0] DATA_OUT
  );
  
  
  always@(*)
    begin
      
      DATA_OUT[15:0]  = DATA_IN[15:0];
      DATA_OUT[31:16] = {16{DATA_IN[15]}};
      
    end
endmodule