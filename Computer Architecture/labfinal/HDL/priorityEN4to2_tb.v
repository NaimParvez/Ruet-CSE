module priorityEN4to2_tb;

    // Inputs
    reg [3:0] in;

    // Outputs
    wire [1:0] out;
    wire valid;

    // Instantiate the Unit Under Test (UUT)
    priorityEN4to2 uut (
        .in(in), 
        .out(out), 
        .valid(valid)
    );

    initial begin
        // Initialize Inputs
        in = 4'b0000;

        // Wait for global reset
        #10;

        // Test cases
        in = 4'b0001; #10;
        $display("in = %b, out = %b, valid = %b", in, out, valid);

        in = 4'b0010; #10;
        $display("in = %b, out = %b, valid = %b", in, out, valid);

        in = 4'b0100; #10;
        $display("in = %b, out = %b, valid = %b", in, out, valid);

        in = 4'b1000; #10;
        $display("in = %b, out = %b, valid = %b", in, out, valid);

        in = 4'b0110; #10;
        $display("in = %b, out = %b, valid = %b", in, out, valid);

        in = 4'b0000; #10;
        $display("in = %b, out = %b, valid = %b", in, out, valid);

        // Finish simulation
        $finish;
    end
      
endmodule