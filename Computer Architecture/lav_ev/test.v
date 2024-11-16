module FullSubtractor_4bit(input [3:0] A, input [3:0] B, input Cin, output [3:0] Diff, output Cout);
    wire [2:0] Borrow;
    
    // 1-bit Full Subtractor
    FullSubtractor_1bit fs0(A[0], B[0], Cin, Diff[0], Borrow[0]);
    FullSubtractor_1bit fs1(A[1], B[1], Borrow[0], Diff[1], Borrow[1]);
    FullSubtractor_1bit fs2(A[2], B[2], Borrow[1], Diff[2], Borrow[2]);
    FullSubtractor_1bit fs3(A[3], B[3], Borrow[2], Diff[3], Cout);
    
endmodule

module FullSubtractor_1bit(input A, input B, input Cin, output Diff, output Borrow);
    wire w1, w2, w3;
    xor(w1, A, B);
    
    xor(w2, A, Cin);
    
    and(w3, B, Cin);
    
    xor(Diff, w1, Cin);
    
    or(Borrow, w2, w3);
    
endmodule