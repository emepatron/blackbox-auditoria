---
name: site-tecnico
description: Use na auditoria de Site para avaliar infraestrutura, segurança e técnico — a seção 1.1 da planilha-gabarito. Cobre HTTPS/SSL, Core Web Vitals e performance, responsividade mobile, domínio/e-mail/favicon, banner de cookies e LGPD, e backup/atualizações.
---

# Site — Auditar técnico (1.1 Infraestrutura, segurança e técnico)

Base de confiança. Site lento, sem cadeado ou sem LGPD perde o visitante antes do conteúdo.

## O que verificar (cruze com a planilha-gabarito)
1. **HTTPS/SSL** válido em todas as páginas. Confira o cadeado e force `http://` → deve redirecionar pra `https://`. Sem SSL válido = **Crítico**.
2. **Performance / Core Web Vitals.** Rode PageSpeed Insights / Lighthouse na home e em 1-2 páginas internas. Benchmark firme: **LCP < 2,5s · INP < 200ms · CLS < 0,1**. Olhe peso de imagens e tempo total de carregamento.
3. **Responsividade mobile.** Abra no celular real e no DevTools (modo dispositivo). Layout mobile-first, sem quebra, sem scroll horizontal, toque confortável.
4. **Domínio próprio, e-mail profissional e favicon.** Domínio próprio (empresa.com.br), e-mail @dominio (não @gmail), favicon presente.
5. **Banner de cookies / LGPD.** Banner de consentimento + política de privacidade acessível. Ausência em site que coleta dado = **Crítico**.
6. **Backup e atualizações.** Backup automático e CMS/plugins atualizados (quando houver acesso ao painel; senão, pergunte).

## Como auditar
- A maior parte se faz só com a URL + DevTools + PageSpeed.
- Backup/atualizações podem exigir acesso ao CMS — se não houver, pergunte e registre como lacuna.

## Saída
Status (OK / Ajustar / Crítico / N/A) de cada item da seção 1.1, com observação concreta (o número do PageSpeed, a falha vista), para a skill `site-preencher`.
