---
name: criativos-preencher
description: Consolida a auditoria de criativos na planilha Auditoria de Criativos - V4.xlsx (uma linha por peça, com os três vereditos, o porquê e o como corrigir) e escreve o resumo em achados/criativos.md. Use ao fim da frente de Criativos, depois que a criativos-analisar julgou as peças.
---

# Criativos — Preencher o gabarito

Transforma a análise peça a peça em registro estruturado: a planilha preenchida + o resumo legível.

## Passo 1 — Preencher a planilha

Trabalhe na cópia em `auditorias/<cliente>/planilhas/Auditoria de Criativos - V4.xlsx` (nunca na original de `planilhas/`).

Uma **linha por criativo**, na aba da plataforma (`Meta Ads`, `Google Ads`, `TikTok Ads`, `LinkedIn Ads`), a partir da linha 4. Ordene por gasto, do maior para o menor.

| Coluna | O que vai |
|---|---|
| B | Nome ou ID do anúncio (o mesmo do export, para rastrear depois) |
| C | Campanha / conjunto |
| D | Formato (menu suspenso) |
| E | Situação — **na prática, sempre `Ativo`**: a auditoria só julga o que está no ar. `Pausado` só aparece se a peça foi pausada durante a auditoria (registre isso em "Por quê") |
| F–J | Gasto, % da verba, impressões, CTR, CPL/CPA — **só se vieram do export**. Sem fonte, deixe vazio. |
| K–R | Os oito critérios: OK / Ajustar / Crítico / N/A |
| S, T, U | Veredito copy, veredito visual, veredito da peça: Manter / Ajustar / Matar |
| V | Por quê — o argumento concreto, com o que foi visto ou medido |
| W | Como corrigir — a ação, específica o suficiente para alguém executar |
| X | Caminho do arquivo ou link da peça (é o que o relatório usa para montar a galeria) |

A planilha já tem menus suspensos, cor condicional e a aba Resumo com as fórmulas. Só escreva os valores. A aba vem com 30 linhas formatadas por plataforma; se precisar de mais, copie uma linha existente para baixo em vez de digitar em linha crua — senão a peça fica sem menu e sem cor.

### Como editar o .xlsx (determinístico)

Use `openpyxl` em Python: carregue o arquivo, localize a aba, escreva célula a célula, salve. Não recalcule as fórmulas à mão — o Resumo usa `COUNTIF`/`SUMIF` que o Excel e o Sheets atualizam ao abrir.

Percentuais (`% da verba`, `CTR`) são armazenados como fração: 0,0234 exibe como 2,34%. Não escreva 2,34 nesses campos.

## Passo 2 — Resumo dos achados

Escreva `auditorias/<cliente>/achados/criativos.md` com:

- **O número de abertura** — quanto da verba analisada está em peça com veredito "Matar" (a aba Resumo calcula). É o dado que abre a conversa com o cliente.
- **Achados transversais** — os 3 a 5 padrões que se repetem entre as peças. Vale mais que a soma dos achados individuais.
- **Peças a matar** — lista com o gasto de cada uma e o motivo em uma linha.
- **Peças a ajustar** — o que trocar, especificamente (hook, legenda, formato, CTA, destino).
- **O que está funcionando** — as peças "Manter" e por quê. Auditoria que só aponta defeito perde credibilidade e esconde o que serve de base para as próximas variações.
- **Cobertura** — quantas peças ativas existem, quantas foram auditadas, que % da verba isso cobre, e o que ficou de fora e por quê.

## Regras

- **Só campanha ativa e anúncio ativo entram na planilha**, em qualquer rede. Peça pausada não recebe linha nem veredito, e não conta na verba analisada.
- Todo veredito vem de um achado real cruzado com a régua da aba Critérios — nunca do chute.
- Onde faltou dado, deixe vazio e registre a lacuna. Célula vazia é honesta; número inventado destrói a auditoria inteira.
- Não afirme verba de plataforma sem ter tido a fonte. Se a peça veio da Biblioteca de Anúncios, você tem a peça, não o gasto.

## Saída

Planilha preenchida + `achados/criativos.md`. Devolve o controle à skill `iniciar` (próxima frente ou fechamento).
