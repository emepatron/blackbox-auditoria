---
name: lp-conversao
description: Use na auditoria de Landing Page para avaliar o que converte — estrutura com objetivo e CTA único, promessa above the fold, prova social e quebra de objeções, copy/oferta e confiança/LGPD. Cobre as seções 1.3 (estrutura e conversão), 1.4 (copy e oferta) e 1.5 (confiança e conformidade) da planilha-gabarito.
---

# Landing Page — Auditar conversão

Onde a página ganha ou perde lead. Lê primeiro como visitante novo (a oferta fica clara sem rolar?), depois como auditor.

## 1.3 Estrutura e conversão (cruze com a planilha)
1. **Um objetivo, um CTA principal** — remova menus e links de fuga; uma única ação dominante.
2. **Promessa clara acima da dobra** — sem rolar, fica claro o que é, para quem e a oferta.
3. **Headline alinhada ao anúncio de origem** — a mensagem do clique = a headline da LP.
4. **Prova social e quebra de objeções** — depoimentos, números, logos, garantias perto do CTA.
5. **Formulário com o mínimo de campos** — cada campo extra reduz conversão; CTA repetido após cada bloco.

## 1.4 Copy e oferta (cruze com a planilha)
1. **Clareza da oferta** — compreensível em poucos segundos, sem jargão.
2. **Benefício antes de feature** — a copy fala do resultado para o cliente.
3. **Gatilhos de persuasão e urgência legítima** — prova, autoridade, especificidade; urgência verdadeira (não falsa).
4. **Ortografia e legibilidade** — sem erros; texto escaneável, com contraste e fonte adequados.

## 1.5 Confiança e conformidade (cruze com a planilha)
1. **Política de privacidade e LGPD** — link visível e base legal para a coleta.
2. **Consentimento na coleta** — checkbox/aviso explícito no formulário.
3. **Sinais de confiança** — selos reais, garantia e ao menos um canal de contato.
4. **Coerência visual com a marca** — logo, paleta e tipografia alinhados à identidade e ao anúncio.

## Como auditar
- Avalie como espectador primeiro (a página convence?), como auditor depois (CTA único, fricção, prova).
- Mede a fricção do formulário: conte os campos e questione cada um.
- Compare cada item com o benchmark da planilha antes de classificar.

## Copy — chame a skill `copy-auditar`

A seção **1.4 Copy e oferta** da planilha tem itens que exigem leitura de copy de verdade — nível de consciência x origem do tráfego, mecanismo, teste da substituição e linguagem genérica.

A `copy-auditar` é transversal: julga a copy como copywriter estrategista (nível de consciência, promessa, mecanismo, prova, objeção, CTA, coerência de funil), não como revisor de texto. Traga de lá o achado no formato de três partes — o que está escrito, por que não funciona, o que colocar no lugar — e registre nos itens de copy desta frente.

## Saída
Status de cada item das seções 1.3, 1.4 e 1.5 + observação concreta (qual bloco, qual ajuste), para a skill `lp-preencher`.
