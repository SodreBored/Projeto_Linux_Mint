# AV2 - Sistemas Operacionais | Linux Mint em Docker

Projeto da Avaliação AV2 da disciplina de Sistemas Operacionais. O sistema
operacional escolhido pela equipe foi o **Linux Mint**, executado em um
**container Docker**, com demonstrações práticas escritas em **Shell Script
(Bash)**.

## Itens do trabalho atendidos

- [x] Sistema operacional instalado em Docker (Linux Mint 21.3 "Una")
- [x] Estrutura do SO apresentada (hierarquia de diretórios / FHS)
- [x] Explicação sobre o Kernel (tipo, funções, observação prática)
- [x] Demonstrações em Shell Script
- [x] Versionamento no GitHub
- [x] Relatório em LaTeX (`relatorio/relatorio.tex` / `relatorio/relatorio.pdf`)

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
│   ├── 00_menu.sh               # Menu interativo (ponto de entrada)
│   ├── 01_info_sistema.sh       # Informações gerais do sistema
│   ├── 02_estrutura_arquivos.sh # Estrutura de diretórios (FHS)
│   ├── 03_kernel_info.sh        # Informações e explicação do Kernel
│   ├── 04_processos_memoria.sh  # Processos e memória
│   └── 05_pacotes.sh            # Gerenciamento de pacotes (APT/dpkg)
└── relatorio/
    ├── relatorio.tex   # Código-fonte do relatório em LaTeX
    └── relatorio.pdf   # Relatório final (gerado)
```

## Como executar (Docker)

> É necessário ter o [Docker](https://www.docker.com/) instalado.

### Opção 1 - Docker Compose (recomendado)

```bash
docker compose -f docker/docker-compose.yml run --rm linuxmint-av2
```

### Opção 2 - Docker "puro"

```bash
# Construir a imagem
docker build -t linuxmint-av2 -f docker/Dockerfile .

# Executar o container interativamente
docker run -it --rm linuxmint-av2
```

Ao iniciar o container, o menu interativo (`00_menu.sh`) será exibido
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
chmod +x *.sh
./00_menu.sh
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

| Nome | Função no projeto |
|------|--------------------|
| _Integrante 1_ | _ex.: Dockerfile e configuração do ambiente_ |
| _Integrante 2_ | _ex.: Scripts de estrutura do SO_ |
| _Integrante 3_ | _ex.: Scripts do Kernel_ |
| _Integrante 4_ | _ex.: Relatório em LaTeX_ |
| _Integrante 5_ | _ex.: Versionamento e apresentação_ |

> Edite a tabela acima com os nomes reais dos integrantes da equipe (máx. 10
> pessoas, conforme as regras da AV2).

## Licença

Projeto acadêmico, desenvolvido para fins educacionais na disciplina de
Sistemas Operacionais.
