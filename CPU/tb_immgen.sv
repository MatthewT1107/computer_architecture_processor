module tb_immgen;

    logic [31:0] instruction;
    logic [31:0] imm_out;

    Immediate_Generator dut (
    .instruction(instruction),
    .imm_out(imm_out)
    );

    initial begin

    // I-type test: immediate = 5
    instruction = 32'b000000000101_00000_000_00001_0010011;
    #10;

    if (imm_out == 32'd5)
        $display("I-type test PASSED");
    else
        $display("I-type test FAILED: expected 5, got %0d", imm_out);

    // I-type test: immediate = -5
    instruction = 32'b111111111011_00000_000_00001_0010011;
    #10;

    if ($signed(imm_out) == -32'sd5)
        $display("I-type negative test PASSED");
    else
        $display("I-type negative test FAILED: expected -5, got %0d", $signed(imm_out));
    
    // S-type test: immediate = 8
    instruction = 32'b0000000_00000_00000_010_01000_0100011;
    #10;

    if (imm_out == 32'd8)
        $display("S-type test PASSED");
    else
        $display("S-type test FAILED: expected 8, got %0d", imm_out);
    
    // B-type test: immediate = 8
    instruction = 32'b0000000_00000_00000_000_0100_0_1100011;
    #10;

    if (imm_out == 32'd8)
        $display("B-type test PASSED");
    else
        $display("B-type test FAILED: expected 8, got %0d", imm_out);
    
    // U-type test: immediate = 0x12345000
    instruction = 32'h12345037;
    #10;

    if (imm_out == 32'h12345000)
        $display("U-type test PASSED");
    else
        $display("U-type test FAILED: expected 0x12345000, got %h", imm_out);

    // J-type test: immediate = 8
    instruction = 32'b000000001000_00000000_00000_1101111;
    #10;

    if (imm_out == 32'd8)
        $display("J-type test PASSED");
    else
        $display("J-type test FAILED: expected 8, got %0d", imm_out);
    
    $display("All immediate generator tests completed.");
    $finish;

    end
    



endmodule