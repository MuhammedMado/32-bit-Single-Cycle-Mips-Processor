Certainly, here's a consolidated version that combines the provided information with the additional details and explanations:

**#32BitSingleCycleMIPSProcessor**

This repository presents the Verilog implementation of a single-cycle MIPS processor, offering an efficient and functional approach to executing MIPS instruction set architecture (ISA) instructions. In this single-cycle design, each instruction's fetch, decode, execute, memory access, and write-back stages occur within a single clock cycle.

## Project Overview

The primary objective of this project is to create a single-cycle MIPS processor using Verilog HDL, capable of executing a subset of MIPS ISA instructions. This subset encompasses essential instructions, including arithmetic and logical operations, memory access, branching, and jumping.

**Key Features:**

- Single-Cycle Architecture: Our processor adopts a single-cycle design, ensuring that every instruction is executed within a single clock cycle.

- Instruction Set Support: The processor supports a selection of MIPS ISA instructions, enabling the execution of commonly used instructions in MIPS assembly programs.

- Modular Design: The Verilog code is organized into distinct modules for various functional units, such as instruction fetch, decode, execute, memory, and write-back stages. This modular structure enhances code readability and modifiability.

**Supported MIPS Instructions:**

This processor supports a range of MIPS instructions, including:

1. **lw**: Load Word (`lw rt, imm(rs)`): Loads a 32-bit word from memory into a register.

2. **sw**: Store Word (`sw rt, imm(rs)`): Stores a 32-bit word from a register into memory.

3. **addi**: Add Immediate (`addi rt, rs, imm`): Adds a 16-bit immediate value to a register's value.

4. **beq**: Branch Equal (`beq rs, rt, offset`): Branches to a target address if the values in two registers are equal.

5. **jal** and **j**: Jump and Jump Register (`jal target` for jump and link, `j target` for jump): Jumps to a target address, optionally saving the return address in a register.

6. **R-type instructions**: Arithmetic and Logical Operations (Supported instructions: `add`, `sub`, `slt`, `mul`): Performs arithmetic and logical operations on register operands.

**Operand Diagrams:**

For a deeper understanding of I-type, R-type, and J-type instruction formats in MIPS, refer to these diagrams:

1. **I-type Operand Diagram:**

![I-type](https://github.com/basemhesham/32-bit_single_cycle_MIPS_processor/assets/136960296/b0e721dd-46fc-49dc-87c5-489a17930964)

2. **R-type Operand Diagram:**

![R-type](https://github.com/basemhesham/32-bit_single_cycle_MIPS_processor/assets/136960296/e119bf58-204f-46cb-8a30-1dc5716892ca)

3. **J-type Operand Diagram:**

![J-type](https://github.com/basemhesham/32-bit_single_cycle_MIPS_processor/assets/136960296/26ab0c76-1120-48dd-95de-55823b1f83e2)

**Single-Cycle MIPS Processor Diagram:**

Here's a schematic representation of the complete single-cycle MIPS processor:

![Complete single-cycle MIPS processor](https://github.com/basemhesham/32-bit_single_cycle_MIPS_processor/assets/136960296/5f56dedd-0686-45e8-a429-2330f72ee35d)

**Top Module View:**

![Top Module](https://github.com/basemhesham/32-bit_single_cycle_MIPS_processor/assets/136960296/04d297bd-8eff-4e27-91e1-cd2e2227303e)

**Main Modules:**

1. **ALU**: The Arithmetic Logic Unit is the core of the processor, performing various operations based on the ALUControl signal.

   ![ALUControl](https://github.com/basemhesham/32-bit_single_cycle_MIPS_processor/assets/136960296/43601d8c-5df2-4207-bed5-f82dea8a2d3d)

2. **Program Counter**: The PC register holds the 32-bit address for instruction execution. It is updated on the rising edge of the clock and cleared asynchronously during a reset.

3. **Instruction Memory**: The instruction memory fetches 32-bit instructions based on the PC's address. It functions as a ROM holding the program for CPU execution.

4. **Register File**: This module comprises 32 32-bit MIPS registers, supporting read and write operations. It is read asynchronously and written synchronously at the clock's rising edge.

5. **Data Memory**: A RAM unit provides storage for data. Reads are asynchronous, while writes are synchronized to the clock's rising edge. It matches the width and depth of the instruction memory.

6. **Control Unit**: The control unit computes control signals based on instruction fields, simplifying operations with separate ALU and main decoders.

   ![Control_Unit](https://github.com/basemhesham/32-bit_single_cycle_MIPS_processor/assets/136960296/b1c3fda4-f172-41f5-b989-cd2aa49badca)

7. **Small Modules**: This section includes modules like Sign Extend and Shift_left_twice, which are parametrized for versatility. Adders and MUXs are also employed in various parts of the processor.

**Contributing:**

Contributions to this project are welcome. If you encounter issues or have improvement suggestions, feel free to submit pull requests or open issues in the repository.

**Reference:**

David M. Harris and Sarah L. Harris - "Digital Design and Computer Architecture," 2nd Edition, 2012.
