`timescale 1ns/1ps

module testbench;
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    // Instantiate the four-bit adder
    four_bit_adder UUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin
        // Initialize dump file and variables
        $dumpfile("Adder4B_tb_test.vcd");
        $dumpvars(0, testbench);

        // Initialize inputs and apply test vectors
        A = 4'b0000; B = 4'b0000; Cin = 1'b0; #20;
        A = 4'b0001; B = 4'b0001; Cin = 1'b0; #20;
        A = 4'b0011; B = 4'b0101; Cin = 1'b1; #20;
        A = 4'b1111; B = 4'b1111; Cin = 1'b1; #20;

        $finish;
    end

    initial begin
        $monitor("%4t: A=%b, B=%b, Cin=%b | Sum=%b, Cout=%b", $time, A, B, Cin, Sum, Cout);
    end
endmodule
