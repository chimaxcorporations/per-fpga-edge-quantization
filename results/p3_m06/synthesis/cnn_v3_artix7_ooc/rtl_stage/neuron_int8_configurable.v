`timescale 1ns/1ps
// P3-M06-03A: single configurable serial INT8 neuron.
// Preserves P3-M04 pipelined arithmetic; count is sampled at start.
module neuron_int8_configurable #(
    parameter MAX_FEATURES = 160
)(
    input wire clk, rst, start, valid_in,
    input wire [7:0] feature_count_in,
    input wire signed [7:0] feature_in, weight_in,
    input wire signed [31:0] bias_in, multiplier_in,
    input wire [5:0] shift_in,
    input wire relu_in,
    output reg busy, done,
    output reg signed [7:0] result,
    output reg overflow,
    output reg config_error
);
    localparam CW = (MAX_FEATURES <= 1) ? 1 : $clog2(MAX_FEATURES + 1);
    localparam ST_IDLE=3'd0, ST_ACC=3'd1, ST_MUL=3'd2,
               ST_MAG=3'd3, ST_SHIFT=3'd4, ST_RND=3'd5, ST_OUT=3'd6;
    reg [2:0] state;
    reg [CW-1:0] count, last_count;
    reg signed [31:0] acc, multiplier_reg;
    reg [5:0] shift_reg;
    reg relu_reg;
    reg signed [63:0] product_reg, rounded_reg;
    reg [63:0] magnitude_reg, quotient_reg;
    reg product_negative_reg, increment_reg;

    wire signed [15:0] product16 = $signed(feature_in) * $signed(weight_in);
    wire signed [31:0] product32 = {{16{product16[15]}},product16};
    wire signed [31:0] sum = acc + product32;
    wire add_overflow = (~(acc[31]^product32[31])) & (acc[31]^sum[31]);
    wire signed [63:0] wide_product = $signed(acc)*$signed(multiplier_reg);
    wire [63:0] magnitude = product_reg[63] ? (~product_reg+64'd1) : product_reg;
    wire [63:0] divisor = 64'd1 << shift_reg;
    wire [63:0] mask = divisor-64'd1;
    wire [63:0] quotient = magnitude_reg >> shift_reg;
    wire [63:0] remainder = magnitude_reg & mask;
    wire [63:0] half = divisor >> 1;
    wire increment = (shift_reg != 6'd0) &&
       ((remainder > half) || ((remainder == half) && quotient[0]));
    wire [63:0] rounded_mag = quotient_reg + {63'd0,increment_reg};
    wire signed [63:0] rounded = product_negative_reg ?
        -$signed(rounded_mag) : $signed(rounded_mag);
    wire signed [7:0] clipped = rounded_reg > 64'sd127 ? 8'sd127 :
        rounded_reg < -64'sd127 ? -8'sd127 : rounded_reg[7:0];
    wire signed [7:0] activated = (relu_reg && clipped < 8'sd0) ? 8'sd0 : clipped;

    always @(posedge clk) begin
        if (rst) begin
            state <= ST_IDLE; busy <= 0; done <= 0; result <= 0;
            overflow <= 0; config_error <= 0;
            acc <= 0; count <= 0; last_count <= 0;
            multiplier_reg <= 0; shift_reg <= 0; relu_reg <= 0;
            product_reg <= 0; magnitude_reg <= 0; product_negative_reg <= 0;
            quotient_reg <= 0; increment_reg <= 0; rounded_reg <= 0;
        end else begin
            done <= 0;
            case (state)
                ST_IDLE: begin
                    busy <= 0;
                    if (start) begin
                        overflow <= 0;
                        config_error <= 0;
                        if (feature_count_in == 0 ||
                            feature_count_in > MAX_FEATURES || shift_in > 63) begin
                            config_error <= 1;
                            done <= 1;
                        end else begin
                            busy <= 1;
                            acc <= bias_in;
                            count <= 0;
                            last_count <= feature_count_in - 1'b1;
                            multiplier_reg <= multiplier_in;
                            shift_reg <= shift_in;
                            relu_reg <= relu_in;
                            state <= ST_ACC;
                        end
                    end
                end
                ST_ACC: if (valid_in) begin
                    acc <= sum;
                    overflow <= overflow | add_overflow;
                    if (count == last_count) state <= ST_MUL;
                    else count <= count + 1'b1;
                end
                ST_MUL: begin product_reg <= wide_product; state <= ST_MAG; end
                ST_MAG: begin
                    magnitude_reg <= magnitude;
                    product_negative_reg <= product_reg[63];
                    state <= ST_SHIFT;
                end
                ST_SHIFT: begin
                    quotient_reg <= quotient;
                    increment_reg <= increment;
                    state <= ST_RND;
                end
                ST_RND: begin rounded_reg <= rounded; state <= ST_OUT; end
                ST_OUT: begin
                    result <= activated;
                    done <= 1;
                    busy <= 0;
                    state <= ST_IDLE;
                end
                default: state <= ST_IDLE;
            endcase
        end
    end
endmodule
