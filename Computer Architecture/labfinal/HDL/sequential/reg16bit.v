module register_16bit (
    input wire clk,           // Clock input
    input wire reset,         // Asynchronous reset
    input wire load,          // Load enable signal
    input wire [15:0] data_in,  // 16-bit input data
    output reg [15:0] data_out  // 16-bit output data
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        data_out <= 16'b0;  // Reset the register to 0
    end else if (load) begin
        data_out <= data_in;  // Load new data when load is high
    end
    // If load is low, the register keeps its current value
end

endmodule