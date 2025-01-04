# RISCV-Mini-1

**Type**: RISC-V Single-Cycle Processor  

## Architecture Overview  
This processor is a 32-bit architecture that executes instructions within a single clock cycle.

![image](https://github.com/user-attachments/assets/8ce0c83b-e7eb-4f6c-86ae-5b1de4041ee1)

## Instruction Formats  
The processor supports multiple instruction formats, each tailored for specific types of operations:  
- **R-Type**: Used for operations between registers (e.g., add, subtract).  
- **I-Type**: Handles immediate values and load instructions (e.g., addi, lw).  
- **S-Type**: Facilitates store instructions (e.g., sw).  
- **SB-Type**: Implements conditional branching (e.g., beq, bne).  

![image](https://github.com/user-attachments/assets/6248a7b7-1287-4dd2-b88b-32c3fea6bfaa)

## Pipeline  
The single-cycle processor completes all instruction stages (fetch, decode, execute, memory access, write-back) in one clock cycle, without pipelining.  

## Key Components  
- Program Counter (PC)  
- Instruction Memory  
- Register File  
- Arithmetic Logic Unit (ALU)  
- Immediate Generator  
- Control Unit  
- Data Memory  
- Multiplexers (MUX)

## Control Signals  
- ALUSrc  
- MemtoReg  
- MemRead/MemWrite  
- RegWrite  
- Branch  
- ALUOp  

## Supported Operations  
- Arithmetic: Addition, subtraction.  
- Logical: AND, OR.  
- Memory Access: Load (`lw`), store (`sw`).  
- Branching: Conditional branches (`beq`, `bne`).

![image](https://github.com/user-attachments/assets/512e2de5-3524-4eb4-bf4f-688780619e1a)


