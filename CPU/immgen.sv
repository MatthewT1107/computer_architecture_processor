// immediate value generator

module immgen (
    input logic [6:0] Opcode,
    input logic [31:0] instruction,
    input logic [31:0] ImmExt, 
);

always_ff @(*) begin
    case(Opcode)
    7'b0000011: Immxt = {{20{instruction[31]}}, instruction[31:20]};
    7'b0100011: ImmExt
    endcase 
end
endmodule