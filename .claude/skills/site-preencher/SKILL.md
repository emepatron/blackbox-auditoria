---
name: site-preencher
description: Use ao fim da auditoria de Site, depois que técnico, estrutura e conversão foram avaliados. Consolida os achados na planilha-gabarito (define o Status de cada item na coluna correta e escreve as Observações) e registra um resumo em auditorias/<cliente>/achados/site.md.
---

# Site — Preencher o gabarito

Transforma os achados em registro estruturado: a planilha preenchida + um resumo legível.

## Passo 1 — Preencher a planilha
Trabalhe na cópia em `auditorias/<cliente>/planilhas/Auditoria de Site Institucional - V4.xlsx` (não na original de `planilhas/`).

Na aba **Site Institucional**, para cada item das seções 1.1 a 1.5:
- **Status** (coluna **G**): `OK`, `Ajustar`, `Crítico` ou `N/A` (item que não se aplica ao cliente).
- **Observações** (coluna **H**): o achado concreto (o que foi visto, qual o número, qual a ação).

A planilha já tem a formatação condicional (cor por status) e a aba **Resumo** que soma sozinha (COUNTIF na coluna G) — só preencha os valores.

### Como editar o .xlsx (determinístico)
Use openpyxl em Python. Carregue o arquivo, vá na aba `Site Institucional`, ache a linha do item (a coluna B tem o nome) e escreva em **G** (Status) e **H** (Observações), depois salve. Não recalcule à mão — a aba Resumo usa fórmulas que o Excel/Sheets atualiza ao abrir.

## Passo 2 — Resumo dos achados
Escreva `auditorias/<cliente>/achados/site.md` com:
- **Top achados** (3-5 mais importantes, por impacto).
- **Por seção:** o que está OK, o que ajustar, o que é crítico (técnico, estrutura/conteúdo, SEO básico, conversão).
- **Quick wins** (resolve em 7 dias).
- **Lacunas** (pontos não auditados por falta de dado/acesso).

## Regras
- Todo status vem de um achado real cruzado com o benchmark — nunca preencha no chute.
- Onde faltou dado, marque `N/A` ou deixe Pendente e registre a lacuna; não invente.

## Saída
Planilha preenchida + `achados/site.md`. Devolve o controle ao analista, que sintetiza e retorna à skill `iniciar`.
