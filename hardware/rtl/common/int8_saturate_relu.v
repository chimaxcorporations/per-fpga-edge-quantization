`timescale 1ns/1ps
// P3-M04-02D: combinational symmetric INT8 saturation and optional ReLU.
// No pipeline register. Input is signed INT64 from Q31 requantization.
module int8_saturate_relu (
    input  wire signed [63:0] data_in,
    input  wire               relu_enable,
    output wire signed [7:0]  data_out
);
    wire signed [7:0] saturated;
    assign saturated = (data_in > 64'sd127)  ? 8'sd127 :
                       (data_in < -64'sd127) ? -8'sd127 :
                       data_in[7:0];
    assign data_out = (relu_enable && (saturated < 8'sd0)) ? 8'sd0 : saturated;
endmodule
