---
name: crm-funil
description: Use para auditar a estrutura e a saúde do funil de vendas no CRM — etapas, conversão por etapa, etapa "buraco negro", tempo por etapa, motivos de perda e previsibilidade. Mapeia a seção 1.3 da planilha de CRM.
---

# CRM — Funil e conversão

Audita se o funil reflete o processo real e onde ele vaza. Cobre a seção **1.3 Funil e conversão** da planilha-gabarito.

## O que olhar
- **Conversão por etapa:** existe % medido entre cada etapa (ex.: quantos passam de qualificação para proposta)? Sem isso, ninguém sabe onde perde.
- **Etapa "buraco negro":** olhe a contagem de cards por etapa. Uma etapa que acumula muito mais que as outras tem critério de saída confuso ou trava operacional.
- **Tempo médio por etapa:** card parado tempo demais numa etapa indica gargalo. Compare com o ciclo de venda do cliente.
- **Motivos de perda:** ao perder um lead, o vendedor escolhe um motivo de uma lista fixa? Sem motivo categorizado, não dá para corrigir a causa.
- **Previsibilidade / forecast:** dá para projetar receita a partir do funil (valor x probabilidade por etapa)?

## Benchmarks (cruze antes de classificar)
- Conversão acompanhada etapa a etapa (não só taxa geral).
- Sem acúmulo desproporcional de cards numa única etapa.
- Tempo por etapa coerente com o ciclo de venda do cliente — sem número universal "(validar)" com o time.
- Motivo de perda obrigatório e categorizado.
- Forecast por etapa ponderado por probabilidade.

## Como conduz
Para cada item da seção 1.3: leia "Como auditar", olhe o dado coletado, compare com o "Benchmark", defina o status (`OK` / `Ajustar` / `Crítico` / `N/A`) e registre o achado com a ação da coluna "Como corrigir". Onde faltar dado, marque a lacuna — não invente.

## Saída
Achados de funil prontos para a skill `crm-preencher` lançar na planilha (Status na coluna G, Observações na H).
