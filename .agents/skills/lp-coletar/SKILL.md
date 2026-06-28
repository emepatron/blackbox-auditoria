---
name: lp-coletar
description: Use quando o squad de Landing Page precisar do alvo e do contexto antes de auditar — pega a URL da LP e, se houver, acesso a GA4/PageSpeed. Negocia o caminho dos dados e salva o contexto em auditorias/<cliente>/dados/.
---

# Landing Page — Coletar dados

Garante o alvo e o contexto antes de auditar. Sem a URL real e sem entender o que a página deve converter, a auditoria vira achismo.

## O que coletar (pergunte ao usuário)
1. **URL da LP** — o link real, em produção. Confirme se é a página que recebe o tráfego pago (não a home).
2. **Objetivo da página** — o que ela deve converter (lead, agendamento, compra) e para qual oferta.
3. **Anúncio de origem** — link ou print do anúncio que leva à LP (serve para checar o alinhamento mensagem→headline).
4. **Onde o lead cai** — CRM/destino do formulário (para o teste de chegada do lead).

## Caminho dos dados (tente nesta ordem)
1. **Acesso direto à URL** (sempre tente): a auditoria mínima roda só com o link — abrir no desktop e no mobile real.
2. **GA4 / Search Console** (se houver): peça acesso ou export para ver tráfego, eventos e taxa de conversão da página.
3. **PageSpeed Insights / Lighthouse**: roda na URL pública, sem credencial — colete o relatório de Core Web Vitals (campo, não só lab).
4. **Acesso ao gerenciador de eventos** (Meta/GA4): se houver, ajuda no teste de rastreamento; senão, peça prints.

## Boas práticas
- Registre **data e dispositivo** do teste (a LP muda no mobile).
- Salve prints, export do PageSpeed e do GA4 em `auditorias/<cliente>/dados/` com nome claro (ex.: `pagespeed-mobile.pdf`).
- Anote o que veio e o que faltou. Faltou acesso? Registre como lacuna — não invente.

## Saída
URL e contexto confirmados + arquivos em `dados/` + uma nota curta (no dossiê) de o que foi obtido, por qual caminho, e quais lacunas restaram.
