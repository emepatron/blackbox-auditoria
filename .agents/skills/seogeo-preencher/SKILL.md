---
name: seogeo-preencher
description: Use ao fim da auditoria de SEO e GEO, depois que técnico, on-page, conteúdo/autoridade e GEO foram avaliados. Consolida os achados na planilha-gabarito (Status na coluna G, Observações na coluna H da aba "SEO e GEO") e escreve um resumo em auditorias/<cliente>/achados/seo-geo.md.
---

# SEO e GEO — Preencher o gabarito

Transforma os achados em registro estruturado: a planilha preenchida + um resumo legível.

## Passo 1 — Preencher a planilha
Trabalhe na cópia em `auditorias/<cliente>/planilhas/Auditoria de SEO e GEO - V4.xlsx` (não na original de `planilhas/`).

Na aba **"SEO e GEO"**, para cada item das seções 1.1 a 1.5:
- **Status — coluna G:** `OK`, `Ajustar`, `Crítico`, `Pendente` ou `N/A` (ponto que não se aplica ao cliente).
- **Observações — coluna H:** o achado concreto (o que foi visto, qual número/página, qual ação). Para itens GEO, mantenha a marca **"(validar)"** quando o critério for emergente.

A planilha já tem a formatação condicional (cor por status) e a aba **Resumo**, que soma sozinha via COUNTIF na coluna G — só preencha os valores.

### Como editar o .xlsx (determinístico)
Use openpyxl em Python. Carregue o arquivo, selecione a aba `SEO e GEO`, localize a linha do item (coluna B = nome do item) e escreva em **G** (Status) e **H** (Observações). Salve. Não recalcule à mão — a aba Resumo recalcula ao abrir no Excel/Sheets.

## Passo 2 — Resumo dos achados
Escreva `auditorias/<cliente>/achados/seo-geo.md` com:
- **Top achados** (3-5 mais importantes, por impacto no tráfego orgânico).
- **Por seção:** técnico (1.1), on-page (1.2), conteúdo/autoridade (1.3), GEO (1.4), mensuração (1.5) — o que está OK, o que ajustar, o que é crítico.
- **Quick wins** (resolve em 7 dias).
- **GEO — emergente:** pontos marcados "(validar)" e o que confirmar antes de agir.
- **Lacunas** (pontos não auditados por falta de acesso/dado).

## Regras
- Todo status vem de um achado real cruzado com o benchmark — nunca preencha no chute.
- Faltou dado → marque `Pendente`/`N/A` e registre a lacuna; não invente.

## Saída
Planilha preenchida + `achados/seo-geo.md`. Devolve o controle ao analista de SEO, que sintetiza e retorna à skill `iniciar`.
