---
name: ecommerce-preencher
description: Use ao fim da auditoria de E-commerce, depois que tecnologia, UX, aquisição e pós-venda foram avaliados. Consolida os achados na planilha-gabarito (Status na coluna E, Observações na coluna F — atenção, esta planilha NÃO usa a coluna G) e registra um resumo em achados/ecommerce.md.
---

# E-commerce — Preencher o gabarito

Transforma os achados em registro estruturado: a planilha preenchida + um resumo legível.

## Passo 1 — Preencher a planilha
Trabalhe na cópia em `auditorias/<cliente>/planilhas/Checklist Auditoria E-commerce - V4.xlsx` (não na original de `planilhas/`).

**Atenção: esta planilha tem layout diferente das outras frentes.** Quatro abas temáticas, colunas próprias:

| Col | Conteúdo |
|---|---|
| A | ✓ (e, nas linhas de seção tipo "1.1 ...", o título da seção) |
| B | Item |
| C | Como executar |
| D | Criticidade (Crítico / Importante / Bom ter) |
| **E** | **Status** ← escreva aqui |
| **F** | **Observações** ← escreva aqui |

Abas a preencher: `1. Tecnologia`, `2. Design e UX`, `3. Marketing e Aquisição`, `4. Pós-venda e Encantamento`.

Para cada item (linhas com texto em B; ignore as linhas de seção, que têm só A preenchido):
- **Status (coluna E):** `OK`, `Ajustar`, `Crítico`, `N/A` ou `Pendente` (valores da aba `_Listas`).
- **Observações (coluna F):** o achado concreto (o que foi visto, número, ação).

A aba `Resumo` soma sozinha via COUNTIF na coluna E — só preencha os valores.

### Como editar o .xlsx (determinístico)
Use openpyxl. Carregue o arquivo, percorra cada aba temática a partir da linha 4, identifique a linha do item pelo texto em B, escreva o Status em **E** e a Observação em **F**, salve. Não recalcule à mão — as fórmulas COUNTIF da aba Resumo atualizam ao abrir.

## Passo 2 — Resumo dos achados
Escreva `auditorias/<cliente>/achados/ecommerce.md` com:
- **Top achados** (3-5 mais importantes, por impacto na receita).
- **Por frente:** Tecnologia / Design e UX / Marketing e Aquisição / Pós-venda — o que está OK, o que ajustar, o que é crítico.
- **Quick wins** (resolve em 7 dias).
- **Lacunas** (pontos não auditados por falta de dado/acesso).

## Regras
- Todo status vem de um achado real cruzado com a Criticidade da planilha — nunca preencha no chute.
- Onde faltou dado, marque `N/A` ou `Pendente` e registre a lacuna; não invente.

## Saída
Planilha preenchida + `achados/ecommerce.md`. Devolve o controle ao analista, que sintetiza e retorna à skill `iniciar`.
