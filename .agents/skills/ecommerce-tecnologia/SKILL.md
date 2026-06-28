---
name: ecommerce-tecnologia
description: Use quando o squad de E-commerce for auditar a tecnologia da loja — infraestrutura, segurança e legal (HTTPS, LGPD/cookies, CNPJ, domínio), performance, checkout e pagamento, frete e logística, catálogo técnico, rastreamento e integrações. Mapeia a aba "1. Tecnologia" da planilha-gabarito.
---

# E-commerce — Auditar tecnologia

A fundação. Loja insegura, checkout que trava ou pixel que não dispara fazem todo o resto desabar. Audite isto antes de olhar qualquer métrica.

## O que verificar (cruze com a aba "1. Tecnologia")
1. **Infraestrutura, segurança e legal:** HTTPS/SSL válido em todas as páginas; pop-up de consentimento de cookies (LGPD); CNPJ + razão social no rodapé de todas as páginas; domínio próprio + e-mail no domínio; plataforma/versão suportada; plugins atualizados (WooCommerce); backup automático + staging.
2. **Performance:** Core Web Vitals (LCP, CLS, INP) — use PageSpeed Insights; imagens otimizadas (webp, lazy load); cache + CDN; velocidade no mobile.
3. **Checkout e pagamento:** faça uma **compra real ponta a ponta**; teste cartão, Pix e boleto aprovando; gateway configurado; checkout salva dados parciais; parcelamento; checkout funcional no mobile; selos de segurança.
4. **Frete e logística:** frete por **pedido** (não por unidade) — teste carrinho com 1, 2, 5 e 10 produtos; teste múltiplos CEPs; integração com transportadora/Melhor Envio; frete grátis condicional; prazo exibido.
5. **Catálogo técnico:** cadastro completo (SKU, estoque, variações, peso/dimensões); estoque sincronizado; produtos esgotados tratados; URLs amigáveis, sem 404, com redirects.
6. **Rastreamento / dados:** Pixel Meta disparando (ViewContent, AddToCart, InitiateCheckout, Purchase com valor); CAPI; GA4 com purchase + value; Google Ads tag + GTM; Merchant Center aprovado; catálogo conectado (dynamic ads); WhatsApp rastreado; UTMs padronizadas; teste de eventos (Events Manager / GA4 DebugView).
7. **Integrações e automação:** CRM (Pulsefy/GHL) conectado; recuperação de carrinho ativa; plataforma de e-mail integrada à base.

## Como auditar sem acesso direto
Sem acesso ao painel, peça prints (Events Manager, gateway, configuração de frete) e faça você mesmo uma compra teste como cliente — é o sinal mais honesto.

## Saída
Status (OK / Ajustar / Crítico / N/A) de cada item, registrado para `ecommerce-preencher`. Marque **Crítico** qualquer falha que impeça venda ou mensuração (checkout reprova, frete por unidade, Purchase sem valor).
