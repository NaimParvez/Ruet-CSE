module mux_4to1_tb;

    // Inputs
    reg [3:0] data_in;
    reg [1:0] select;

    // Outputs
    wire data_out;

    // Instantiate the Unit Under Test (UUT)
    mux_4to1 uut (
        .data_in(data_in),
        .select(select),
        .data_out(data_out)
    );

    initial begin
        // Initialize Inputs
        data_in = 0;
        select = 0;

        // Wait 100 ns for global reset to finish
        #100;
        
        // Test case 1: select = 00, data_in = 1010
        data_in = 4'b1010;
        select = 2'b00;
        #10;
        $display("Test case 1: data_in = %b, select = %b, data_out = %b", data_in, select, data_out);

        // Test case 2: select = 01, data_in = 1010
        select = 2'b01;
        #10;
        $display("Test case 2: data_in = %b, select = %b, data_out = %b", data_in, select, data_out);

        // Test case 3: select = 10, data_in = 1010
        select = 2'b10;
        #10;
        $display("Test case 3: data_in = %b, select = %b, data_out = %b", data_in, select, data_out);

        // Test case 4: select = 11, data_in = 1010
        select = 2'b11;
        #10;
        $display("Test case 4: data_in = %b, select = %b, data_out = %b", data_in, select, data_out);

        // Additional test case
        data_in = 4'b0101;
        select = 2'b10;
        #10;
        $display("Test case 5: data_in = %b, select = %b, data_out = %b", data_in, select, data_out);

        $finish;
    end
      
endmodule