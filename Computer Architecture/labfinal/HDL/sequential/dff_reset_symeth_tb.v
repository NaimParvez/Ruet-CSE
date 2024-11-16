`timescale 1ns / 1ps

module dff_reset_symeth_tb;

    // Inputs
    reg clk;
    reg reset;
    reg en;
    reg d;

    // Outputs
    wire q;

    // Instantiate the Unit Under Test (UUT)
    d_ff_reset_en2 uut (
        .clk(clk), 
        .reset(reset), 
        .en(en), 
        .d(d), 
        .q(q)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 0;
        en = 0;
        d = 0;

        // Apply reset
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Test case 1: Enable is low, D is high
        en = 0;
        d = 1;
        #20;

        // Test case 2: Enable is high, D is high
        en = 1;
        d = 1;
        #20;

        // Test case 3: Enable is high, D is low
        en = 1;
        d = 0;
        #20;

        // Test case 4: Apply reset
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Test case 5: Enable is low, D is low
        en = 0;
        d = 0;
        #20;

        // Finish simulation
        $finish;
    end

    always #5 clk = ~clk; // Clock generator

endmodule