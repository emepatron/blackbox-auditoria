---
name: campanhas-tracking
description: Audita o rastreamento e a mensuração das campanhas (pixel/tag, eventos de conversão, server-side/CAPI/Enhanced Conversions, UTMs, consentimento, janela de atribuição). Use no início da auditoria de Campanhas — se a mensuração está quebrada, todo o resto é leitura de dado mentiroso. Cobre a seção de rastreamento da aba Fundamentos e os itens de configuração de cada plataforma.
---

# Campanhas — Auditar rastreamento

A primeira coisa a auditar. Mensuração quebrada = decisão baseada em dado falso.

## O que verificar (cruze com a planilha-gabarito)
1. **Pixel/tag instalado e disparando** em todas as páginas (home, LP, checkout, obrigado). Use Meta Pixel Helper / Google Tag Assistant se houver acesso ao site; senão, peça print do gerenciador de eventos.
2. **Eventos de conversão** configurados e validados (Lead/Compra/AddToCart) com valor/moeda. Faça/peça uma conversão teste.
3. **Server-side:** Meta CAPI (deduplicação por event_id, EMQ) e Google Enhanced Conversions ativos.
4. **UTMs** padronizados em todos os links; cruze com o GA4.
5. **Consentimento / Consent Mode v2** (LGPD).
6. **Janela de atribuição** definida e coerente com o report ao cliente.
7. **Por plataforma:** Meta (domínio verificado + priorização de eventos AEM); Google (conversões primárias, sem duplicidade); TikTok (Pixel + Events API); LinkedIn (Insight Tag).

## Como auditar sem acesso direto
Se não houver acesso ao site/gerenciador, peça: print do Gerenciador de Eventos (Meta), da aba Conversões (Google), e confirme com perguntas ("o lead cai no CRM quando alguém preenche o form?").

## Saída
Status (OK / Ajustar / Crítico) de cada item de rastreamento, registrado para a skill `campanhas-preencher`. Marque como **Crítico** qualquer falha que comprometa a mensuração (pixel não dispara, evento não registra, lead não chega ao destino).
