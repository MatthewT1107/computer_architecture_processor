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



endmodule