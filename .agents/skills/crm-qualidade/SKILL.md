---
name: crm-qualidade
description: Use para auditar a qualidade dos dados do CRM — duplicados, campos-chave preenchidos, padronização de telefone/e-mail, leads sem dono e rotina de higienização. Mapeia a seção 1.2 da planilha de CRM.
---

# CRM — Qualidade dos dados

Audita se a base do CRM é confiável. Base suja esconde o número real e mente para todo o resto da auditoria. Cobre a seção **1.2 Qualidade dos dados** da planilha-gabarito.

## O que olhar
- **Duplicados:** busque contatos/empresas repetidos por e-mail, telefone e nome. Duplicidade infla a base e fragmenta o histórico.
- **Campos-chave preenchidos:** amostre cards e veja o preenchimento de nome, telefone, e-mail, origem e valor. Campo vazio = decisão no escuro.
- **Padronização:** telefone e e-mail seguem formato consistente (DDD, máscara, validação)? Formato bagunçado quebra automação e dedupe.
- **Leads sem responsável:** filtre cards sem dono. Lead órfão não é trabalhado por ninguém.
- **Rotina de higienização:** com que frequência a base é limpa (dedupe, arquivar leads mortos)?

## Benchmarks (cruze antes de classificar)
- Taxa de duplicados próxima de 0%.
- Campos-chave > 90% preenchidos.
- Telefone e e-mail em formato padronizado e validado.
- 0 leads ativos sem responsável.
- Higienização ao menos mensal "(validar com o time)".

## Como conduz
Para cada item da seção 1.2: leia "Como auditar", olhe o dado coletado, compare com o "Benchmark", defina o status (`OK` / `Ajustar` / `Crítico` / `N/A`) e registre o achado com a ação da coluna "Como corrigir". Onde faltar dado, marque a lacuna — não invente.

## Saída
Achados de qualidade prontos para a skill `crm-preencher` lançar na planilha (Status na coluna G, Observações na H).
