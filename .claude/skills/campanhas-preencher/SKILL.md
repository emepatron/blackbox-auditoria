---
name: campanhas-preencher
description: Consolida os achados da auditoria de Campanhas na planilha-gabarito (define o Status de cada item e escreve as Observações) e registra um resumo em achados/campanhas.md. Use ao fim da auditoria de Campanhas, depois que tracking, criativos e métricas foram avaliados.
---

# Campanhas — Preencher o gabarito

Transforma os achados em registro estruturado: a planilha preenchida + um resumo legível.

## Passo 1 — Preencher a planilha
Trabalhe na cópia em `auditorias/<cliente>/planilhas/Auditoria de Campanhas - V4.xlsx` (não na original de `planilhas/`).

Para cada item auditado, nas abas Fundamentos / Meta / Google / LinkedIn / TikTok:
- **Status** (coluna G): `OK`, `Ajustar`, `Crítico` ou `N/A` (frente que o cliente não usa).
- **Observações** (coluna H): o achado concreto (o que foi visto, qual o número, qual a ação).

A planilha já tem a formatação condicional (cor por status) e a aba Resumo que soma sozinha — só preencha os valores.

### Como editar o .xlsx (determinístico)
Use openpyxl em Python. Carregue o arquivo, localize a aba e a linha do item, escreva em G (Status) e H (Observações), salve. Não recalcule à mão — a aba Resumo usa fórmulas COUNTIF que o Excel/Sheets atualiza ao abrir.

## Passo 2 — Resumo dos achados
Escreva `auditorias/<cliente>/achados/campanhas.md` com:
- **Top achados** (3-5 mais importantes, por impacto).
- **Por plataforma:** o que está OK, o que ajustar, o que é crítico.
- **Quick wins** (resolve em 7 dias).
- **Lacunas** (pontos não auditados por falta de dado).

## Regras
- Todo status vem de um achado real cruzado com o benchmark — nunca preencha no chute.
- Onde faltou dado, marque `N/A` ou deixe Pendente e registre a lacuna; não invente.

## Saída
Planilha preenchida + `achados/campanhas.md`. Devolve o controle ao estrategista, que sintetiza e retorna à skill `iniciar`.
