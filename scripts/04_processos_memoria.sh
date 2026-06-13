#!/bin/bash
# =============================================================================
# 04_processos_memoria.sh - Processos e uso de memória
# =============================================================================
# Demonstra como o gerenciamento de processos e memória, realizado pelo
# kernel, pode ser observado através de ferramentas de espaço de usuário.
# =============================================================================

echo "############################################################"
echo "# 4. PROCESSOS E MEMÓRIA"
echo "############################################################"
echo

echo ">>> Processos em execução (ps aux - 10 primeiros):"
ps aux | head -n 11
echo

echo ">>> Total de processos em execução:"
ps aux --no-headers | wc -l
echo

echo ">>> Uso de memória (free -h):"
free -h
echo

echo ">>> Processo com maior uso de CPU neste instante:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
echo

echo ">>> Árvore de processos (pstree, se disponível):"
if command -v pstree >/dev/null 2>&1; then
    pstree -p | head -n 20
else
    ps -ejH | head -n 20
fi
echo
