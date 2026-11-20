// top level cpu module

module cpu (
    input logic clk,

    output logic [31:0] imem_address,
    input logic [31:0] imem_data_out,

    output logic [2:0] funct3,
    output logic [31:0] dmem_wren,
    output logic [31:0] dmem_address,
    output logic [31:0] dmem_data_in,
    output logic [31:0] dmem_data_out
);
// Internal signals
logic IR_write_enable;
logic [31:0] instruction;
logic [31:0] immediate;

Instruction_Register ir (
    .clk(clk),
    .reset(1'b0),
    .IR_write_enable(IR_write_enable),
    .instruction_in(imem_data_out),
    .instruction_out(instruction)
);

Immediate_Generator immgen (
    .instruction(instruction),
    .imm_out(immediate)
);

endmodule