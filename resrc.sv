package riscv;

    typedef enum {ADDI, ANDI, ORI, XORI,
                ADDU, SUBU, AAND, OOR, XXOR, NNOR, SSLL, SLLV, SSRA, SRAV,
				SSRL, SRLV, LUI, LBU, LW, SB, SW, SLT,
				SLTU, SLTI,	SLTIU, BEQ, BGEZ, BLEZ, BNE, J, JAL, JALR, JR, 
				MULTU, DIVU, MFHI, MFLO, invalid_instruction, NOP} inst_type;
    typedef struct {
        logic CY1;       // command of the first stage
        logic CY2;      //    "    of the second stage
        logic walu;     //   "    of the third stage
        logic wmdr;     //    "    of the fourth stage
        logic wpc;       // PC write enable
        logic wreg;       // register bank write enable
        logic whilo;       // habilitao de escrita nos registradores HI e LO
        logic ce;       // Chip enable and R_W controls
        logic rw   ;
        logic bw  ;       // Byte-word control (mem write only)
        logic i    ;      // operation specification
        logic rst_md;       // mult and div initialization
    } microinstruction;

    typedef enum  logic[2:0] {R_type, I_type, S_type, B_type, U_type, J_type} fmts;

    typedef enum  logic[2:0] {
                              OP0, OP1, OP2, OP3, OP4, OP5, OP6, OP7, NOTOKEN='Z
                              } instruction_type;
endpackage
