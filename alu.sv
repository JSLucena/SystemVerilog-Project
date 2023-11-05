import riscv::*;

module ALU(
    input logic op1; //rs1
    input logic op2; //rs2, IMM, shamt
    output logic outalu;
    input inst_type op_alu;

);
always_comb begin
    case(op_alu)
    SLTI, SLT : outalu = $signed(op1) > $signed(op2) ? 32'b1 : 32'b0;
    SLTIU, SLTU : outalu = $unsigned(op1) > $unsigned(op2) ? 32'b1 : 32'b0;
    ANDI, AND : outalu = op1 & op2;
    XORI, XOR : outalu = op1 ^ op2;
    ORI, OR : outalu = op1 | op2;
    SLLI, SLL : outalu = op1 << op2;
    SRLI, SRL : outalu = op1 >> op2;
    SRAI, SRA : outalu = $signed(op1) >>> op2;
    ADDI, AUIPC, ADD, LB, LH, LW, LBU, LHU, SB, SH, SW, JAL, JALR, BEQ, BNE, BLT, BGE, BLTU, BGEU : outalu = op1 + op2;
    SUB : outalu = op1 - op2
    LUI : outalu = {op1, 12b'0}
    default : outalu = op1; // FENCE, FENCEI, CSRRW, CSRRS, CSRRC, CSRRWI, CSRRSI, CSRRCI, ECALL, EBREAK, URET, SRET, MRET, WFI, SFENCEVMA
end
endmodule