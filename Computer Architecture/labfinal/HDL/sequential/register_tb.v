`timescale 1ns / 1ps

module register_tb;

    // Inputs
    reg clk;
    reg reset;
    reg [6:0] d;

    // Outputs
    wire [6:0] q;

    // Instantiate the Unit Under Test (UUT)
    register_7bit uut (
        .clk(clk), 
        .reset(reset), 
        .d(d), 
        .q(q)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 0;
        d = 7'b0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Add stimulus here
        reset = 1; #10;
        reset = 0; #10;
        
        d = 7'b1010101; #10;
        clk = 1; #10;
        clk = 0; #10;
        
        d = 7'b0101010; #10;
        clk = 1; #10;
        clk = 0; #10;
        
        reset = 1; #10;
        reset = 0; #10;
    end
    
    always #5 clk = ~clk; // Clock generator with period of 10 ns

endmodule