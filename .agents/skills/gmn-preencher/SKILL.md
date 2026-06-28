---
name: gmn-preencher
description: Use ao fim da auditoria de Google Meu Negócio, depois que perfil, reputação e SEO local foram avaliados. Consolida os achados na planilha-gabarito (Status na coluna G e Observações na coluna H) e registra um resumo em achados/google-meu-negocio.md.
---

# Google Meu Negócio — Preencher o gabarito

Transforma os achados em registro estruturado: a planilha preenchida + um resumo legível.

## Passo 1 — Preencher a planilha
Trabalhe na cópia em `auditorias/<cliente>/planilhas/Auditoria de Google Meu Negócio - V4.xlsx` (não na original de `planilhas/`).

Na aba **Google Meu Negócio**, para cada item das seções 1.1 a 1.5:
- **Status** (coluna G): `OK`, `Ajustar`, `Crítico`, `Pendente` ou `N/A` (item que não se aplica ao negócio).
- **Observações** (coluna H): o achado concreto (o que foi visto, qual o número, qual a ação).

A planilha já tem o menu de Status, a formatação condicional (cor por status) e a aba Resumo que soma sozinha — só preencha os valores.

### Como editar o .xlsx (determinístico)
Use openpyxl em Python. Carregue o arquivo, abra a aba `Google Meu Negócio`, localize a linha do item (linhas 5-9, 11-15, 17-21, 23-26, 28-32) e escreva em G (Status) e H (Observações), salve. Não recalcule à mão — a aba Resumo usa fórmulas COUNTIF que o Excel/Sheets atualiza ao abrir.

## Passo 2 — Resumo dos achados
Escreva `auditorias/<cliente>/achados/google-meu-negocio.md` com:
- **Top achados** (3-5 mais importantes, por impacto — NAP, verificação e reputação costumam liderar).
- **Por seção:** o que está OK, o que ajustar, o que é crítico.
- **Quick wins** (resolve em 7 dias — ex.: responder avaliações pendentes, atualizar horário).
- **Lacunas** (pontos não auditados por falta de dado/acesso).

## Regras
- Todo status vem de um achado real cruzado com o benchmark — nunca preencha no chute.
- Onde faltou dado, marque `N/A` ou deixe `Pendente` e registre a lacuna; não invente. Onde incerto, use "(validar)" na observação.

## Saída
Planilha preenchida + `achados/google-meu-negocio.md`. Devolve o controle ao analista, que sintetiza e retorna à skill `iniciar`.
