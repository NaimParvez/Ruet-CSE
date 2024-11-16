module register_16bit_tb;

    // Inputs
    reg clk;
    reg reset;
    reg load;
    reg [15:0] data_in;

    // Outputs
    wire [15:0] data_out;

    // Instantiate the Unit Under Test (UUT)
    register_16bit uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 0;
        load = 0;
        data_in = 16'h0000;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Test case 1: Reset
        reset = 1;
        #10;
        reset = 0;
        #10;
        $display("Test case 1 (Reset): data_out = %h", data_out);

        // Test case 2: Load data
        data_in = 16'hA5A5;
        load = 1;
        #10;
        load = 0;
        #10;
        $display("Test case 2 (Load data): data_in = %h, data_out = %h", data_in, data_out);

        // Test case 3: Maintain data when load is low
        data_in = 16'h5A5A;
        #20;
        $display("Test case 3 (Maintain data): data_in = %h, data_out = %h", data_in, data_out);

        // Test case 4: Load new data
        load = 1;
        #10;
        load = 0;
        #10;
        $display("Test case 4 (Load new data): data_in = %h, data_out = %h", data_in, data_out);

        // Test case 5: Reset again
        reset = 1;
        #10;
        reset = 0;
        #10;
        $display("Test case 5 (Reset again): data_out = %h", data_out);

        $finish;
    end
      
endmodule