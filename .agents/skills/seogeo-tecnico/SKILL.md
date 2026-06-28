---
name: seogeo-tecnico
description: Use no início da auditoria de SEO e GEO para avaliar o SEO técnico — indexação (Search Console), sitemap/robots, Core Web Vitals, mobile-first, HTTPS, canônicas e duplicação. É a base: site não indexado ou lento não rankeia. Cobre a seção 1.1 da planilha-gabarito.
---

# SEO e GEO — Auditar o técnico

A primeira camada. Se a indexação está quebrada ou o site é lento, otimizar conteúdo é cedo demais.

## O que verificar (cruze com a planilha-gabarito, seção 1.1)
1. **Indexação (GSC):** em Páginas (Indexação), compare indexadas x não indexadas e os motivos. Páginas-chave devem estar 100% indexadas. Cheque `noindex` e bloqueios indevidos.
2. **sitemap.xml e robots.txt:** acesse `/sitemap.xml` e `/robots.txt`. Sitemap deve listar as URLs canônicas e estar enviado no GSC; robots sem bloqueio indevido de páginas importantes.
3. **Core Web Vitals (benchmark firme):** no GSC (Core Web Vitals) ou PageSpeed/CrUX — **LCP < 2,5s · INP < 200ms · CLS < 0,1**.
4. **Mobile-first, HTTPS, canônicas e duplicação:** HTTPS forçado em todo o site (sem conteúdo misto), paridade mobile/desktop, canônica única por página, URLs limpas, sem conteúdo duplicado.

## Como auditar sem acesso direto
Sem GSC: cheque `/sitemap.xml`, `/robots.txt`, HTTPS, `<link rel="canonical">` e responsividade direto no HTML público; rode as páginas-chave no PageSpeed Insights para os Core Web Vitals. Registre o que não der pra verificar como lacuna.

## Saída
Status (OK / Ajustar / Crítico / N/A) de cada item técnico, com o achado concreto (qual página, qual número), para a skill `seogeo-preencher`. Marque como **Crítico** o que bloqueia tráfego: páginas-chave não indexadas, site sem HTTPS, robots bloqueando conteúdo importante.
