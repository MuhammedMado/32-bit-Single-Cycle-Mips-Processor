module ControlUnit
						(
						input [5:0] OpCode,
						input [5:0] Funct,
						input zero,
						output Jump,
						output MemtoReg,MemWrite,ALUSrc,RegDest,RegWrite,PCSrc,
					   output [2:0] ALUControl
						);
						
						wire Branch;
						wire [1:0] ALUOp;
						
						MainDecoder maindec
						(
						.OpCode(OpCode),
						.Jump(Jump),
						.ALUOp(ALUOp),
						.MemtoReg(MemtoReg),
						.MemWrite(MemWrite),
						.Branch(Branch),
						.ALUSrc(ALUSrc),
						.RegDest(RegDest),
						.RegWrite(RegWrite)
						);
						
						ALUDecoder aludec
						(
						.ALUOp(ALUOp),
					   .Funct(Funct),
					   .ALUControl(ALUControl)
						);
						
						and (PCSrc,zero,Branch);
endmodule 