module demux_1to4_tb;

    // Inputs
    reg data_in;
    reg [1:0] select;

    // Outputs
    wire [3:0] data_out;

    // Instantiate the Unit Under Test (UUT)
    demux_1to4 uut (
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
        
        // Test case 1: data_in = 1, select = 00
        data_in = 1;
        select = 2'b00;
        #10;
        $display("Test case 1: data_in = %b, select = %b, data_out = %b", data_in, select, data_out);

        // Test case 2: data_in = 1, select = 01
        select = 2'b01;
        #10;
        $display("Test case 2: data_in = %b, select = %b, data_out = %b", data_in, select, data_out);

        // Test case 3: data_in = 1, select = 10
        select = 2'b10;
        #10;
        $display("Test case 3: data_in = %b, select = %b, data_out = %b", data_in, select, data_out);

        // Test case 4: data_in = 1, select = 11
        select = 2'b11;
        #10;
        $display("Test case 4: data_in = %b, select = %b, data_out = %b", data_in, select, data_out);

        // Test case 5: data_in = 0, select = 10
        data_in = 0;
        select = 2'b10;
        #10;
        $display("Test case 5: data_in = %b, select = %b, data_out = %b", data_in, select, data_out);

        $finish;
    end
      
endmodule