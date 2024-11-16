module counter_4bit_down (
    input wire clk,           // Clock input
    input wire reset,         // Asynchronous reset
    input wire enable,        // Counter enable
    output reg [3:0] count    // 4-bit counter output
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 4'b1111;  // Reset the counter to maximum value (15)
    end else if (enable) begin
        count <= count - 1'b1;  // Decrement the counter when enabled
    end
    // If not enabled, the counter keeps its current value
end

endmodule


iverilog -o counter_test counter_4bit_down.v counter_4bit_down_tb.v
vvp counter_test