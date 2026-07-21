# Blackbox de Auditoria — V4

Kit de auditoria da V4. Você copia esta pasta, dá o nome do cliente e a IA conduz a auditoria do começo ao fim: pergunta o contexto, descobre como pegar os dados, audita frente por frente contra um gabarito e entrega o relatório final.

**8 frentes:** Campanhas · Criativos · CRM · Landing Page · Site · Google Meu Negócio · SEO/GEO · E-commerce.

Funciona em **Claude Code, Codex, Antigravity e Gemini**. E funciona **sem IA nenhuma** — cada planilha é autossuficiente.

---

## Começando

**1.** Baixe: botão verde **Code → Download ZIP** (ou `git clone`).
**2.** Renomeie a pasta para o cliente: `auditoria-nome-do-cliente`. Um cliente, uma cópia.
**3.** Abra a pasta na sua IA.
**4.** Escreva: **`iniciar auditoria`**

Daí em diante a IA assume. Ela pergunta o que auditar, por quê, o contexto do cliente e como obter os dados — e conduz.

| IA | Como começar |
|---|---|
| **Claude Code** | `/iniciar` ou "iniciar auditoria" |
| **Codex** | "iniciar auditoria do cliente X" — carrega sozinho |
| **Antigravity** | "iniciar auditoria" — carrega sozinho |
| **Gemini CLI** | "iniciar auditoria" — ativa a habilidade |

---

## Leia isto antes de rodar a primeira vez

**A auditoria é sua. A IA é a ferramenta.**

Quem assina o diagnóstico é o coordenador — a IA acelera, padroniza e aponta onde olhar, mas **nenhum achado vai pro cliente sem alguém do time ter validado na plataforma**. Duas frases merecem o mesmo cuidado: *"a IA falou, então está certo"* e *"a IA errou"* — nenhuma das duas se sabe sem abrir a plataforma e conferir. Todo achado sai com fonte, janela, valor e status justamente para essa conferência levar 2 minutos. Caso real das primeiras auditorias: pontos dados como "já feitos" não estavam feitos, e um achado correto de Google Ads foi lido como "erro da IA sobre o Meta" por falta de rótulo. Nos dois casos, abrir a plataforma teria resolvido em minutos. Regra prática: os pontos **Críticos, confira todos** antes de apresentar.

**A blackbox não é um botão. É uma auditoria feita a quatro mãos.**

A IA sabe o método, os benchmarks e onde olhar. Você sabe do cliente: o histórico, o que já foi tentado, o que o comercial escuta, por que aquela campanha existe. A auditoria boa sai do encontro dos dois — e ela vai te perguntar isso o tempo todo.

**Converse durante a auditoria.** Ao fim de cada frente a IA para, resume em linguagem simples e pergunta se fez sentido. Esse é o momento mais importante: é onde você entende a lógica e onde você corrige a leitura dela com o que só você sabe.

**Pergunte tudo que não entender.** Não existe pergunta boba aqui — "o que é EMQ?", "por que frequência 4 é ruim?", "por que isso é crítico e aquilo não?". A IA é obrigada a traduzir o jargão e explicar o mecanismo, não só dar o veredito. Se ela usar uma sigla sem explicar, cobre.

**Por que isso importa de verdade:** você vai apresentar essa auditoria para o cliente. Achado que você não consegue explicar com as suas palavras é achado que cai na primeira pergunta dele. Se ao fim você não sabe defender o diagnóstico, a auditoria não terminou — volte e pergunte.

**Discorde quando achar que está errado.** Você conhece o cliente. Se um achado não bate com a realidade, diga — a IA vai mostrar a evidência que a levou até ali, e muitas vezes o seu contexto é o que muda o veredito. Isso melhora a auditoria, não atrapalha.

**Compartilhe com quem opera.** Leve os achados para o gestor de tráfego, para o comercial, para quem responde as avaliações do Google. Auditoria discutida vira ação; auditoria entregue por e-mail vira arquivo.

---

## O que cada frente audita

### Campanhas — a conta
Mensuração (pixel/tag, eventos, CAPI e conversões server-side, UTMs, consentimento, janela de atribuição), estrutura e nomenclatura, separação por etapa de funil, públicos e sobreposição, orçamento e lances, métricas contra benchmark **e** contra o CPA-alvo real do cliente. Abas por plataforma: Meta, Google, LinkedIn, TikTok, mais uma de fundamentos que vale para todos os canais.

