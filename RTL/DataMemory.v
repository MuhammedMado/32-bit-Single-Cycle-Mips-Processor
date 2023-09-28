module DataMemory 
					#(parameter DataMemory_WIDTH = 32 , DataMemory_DEPTH = 256)
					(
					input CLK,
					input WE,
					input [DataMemory_WIDTH-1:0] A,
					input [DataMemory_WIDTH-1:0] WD,
					output [DataMemory_WIDTH-1:0] RD,
					output [(DataMemory_WIDTH/2)-1:0] test_value
					);
					
					reg [DataMemory_WIDTH-1:0] Data_Mem [0:DataMemory_DEPTH-1];
					
					integer i;
				   initial
				   begin
					  for (i = 0; i < DataMemory_DEPTH; i = i+1)
						 Data_Mem [i] = 0;
				   end
						
						
					always @(posedge CLK) 
					begin
						 if (WE)
							Data_Mem[A] <= WD; // Synchronous write
					end

					assign RD = Data_Mem[A]; // Asynchronous read
					assign test_value = Data_Mem[32'h0000_0000][15:0]; // Test value read from address 0x0000_0000

endmodule