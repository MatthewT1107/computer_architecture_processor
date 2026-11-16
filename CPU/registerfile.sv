// register file

module register_file (
    input logic clk,
    // Write enable: Determines whether a write happens
    input logic we,
    // Register destination: Selects which of the registers to write
    input logic [4:0] rd ,
    // Write data: The actual value to store
    input logic [31:0] wd ,
    // Read source 1, selects the first register to read
    input logic [4:0] rs1,
    // Read source 2, selects the second register to read
    input logic [4:0] rs2,
    
    // Giving these values to the ALU
    // Read data 1: Data read from rs1
    output logic [31:0] rd1,
     // Read data 2: Data read from rs2
    output logic [31:0] rd2

);

// 32 registers with 32 bit logic
logic [31:0] registers [0:31];

// Read rs1 and rs2 and output their values to rd1 and rs2
always_comb begin
    // If the register index is 0, output 0 else output register value  
        // Register 0 is always value 0
    rd1 = (rs1==0) ? 32'b0 : registers[rs1];
    rd2 = (rs2==0) ? 32'b0 : registers[rs2];
end

// Write value wd to register rd
always_ff @(posedge clk) begin
    // If write enable and not reg 0 set register rd to wd
    if (we && rd != 0 ) begin
        registers[rd] <= wd;
    end
end

endmodule