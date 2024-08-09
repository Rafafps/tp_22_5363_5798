Implementação do Caminho de Dados Simplificado para Processador RISC-V
Descrição
Este projeto visa a implementação de um caminho de dados simplificado para um processador RISC-V, focado em um subconjunto específico de instruções: lb, sb, sub, and, ori, srl, e beq. O objetivo é criar uma arquitetura funcional que suporta essas instruções, utilizando a linguagem de descrição de hardware SystemVerilog/Verilog.

Estrutura do Projeto
O projeto está dividido nas seguintes seções:

Caminho de Dados: Implementação da arquitetura de caminho de dados para o processador RISC-V, incluindo a Unidade Lógica e Aritmética (ULA), Banco de Registradores, Memória de Dados, Multiplexadores, Unidade de Controle e Contador de Programa (PC).

Componentes:

Unidade Lógica e Aritmética (ULA): Realiza operações aritméticas e lógicas.
Banco de Registradores: Contém registradores para armazenar operandos e resultados.
Memória de Dados: Utilizada para operações de carga e armazenamento.
Multiplexadores (MUX): Seleciona entre diferentes fontes de dados.
Unidade de Controle: Gera sinais de controle para coordenar o fluxo de dados.
Contador de Programa (PC): Mantém o endereço da próxima instrução.
Requisitos
SystemVerilog/Verilog: Linguagem de descrição de hardware utilizada para a implementação.
Ferramentas de Simulação: Para testar a implementação do caminho de dados.
Documentação: Inclui diagramas e descrições dos componentes implementados.
Instruções de Uso
Clone o Repositório

bash
Copiar código
git clone <URL-do-repositorio>
Navegue até o Diretório do Projeto

bash
Copilar código
iverilog -o risc_v_TB.vvp *.v
vvp risc_v_TB.vvp
gtkwave risc_v_TB.vcd
Compile e Simule

Utilize as ferramentas de simulação de sua escolha para compilar e testar o código em SystemVerilog/Verilog.

Verifique os Resultados

Consulte os resultados das simulações e verifique a funcionalidade dos componentes implementados.

Estrutura de Diretórios
src/: Contém o código fonte em SystemVerilog/Verilog.
docs/: Documentação adicional, incluindo diagramas e relatórios.
tests/: Scripts e arquivos para testes e simulações.
Contribuições
Se você deseja contribuir para este projeto, por favor, siga estas etapas:

Faça um fork do repositório.
Crie uma branch para sua feature ou correção.
Faça suas alterações e adicione testes.
Envie um pull request descrevendo suas alterações.
Contato
Para mais informações ou perguntas, entre em contato com:

Rafaella Ferreira: rafaella.ferreira@ufv.br
Daniel Martins: daniel.martins@ufv.br
Licença
Este projeto é licenciado sob a Licença XYZ. Veja o arquivo LICENSE para mais detalhes.
