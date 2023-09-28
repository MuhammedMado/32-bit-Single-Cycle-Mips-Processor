module ALUDecoder
					  (
					  input[1:0] ALUOp,
					  input [5:0] Funct,
					  output reg [2:0] ALUControl
					  );
					  
					  always @(*)
					  begin
						case(ALUOp)
						2'b00: ALUControl = 3'b010;
						2'b01:ALUControl = 3'b100;
						2'b10: 
						begin
							casez(Funct)
								6'b100000: ALUControl = 3'b010;   //add
								6'b100010: ALUControl = 3'b100;   //sub
								6'b101010: ALUControl = 3'b110;   //slt
								6'b011100: ALUControl = 3'b101;   //mul
								default: ALUControl = 3'b010;   //add
							endcase
						end
						default:ALUControl = 3'b010;
						endcase
					  end
endmodule 