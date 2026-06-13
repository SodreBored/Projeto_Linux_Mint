#!/bin/bash
# =============================================================================
# 05_pacotes.sh - Gerenciamento de pacotes (APT / dpkg)
# =============================================================================
# O Linux Mint é baseado em Ubuntu/Debian e utiliza o sistema de
# gerenciamento de pacotes APT (Advanced Package Tool), que por sua vez
# utiliza o dpkg como ferramenta de baixo nível.
# =============================================================================

echo "############################################################"
echo "# 5. GERENCIAMENTO DE PACOTES (APT/dpkg)"
echo "############################################################"
echo

echo ">>> Versão do gerenciador de pacotes APT:"
apt --version 2>/dev/null | head -n 1
echo

echo ">>> Quantidade de pacotes instalados (dpkg):"
dpkg -l 2>/dev/null | grep -c '^ii'
echo

echo ">>> Exemplos de pacotes instalados (10 primeiros):"
dpkg -l 2>/dev/null | grep '^ii' | awk '{print $2, $3}' | head -n 10
echo

echo ">>> Repositórios configurados (/etc/apt/sources.list - resumo):"
if [ -f /etc/apt/sources.list ]; then
    grep -v '^#' /etc/apt/sources.list | grep -v '^$' | head -n 5
else
    echo "Arquivo sources.list não encontrado."
fi
echo

cat <<'EOF'
>>> Sobre o gerenciamento de pacotes:

  - dpkg : ferramenta de baixo nível, instala/remove arquivos .deb
           individuais, mas não resolve dependências automaticamente.
  - APT  : camada de alto nível sobre o dpkg, resolve dependências e
           baixa pacotes dos repositórios configurados.

Comandos úteis (executar com privilégios de root dentro do container):
  apt update                -> atualiza a lista de pacotes disponíveis
  apt upgrade               -> atualiza os pacotes instalados
  apt install <pacote>      -> instala um novo pacote
  apt remove <pacote>       -> remove um pacote
  dpkg -l                   -> lista pacotes instalados
  dpkg -L <pacote>          -> lista arquivos de um pacote instalado
EOF
echo
