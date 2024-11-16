module demux_1to4 (
    input data_in,        // 1 input line
    input [1:0] select,   // 2 select lines
    output reg [3:0] data_out  // 4 output lines
);

always @(*) begin
    data_out = 4'b0000; // Default all outputs to 0
    case(select)
        2'b00: data_out[0] = data_in;
        2'b01: data_out[1] = data_in;
        2'b10: data_out[2] = data_in;
        2'b11: data_out[3] = data_in;
    endcase
end

endmodule