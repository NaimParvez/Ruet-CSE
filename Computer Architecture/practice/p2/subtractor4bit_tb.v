`timescale 1ns/1ps
`include "subtractor4bit.v"

module subtractor4bit_tb;
   reg [3:0] A;    // 4-bit register for input A (minuend)
   reg [3:0] B;    // 4-bit register for input B (subtrahend)
   reg Bin;        // Register for the initial borrow input
   wire [3:0] Diff; // Wire for the 4-bit difference output
   wire Bout;      // Wire for borrow output

   // Instantiate the 4-bit subtractor module
   subtractor4bit uut
   (
       .A(A),
       .B(B),
       .Bin(Bin),
       .Diff(Diff),
       .Bout(Bout)
   );

   // Initial block to apply test cases
   initial begin
       A = 4'b1010; B = 4'b0011; Bin = 1'b0; // A = 10, B = 3, No initial borrow
       #20;
       A = 4'b1001; B = 4'b1100; Bin = 1'b0; // A = 9, B = 12, No initial borrow
       #20;
       A = 4'b0100; B = 4'b0011; Bin = 1'b1; // A = 4, B = 3, With initial borrow
       #20;
       A = 4'b0000; B = 4'b0001; Bin = 1'b0; // A = 0, B = 1, No initial borrow
       #20;
   end

   // Monitor block to display values during simulation
   initial begin
    $monitor("A=%d B=%d Bin=%d Diff=%d Bout=%d\n", 
              A, B, Bin, Diff, Bout);
   end
endmodule
