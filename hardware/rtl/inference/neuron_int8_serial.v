`timescale 1ns/1ps
// P3-M04-03A: serial signed INT8 dot-product neuron.
// One accepted input/weight pair per clock; start loads bias.
// start must be asserted only when !busy. N_FEATURES >= 1.
// Finish: done pulses one cycle after the last accepted pair.
module neuron_int8_serial #(parameter N_FEATURES = 40) (
    input wire clk, input wire rst, input wire start,
    input wire valid_in,
    input wire signed [7:0] feature_in, weight_in,
    input wire signed [31:0] bias_in, multiplier_in,
    input wire [5:0] shift_in,
    input wire relu_in,
    output reg busy, output reg done,
    output reg signed [7:0] result,
    output reg overflow
);
    localparam CW = (N_FEATURES <= 1) ? 1 : $clog2(N_FEATURES);
    localparam [CW-1:0] LAST_COUNT = CW'(N_FEATURES - 1);
    reg [CW-1:0] count;
    reg signed [31:0] acc;
    reg signed [31:0] multiplier_reg;
    reg [5:0] shift_reg;
    reg relu_reg;
    reg finish_pending;
    wire signed [15:0] product16 = $signed(feature_in) * $signed(weight_in);
    wire signed [31:0] product32 = {{16{product16[15]}}, product16};
    wire signed [31:0] sum = acc + product32;
    wire add_overflow = (~(acc[31] ^ product32[31])) & (acc[31] ^ sum[31]);
    // Wide product, variable right shift, round nearest ties to even.
    wire signed [63:0] wide_product = $signed(acc) * $signed(multiplier_reg);
    wire [63:0] magnitude = wide_product[63] ? (~wide_product + 64'd1) : wide_product;
    wire [63:0] divisor = 64'd1 << shift_reg;
    wire [63:0] mask = divisor - 64'd1;
    wire [63:0] quotient = magnitude >> shift_reg;
    wire [63:0] remainder = magnitude & mask;
    wire [63:0] half = divisor >> 1;
    wire increment = (shift_reg != 6'd0) && ((remainder > half) || ((remainder == half) && quotient[0]));
    wire [63:0] rounded_mag = quotient + {63'd0, increment};
    wire signed [63:0] rounded = wide_product[63] ? -$signed(rounded_mag) : $signed(rounded_mag);
    wire signed [7:0] clipped;
    wire signed [7:0] activated;
    assign clipped = rounded > 64'sd127 ? 8'sd127 : rounded < -64'sd127 ? -8'sd127 : rounded[7:0];
    assign activated = (relu_reg && clipped < 8'sd0) ? 8'sd0 : clipped;
    always @(posedge clk) begin
        if (rst) begin
            busy <= 1'b0; done <= 1'b0; result <= 8'sd0;
            overflow <= 1'b0; acc <= 32'sd0; count <= {CW{1'b0}};
            multiplier_reg <= 32'sd0; shift_reg <= 6'd0;
            relu_reg <= 1'b0; finish_pending <= 1'b0;
        end else begin
            done <= 1'b0;
            if (start && !busy) begin
                busy <= 1'b1; acc <= bias_in; count <= {CW{1'b0}};
                overflow <= 1'b0; multiplier_reg <= multiplier_in;
                shift_reg <= shift_in; relu_reg <= relu_in;
                finish_pending <= 1'b0;
            end else if (busy && finish_pending) begin
                result <= activated; done <= 1'b1; busy <= 1'b0;
                finish_pending <= 1'b0;
            end else if (busy && valid_in) begin
                acc <= sum;
                overflow <= overflow | add_overflow;
                if (count == LAST_COUNT) finish_pending <= 1'b1;
                else count <= count + 1'b1;
            end
        end
    end
endmodule
