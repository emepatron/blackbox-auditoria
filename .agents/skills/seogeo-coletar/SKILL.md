---
name: seogeo-coletar
description: Use quando o squad de SEO e GEO precisar dos dados do site e ainda não os tiver. Garante a URL do site e negocia o acesso a Google Search Console e GA4 (opcionais) — MCP, API ou export manual — e salva o que receber em auditorias/<cliente>/dados/.
---

# SEO e GEO — Coletar dados

Garante o mínimo para auditar: a URL do site e, quando houver, o acesso ao Search Console e ao GA4. Sem o site não há auditoria; sem GSC/GA4 a auditoria acontece, mas alguns pontos viram lacuna.

## O que obter
1. **URL do site** (obrigatório) — domínio principal e as páginas-chave (home, principais serviços/produtos, blog). Sem isso, nada a auditar.
2. **Google Search Console** (opcional, mas alavanca muito) — destrava indexação, Core Web Vitals, queries, posições e links.
3. **GA4** (opcional) — destrava tráfego e conversões orgânicas (canal Organic Search).

## Caminho de dados (tente nesta ordem)
1. **MCP conectado?** Pergunte se há MCP do GSC/GA4 na sessão. Se sim, puxe direto.
2. **API/acesso?** Se houver login/credencial do GSC ou GA4, peça via `.env` LOCAL (nunca no chat, nunca versionado) ou peça um print/export da tela.
3. **Export manual (fallback universal):** instrua e receba o arquivo:
   - **GSC:** abra Páginas (Indexação), Core Web Vitals, Desempenho (queries/posições) e Links → exporte CSV ou print.
   - **GA4:** Aquisição → Canais → isole Organic Search → exporte sessões, engajamento e conversões.
   - **Sem GSC/GA4:** a auditoria técnica/on-page roda direto sobre o HTML público das páginas-chave (sitemap, robots, title/meta, headings, schema).

## Boas práticas
- Registre o **período** analisado (ex.: últimos 28 dias no GSC) — comparar bases diferentes engana.
- Salve cada arquivo em `auditorias/<cliente>/dados/` com nome claro (ex.: `gsc-indexacao.csv`).
- Anote o que veio e o que faltou. Faltou dado de um ponto → registre como lacuna, não invente.

## Saída
URL e páginas-chave confirmadas + dados disponíveis em `dados/` + nota curta (no dossiê) de o que foi obtido, por qual caminho, e quais lacunas restaram.
