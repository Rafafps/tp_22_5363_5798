`timescale 1ns/100ps

module risc_v_TB;
    reg clk;
    reg reset;
    
    risc_v uut (
        .clk(clk),
        .reset(reset)
    );
    
    initial begin
        // Inicialização
        clk = 0;
        reset = 1;
        
        // Soltar o reset
        #5 reset = 0;
        
        // Rodar o clock
        forever #5 clk = ~clk;
    end
    
    initial begin
        // Monitoramento de variáveis importantes
        $monitor("Time: %0t | PC: %h | Instruction: %h", $time, uut.currentPC, uut.instruction);
        
        // Simulação durante 100 ciclos de clock
        #100 $finish;
    end

    // Gerar arquivo VCD
    initial begin
        $dumpfile("risc_v_TB.vcd"); // Nome do arquivo VCD
        $dumpvars(0, risc_v_TB); // Nível de hierarquia a ser registrado (0 para todo o módulo)
    end
endmodule
