// control fsm

module control_unit (
    input logic clk,
    input logic reset,
    input logic [31:0] instruction,
    input logic branch,
    output logic PC_write_enable,
    output logic IR_write_enable,
    output logic alu_op,
    output logic alu_op,
    output logic pc_sel,
    output logic Sel_op1,
    output logic Sel_op2,
    output logic we, // write enable
    output logic dmem_wren

);

typedef enum logic [2:0] {
    FETCH1,
    FETCH2,
    DECODE,
    EXECUTE,
    MEM,
    BRANCH,
} state_t;

state_t state = FETCH1 // step we are on right now, starting at FETCH1

logic [6:0] opcode;
assign opcode = instruction[6:0];

//opcodes
localparam [6:0] op_Itype = 7'b00100011;
localparam [6:0] op_Rtype = 7'b0010011; //
localparam [6:0] op_load = 7'b0000011; // itype L
localparam [6:0] op_store = 7'b0100011; // stype
localparam [6:0] op_branch = 7'b1100011; // btype
localparam [6:0] op_jal = 7'b1101111; // jump and link
localparam [6:0] op_jalr = 7'b1100111; // jump and link register
localparam [6:0] op_lui = 7'b0110111; // load upper immediate
localparam [6:0] op_auipc = 'b0010111; // add upper immediate

always_ff @(posedge clk) begin
    if(reset)
        state <= FETCH1;
    else begin
        case (state)
            FETCH1 : state <= FETCH2;
            FETCH2: state <= DECODE;
            DECODE: begin
                if (opcode == op_lui) // if in decode statem load upper immediate register
            end
        endcase
    end
end

endmodule

module alu_control (

)
endmodule