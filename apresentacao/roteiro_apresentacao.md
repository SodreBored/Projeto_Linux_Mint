# Roteiro de Apresentação — AV2 (Linux Mint em Docker)

> Roteiro pensado para **uma pessoa apresentar tudo**, com tempo total
> estimado de **15 a 20 minutos**. Ajuste os tempos conforme o limite
> definido pelo professor.

---

## 0. Antes de começar (checklist)

Faça isso **antes** do dia da apresentação, com calma:

- [ ] Clonar o repositório do GitHub na máquina que será usada;
- [ ] Ter o Docker instalado e testado (`docker --version`);
- [ ] Rodar `docker build` e `docker run` pelo menos uma vez antes, para
      a imagem já estar em cache (evita demora/erros ao vivo);
- [ ] Deixar abertos, em abas/janelas separadas:
  - Terminal (para rodar o container);
  - Editor de código (para mostrar os scripts e o Dockerfile);
  - Navegador com o repositório no GitHub;
  - `relatorio.pdf` aberto em um leitor de PDF;
- [ ] **Plano B**: se o Docker não funcionar no dia (rede do laboratório,
      permissões etc.), tenha prints/gravação da tela rodando o container
      e os scripts. Os scripts também rodam direto em qualquer Mint/Ubuntu,
      sem Docker, caso precise.

---

## 1. Abertura (≈ 1 min)

**O que falar:**

> "Boa tarde/Bom dia. Nosso grupo desenvolveu o trabalho da AV2 utilizando
> o **Linux Mint** como sistema operacional, executado dentro de um
> **container Docker**. Vamos mostrar a estrutura do sistema operacional,
> explicar o funcionamento do Kernel, demonstrar os scripts em Shell Script
> que desenvolvemos, e por fim mostrar o repositório no GitHub e o
> relatório em LaTeX."

---

## 2. Por que Linux Mint + Docker (≈ 1–2 min)

**O que mostrar:** nada na tela ainda, ou o `Dockerfile` aberto no editor.

**O que falar:**

> "Escolhemos o Linux Mint por ser uma distribuição baseada em
> Ubuntu/Debian, muito usada em desktops, com o gerenciador de pacotes APT
> e o ambiente Cinnamon.
>
> Para a instalação, optamos pelo Docker em vez de uma máquina virtual
> completa, porque o Docker compartilha o kernel do hospedeiro e isola
> apenas o espaço de usuário — fica mais leve, mais rápido de montar e
> totalmente reproduzível, já que todo o ambiente está descrito em um
> arquivo de configuração: o `Dockerfile`."

Mostre rapidamente o arquivo `docker/Dockerfile`, apontando:
- a imagem base (`linuxmintd/mint21.3-amd64`);
- a instalação de ferramentas extras;
- a cópia dos scripts para dentro do container;
- o comando padrão (`CMD`) que abre o menu.

---

## 3. Subindo o container (≈ 2–3 min) — DEMONSTRAÇÃO

**O que mostrar:** terminal.

**Comando:**

```bash
docker compose -f docker/docker-compose.yml run --rm linuxmint-av2
```

**O que falar enquanto sobe:**

> "Esse comando constrói a imagem (caso ainda não exista) e já inicia o
> container. Ao entrar, o próprio container abre automaticamente o nosso
> menu interativo, escrito em Shell Script, que vai nos guiar pelas
> próximas demonstrações."

Quando o menu aparecer, explique rapidamente as opções disponíveis (1 a 6)
sem entrar ainda nos detalhes — elas serão usadas nas próximas seções.

---

## 4. Estrutura do Sistema Operacional (≈ 2–3 min)

**O que mostrar:** opção **2** do menu (`02_estrutura_arquivos.sh`).

**O que falar:**

> "Aqui mostramos a estrutura de diretórios do Linux Mint, que segue o
> padrão FHS — *Filesystem Hierarchy Standard*, comum a praticamente todas
> as distribuições Linux."

