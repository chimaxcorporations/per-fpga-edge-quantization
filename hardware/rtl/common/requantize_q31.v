// P3-M04-02C: signed INT32 x signed INT32 Q31 multiplier.
// Combinational, Verilog-2001. Exact round-to-nearest, ties-to-even.
// Output is signed INT64; INT8 clipping is a separate downstream stage.
module requantize_q31 (
    input  wire signed [31:0] accumulator,
    input  wire signed [31:0] multiplier_q31,
    output wire signed [63:0] rounded_out
);
    wire signed [63:0] product;
    wire [63:0] magnitude;
    wire [63:0] quotient;
    wire [30:0] remainder;
    wire increment;
    wire [63:0] rounded_magnitude;

    assign product = $signed(accumulator) * $signed(multiplier_q31);
    assign magnitude = product[63] ? (~product + 64'd1) : product;
    assign quotient = magnitude >> 31;
    assign remainder = magnitude[30:0];
    assign increment = (remainder > 31'h40000000) ||
                       ((remainder == 31'h40000000) && quotient[0]);
    assign rounded_magnitude = quotient + {63'd0, increment};
    assign rounded_out = product[63] ? -$signed(rounded_magnitude) :
                                       $signed(rounded_magnitude);
endmodule
