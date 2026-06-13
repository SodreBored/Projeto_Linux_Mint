# AV2 - Sistemas Operacionais | Linux Mint em Docker

Projeto da Avaliação AV2 da disciplina de Sistemas Operacionais. O sistema
operacional escolhido pela equipe foi o **Linux Mint**, executado em um
**container Docker**, com demonstrações práticas escritas em **Shell Script
(Bash)**.

## 

## Estrutura do repositório

```
projeto-av2-linux-mint/
├── README.md
├── .gitignore
├── docker/
│   ├── Dockerfile          # Imagem do Linux Mint + ferramentas + scripts
│   ├── docker-compose.yml  # Build/execução simplificados
│   └── .dockerignore
├── scripts/
│   ├── 00\_menu.sh               # Menu interativo (ponto de entrada)
│   ├── 01\_info\_sistema.sh       # Informações gerais do sistema
│   ├── 02\_estrutura\_arquivos.sh # Estrutura de diretórios (FHS)
│   ├── 03\_kernel\_info.sh        # Informações e explicação do Kernel
│   ├── 04\_processos\_memoria.sh  # Processos e memória
│   └── 05\_pacotes.sh            # Gerenciamento de pacotes (APT/dpkg)
└── relatorio/
    ├── relatorio.tex   # Código-fonte do relatório em LaTeX
    └── relatorio.pdf   # Relatório final (gerado)
```

## Como executar (Docker)

> É necessário ter o \[Docker](https://www.docker.com/) instalado.

### Use no terminal:

```bash
docker compose -f docker/docker-compose.yml run --rm linuxmint-av2
```

Ao iniciar o container, o menu interativo (`00\_menu.sh`) será exibido
automaticamente, permitindo escolher qual demonstração executar:

```
============================================================
   AV2 - Sistemas Operacionais | Linux Mint em Docker
============================================================

Selecione uma opção:

  1) Informações gerais do sistema (distribuição, host)
  2) Estrutura de diretórios do Sistema Operacional (FHS)
  3) Informações sobre o Kernel
  4) Processos e uso de memória
  5) Gerenciamento de pacotes (APT/dpkg)
  6) Executar TODOS os scripts em sequência
  0) Sair
```

## Executando os scripts sem o Docker

Os scripts são compatíveis com qualquer distribuição baseada em
Debian/Ubuntu (como o próprio Linux Mint). Para executá-los diretamente
em uma máquina/VM com Linux Mint:

```bash
cd scripts
chmod +x \*.sh
./00\_menu.sh
```

## Gerando o relatório em PDF

O relatório foi escrito em LaTeX (`relatorio/relatorio.tex`). Para gerar o
PDF (`relatorio.pdf`), com o TeX Live instalado:

```bash
cd relatorio
pdflatex relatorio.tex
pdflatex relatorio.tex   # executar duas vezes para gerar o sumário
```

## Equipe

|Nome|Função no projeto|
|-|-|
|*Pedro Bertonha Sodré*|*ex.: Dockerfile e configuração do ambiente/ Relatório em LaTeX*|
|*Eduardo Silva*|*ex.: Scripts de estrutura do SO/ Versionamento e apresentação*|
|*Pedro Henrique*|*ex.: Scripts do Kernel*|

## 

## Licença

Projeto acadêmico, desenvolvido para fins educacionais na disciplina de
Sistemas Operacionais.

