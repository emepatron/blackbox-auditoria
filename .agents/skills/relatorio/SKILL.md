---
name: relatorio
description: Gera o relatório final aprofundado de uma auditoria do Blackbox. Use quando a auditoria das frentes terminou e o usuário quer o entregável final, ou disser "gera o relatório", "fecha a auditoria", "quero o relatório final". Pergunta o formato (HTML no Design System V4 ou .md) e a profundidade (Executivo, Completo ou Aprofundado), e produz o relatório a partir dos achados e das planilhas preenchidas em auditorias/<cliente>/. Também orienta o usuário a subir as planilhas no Google Sheets para o time acompanhar.
---

# Auditoria — Relatório Final

Consolida tudo que foi auditado num relatório aprofundado e acionável. Lê os achados (`auditorias/<cliente>/achados/`) e as planilhas preenchidas (`auditorias/<cliente>/planilhas/`).

## Padrão de referência (validado em auditorias reais, jul/2026)

O formato-padrão de entrega é o **documento HTML único** gerado por script (`gerar_final.py` + checklist
exportado das planilhas em JSON), publicado como página única. Regras do padrão:

1. **Documento ÚNICO** — proibido mencionar rodadas/versões; toda seção diz a verdade do estado final.
2. **Seções na ordem:** hero com números-chave → Funil (mapa verificado + teste real) → CRM (mostrando
   também o que FUNCIONA, ex.: motor comercial vivo — nunca deixar parecer "tudo morto" se não for) →
   Campanhas (conta: mensuração, estrutura, públicos, orçamento) → **Criativos (galeria peça a peça —
   ver 2.1)** → **"O que deveria rodar — a estrutura ideal por plataforma"** → Tracking → Performance →
   SEO/GEO → Experiência por ativo (prints + citações) → Corrigir (tabela dos Críticos) → Otimizar
   (tabela dos Ajustar) → Cobertura → Plano em ondas.
2.1 **Seção Criativos — galeria** (quando a frente de Criativos foi auditada): a peça de um lado, o
   parecer do outro. Uma peça por bloco, **ordenado por gasto** (a que come mais verba primeiro):
   - **Esquerda:** a imagem, ou o frame de abertura do vídeo (o de 0-1s, que é o hook). Largura ~40%,
     `border-radius` do DS, sem moldura decorativa.
   - **Direita:** nome do anúncio · formato · gasto e % da verba · CTR e CPL (só se vieram do export) ·
     os três vereditos como badges (COPY / VISUAL / PEÇA, verde-âmbar-vermelho) · o porquê em uma
     frase · o "como corrigir" em Alert.
   - **Abertura da seção:** o número que importa — *"R$ X (Y% da verba analisada) está em criativo com
     veredito Matar"* — em KPI Card, seguido dos 3 a 5 achados transversais.
   - **Fechamento:** cobertura da frente (peças ativas × auditadas × % da verba).
   - Imagens comprimidas junto com os demais prints (`sips` → JPG 1600px). Vídeo **não** é embutido —
     usa-se o frame; o relatório é documento único, não player.
   - Se a peça veio da Biblioteca de Anúncios (sem métrica), o bloco mostra o parecer sem número e a
     seção declara isso. Nunca estimar gasto para preencher a lacuna visual.
3. **"Como corrigir" em CADA achado** — nos alerts da narrativa e nas tabelas (coluna da planilha).
4. **Estrutura ideal por plataforma** — tabelas por campanha/camada (papel, público, criativo, destino,
   métrica) + a régua das 4 perguntas: que intenção ataca? para onde manda o lead? que conversão única
   otimiza? como o CRM sabe que veio dela?
5. **Precisão de atribuição** — NUNCA afirmar número de fonte sem acesso (ex.: verba do Meta sem a
   conta); CTR ≠ conversão; amostra de 1 não vira taxa; rotular a fonte de cada número.
6. **Cobertura honesta** — tabela por frente + lista de pendências com motivo e o que destrava. Em
   Campanhas e Criativos, deixar explícito que o recorte é **só o que está ativo** — para o cliente não
   ler a ausência de uma campanha antiga como falha da auditoria.
6.1 **Board de acompanhamento** (quando o time for executar as correções): injetar
   `design-system-v4/board-tracker.html` antes de `</body>` — cada item de Corrigir, Otimizar e Plano
   ganha um seletor **A fazer / Fazendo / Feito** + contador de progresso por seção, com estado
   compartilhado via Supabase (todos veem o mesmo, em tempo real). Setup do backend:
   `design-system-v4/board-setup.sql` num projeto Supabase **dedicado** (nunca reusar projeto com dados
   de cliente — a chave publishable fica visível no HTML). Gerar com `SB_URL=... SB_KEY=... python3
   gerar_final.py`; sem as variáveis o board cai em modo local (só para preview).
7. **Deploy** (se solicitado): copiar para `~/Para deploy/auditoria-<cliente>/`, prints comprimidos
   (`sips` → JPG 1600px, ajustar refs .png→.jpg), token `pass show V4-Company/infra/vercel-token`,
   `npx vercel deploy --prod --yes`, validar página + imagens com curl, avisar que a URL é pública —
   e SÓ após revisão e aprovação explícita do usuário.

## Passo 1 — Formato e profundidade

Pergunte as duas coisas juntas, antes de escrever qualquer linha:

