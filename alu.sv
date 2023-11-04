import riscv::*;

module ALU(
    input logic op1;
    input logic op2;
    output logic outalu;
    input inst_type op_alu;

);
always_comb begin
    case(op_alu)
    ADDI : 
    SLTI :
    ANDI :
    XORI :
    ORI :
end
endmodule