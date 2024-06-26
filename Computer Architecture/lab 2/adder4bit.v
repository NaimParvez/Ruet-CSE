module four_bit_adder (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);
    wire C1, C2, C3;

    // Sum and Carry calculation for each bit
    assign {C1, Sum[0]} = A[0] + B[0] + Cin;
    assign {C2, Sum[1]} = A[1] + B[1] + C1;
    assign {C3, Sum[2]} = A[2] + B[2] + C2;
    assign {Cout, Sum[3]} = A[3] + B[3] + C3;

endmodule
