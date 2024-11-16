module FullSubtractor_4bit_TB;
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    wire [3:0] Diff;
    wire Cout;
    
    FullSubtractor_4bit uut(
        .A(A),
        .B(B),
        .Cin(Cin),
        .Diff(Diff),
        .Cout(Cout)
    );
    
    initial begin
        $monitor("A=%b, B=%b, Cin=%b, Diff=%b, Cout=%b", A, B, Cin, Diff, Cout);
        
        // Test case 1
        A = 4'b0000;
        B = 4'b0000;
        Cin = 0;
        #10;
        
        // Test case 2
        A = 4'b1111;
        B = 4'b0001;
        Cin = 1;
        #10;
        
        // Test case 3
        A = 4'b0101;
        B = 4'b0010;
        Cin = 0;
        #10;
        
        // Add more test cases here
        
        $finish;
    end
endmodule