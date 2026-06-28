---
name: lp-preencher
description: Use ao fim da auditoria de Landing Page, depois que o técnico e a conversão foram avaliados — preenche a planilha-gabarito (Status na coluna G + Observações na coluna H) e escreve o resumo em achados/landing-page.md.
---

# Landing Page — Preencher o gabarito

Transforma os achados em registro estruturado: a planilha preenchida + um resumo legível.

## Passo 1 — Preencher a planilha
Trabalhe na cópia em `auditorias/<cliente>/planilhas/Auditoria de Landing Page - V4.xlsx` (não na original de `planilhas/`).

Na aba **Landing Page**, para cada item das seções 1.1 a 1.5:
- **Status** (coluna **G**): `OK`, `Ajustar`, `Crítico` ou `N/A` (item que não se aplica à página).
- **Observações** (coluna **H**): o achado concreto (o que foi visto, qual o número, qual a ação).

A planilha já tem a formatação condicional (cor por status) e a aba Resumo que soma sozinha (COUNTIF na coluna G) — só preencha os valores.

### Como editar o .xlsx (determinístico)
Use openpyxl em Python. Carregue o arquivo, abra a aba `Landing Page`, localize a linha do item (as linhas de seção como `1.1 ...` ficam na coluna A; os itens na coluna B), escreva em G (Status) e H (Observações), salve. Não recalcule à mão — a aba Resumo usa COUNTIF que o Excel/Sheets atualiza ao abrir.

## Passo 2 — Resumo dos achados
Escreva `auditorias/<cliente>/achados/landing-page.md` com:
- **Top achados** (3-5 mais importantes, por impacto na conversão).
- **Por seção:** o que está OK, o que ajustar, o que é crítico (rastreamento, performance, estrutura, copy, confiança).
- **Quick wins** (resolve em 7 dias).
- **Lacunas** (pontos não auditados por falta de acesso/dado).

## Regras
- Todo status vem de um achado real cruzado com o benchmark da planilha — nunca preencha no chute.
- Onde faltou dado, marque `N/A` ou deixe Pendente e registre a lacuna; não invente.

## Saída
Planilha preenchida + `achados/landing-page.md`. Devolve o controle ao analista, que sintetiza e retorna à skill `iniciar`.
