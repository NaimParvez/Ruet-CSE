`timescale 1ns/1ns
`include "hello.v"

module hello_tb;
    reg A;
    wire B;


    hello uut(
        .A(A),
        .B(B)
    );

    initial begin
        $dumpfile("hello_tb.vcd");
        $dumpvars(0, hello_tb);


        A = 0;
        #100;
        A = 1;
        #100;
        A = 0;
        #100;

        $display("Simulation done");
    end

endmodule