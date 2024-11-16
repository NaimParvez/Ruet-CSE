module subtractor4bit
(
   input [3:0] A,     // Minuend (4-bit input)
   input [3:0] B,     // Subtrahend (4-bit input)
   input Bin,         // Borrow input (initial borrow)
   output [3:0] Diff, // Difference (4-bit output)
   output Bout        // Borrow output
);
   wire [3:0] Borrow; // Wires for borrow between the bits

   // Subtract bit by bit, propagating the borrow
   assign {Borrow[0], Diff[0]} = A[0] - B[0] - Bin;
   assign {Borrow[1], Diff[1]} = A[1] - B[1] - Borrow[0];
   assign {Borrow[2], Diff[2]} = A[2] - B[2] - Borrow[1];
   assign {Borrow[3], Diff[3]} = A[3] - B[3] - Borrow[2];
   
   // Final borrow output
   assign Bout = Borrow[3];

endmodule
