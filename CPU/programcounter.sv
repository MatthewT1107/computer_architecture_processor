// Program counter

module Program_Counter (    
    input logic clk,
    input logic reset,
    input logic PC_write_enable, // enable signal to write to the program counter
    input logic [31:0] PC_in, // input program counter is 32 bits
    output logic [31:0] PC_out  // output program counter is 32 bits
);

always_ff @(posedge clk or posedge reset) begin
    if (reset)
        PC_out <= 32'h1000; // if reset is true, reset program counter to start memory
    else if (PC_write_enable)
        PC_out <= PC_in; // otherwise if enabled to write, update program counter with input value
end
endmodule

// PC + 4 adder

module PC_Adder(
    input logic [31:0] from_PC, // from_PC is the current program counter value
    output logic [31:0] Next_to_PC  // Next_to_PC is the next program counter value, which is 4 bytes ahead of the current value
);
assign Next_to_PC = 32'd4 + from_PC; // add 4 to the current program counter value to get the next value

endmodule

