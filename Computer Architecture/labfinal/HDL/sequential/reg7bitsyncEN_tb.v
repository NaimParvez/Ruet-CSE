module register_7bit_sync_enable_tb;

    // Inputs
    reg clk;
    reg reset;
    reg enable;
    reg [6:0] data_in;

    // Outputs
    wire [6:0] data_out;

    // Instantiate the Unit Under Test (UUT)
    register_7bit_sync_enable uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 0;
        enable = 0;
        data_in = 7'b0000000;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Test case 1: Reset
        reset = 1;
        #10;
        reset = 0;
        #10;
        $display("Test case 1 (Reset): data_out = %b", data_out);

        // Test case 2: Load data with enable high
        data_in = 7'b1010101;
        enable = 1;
        #10;
        enable = 0;
        #10;
        $display("Test case 2 (Load data): data_in = %b, data_out = %b", data_in, data_out);

        // Test case 3: Attempt to load data with enable low
        data_in = 7'b0101010;
        #20;
        $display("Test case 3 (Enable low): data_in = %b, data_out = %b", data_in, data_out);

        // Test case 4: Load new data with enable high
        enable = 1;
        #10;
        enable = 0;
        #10;
        $display("Test case 4 (Load new data): data_in = %b, data_out = %b", data_in, data_out);

        // Test case 5: Reset again
        reset = 1;
        #10;
        reset = 0;
        #10;
        $display("Test case 5 (Reset again): data_out = %b", data_out);

        $finish;
    end
      
endmodule