module tb_instructionregister;
    logic clk;
    logic reset;
    logic IR_write_enable;
    logic [31:0] instruction_in;
    logic [31:0] instruction_out;

    Instruction_Register dut (
        .clk(clk),
        .reset(reset),
        .IR_write_enable(IR_write_enable),
        .instruction_in(instruction_in),
        .instruction_out(instruction_out)
    );

    //generate clock
    always begin
        clk = 0;
        #5;
        clk = 1;
        #5;
    end

    initial begin
        //initialize inputs
        reset = 1;
        IR_write_enable = 0;
        instruction_in = 32'd0;

        #10;
        reset = 0;


        //test loading an instruction
        instruction_in = 32'h00A00093; //ADDI x1, x0, 10
        IR_write_enable = 1;

        #10;

        if (instruction_out == 32'h00A00093)
            $display("Instruction load test PASSED");
        else
            $display("Instruction load test FAILED: got %h", instruction_out);
    

        // test holding the previous instruction
        instruction_in = 32'h00500113; // ADDI x2, x0, 5
        IR_write_enable = 0;

        #10;

        if (instruction_out == 32'h00A00093)
            $display("Instruction hold test PASSED");
        else
            $display("Instruction hold test FAILED: got %h", instruction_out);
            
            
        // test resetting the instruction register
        reset = 1;

        #1;

        if (instruction_out == 32'd0)
            $display("Instruction reset test PASSED");
        else
            $display("Instruction reset test FAILED: got %h", instruction_out);

        reset = 0;

        $display("All instruction register tests completed.");
        $finish;

    end



endmodule