Aponte para a saída na tela e destaque 3 ou 4 diretórios, por exemplo:

- **`/etc`** → arquivos de configuração do sistema;
- **`/home`** → diretórios pessoais dos usuários;
- **`/proc`** e **`/sys`** → sistemas de arquivos *virtuais*, que expõem
  informações do kernel e dos processos em tempo real (não ocupam espaço
  em disco);
- **`/usr`** e **`/var`** → onde fica a maior parte dos programas e dos
  dados variáveis (logs, cache).

> "Essa organização em camadas — hardware, kernel, shell/bibliotecas e
> aplicações — é o que vamos detalhar a seguir, com foco no Kernel."

---

## 5. O Kernel (≈ 3–4 min) — ponto central da apresentação

**O que mostrar:** opção **3** do menu (`03_kernel_info.sh`).

**O que falar (introdução):**

> "O Kernel é o núcleo do sistema operacional: é ele que faz a ponte entre
> o hardware e os programas. O Linux usa um kernel do tipo **monolítico
> modular** — os principais serviços (processos, memória, arquivos, rede)
> rodam no mesmo espaço privilegiado, mas podem ser estendidos por
> **módulos** carregados dinamicamente, sem precisar reiniciar o sistema."

**Durante a saída do script, destaque:**

- `uname -a` → mostra a versão do kernel em execução;
- `/proc/version` → mostra com qual compilador o kernel foi gerado;
- `lsmod` → lista os módulos carregados no momento;
- `/sys/class` → dispositivos gerenciados pelo kernel.

**Fale as 5 funções principais do kernel** (pode ler direto da saída do
script, que já as explica):

1. **Gerenciamento de processos** — decide qual processo usa a CPU
   (*scheduler*);
2. **Gerenciamento de memória** — controla RAM, memória virtual e swap;
3. **Gerenciamento de dispositivos** — comunica com o hardware via
   drivers/módulos;
4. **Sistema de arquivos** — implementa `open`, `read`, `write`, `close`;
5. **Comunicação entre processos e rede** — pipes, sinais, TCP/IP.

---

## 6. Linguagem utilizada: Shell Script (≈ 2 min)

**O que mostrar:** abra um dos scripts no editor (sugestão:
`scripts/02_estrutura_arquivos.sh` ou `03_kernel_info.sh`).

**O que falar:**

> "Para automatizar todas essas demonstrações, usamos **Shell Script
> (Bash)** — a linguagem nativa do Linux para interagir com o sistema. Ela
> não exige nada além do que já vem instalado no Mint, e é exatamente a
> linguagem usada por administradores de sistemas no dia a dia."

Mostre rapidamente uma parte do código, destacando:
- o uso de comandos do sistema (`ls`, `cat`, `uname`, `ps`, `free`...);
- verificações com `if command -v ... >/dev/null`, que tornam os scripts
  mais robustos (funcionam mesmo se alguma ferramenta não estiver
  instalada);
- o uso de `cat <<'EOF' ... EOF` para imprimir blocos de texto explicativo.

---

## 7. Processos e memória (≈ 1–2 min)

**O que mostrar:** opção **4** do menu (`04_processos_memoria.sh`).

**O que falar:**

> "Aqui vemos, na prática, o gerenciamento de processos e memória feito
> pelo kernel: a lista de processos em execução (`ps aux`), o uso de
> memória RAM (`free -h`) e a árvore de processos (`pstree`), mostrando
> como cada processo é filho de outro até chegar ao processo inicial."

---

## 8. Gerenciamento de pacotes (≈ 1–2 min)

**O que mostrar:** opção **5** do menu (`05_pacotes.sh`).

**O que falar:**

> "O Linux Mint herda do Ubuntu/Debian o sistema de pacotes **APT/dpkg**.
> O `dpkg` é a ferramenta de baixo nível, que instala arquivos `.deb`
> individuais, enquanto o `APT` resolve as dependências automaticamente e
> baixa os pacotes dos repositórios configurados em
> `/etc/apt/sources.list`."

