#!/bin/bash
# =============================================================================
# 00_menu.sh - Menu principal do projeto AV2 (Linux Mint)
# =============================================================================
# Este script funciona como ponto de entrada do container e apresenta um
# menu interativo para acessar as demonstrações práticas desenvolvidas
# pela equipe, todas escritas em Shell Script (Bash).
# =============================================================================

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mostrar_cabecalho() {
    clear
    echo "============================================================"
    echo "   AV2 - Sistemas Operacionais | Linux Mint em Docker"
    echo "============================================================"
    echo
}

pausar() {
    echo
    read -rp "Pressione ENTER para voltar ao menu..." _
}

while true; do
    mostrar_cabecalho
    echo "Selecione uma opção:"
    echo
    echo "  1) Informações gerais do sistema (distribuição, host)"
    echo "  2) Estrutura de diretórios do Sistema Operacional (FHS)"
    echo "  3) Informações sobre o Kernel"
    echo "  4) Processos e uso de memória"
    echo "  5) Gerenciamento de pacotes (APT/dpkg)"
    echo "  6) Executar TODOS os scripts em sequência"
    echo "  0) Sair"
    echo
    read -rp "Opção: " opcao

    case "$opcao" in
        1) bash "$DIR/01_info_sistema.sh"        | less; pausar ;;
        2) bash "$DIR/02_estrutura_arquivos.sh"  | less; pausar ;;
        3) bash "$DIR/03_kernel_info.sh"         | less; pausar ;;
        4) bash "$DIR/04_processos_memoria.sh"   | less; pausar ;;
        5) bash "$DIR/05_pacotes.sh"             | less; pausar ;;
        6)
            for script in 01_info_sistema.sh 02_estrutura_arquivos.sh \
                          03_kernel_info.sh 04_processos_memoria.sh \
                          05_pacotes.sh; do
                bash "$DIR/$script"
                echo
                echo "------------------------------------------------------------"
                echo
            done | tee "$DIR/../saida_completa.txt" | less
            pausar
            ;;
        0) echo "Saindo..."; exit 0 ;;
        *) echo "Opção inválida!"; sleep 1 ;;
    esac
done