> "Vou fechar a auditoria. Duas escolhas:
>
> **Formato**
> 1. **HTML** — documento único no Design System V4, apresentável para o cliente (recomendado)
> 2. **.md** — markdown, leve, fácil de editar e colar em outro lugar
>
> **Profundidade**
> 1. **Executivo** — 1 a 2 páginas: o número de abertura, os 5 achados que decidem e o plano. Para quem vai decidir, não para quem vai executar.
> 2. **Completo** — o padrão: narrativa por frente, 'como corrigir' em cada achado, estrutura ideal por plataforma, tabelas de Corrigir e Otimizar, cobertura e plano em ondas.
> 3. **Aprofundado** — o completo mais a evidência: prints, citações, dado bruto por frente e a galeria de criativos inteira em vez do recorte.
>
> Se não escolher, faço **HTML + Completo**."

### O que muda em cada profundidade

| | Executivo | Completo (padrão) | Aprofundado |
|---|---|---|---|
| Achados | os 5 de maior impacto | todos, por frente | todos + evidência de cada um |
| "Como corrigir" | só nos 5 | em cada achado | em cada achado, com passo a passo |
| Estrutura ideal por plataforma | não entra | entra | entra, com tabela por campanha |
| Criativos | os 3 piores | o recorte auditado (~80% da verba) | todas as peças coletadas |
| Prints e citações | não | os que sustentam achado crítico | todos |
| Cobertura | uma linha | tabela por frente | tabela + o que destrava cada pendência |

**A profundidade muda o que é MOSTRADO, nunca o que foi AUDITADO.** Executivo não é auditoria rasa: é a mesma auditoria, apresentada curta. E em qualquer profundidade a seção de cobertura existe — o cliente precisa saber o que não foi olhado.

## Passo 1.1 — As planilhas são entregável, e são de trabalho

Diga ao usuário, sempre, ao entregar:

> "As planilhas preenchidas estão em `auditorias/<cliente>/planilhas/`. Elas não são anexo do relatório
> — são a ferramenta de trabalho. Suba no Google Sheets (Arquivo → Importar → Enviar) e você tem o
> checklist ao vivo para bater com o time: cada um vê o status item a item, comenta na linha, marca o
> que já foi resolvido e a aba Resumo recalcula sozinha."

Por que isso importa: o relatório é a foto do diagnóstico, fechada na data. A planilha é o que continua
vivo depois — é nela que o time acompanha a execução. Entregar só o relatório faz a auditoria virar
documento de arquivo.

Ao subir para o Sheets, os menus suspensos, as cores por status e as fórmulas da aba Resumo costumam
sobreviver à importação. Peça para conferir a aba Resumo depois de importar; se algum número não bater,
é a fórmula que não converteu, não o preenchimento.

Para acompanhamento dentro do próprio relatório HTML, existe o **board** (ver 6.1) — o seletor
A fazer / Fazendo / Feito. Sheets e board resolvem a mesma necessidade por caminhos diferentes:
o Sheets é melhor para o time operar, o board é melhor para o cliente enxergar progresso.

## Passo 2 — Estrutura do relatório (vale para os dois formatos)

1. **Sumário executivo** — o que foi auditado, contexto do cliente, e os 3-5 achados mais importantes.
2. **Diagnóstico por frente** — para cada frente auditada:
   - O que está OK (forças).
   - O que precisa ajuste (com a referência/benchmark que embasou).
   - O que é crítico (resolver já).
3. **Plano de ação priorizado** — lista de correções ordenada por impacto x esforço, com o "como corrigir" da planilha.
4. **Quick wins** — o que dá pra resolver em 7 dias.
5. **Anexos** — link/menção às planilhas preenchidas.

Regras: nada de inventar. Todo achado vem dos dados coletados e do status da planilha. Onde houver lacuna, registre como "não auditado / falta dado".

## Passo 3 — Geração por formato

### .md
Escreva em `auditorias/<cliente>/relatorio/relatorio.md` seguindo a estrutura acima.

### HTML (Design System V4)
Gere um `relatorio.html` em `auditorias/<cliente>/relatorio/` usando a identidade de `design-system-v4/`:
- Leia `design-system-v4/index.html` e `design-system-v4/readme.md` para tokens (cores, tipografia Space Grotesk + Inter + JetBrains Mono, componentes).
- Use os componentes do guia (KPI Card, Alert, Section Header, Tabela, Status Grid) para apresentar diagnóstico, plano e quick wins.
- Sem emojis decorativos. Layout limpo, vermelho V4 como acento.
- Aplique o checklist anti-IA (sem clichês de mercado, sem frases binárias).

## Ao entregar, passe o relatório com a pessoa

Não mande o arquivo e encerre. Quem vai apresentar isso ao cliente precisa saber sustentar cada
achado — e na maioria das vezes não domina o assunto.

Percorra com ela: os 3 achados mais importantes, o porquê de cada um em linguagem simples, e o que
esperar de pergunta do cliente. Pergunte, explicitamente, se algum ponto ficou obscuro. Se ela não
consegue explicar o achado com as próprias palavras, ele ainda não está entregue.

## Checklist final antes de entregar
- Sumário executivo bate com os achados detalhados?
- Todo achado tem base (dado + benchmark)?
- Plano de ação está priorizado por impacto?
- Lacunas (frentes/pontos não auditados) estão sinalizadas?
- Formato escolhido foi gerado e salvo em `auditorias/<cliente>/relatorio/`?
- A profundidade pedida foi respeitada (nem a mais, nem a menos)?
- O usuário foi avisado de que pode subir as planilhas no Google Sheets para bater com o time?
- Você passou os principais achados com a pessoa e confirmou que ela consegue explicá-los?

## Cross-IA
Markdown puro, espelhada em `.claude/skills/` e `.agents/skills/`. Para HTML/planilha, usa apenas ferramentas locais (sem dependência de IA específica).
