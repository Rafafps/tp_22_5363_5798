`timescale 1ns/100ps

module risc_v(
    input clk,
    input reset
);
    wire [31:0] currentPC, nextPC, instruction;
    wire [4:0] rs1, rs2, rd;
    wire [31:0] readData1, readData2, writeData, immGen, aluResult, memData;
    wire regWrite, aluSrc, memWrite, branch, jump;
    wire [3:0] aluControl;
    wire zero;

    counter pc(
        .clk(clk),
        .reset(reset),
        .nextPC(nextPC),
        .currentPC(currentPC)
    );

    instruction_memory imem(
        .address(currentPC),
        .instruction(instruction)
    );

    reg_file regfile(
        .clk(clk),
        .rs1(instruction[19:15]),
        .rs2(instruction[24:20]),
        .rd(instruction[11:7]),
        .writeData(writeData),
        .regWrite(regWrite),
        .readData1(readData1),
        .readData2(readData2)
    );

    alu alu(
        .srcA(readData1),
        .srcB(aluSrc ? immGen : readData2),
        .aluControl(aluControl),
        .aluResult(aluResult),
        .zero(zero)
    );

    immgen immgen(
        .instruction(instruction),
        .immOut(immGen)
    );

    control_unit control(
        .opcode(instruction[6:0]),
        .funct3(instruction[14:12]),
        .funct7(instruction[31:25]),
        .aluControl(aluControl),
        .regWrite(regWrite),
        .aluSrc(aluSrc),
        .memWrite(memWrite),
        .branch(branch),
        .jump(jump)
    );

    data_memory dmem(
        .clk(clk),
        .memWrite(memWrite),
        .address(aluResult),
        .writeData(readData2),
        .readData(memData)
    );

    assign writeData = (jump || branch) ? memData : aluResult;
    assign nextPC = currentPC + 4;

endmodule
