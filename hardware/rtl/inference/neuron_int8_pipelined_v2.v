`timescale 1ns/1ps

// P3-M04-05A
// Timing-optimized serial INT8 neuron.
//
// Accumulation behavior is preserved.
// Requantization is divided into registered stages.
//
// Arithmetic semantics:
// - Signed INT8 multiplication
// - INT32 accumulation
// - Signed 32x32 -> 64-bit multiplication
// - Round-to-nearest, ties-to-even
// - INT8 saturation
// - Optional ReLU

module neuron_int8_pipelined_v2 #(
    parameter N_FEATURES = 40
)(
    input wire clk,
    input wire rst,
    input wire start,
    input wire valid_in,

    input wire signed [7:0] feature_in,
    input wire signed [7:0] weight_in,

    input wire signed [31:0] bias_in,
    input wire signed [31:0] multiplier_in,
    input wire [5:0] shift_in,
    input wire relu_in,

    output reg busy,
    output reg done,
    output reg signed [7:0] result,
    output reg overflow
);

    localparam CW = (N_FEATURES <= 1) ? 1 : $clog2(N_FEATURES);
    localparam [CW-1:0] LAST_COUNT = CW'(N_FEATURES - 1);

    localparam ST_IDLE  = 3'd0;
    localparam ST_ACC   = 3'd1;
    localparam ST_MUL   = 3'd2;
    localparam ST_MAG   = 3'd3;
    localparam ST_SHIFT = 3'd4;
    localparam ST_RND   = 3'd5;
    localparam ST_OUT   = 3'd6;

    reg [2:0] state;

    reg [CW-1:0] count;

    reg signed [31:0] acc;
    reg signed [31:0] multiplier_reg;

    reg [5:0] shift_reg;
    reg relu_reg;

    reg signed [63:0] product_reg;
    reg [63:0] magnitude_reg;
    reg product_negative_reg;

    reg [63:0] quotient_reg;
    reg increment_reg;

    reg signed [63:0] rounded_reg;

    // --------------------------------------------------
    // INT8 multiplication and INT32 accumulation
    // --------------------------------------------------

    wire signed [15:0] product16 =
        $signed(feature_in) * $signed(weight_in);

    wire signed [31:0] product32 =
        {{16{product16[15]}}, product16};

    wire signed [31:0] sum =
        acc + product32;

    wire add_overflow =
        (~(acc[31] ^ product32[31])) &
        (acc[31] ^ sum[31]);

    // --------------------------------------------------
    // Registered wide multiplication
    // --------------------------------------------------

    wire signed [63:0] wide_product =
        $signed(acc) * $signed(multiplier_reg);

    // --------------------------------------------------
    // Requantization
    // --------------------------------------------------

    wire [63:0] magnitude =
        product_reg[63]
        ? (~product_reg + 64'd1)
        : product_reg;

    wire [63:0] divisor =
        64'd1 << shift_reg;

    wire [63:0] mask =
        divisor - 64'd1;

    wire [63:0] quotient =
        magnitude_reg >> shift_reg;

    wire [63:0] remainder =
        magnitude_reg & mask;

    wire [63:0] half =
        divisor >> 1;

    wire increment =
        (shift_reg != 6'd0) &&
        (
            (remainder > half) ||
            ((remainder == half) && quotient[0])
        );

    wire [63:0] rounded_mag =
        quotient_reg + {63'd0, increment_reg};

    wire signed [63:0] rounded =
        product_negative_reg
        ? -$signed(rounded_mag)
        : $signed(rounded_mag);

    // --------------------------------------------------
    // Saturation and activation
    // --------------------------------------------------

    wire signed [7:0] clipped =
        rounded_reg > 64'sd127
        ? 8'sd127
        : rounded_reg < -64'sd127
          ? -8'sd127
          : rounded_reg[7:0];

    wire signed [7:0] activated =
        (relu_reg && clipped < 8'sd0)
        ? 8'sd0
        : clipped;

    // --------------------------------------------------
    // Sequential controller
    // --------------------------------------------------

    always @(posedge clk) begin

        if (rst) begin

            state <= ST_IDLE;

            busy <= 1'b0;
            done <= 1'b0;

            result <= 8'sd0;
            overflow <= 1'b0;

            acc <= 32'sd0;
            count <= {CW{1'b0}};

            multiplier_reg <= 32'sd0;
            shift_reg <= 6'd0;
            relu_reg <= 1'b0;

            product_reg <= 64'sd0;
            magnitude_reg <= 64'd0;
            product_negative_reg <= 1'b0;

            quotient_reg <= 64'd0;
            increment_reg <= 1'b0;

            rounded_reg <= 64'sd0;

        end else begin

            done <= 1'b0;

            case (state)

                ST_IDLE: begin

                    busy <= 1'b0;

                    if (start) begin

                        busy <= 1'b1;

                        acc <= bias_in;
                        count <= {CW{1'b0}};

                        overflow <= 1'b0;

                        multiplier_reg <= multiplier_in;
                        shift_reg <= shift_in;
                        relu_reg <= relu_in;

                        state <= ST_ACC;

                    end

                end

                ST_ACC: begin

                    if (valid_in) begin

                        acc <= sum;

                        overflow <= overflow | add_overflow;

                        if (count == LAST_COUNT) begin
                            state <= ST_MUL;
                        end else begin
                            count <= count + 1'b1;
                        end

                    end

                end

                ST_MUL: begin

                    product_reg <= wide_product;

                    state <= ST_MAG;

                end

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

                ST_RND: begin

                    rounded_reg <= rounded;

                    state <= ST_OUT;

                end

                ST_OUT: begin

                    result <= activated;

                    done <= 1'b1;
                    busy <= 1'b0;

                    state <= ST_IDLE;

                end

                default: begin
                    state <= ST_IDLE;
                end

            endcase

        end

    end

endmodule
