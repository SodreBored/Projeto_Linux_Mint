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


## Equipe

João Victor Araujo dos Santos
Ruan Welisson Nazário Teles
Guilherme Virgílio de Moura Alves
Pedro Henrique Mendes de Oliveira
Ivano Gabriel Silva Melo
Cauã Manoel Nogueira de Aguiar
Eduardo dos Santos Silva
Pedro Bertonha Sodré
Matheus Kayke da Silva Marinho Mariano
Lucas da Silva Fernandes

## 

## Licença

Projeto acadêmico, desenvolvido para fins educacionais na disciplina de
Sistemas Operacionais.

