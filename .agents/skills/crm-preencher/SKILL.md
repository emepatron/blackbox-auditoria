---
name: crm-preencher
description: Use ao fim da auditoria de CRM, depois que qualidade, funil e cadência foram avaliados. Consolida os achados na planilha-gabarito (define o Status na coluna G e escreve as Observações na coluna H) e registra um resumo em achados/crm.md.
---

# CRM — Preencher o gabarito

Transforma os achados em registro estruturado: a planilha preenchida + um resumo legível.

## Passo 1 — Preencher a planilha
Trabalhe na cópia em `auditorias/<cliente>/planilhas/Auditoria de CRM - V4.xlsx` (não na original de `planilhas/`).

Para cada item da aba **CRM** (seções 1.1 a 1.5):
- **Status** (coluna G): `OK`, `Ajustar`, `Crítico` ou `N/A` (ponto que não se aplica ao cliente).
- **Observações** (coluna H): o achado concreto (o que foi visto, qual o número, qual a ação).

A planilha já tem a formatação condicional (cor por status) e a aba Resumo que soma sozinha (COUNTIF na coluna G) — só preencha os valores.

### Como editar o .xlsx (determinístico)
Use openpyxl em Python. Carregue o arquivo, abra a aba `CRM`, localize a linha do item, escreva em `G` (Status) e `H` (Observações), salve. Não recalcule à mão — a aba Resumo usa fórmulas que o Excel/Sheets atualiza ao abrir.

## Passo 2 — Resumo dos achados
Escreva `auditorias/<cliente>/achados/crm.md` com:
- **Top achados** (3-5 mais importantes, por impacto na receita).
- **Por seção:** o que está OK, o que ajustar, o que é crítico (estrutura, qualidade, funil, cadência, gestão).
- **Quick wins** (resolve em 7 dias — ex.: atribuir leads órfãos, ligar alerta de lead novo).
- **Lacunas** (pontos não auditados por falta de dado/acesso).

## Regras
- Todo status vem de um achado real cruzado com o benchmark — nunca preencha no chute.
- Onde faltou dado, marque `N/A` ou deixe `Pendente` e registre a lacuna; não invente.
- Benchmark incerto → registre "(validar)" na observação.

## Saída
Planilha preenchida + `achados/crm.md`. Devolve o controle ao analista, que sintetiza e retorna à skill `iniciar`.
