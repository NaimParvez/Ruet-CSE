module mux_4to1 (
    input [3:0] data_in,  // 4 input lines
    input [1:0] select,   // 2 select lines
    output reg data_out   // 1 output line
);

always @(*) begin
    case(select)
        2'b00: data_out = data_in[0];
        2'b01: data_out = data_in[1];
        2'b10: data_out = data_in[2];
        2'b11: data_out = data_in[3];
        default: data_out = 1'bx; // For completeness, though not necessary in this case
    endcase
end

endmodule