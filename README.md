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

## Duas regras que valem para a auditoria inteira

**Só o que está ATIVO.** Em Campanhas e Criativos, a auditoria analisa campanha ativa e anúncio ativo, em qualquer rede. O que já foi pausado é histórico, não é decisão pendente — e histórico infla relatório sem gerar ação. Atenção: anúncio ativo dentro de campanha pausada **não** conta como ativo, e o export do período traz gasto de campanha encerrada, o que distorce todo percentual de verba.

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

O relatório sai em três formatos, à sua escolha: **`.md`**, **planilha consolidada** ou **HTML no Design System V4** — documento único, apresentável, com "como corrigir" em cada achado, galeria dos criativos com o parecer ao lado da peça, plano em ondas e uma seção de cobertura honesta dizendo o que não foi auditado e por quê.

O HTML aceita um **board de acompanhamento** opcional: cada correção ganha um seletor *A fazer / Fazendo / Feito*, compartilhado entre todo mundo que abrir o link.

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
