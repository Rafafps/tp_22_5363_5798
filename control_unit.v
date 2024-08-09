`timescale 1ns/100ps

module control_unit(
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg [3:0] aluControl,
    output reg regWrite,
    output reg aluSrc,
    output reg memWrite,
    output reg branch,
    output reg jump
);
    always @(*) begin
        // Inicializando os sinais de controle
        aluControl = 4'b0000;
        regWrite = 0;
        aluSrc = 0;
        memWrite = 0;
        branch = 0;
        jump = 0;

        case (opcode)
            7'b0110011: begin // Tipo-R (ADD, SUB, AND, OR, SLL)
                regWrite = 1;
                case (funct3)
                    3'b000: aluControl = (funct7 == 7'b0000000) ? 4'b0000 : 4'b0001; // ADD ou SUB
                    3'b111: aluControl = 4'b0010; // AND
                    3'b110: aluControl = 4'b0011; // OR
                    3'b001: aluControl = 4'b0101; // SLL
                    default: aluControl = 4'b0000;
                endcase
            end
            7'b0010011: begin // Tipo-I (ADDI, ANDI)
                regWrite = 1;
                aluSrc = 1;
                case (funct3)
                    3'b000: aluControl = 4'b0000; // ADDI
                    3'b111: aluControl = 4'b0010; // ANDI
                    default: aluControl = 4'b0000;
                endcase
            end
            7'b0100011: begin // Tipo-S (SB)
                memWrite = 1;
                aluSrc = 1;
                aluControl = 4'b0000; // Soma base+offset
            end
            7'b1100011: begin // Tipo-B (BEQ)
                branch = 1;
                case (funct3)
                    3'b000: aluControl = 4'b0001; // BEQ (usa SUB para comparação)
                    default: aluControl = 4'b0000;
                endcase
            end
            7'b1101111: begin // JAL
                jump = 1;
            end
            default: begin
                aluControl = 4'b0000;
                regWrite = 0;
                aluSrc = 0;
                memWrite = 0;
                branch = 0;
                jump = 0;
            end
        endcase
    end
endmodule
