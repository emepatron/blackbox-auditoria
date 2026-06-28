---
name: gmn-coletar
description: Use quando o squad de Google Meu Negócio precisar dos dados do perfil e ainda não os tiver. Pega o link do Perfil da Empresa no Google e, opcionalmente, prints dos Insights, e salva tudo em auditorias/<cliente>/dados/.
---

# Google Meu Negócio — Coletar dados

Garante o acesso ao perfil antes de auditar. Sem o perfil aberto e os dados na mão, não há auditoria — só achismo.

## Caminho de dados (tente nesta ordem)
1. **Link do perfil (essencial):** peça o link do Perfil da Empresa no Google. Se o cliente não tiver, pesquise o nome do negócio + cidade no Google/Maps e confirme o perfil correto com o usuário.
2. **Acesso de gestor (ideal):** pergunte se há acesso ao painel do Google Business Profile. Com acesso, dá pra ver Insights, mensagens, Q&A e edições — o que não aparece na visão pública.
3. **Prints/exports manuais (fallback universal):** sem acesso de gestor, peça prints de:
   - **Insights/Desempenho:** como as pessoas encontram o perfil (busca direta vs descoberta), buscas que acionaram, ações (site, rotas, ligações) — últimos 28-90 dias.
   - **Avaliações:** print da nota média e do volume; amostra das avaliações recentes (respondidas ou não).
   - **Posts e Q&A:** print do último post (com data) e da seção de perguntas e respostas.

## Boas práticas
- Registre o **período** dos Insights (ex.: últimos 28 dias) — comparar bases diferentes engana.
- Salve cada arquivo em `auditorias/<cliente>/dados/` com nome claro (ex.: `gmn-insights-28d.png`, `gmn-avaliacoes.png`).
- Anote o NAP do site do cliente para cruzar com o perfil na skill `gmn-perfil`.
- O que faltou, registre como lacuna — não invente.

## Saída
Link do perfil + prints/dados em `dados/` + uma nota curta (no dossiê) de o que foi obtido, por qual caminho, e quais lacunas restaram.
