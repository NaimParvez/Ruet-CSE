module register_7bit_sync_enable (
    input wire clk,           // Clock input
    input wire reset,         // Asynchronous reset
    input wire enable,        // Synchronous enable input
    input wire [6:0] data_in, // 7-bit input data
    output reg [6:0] data_out // 7-bit output data
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        data_out <= 7'b0000000;  // Reset the register to 0
    end else if (enable) begin
        data_out <= data_in;     // Load new data when enable is high
    end
    // If enable is low, the register keeps its current value
end

endmodule


register_7bit_sync_enable.v
register_7bit_sync_enable_tb.v

iverilog -o register_test register_7bit_sync_enable.v register_7bit_sync_enable_tb.v
vvp register_test