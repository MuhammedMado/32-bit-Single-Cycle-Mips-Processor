module Data_Path 
   #(parameter MIPS_SIZE = 32 , 
			   ALUControl_WIDTH = 3 ,
			   RegAdd_WIDTH = 5  
			 
    )
(
 input                                 CLK , RST ,
 input   [MIPS_SIZE - 1 : 0 ]          ReadData ,
 output  [MIPS_SIZE - 1 : 0 ]          WriteData ,
 output  [MIPS_SIZE - 1 : 0]           PC ,
 input   [MIPS_SIZE - 1 : 0]           instr ,
 output  [MIPS_SIZE - 1 : 0]           ALUResult ,
 output                                Zero_flag ,
 input                                 MemtoReg ,
 input                                 PCSrc ,
 input   [ALUControl_WIDTH - 1 : 0]    ALUControl ,
 input                                 ALUSrc ,
 input                                 RegDst ,
 input                                 RegWrite  ,
 input                                 Jump
  
);

wire  [RegAdd_WIDTH - 1 : 0]   A3_mux ;
wire  [MIPS_SIZE - 1 : 0]      WD3_Result ;
wire  [MIPS_SIZE - 1 : 0]      RD1_SrcA ;
wire  [MIPS_SIZE - 1 : 0]      SrcB_mux ;
wire  [MIPS_SIZE - 1 : 0]      Signlmm ; 
wire  [MIPS_SIZE - 1 : 0]      Signlmm_Shift ; 
wire  [MIPS_SIZE - 1 : 0]      PCPlus4 ;
wire  [MIPS_SIZE - 1 : 0]      PCBranch ;
wire  [MIPS_SIZE - 1 : 0]      Branch_mux ;
wire  [MIPS_SIZE - 1 : 0]      Shift_mux ;
wire  [MIPS_SIZE - 1 : 0]      PC_mux ;

Register_File RegFile (
.CLK(CLK) ,
.RST(RST) ,
.A1(instr[25:21]) ,
.A2(instr[20:16]) ,
.A3(A3_mux) ,
.WE3(RegWrite) ,
.WD3(WD3_Result) ,
.RD1(RD1_SrcA) ,
.RD2(WriteData)
);

mux #(.WIDTH(5)) MUX_A3 (
.d0(instr[20:16]) ,
.d1(instr[15:11]) ,
.s(RegDst) ,
.OUT(A3_mux)
);

mux  MUX_Result (
.d0(ALUResult) ,
.d1(ReadData) ,
.s(MemtoReg) ,
.OUT(WD3_Result)
);

Sign_Extend Sign_Extend (
.IN(instr[15:0]) ,
.OUT(Signlmm) 
);

mux  MUX_SrcB (
.d0(WriteData) ,
.d1(Signlmm) ,
.s(ALUSrc) ,
.OUT(SrcB_mux)
);

ALU ALU1 (
.SrcA(RD1_SrcA) ,
.SrcB(SrcB_mux) ,
.ALUControl(ALUControl) ,
.ALUResult(ALUResult) ,
.Zero_flag(Zero_flag)
);


Shifter SLT_Signlmm (
.in(Signlmm) ,
.shifted_in(Signlmm_Shift)
);

Shifter SLT_PCJump (
.in({6'd0 ,instr[25:0] }) ,
.shifted_in(Shift_mux)
);

Adder Adder_PCBranch(
.IN_1(Signlmm_Shift) ,
.IN_2(PCPlus4) ,
.OUT(PCBranch)
);

Adder Adder_PCPlus4(
.IN_1(PC) ,
.IN_2(32'd4) ,
.OUT(PCPlus4)
);

mux MUX_Branch (
.d0(PCPlus4) ,
.d1(PCBranch) ,
.s(PCSrc) ,
.OUT(Branch_mux)
);

mux MUX_PCJump (
.d0(Branch_mux) ,
.d1({PCPlus4[31:28],Shift_mux[27:0]}) ,
.s(Jump) ,
.OUT(PC_mux)
);

PC PC1 (
.CLK(CLK) ,
.RST(RST) ,
.PC_reg(PC_mux) ,
.PC(PC)
);

endmodule