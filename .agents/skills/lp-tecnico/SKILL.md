---
name: lp-tecnico
description: Use na auditoria de Landing Page para avaliar o lado técnico — Core Web Vitals, performance, responsivo, HTTPS e o rastreamento (tags, eventos, UTMs e o teste do formulário chegando ao CRM). Cobre as seções 1.1 (rastreamento) e 1.2 (performance e técnico) da planilha-gabarito.
---

# Landing Page — Auditar técnico e rastreamento

O lado técnico sustenta tudo. Página lenta perde lead antes de converter; rastreamento quebrado faz toda decisão nascer de dado falso. Comece pelo rastreamento.

## 1.1 Configuração e rastreamento (cruze com a planilha)
1. **Tags Google e Meta** instaladas e disparando, sem duplicidade (Tag Assistant / Meta Pixel Helper).
2. **Eventos de conversão** configurados (envio de formulário, clique no CTA) com valor/moeda quando fizer sentido.
3. **Teste real:** preencha e envie o formulário de verdade e confirme que **o lead chega ao CRM/destino** — sem perda. Este é o item mais crítico.
4. **UTMs** preservados do clique à conversão (capturados em campos ocultos do formulário).
5. **Página de obrigado** com evento dedicado de conversão.

## 1.2 Performance e técnico (cruze com a planilha)
1. **Core Web Vitals** no verde — **LCP < 2,5s · INP < 200ms · CLS < 0,1** (rode PageSpeed/Lighthouse na URL real, dado de campo).
2. **Imagens** otimizadas e leves — formatos modernos (WebP/AVIF) + lazy load.
3. **Responsivo no mobile** — mobile-first, sem rolagem horizontal, alvos de toque adequados.
4. **HTTPS válido** sem conteúdo misto + carregamento < 3s.

## Como auditar
- Use os dados da skill `lp-coletar` (URL, export do PageSpeed). Para CWV, prefira o relatório de campo.
- Sem acesso ao gerenciador, peça prints (Gerenciador de Eventos / GA4) e confirme por pergunta: "o lead cai no CRM quando alguém envia o form?".
- Compare cada item com o benchmark da planilha antes de classificar.

## Saída
Status (OK / Ajustar / Crítico / N/A) de cada item das seções 1.1 e 1.2, para a skill `lp-preencher`. Marque como **Crítico** qualquer falha que comprometa a mensuração (tag não dispara, lead não chega ao CRM).
