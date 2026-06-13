#!/bin/bash
# =============================================================================
# 02_estrutura_arquivos.sh - Estrutura de diretórios do Sistema Operacional
# =============================================================================
# O Linux Mint, assim como outras distribuições Linux, segue o padrão
# FHS (Filesystem Hierarchy Standard). Este script lista os diretórios
# da raiz "/" e explica a função de cada um.
# =============================================================================

echo "############################################################"
echo "# 2. ESTRUTURA DE DIRETÓRIOS (FHS - Filesystem Hierarchy Standard)"
echo "############################################################"
echo

echo ">>> Conteúdo da raiz '/':"
ls -lh /
echo

echo ">>> Descrição de cada diretório principal:"
cat <<'EOF'

/bin    -> Binários essenciais usados por todos os usuários
           (ex.: ls, cp, mv, cat). No Mint, é um link para /usr/bin.
/boot   -> Arquivos necessários para o boot: kernel (vmlinuz),
           initramfs e arquivos do gerenciador de boot (GRUB).
/dev    -> Arquivos de dispositivo (representam discos, terminais,
           periféricos). Ex.: /dev/sda, /dev/null.
/etc    -> Arquivos de configuração do sistema e dos aplicativos
           (ex.: /etc/passwd, /etc/fstab, /etc/apt/sources.list).
/home   -> Diretórios pessoais dos usuários comuns
           (ex.: /home/usuario).
/lib    -> Bibliotecas compartilhadas necessárias pelos binários
           de /bin e /sbin (link para /usr/lib).
/media  -> Pontos de montagem automáticos para mídias removíveis
           (pen drives, CDs).
/mnt    -> Ponto de montagem temporário para sistemas de arquivos
           montados manualmente.
/opt    -> Pacotes de softwares opcionais/adicionais, geralmente
           de terceiros.
/proc   -> Sistema de arquivos virtual que expõe informações do
           kernel e dos processos em execução (não ocupa espaço
           em disco).
/root   -> Diretório pessoal do superusuário (root).
/run    -> Dados de tempo de execução desde o último boot
           (PIDs, sockets).
/sbin   -> Binários essenciais de administração do sistema
           (uso normalmente restrito ao root).
/srv    -> Dados de serviços oferecidos pelo sistema
           (ex.: arquivos de um servidor web).
/sys    -> Sistema de arquivos virtual que expõe informações
           sobre dispositivos e drivers do kernel.
/tmp    -> Arquivos temporários, geralmente apagados a cada boot.
/usr    -> Hierarquia secundária: programas, bibliotecas,
           documentação para os usuários (a maior parte do
           sistema fica aqui).
/var    -> Dados variáveis: logs (/var/log), caches, filas de
           e-mail, bancos de dados de pacotes.

EOF

echo ">>> Visão em árvore de /etc (2 níveis) - exemplo de configuração:"
if command -v tree >/dev/null 2>&1; then
    tree -L 2 /etc | head -n 40
else
    find /etc -maxdepth 2 | head -n 40
fi
echo

echo ">>> Tamanho ocupado pelos principais diretórios (/):"
du -sh /bin /etc /home /lib /opt /usr /var 2>/dev/null
echo
