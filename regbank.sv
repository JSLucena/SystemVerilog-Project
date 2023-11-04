module regbank(
    input logic clk, rst, ce;
    input logic [4:0] read1Addr, read2Addr, writeAddr;
    input logic [31:0] dataIn;
    output logic [31:0] out1, out2;
)

logic [31:0] regs [31:1];
logic [31:0] out1_int, out2_int;


assign out1 = regs[read1Addr];
assign out2 = regs[read2Addr];

integer i;

always_ff @( clk ) begin
    if (rst) begin
        for(i = 0; i < 32; i++)
            regs[i] = '0;
        
    end else begin
        if (ce and writeAddr != '0) regs[writeAddr] = dataIn; end
    
end
endmodule