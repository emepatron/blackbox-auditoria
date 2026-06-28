---
name: site-coletar
description: Use quando o squad de Site precisar do acesso ao site institucional e ainda não o tiver. Garante a URL principal e, quando houver, acesso a GA4, Search Console e PageSpeed Insights. Negocia o caminho — MCP, API/login ou export manual (print/PDF) — e registra o que recebeu em auditorias/<cliente>/dados/.
---

# Site — Coletar acessos

Garante o que precisa existir antes de auditar. Sem a URL e sem dado de apoio, a auditoria vira achismo.

## Mínimo indispensável
- **URL principal do site** (e subdomínios/idiomas, se houver). Confirme se está no ar e qual é o CMS (WordPress, Webflow, Wix, custom).

## Caminho de dados (tente nesta ordem)
1. **Acesso direto (público):** quase tudo do institucional é auditável só com a URL — navegue, inspecione (DevTools), rode PageSpeed Insights / Lighthouse. Comece por aqui.
2. **API/login (quando houver):**
   - **GA4** — confirma tráfego e eventos de conversão. Peça acesso de leitura ou export.
   - **Search Console** — propriedade verificada, cobertura, sitemap, consultas. Peça acesso ou prints.
   - **CMS/hospedagem** — só se for preciso checar backup, plugins, certificado por dentro.
   - Credenciais sempre via `.env` LOCAL — nunca no chat, nunca versionado.
3. **Export manual (fallback universal):** print do GA4 (eventos/conversões), print do Search Console (cobertura/sitemap), PDF do relatório do PageSpeed. Receba o arquivo e registre.

## Boas práticas
- Registre a **data** da coleta (PageSpeed e tráfego variam no tempo).
- Salve cada arquivo em `auditorias/<cliente>/dados/` com nome claro (ex.: `pagespeed-home.pdf`, `ga4-30d.png`).
- Anote o que veio e o que faltou. Lacuna é lacuna — não invente.

## Saída
URL confirmada + dados de apoio em `dados/` + nota curta (no dossiê) do que foi obtido, por qual caminho, e quais lacunas restaram.