### Criativos — a peça
Baixa os anúncios que estão no ar e julga **um por um**. No Meta, pela Biblioteca de Anúncios — pública, basta o @ da página, não precisa de acesso à conta do cliente. Nas outras redes, pelo gerenciador em modo somente leitura, ou pelos arquivos que o cliente entregar.

Cada peça é cruzada com o que consome de verba e recebe **três vereditos** — copy, visual e peça — em **Manter / Ajustar / Matar**. Separar copy de visual é o que evita jogar fora criativo bom por causa de texto ruim.

O número que a frente entrega: **quanto da verba está em criativo que deveria sair do ar.**

Critérios: hook nos primeiros 3 segundos, promessa e mecanismo, prova, objeção tratada, CTA, formato por posicionamento, legenda e leitura sem som, alinhamento entre o anúncio e a página de destino, fadiga criativa e variação por conjunto.

### CRM
Qualidade dos dados (duplicados, campos-chave, padronização, lead sem dono), estrutura do funil, conversão por etapa, etapa "buraco negro", motivos de perda, tempo de primeira resposta, cadência de follow-up e SLA. Agnóstico de ferramenta.

### Landing Page
Rastreamento com **teste real do formulário** (enviar de verdade e confirmar que o lead chega ao destino), Core Web Vitals e performance, responsivo, estrutura de conversão (objetivo único, CTA, fricção do formulário), copy e oferta, confiança e LGPD.

### Site institucional
Infraestrutura e segurança, estrutura e navegação, conteúdo e credibilidade, SEO on-page básico, conversão e contato, e a copy — onde mora o texto mais genérico do mercado.

### Google Meu Negócio
Verificação e dados básicos, NAP consistente com o site, conteúdo e mídia, avaliações e reputação, posts e Q&A, SEO local, e a copy do perfil e das respostas às avaliações.

### SEO / GEO
SEO técnico (indexação, sitemap, canônicas, Core Web Vitals), on-page, conteúdo e autoridade, **GEO** — otimização para ser citado por ChatGPT, Perplexity e AI Overviews — e a copy de busca: title e meta que ganham o clique, não só a posição.

### E-commerce
Tecnologia (checkout, pagamento, frete, catálogo, rastreamento), design e UX da jornada completa (home → categoria → produto → carrinho → checkout, no mobile de verdade), marketing e aquisição, pós-venda e recompra, e a copy de produto e de checkout.

---

## Três regras que valem para a auditoria inteira

**O corte é a janela, não o status.** Em Campanhas e Criativos entra tudo que **consumiu verba dentro do período auditado** — ativo ou pausado. Campanha pausada que gastou na janela é achado de processo: quanto queimou antes de alguém pausar. Pausar não devolve o dinheiro. O que não gastou nada na janela fica fora — isso sim é histórico. Atenção: anúncio ativo dentro de campanha pausada não está rodando.

**Todo achado sai rotulado.** Plataforma · onde foi visto · janela · valor · status — por exemplo: *"Google Ads · termos de pesquisa · últimos 60 dias · R$ 500 · pausados em 14/07"*. É o que permite qualquer pessoa do time abrir a plataforma e conferir o ponto em 2 minutos, e o que impede a conversa de virar "a IA errou" sem ninguém verificar.

**Somente leitura no sistema do cliente.** Navegar, pré-visualizar, capturar tela, exportar: sim. Pausar, editar, duplicar, excluir, alterar orçamento: não, nunca. O gerenciador de anúncios é produção — um clique errado custa dinheiro do cliente. Informação que só existe atrás de uma tela de edição vira lacuna registrada, não risco assumido.

---

## O que você recebe no fim

Tudo em `auditorias/<nome-do-cliente>/`:

| Arquivo | O que é |
|---|---|
| `00-dossie.md` | O contexto que você passou |
| `dados/` | Exports, CSVs e prints entregues |
| `planilhas/` | Os checklists preenchidos, com status e observação em cada item |
| `criativos/` | As peças baixadas + o inventário |
| `achados/` | Os achados por frente |
| `relatorio/` | O relatório final |

No fechamento, a IA pergunta duas coisas:

