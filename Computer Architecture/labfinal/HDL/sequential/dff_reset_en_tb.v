`timescale 1ns / 1ps

module dff_reset_en_tb;

    // Inputs
    reg clk;
    reg reset;
    reg en;
    reg d;

    // Outputs
    wire q;

    // Instantiate the Unit Under Test (UUT)
    dff_reset_en uut (
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

        // Enable and set d to 1
        en = 1;
        d = 1;
        #10;

        // Disable enable
        en = 0;
        #10;

        // Set d to 0 and enable
        d = 0;
        en = 1;
        #10;

        // Apply reset again
        reset = 1;
        #10;
        reset = 0;
        #10;

        // Finish simulation
        $finish;
    end

    // Clock generation
    always #5 clk = ~clk;

endmodule