---

## 9. Versionamento — Git e GitHub (≈ 1–2 min)

**O que mostrar:** navegador, repositório do projeto no GitHub.

**O que falar:**

> "Todo o material — Dockerfile, scripts e relatório — foi versionado com
> Git e está hospedado no GitHub. Aqui vemos o histórico de commits, que
> mostra a evolução do projeto, e a estrutura de pastas: `docker/` para o
> ambiente, `scripts/` para as demonstrações em Shell Script e
> `relatorio/` para o relatório em LaTeX."

Mostre rapidamente a estrutura de pastas e, se der tempo, 1 ou 2 commits no
histórico.

---

## 10. Relatório em LaTeX (≈ 1 min)

**O que mostrar:** `relatorio.pdf` aberto.

**O que falar:**

> "Por fim, todo o conteúdo apresentado — estrutura do sistema operacional,
> funcionamento do kernel, scripts desenvolvidos e o processo de
> versionamento — está documentado em detalhes no nosso relatório,
> produzido em LaTeX."

Passe rapidamente pelo sumário e por 1–2 seções (ex.: a tabela do FHS e a
seção do Kernel), sem ler o texto inteiro.

---

## 11. Encerramento (≈ 30 s)

**O que falar:**

> "Com isso encerramos a apresentação do nosso projeto: Linux Mint
> executado em Docker, com a estrutura do sistema operacional, o
> funcionamento do Kernel, scripts em Shell Script, versionamento no
> GitHub e relatório em LaTeX. Ficamos à disposição para perguntas."

---

## 12. Possíveis perguntas e respostas rápidas

| Pergunta provável | Resposta curta |
|---|---|
| Por que Docker e não uma VM completa? | Docker compartilha o kernel do hospedeiro, é mais leve, sobe em segundos e o ambiente fica 100% descrito no Dockerfile (reprodutível). |
| Qual a diferença entre kernel monolítico e microkernel? | No monolítico, todos os serviços (processos, memória, drivers, rede) rodam no mesmo espaço privilegiado; no microkernel, só o essencial fica no núcleo e o resto roda como processos isolados em espaço de usuário. |
| O que é um módulo do kernel? | É um pedaço de código (arquivo `.ko`) que pode ser carregado/removido do kernel em tempo de execução, geralmente um driver, sem precisar recompilar ou reiniciar o sistema. |
| Por que `/proc` e `/sys` não ocupam espaço em disco? | Porque são sistemas de arquivos *virtuais*: o conteúdo é gerado pelo kernel em tempo real, na memória, e não fica salvo no disco. |
| Por que escolheram Shell Script e não outra linguagem? | É a linguagem nativa de administração do Linux, já vem instalada (Bash), e dá acesso direto a comandos do sistema e aos arquivos virtuais do kernel. |
| O container "é" o Linux Mint mesmo? | Sim, o sistema de arquivos e os pacotes são do Linux Mint; o que é compartilhado com o hospedeiro é apenas o kernel (o container não tem o seu próprio kernel, diferente de uma VM). |

---

## 13. Cronograma resumido (referência rápida)

| Etapa | Tempo |
|---|---|
| 1. Abertura | 1 min |
| 2. Linux Mint + Docker (por quê) | 1–2 min |
| 3. Subir o container (demo) | 2–3 min |
| 4. Estrutura do SO (FHS) | 2–3 min |
| 5. Kernel | 3–4 min |
| 6. Shell Script | 2 min |
| 7. Processos e memória | 1–2 min |
| 8. Pacotes (APT/dpkg) | 1–2 min |
| 9. GitHub | 1–2 min |
| 10. Relatório LaTeX | 1 min |
| 11. Encerramento | 30 s |
| **Total** | **≈ 16–22 min** |
