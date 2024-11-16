module decoder2to4
(
   input [1:0] A,     // 2-bit input
   input E,           // Enable input
   output [3:0] Y     // 4-bit output
);
   // Logic for 2-to-4 decoder
   assign Y[3] = E & A[1] & A[0];
   assign Y[2] = E & A[1] & ~A[0];
   assign Y[1] = E & ~A[1] & A[0];
   assign Y[0] = E & ~A[1] & ~A[0];

endmodule
