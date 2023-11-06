module fetcher(
    input logic clk;
    input logic rst;
    input logic ce;
    input logic branch;
    input logic [31:0] branch_addr;
    input logic [31:0] instruction;
    output logic [31:0] i_address;
    output logic [31:0] IR;
    output logic [31:0] NPC;

)
logic [31:0] pc;

assign i_address <= pc;
always_ff @(posedge clk) begin
        if(rst)
            pc <= 32'h00000000;
        else if(branch)
            pc <= branch_addr;
        else if(ce)
            pc <= pc+4;
        else
            pc <= pc;

end

always_ff @(posedge clk) begin
    if(ce) begin
        IR <= instruction;
        NPC <= pc;
    end

end 