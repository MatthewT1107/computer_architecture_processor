// control unit

module control_unit(instruction, Branch, MemRead, MemtoReg, ALUOp, ALUSrc, RegWrite);

input [6:0] instruction;
output Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
output[1:0] ALUOp;

always @(*) begin
    case(instruction)
    7'b0110011 : {ALUSrc, MemtoReg, RegWrite, MemWrite, Branch, ALUOp} <= 8'b001000_01;
    
    endcase
end
endmodule