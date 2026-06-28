---
name: relatorio
description: Gera o relatório final aprofundado de uma auditoria do Blackbox. Use quando a auditoria das frentes terminou e o usuário quer o entregável final, ou disser "gera o relatório", "fecha a auditoria", "quero o relatório final". Oferece 3 formatos — .md, planilha consolidada, ou HTML no Design System V4 — e produz o relatório a partir dos achados e das planilhas preenchidas em auditorias/<cliente>/.
---

# Auditoria — Relatório Final

Consolida tudo que foi auditado num relatório aprofundado e acionável. Lê os achados (`auditorias/<cliente>/achados/`) e as planilhas preenchidas (`auditorias/<cliente>/planilhas/`).

## Passo 1 — Formato
Pergunte (se ainda não escolhido):

> "Qual formato do relatório?
> 1. **.md** — markdown, leve, fácil de editar.
> 2. **Planilha** — consolida os checklists preenchidos num só arquivo, com a aba Resumo.
> 3. **HTML** — apresentável pro cliente, no Design System V4 (`design-system-v4/`)."

## Passo 2 — Estrutura do relatório (vale pros 3 formatos)

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

### Planilha
Consolide os checklists preenchidos das frentes num único `.xlsx` em `auditorias/<cliente>/relatorio/`, mantendo o padrão visual V4 (use o mesmo motor das planilhas em `planilhas/`). Inclua a aba Resumo somando o status de todas as frentes.

### HTML (Design System V4)
Gere um `relatorio.html` em `auditorias/<cliente>/relatorio/` usando a identidade de `design-system-v4/`:
- Leia `design-system-v4/index.html` e `design-system-v4/readme.md` para tokens (cores, tipografia Space Grotesk + Inter + JetBrains Mono, componentes).
- Use os componentes do guia (KPI Card, Alert, Section Header, Tabela, Status Grid) para apresentar diagnóstico, plano e quick wins.
- Sem emojis decorativos. Layout limpo, vermelho V4 como acento.
- Aplique o checklist anti-IA (sem clichês de mercado, sem frases binárias).

## Checklist final antes de entregar
- Sumário executivo bate com os achados detalhados?
- Todo achado tem base (dado + benchmark)?
- Plano de ação está priorizado por impacto?
- Lacunas (frentes/pontos não auditados) estão sinalizadas?
- Formato escolhido foi gerado e salvo em `auditorias/<cliente>/relatorio/`?

## Cross-IA
Markdown puro, espelhada em `.claude/skills/` e `.agents/skills/`. Para HTML/planilha, usa apenas ferramentas locais (sem dependência de IA específica).
