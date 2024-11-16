module counter_4bit_down_with_testbench;

    // Counter inputs
    reg clk;
    reg reset;
    reg enable;

    // Counter output
    reg [3:0] count;

    // Clock generation
    always #5 clk = ~clk;

    // Counter logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 4'b1111;  // Reset the counter to maximum value (15)
        end else if (enable) begin
            count <= count - 1'b1;  // Decrement the counter when enabled
        end
        // If not enabled, the counter keeps its current value
    end

    // Testbench
    initial begin
        // Initialize inputs
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


iverilog -o counter_test counter_4bit_down_with_testbench.v
vvp counter_test