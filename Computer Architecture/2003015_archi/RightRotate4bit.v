module RightRotate4bit (
    input wire [3:0] in,   // 4-bit input operand
    input wire clk,        // Clock signal
    input wire reset,      // Reset signal
    input wire load,       // Load signal to load initial input
    output reg [3:0] out   // 4-bit output after rotate
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            out <= 4'b0000;     // Reset output to 0000 when reset is high
        else if (load)
            out <= in;          // Load input value when load is high
        else
            out <= {out[0], out[3:1]};  // Right rotate the bits
    end

endmodule