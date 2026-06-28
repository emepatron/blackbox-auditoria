---
name: site-conversao
description: Use na auditoria de Site para avaliar SEO on-page básico e a camada de conversão/contato/mensuração — as seções 1.4 e 1.5 da planilha-gabarito. Cobre titles/meta descriptions, headings/URLs, sitemap/robots/alt, Search Console, CTA de contato, formulário/WhatsApp, GA4, integração com CRM e mapa/endereço.
---

# Site — Auditar SEO básico e conversão (1.4 e 1.5)

Mesmo institucional precisa ser encontrado (SEO on-page básico) e dar um caminho claro de contato com mensuração funcionando.

## 1.4 SEO on-page básico (cruze com a planilha)
1. **Title e meta description únicos por página.** Benchmark firme: **title < 60 caracteres · meta description < 155 caracteres**. Sem títulos duplicados ou genéricos.
2. **Hierarquia de headings (H1 único) + URLs amigáveis.** Um único H1 por página; URLs curtas e descritivas.
3. **sitemap.xml, robots.txt e alt nas imagens.** Sitemap válido, robots correto (não bloqueia o que deveria indexar), imagens com texto alternativo.
4. **Google Search Console conectado.** Propriedade verificada e com dados.

> Aqui é só o on-page básico. SEO profundo (técnico avançado, estratégia de conteúdo, link building, GEO) é a frente **SEO/GEO** — não a invada.

## 1.5 Conversão, contato e mensuração (cruze com a planilha)
5. **CTA claro de contato** visível em cada página-chave.
6. **Formulário e/ou WhatsApp funcionando.** Faça um envio teste — a mensagem precisa chegar. Falha aqui = **Crítico**.
7. **GA4 e rastreamento de conversões.** GA4 ativo + eventos de conversão disparando (confirme com o dado da skill coletar). Sem mensuração = **Crítico**.
8. **Integração com CRM.** Leads caem num destino organizado (CRM/planilha), não se perdem num e-mail solto.
9. **Mapa/endereço** quando há ponto físico (bom ter; N/A se 100% digital).

## Como auditar
- SEO básico: inspecione o HTML (title, meta, H1), acesse `/sitemap.xml` e `/robots.txt`, cheque alt das imagens.
- Conversão: teste o formulário/WhatsApp de verdade; confirme GA4 e CRM com o dado coletado (não suponha que dispara).

## Saída
Status de cada item de 1.4 e 1.5 + observação concreta (o caractere a mais no title, o form que não chegou), para a skill `site-preencher`.
