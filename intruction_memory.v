`timescale 1ns/100ps


module instruction_memory(
    input [31:0] address,
    output reg [31:0] instruction
);
    reg [31:0] memory [0:255];
    
    initial begin
        // Carregar o programa (exemplo hardcoded)
        memory[0] = 32'b00000000000100000000000110010011; // addi x3, x0, 1
        memory[1] = 32'b00000000001000001000001000110011; // add x4, x1, x2
        // Adicionar mais instruções conforme necessário
    end
    
    always @(address) begin
        instruction = memory[address >> 2];
    end
endmodule
