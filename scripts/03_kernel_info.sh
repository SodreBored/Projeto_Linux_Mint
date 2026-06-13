#!/bin/bash
# =============================================================================
# 03_kernel_info.sh - Informações sobre o Kernel Linux
# =============================================================================
# Demonstra como consultar a versão do kernel, módulos carregados,
# parâmetros do kernel e informações de hardware expostas pelo kernel
# através dos sistemas de arquivos virtuais /proc e /sys.
# =============================================================================

echo "############################################################"
echo "# 3. INFORMAÇÕES SOBRE O KERNEL"
echo "############################################################"
echo

echo ">>> Versão do kernel (uname -a):"
uname -a
echo

echo ">>> Versão do kernel detalhada (/proc/version):"
cat /proc/version 2>/dev/null
echo

echo ">>> Módulos do kernel atualmente carregados (lsmod):"
if command -v lsmod >/dev/null 2>&1; then
    lsmod | head -n 15
    echo "... (lista truncada, use 'lsmod' completo para ver tudo)"
else
    echo "Comando lsmod não disponível neste ambiente (container)."
fi
echo

echo ">>> Parâmetros do kernel em tempo de execução (sysctl - amostra):"
if command -v sysctl >/dev/null 2>&1; then
    sysctl kernel.ostype kernel.osrelease kernel.version 2>/dev/null
else
    echo "Comando sysctl não disponível."
fi
echo

echo ">>> Informações de CPU vistas pelo kernel (/proc/cpuinfo - resumo):"
grep -m1 -E "model name|processor|cpu cores" /proc/cpuinfo 2>/dev/null
echo

echo ">>> Informações de memória vistas pelo kernel (/proc/meminfo - resumo):"
head -n 5 /proc/meminfo 2>/dev/null
echo

echo ">>> Árvore de dispositivos exposta pelo kernel (/sys/class - amostra):"
ls /sys/class 2>/dev/null | head -n 15
echo

cat <<'EOF'
>>> Sobre o Kernel Linux:

O kernel é o núcleo do sistema operacional: o software responsável por
intermediar a comunicação entre o hardware e os programas (software de
aplicação). O Linux utiliza um kernel do tipo MONOLÍTICO MODULAR, ou
seja, todos os principais serviços (escalonamento de processos,
gerenciamento de memória, sistema de arquivos, rede, drivers) rodam no
mesmo espaço de endereçamento privilegiado (kernel space), mas podem ser
estendidos dinamicamente por meio de MÓDULOS (arquivos .ko), sem a
necessidade de recompilar o kernel inteiro.

Principais responsabilidades do kernel:

  1. Gerenciamento de processos: cria, escalona e finaliza processos,
     decidindo qual processo usa a CPU em cada instante (scheduler).
  2. Gerenciamento de memória: controla a memória RAM, memória virtual,
     paginação e swap, isolando o espaço de memória de cada processo.
  3. Gerenciamento de dispositivos: comunica-se com o hardware através
     de drivers (módulos do kernel), expondo os dispositivos em /dev.
  4. Sistema de arquivos: implementa os sistemas de arquivos (ext4,
     btrfs, etc.) e fornece a interface de chamadas de sistema
     (system calls) para leitura/escrita de arquivos.
  5. Comunicação entre processos (IPC) e rede: implementa pipes,
     sockets e a pilha de protocolos TCP/IP.

No Linux Mint, o kernel é o mesmo kernel Linux utilizado pelo Ubuntu
(a distribuição na qual o Mint é baseado), normalmente disponível em
/boot/vmlinuz-<versão>.
EOF
echo
