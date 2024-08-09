# Implementação do Caminho de Dados Simplificado para Processador RISC-V

## Descrição

Este projeto visa a implementação de um caminho de dados simplificado para um processador RISC-V, focado em um subconjunto específico de instruções: `lb`, `sb`, `sub`, `and`, `ori`, `srl`, e `beq`. O objetivo é criar uma arquitetura funcional que suporta essas instruções, utilizando a linguagem de descrição de hardware SystemVerilog/Verilog.

## Estrutura do Projeto

O projeto está dividido nas seguintes seções:

- **Caminho de Dados**: Implementação da arquitetura de caminho de dados para o processador RISC-V, incluindo a Unidade Lógica e Aritmética (ULA), Banco de Registradores, Memória de Dados, Multiplexadores, Unidade de Controle e Contador de Programa (PC).

### Componentes

1. **Unidade Lógica e Aritmética (ULA)**: Realiza operações aritméticas e lógicas.
2. **Banco de Registradores**: Contém registradores para armazenar operandos e resultados.
3. **Memória de Dados**: Utilizada para operações de carga e armazenamento.
4. **Multiplexadores (MUX)**: Seleciona entre diferentes fontes de dados.
5. **Unidade de Controle**: Gera sinais de controle para coordenar o fluxo de dados.
6. **Contador de Programa (PC)**: Mantém o endereço da próxima instrução.

## Requisitos

- **SystemVerilog/Verilog**: Linguagem de descrição de hardware utilizada para a implementação.
- **Ferramentas de Simulação**: Para testar a implementação do caminho de dados.
- **Documentação**: Inclui diagramas e descrições dos componentes implementados.

## Instruções de Uso

1. **Clone o Repositório**

   ```bash
   git clone <URL-do-repositorio>

2. **Compilação (comandos)**  
    ```bash
    iverilog -o risc_v_TB.vvp *.v
   vvp risc_v_TB.vvp
    gtkwave risc_v_TB.vcd
