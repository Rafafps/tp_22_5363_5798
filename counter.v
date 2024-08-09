`timescale 1ns/100ps

module counter(
    input clk,
    input reset,
    input [31:0] nextPC,
    output reg [31:0] currentPC
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            currentPC <= 32'b0;
        else
            currentPC <= nextPC;
    end
endmodule