**Formato** — **HTML** no Design System V4 (documento único, apresentável para o cliente) ou **`.md`** (leve, fácil de editar e colar em outro lugar).

**Profundidade:**

| | O que entrega |
|---|---|
| **Executivo** | 1 a 2 páginas: o número de abertura, os 5 achados que decidem e o plano. Para quem decide. |
| **Completo** (padrão) | Narrativa por frente, "como corrigir" em cada achado, estrutura ideal por plataforma, tabelas de Corrigir e Otimizar, cobertura e plano em ondas. |
| **Aprofundado** | O completo mais a evidência: prints, citações, dado bruto por frente e a galeria de criativos inteira. |

A profundidade muda o que é **mostrado**, nunca o que foi **auditado**. Executivo não é auditoria rasa — é a mesma auditoria, apresentada curta. Em qualquer profundidade, a seção de cobertura existe: o cliente precisa saber o que não foi olhado.

O HTML aceita um **board de acompanhamento** opcional: cada correção ganha um seletor *A fazer / Fazendo / Feito*, compartilhado entre todo mundo que abrir o link.

### As planilhas preenchidas são ferramenta de trabalho, não anexo

Suba `auditorias/<cliente>/planilhas/` no **Google Sheets** (Arquivo → Importar → Enviar) e bata com o time: cada um vê o status item a item, comenta na linha, marca o que já resolveu, e a aba Resumo recalcula sozinha. Menus suspensos e cores por status sobrevivem à importação — só confira a aba Resumo depois de importar.

O relatório é a foto do diagnóstico, fechada na data. A planilha é o que continua viva durante a execução. Entregar só o relatório faz a auditoria virar documento de arquivo.

---

## O que tem dentro

| Pasta | O que é |
|---|---|
| `planilhas/` | Os 8 gabaritos — 7 checklists + a matriz de criativos. Funcionam sozinhos, sem IA. |
| `squads/` | Os times de especialistas (IA) de cada frente |
| `.claude/skills/` e `.agents/skills/` | As habilidades da IA — idênticas nos dois diretórios, para rodar em qualquer runtime |
| `design-system-v4/` | Identidade visual V4 para os relatórios em HTML |
| `auditorias/` | Onde a auditoria de cada cliente é gerada |

As planilhas trazem, em cada item: **como auditar** (passo a passo), **benchmark de referência**, **como corrigir** e **criticidade**. Status por menu suspenso, cor automática e aba Resumo que conta sozinha.

---

## Dúvidas comuns

**Não tenho acesso ao Meta/Google do cliente. Consigo auditar?**
Sim. A frente de Criativos puxa os anúncios do Meta pela Biblioteca de Anúncios, que é pública. Para o resto, a IA te ensina a exportar o CSV do gerenciador e você entrega. A auditoria acontece de qualquer jeito — o que muda é o que dá para afirmar, e isso fica declarado no relatório.

**Preciso instalar alguma coisa?**
Não. O kit é autossuficiente. Para analisar vídeo quadro a quadro, a IA usa `ffmpeg` se estiver disponível; se não estiver, ela trabalha com os frames de abertura e diz que a leitura ficou limitada.

**A IA vai mexer na conta do cliente?**
Não. A regra de somente leitura está escrita nas habilidades e nos agentes. Se você vir a IA propondo pausar, editar ou duplicar qualquer coisa, pare — não é o comportamento esperado.

**Posso usar só a planilha, na mão?**
Pode. Cada planilha em `planilhas/` é autossuficiente.

**Campanhas e Criativos não são a mesma coisa?**
Não. Campanhas audita a conta — mensuração, estrutura, públicos, orçamento. Criativos audita a peça — o que cada anúncio diz e mostra. Quando o cliente investe em mídia, vale rodar as duas: a de conta dá o contexto que a de peça usa como referência.

---

## Segurança

- **Nunca** cole senha, token ou API key no chat. Se precisar de credencial, a IA te orienta a colocar num `.env` local, que não vai para o Git.
- Os dados do cliente ficam só na sua cópia. Nada sobe para o repositório do template.
- A IA nunca pede login para entrar na conta do cliente: ou a sessão já está aberta no seu navegador, ou a coleta é manual.

---
Feito pela V4. Identidade visual: Design System V4.
