`timescale 1ns/1ps
`include "RightRotate4bit.v"

module RightRotate4bit_tb;

    reg [3:0] in;      // 4-bit input operand
    reg clk;           // Clock signal
    reg reset;         // Reset signal
    reg load;          // Load signal
    wire [3:0] out;    // 4-bit output after rotate

    // Instantiate the RightRotate4bit module
    RightRotate4bit uut (
        .in(in),
        .clk(clk),
        .reset(reset),
        .load(load),
        .out(out)
    );

    // Generate clock signal
    always #10 clk = ~clk;  // Clock period = 20ns (50 MHz)

    // Test sequence
    initial begin
        $dumpfile("RightRotate4bit.vcd");
        $dumpvars(0, RightRotate4bit_tb);

        // Initialize inputs
        clk = 0;
        reset = 1;      // Assert reset to reset the counter
        load = 0;       // Initially, load is 0
        in = 4'b1101;   // Set input to 1101
        #20;

        // Release reset and load the input value
        reset = 0;      // Deassert reset
        load = 1;       // Load input value
        #20;            // Wait for one clock cycle

        // Start rotating the value
        load = 0;       // Deassert load to allow rotation
        #20;            // After 1st clock pulse (first rotate)
        #20;            // After 2nd clock pulse (second rotate)
        #20;            // After 3rd clock pulse (third rotate)
        #20;            

        $finish;
    end

    // Monitor the output and clock
    initial begin
        $monitor("Time = %0dns, Clock = %b, Input = %b, Output = %b", $time, clk, in, out);
    end

endmodule