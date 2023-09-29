module MainDecoder 
						(
						input[5:0] OpCode,
						output reg [1:0] ALUOp,
						output reg Jump,
						output reg MemWrite,RegWrite,MemtoReg,RegDest,ALUSrc,Branch
						);
						
						always @(*)
						begin
						    Jump     = 1'b0 ;
                ALUOp    = 2'b00 ;
                MemWrite = 1'b0 ;
                RegWrite = 1'b0 ;
                RegDest   = 1'b0 ;
                ALUSrc   = 1'b0 ;
                MemtoReg = 1'b0 ;
                Branch   = 1'b0 ;
                
							case(OpCode)
								6'b100011:                    //lw
								begin
									RegWrite = 1'b1;
									ALUSrc = 1'b1;
									MemtoReg = 1'b1;
								end
								
								6'b10_1011:                   //sw
								begin
									MemWrite = 1'b1;
									ALUSrc = 1'b1;
									MemtoReg = 1'b1;
								end
								
								 6'b00_0000 : begin   //R Type
                    ALUOp    = 2'b10 ;
                    RegWrite = 1'b1 ;
                     RegDest   = 1'b1 ;
                end
								
								6'b00_1000:                 //addi
								begin									
								  RegWrite = 1'b1;
									ALUSrc = 1'b1;
								end
								
								6'b00_0100:                    //beq
								begin
									ALUOp = 2'b01;
									Branch = 1'b1;
								end
								
								6'b00_0010:                     //jal&j
								begin
									Jump = 1'b1;
								end
								
								default:
								begin
									Jump = 1'b0;
									ALUOp = 2'b00;
									MemWrite = 1'b0;
									RegWrite = 1'b0;
									RegDest = 1'b0;
									ALUSrc = 1'b0;
									MemtoReg = 1'b0;
									Branch = 1'b0; 
								end
							endcase
						end
endmodule 