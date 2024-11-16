module register_7bit (
    input wire clk,
    input wire reset,
    input wire [6:0] d,
    output reg [6:0] q
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 7'b0;
    end else begin
        q <= d;
    end
end

endmodule