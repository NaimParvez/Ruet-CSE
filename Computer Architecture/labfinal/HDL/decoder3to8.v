module decoder3to8
(
    input [2:0] A,    // 3-bit input
    input E,          // Enable input
    output [7:0] Y    // 8-bit output
);
    // Logic for 3-to-8 decoder
    assign Y[7] = E & A[2] & A[1] & A[0];       // Y7 is high if E=1, A=111
    assign Y[6] = E & A[2] & A[1] & ~A[0];      // Y6 is high if E=1, A=110
    assign Y[5] = E & A[2] & ~A[1] & A[0];      // Y5 is high if E=1, A=101
    assign Y[4] = E & A[2] & ~A[1] & ~A[0];     // Y4 is high if E=1, A=100
    assign Y[3] = E & ~A[2] & A[1] & A[0];      // Y3 is high if E=1, A=011
    assign Y[2] = E & ~A[2] & A[1] & ~A[0];     // Y2 is high if E=1, A=010
    assign Y[1] = E & ~A[2] & ~A[1] & A[0];     // Y1 is high if E=1, A=001
    assign Y[0] = E & ~A[2] & ~A[1] & ~A[0];    // Y0 is high if E=1, A=000

endmodule
