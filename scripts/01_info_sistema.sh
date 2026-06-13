#!/bin/bash
# =============================================================================
# 01_info_sistema.sh - Informações gerais do Sistema Operacional
# =============================================================================
# Demonstra como obter informações básicas sobre a distribuição Linux Mint,
# a máquina (hostname) e o tempo de atividade do sistema.
# =============================================================================

echo "############################################################"
echo "# 1. INFORMAÇÕES GERAIS DO SISTEMA"
echo "############################################################"
echo

echo ">>> Distribuição (arquivo /etc/os-release):"
if [ -f /etc/os-release ]; then
    cat /etc/os-release
else
    echo "Arquivo /etc/os-release não encontrado."
fi
echo

echo ">>> Comando lsb_release (se disponível):"
if command -v lsb_release >/dev/null 2>&1; then
    lsb_release -a
else
    echo "lsb_release não está instalado."
fi
echo

echo ">>> Nome do host (hostname):"
hostname
echo

echo ">>> Tempo de atividade do sistema (uptime):"
uptime
echo

echo ">>> Data e hora atuais:"
date
echo

echo ">>> Arquitetura do processador:"
uname -m
echo
