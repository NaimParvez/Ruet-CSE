`timescale 1ns/1ps
module decoder3to8_tb;
    reg [2:0] A;     // 3-bit register for input A
    reg E;           // Register for enable input
    wire [7:0] Y;    // Wire for the 8-bit output

    // Instantiate the 3-to-8 decoder module
    decoder3to8 uut
    (
        .A(A),
        .E(E),
        .Y(Y)
    );

    // Initial block to apply test cases
    initial begin
        // Case 1: E = 0, A = 000
        A = 3'b000; E = 1'b0;
        #20;
        // Case 2: E = 1, A = 000
        E = 1'b1;
        #20;
        // Case 3: E = 1, A = 001
        A = 3'b001;
        #20;
        // Case 4: E = 1, A = 010
        A = 3'b010;
        #20;
        // Case 5: E = 1, A = 011
        A = 3'b011;
        #20;
        // Case 6: E = 1, A = 100
        A = 3'b100;
        #20;
        // Case 7: E = 1, A = 101
        A = 3'b101;
        #20;
        // Case 8: E = 1, A = 110
        A = 3'b110;
        #20;
        // Case 9: E = 1, A = 111
        A = 3'b111;
        #20;
    end

    // Monitor block to display values during simulation
    initial begin
        $monitor("E=%b A=%b Y=%b\n", E, A, Y);
    end
endmodule
