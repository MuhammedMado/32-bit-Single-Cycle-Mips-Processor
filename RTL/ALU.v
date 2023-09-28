module ALU #(parameter x = 32)(
  input wire [x-1:0] A, // input A
  input wire [x-1:0] B, // input B
  input wire [2:0] ALUControl, // 3-bit input op
  
  output reg [x-1:0] ALUResult, //  output
  output reg zero // 1-bit output zero flag
);

 
always @ (*) begin // combinational logic
  case (ALUControl)
    3'b000: ALUResult <= A & B; // output  A & B
    3'b001: ALUResult <= A | B; // output A | B
    3'b010: ALUResult <= A + B; // output A + B
    3'b100: ALUResult <= A - B; // output A - B
    3'b101: ALUResult <= A * B; // output A * B
    3'b110: ALUResult <= (A > B) ? 1'b1 : 1'b0; // output 1 if A > B, otherwise 0
    default: ALUResult <= 32'b0; //Default case
  endcase 
end

always @* begin
 zero = (ALUResult == 32'b0);
end 

endmodule