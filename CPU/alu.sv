// ALU module
// The ALU performs arithmetic and logical operations on input values

module alu (
    
    input logic [31:0] a, //input val 1
    input logic [31:0] b, //input val 2
    input logic [3:0] alu_operation, //operation to do
    output logic [31:0] result

);

// ALU only needs to do combinational logic 

always_comb begin
    case (alu_operation)  
        //add  
        4'b0000: result = a+b;
        //subtract
        4'b0001: result = a-b;
        //and
        4'b0010: result =  a&b;
        //or
        4'b0011: result = a|b;
        //xor
        4'b0100: result = a^b;
        //shift left logical
        4'b0101: result = a << b[4:0];
        //shift right logical
        4'b0110: result = a >> b[4:0];
        //shift right arithmetic
        4'b0111: result = $signed(a) >>> b[4:0]; //signed indicated by $signed
        //set less than (signed)
        4'b1000: result = $signed(a) < $signed(b);
        //set less than (unsigned)
        4'b1001: result = a<b;
        default: result = 32'b0;
    endcase
end


endmodule