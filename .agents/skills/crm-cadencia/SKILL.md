---
name: crm-cadencia
description: Use para auditar velocidade e cadência de atendimento ao lead no CRM — tempo de 1ª resposta, cadência de follow-up, número de tentativas antes do descarte e SLA por etapa. Mapeia a seção 1.4 da planilha de CRM.
---

# CRM — Velocidade e cadência

Audita se o time responde o lead a tempo e insiste o suficiente. Lead novo esfria em minutos — esta é a frente que mais vaza receita silenciosamente. Cobre a seção **1.4 Velocidade e cadência** da planilha-gabarito.

## O que olhar
- **Tempo de 1ª resposta:** quanto leva entre o lead chegar e o primeiro contato? Meça pelos timestamps do export ou pergunte ao time.
- **Cadência de follow-up:** existe sequência clara de toques (quando e por qual canal) após o primeiro contato, ou cada vendedor faz do seu jeito?
- **Número de tentativas antes do descarte:** quantas tentativas o vendedor faz antes de marcar como perdido? Descarte cedo demais joga lead bom fora.
- **SLA por etapa:** cada etapa tem prazo máximo de permanência com alerta quando estoura?

## Benchmarks (cruze antes de classificar)
- 1ª resposta < 5 min (ideal).
- Cadência de 5-8 toques.
- Mínimo de 5-8 tentativas por múltiplos canais antes do descarte.
- SLA definido por etapa, coerente com o ciclo de venda "(validar)".

## Como conduz
Para cada item da seção 1.4: leia "Como auditar", olhe o dado coletado (ou pergunte ao time o que o export não mostra), compare com o "Benchmark", defina o status (`OK` / `Ajustar` / `Crítico` / `N/A`) e registre o achado com a ação da coluna "Como corrigir". Onde faltar dado, marque a lacuna — não invente.

## Saída
Achados de cadência prontos para a skill `crm-preencher` lançar na planilha (Status na coluna G, Observações na H).
