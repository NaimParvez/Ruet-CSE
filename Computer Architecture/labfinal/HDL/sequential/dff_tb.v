`timescale 1ns / 1ps

module dff_tb;

    // Inputs
    reg clk;
    reg d;

    // Outputs
    wire q;

    // Instantiate the Unit Under Test (UUT)
    dff uut (
        .clk(clk), 
        .d(d), 
        .q(q)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        d = 0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;
    end
    
    always #5 clk = ~clk; // Generate clock with period of 10 time units

endmodule