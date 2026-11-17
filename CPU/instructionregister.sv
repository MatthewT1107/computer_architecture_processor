// instruction generator

module Instruction_Register(
    input logic clk,
    input logic reset,
    input logic IR_write_enable,
    input logic [31:0] instruction_in,
    output logic [31:0] instruction_out
);

    always_ff@(posedge clk or posedge reset)begin
        if (reset)
            instruction_out <= 32'd0;
        else if (IR_write_enable)
            instruction_out <= instruction_in;
    end
endmodule  