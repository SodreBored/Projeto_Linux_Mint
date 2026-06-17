# =============================================================================
# Dockerfile - Linux Mint (AV2 - Sistemas Operacionais)
# =============================================================================
# Este Dockerfile cria um container com o Linux Mint, instala as ferramentas
# necessárias para explorar a estrutura do sistema operacional e o kernel,
# e copia os scripts shell desenvolvidos pela equipe.
#
# Imagem base: linuxmintd/mint21.3-amd64 (imagem mantida pela comunidade,
# baseada no Ubuntu 22.04 / Linux Mint 21.3 "Virginia")
# =============================================================================

FROM linuxmintd/mint21.3-amd64:latest

LABEL maintainer="Equipe AV2 - Sistemas Operacionais"
LABEL description="Ambiente Linux Mint para estudo de estrutura de SO e Kernel"

# Evita prompts interativos durante a instalação de pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Atualiza os repositórios e instala ferramentas usadas pelos scripts
RUN apt-get update && apt-get install -y \
        htop \
        tree \
        neofetch \
        net-tools \
        procps \
        nano \
        less \
        man-db \
        kmod \
        dos2unix \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Diretório de trabalho dentro do container
WORKDIR /projeto

# Copia os scripts shell para dentro do container
COPY scripts/ /projeto/scripts/

# Converte terminacoes de linha CRLF (Windows) para LF (Unix) e
# garante que todos os scripts tenham permissao de execucao.
# Isso evita o erro "$'\r': command not found" caso os arquivos
# tenham sido editados/salvos no Windows.
RUN dos2unix /projeto/scripts/*.sh \
    && chmod +x /projeto/scripts/*.sh

# Mensagem de boas-vindas + menu interativo ao iniciar o container
CMD ["/bin/bash", "/projeto/scripts/00_menu.sh"]
