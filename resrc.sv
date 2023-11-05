package riscv;

    typedef enum {ADDI, ANDI, ORI, XORI, SLTI, SLTIU, AUIPC, LUI, SLLI, SRLI, SRAI,
                    ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND, FENCE, FENCEI,
                    CSRRW, CSRRS, CSRRC, CSRRWI, CSRRSI, CSRRCI, ECALL, EBREAK,
                    URET, SRET, MRET, WFI, SFENCEVMA, LB, LH, LW, LBU, LHU, SB, SH, SW,
                    JAL, JALR, BEQ, BNE, BLT, BGE, BLTU, BGEU

    } inst_type;
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
