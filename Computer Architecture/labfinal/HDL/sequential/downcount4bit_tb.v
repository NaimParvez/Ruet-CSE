module counter_4bit_down_tb;

    // Inputs
    reg clk;
    reg reset;
    reg enable;

    // Outputs
    wire [3:0] count;

    // Instantiate the Unit Under Test (UUT)
    counter_4bit_down uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 0;
        enable = 0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Test case 1: Reset
        reset = 1;
        #10;
        reset = 0;
        #10;
        $display("Test case 1 (Reset): count = %b", count);

        // Test case 2: Enable counting
        enable = 1;
        #80;  // Wait for 8 clock cycles
        $display("Test case 2 (After 8 cycles): count = %b", count);

        // Test case 3: Disable counting
        enable = 0;
        #40;  // Wait for 4 clock cycles
        $display("Test case 3 (Disabled for 4 cycles): count = %b", count);

        // Test case 4: Re-enable counting
        enable = 1;
        #60;  // Wait for 6 clock cycles
        $display("Test case 4 (Re-enabled for 6 cycles): count = %b", count);

        // Test case 5: Let it wrap around
        #20;  // Wait for 2 more clock cycles
        $display("Test case 5 (Wrap around): count = %b", count);

        // Test case 6: Reset again
        reset = 1;
        #10;
        reset = 0;
        #10;
        $display("Test case 6 (Reset again): count = %b", count);

        $finish;
    end
      
endmodule