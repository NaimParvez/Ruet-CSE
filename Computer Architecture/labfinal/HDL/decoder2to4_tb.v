`timescale 1ns/1ps
module decoder2to4_tb;
   reg [1:0] A;    // 2-bit register for input A
   reg E;          // Register for enable input
   wire [3:0] Y;   // Wire for the 4-bit output

   // Instantiate the 2-to-4 decoder module
   decoder2to4 uut
   (
       .A(A),
       .E(E),
       .Y(Y)
   );

   // Initial block to apply test cases
   initial begin
       A = 2'b00; E = 1'b0; // Test with Enable = 0
       #20;
       E = 1'b1;            // Test with Enable = 1
       #20;
       A = 2'b01;           // A = 01, with Enable = 1
       #20;
       A = 2'b10;           // A = 10, with Enable = 1
       #20;
       A = 2'b11;           // A = 11, with Enable = 1
       #20;
   end

   // Monitor block to display values during simulation
   initial begin
    $monitor("E=%b A=%b Y=%b\n", E, A, Y);
   end
endmodule
