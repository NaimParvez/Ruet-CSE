module dff_reset_en (
    input wire clk,
    input wire reset,
    input wire en,
    input wire d,
    output reg q
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 1'b0;
    end else if (en) begin
        q <= d;
    end
end

endmodule