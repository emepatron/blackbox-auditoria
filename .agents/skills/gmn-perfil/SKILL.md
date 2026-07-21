---
name: gmn-perfil
description: Use na auditoria de Google Meu Negócio para avaliar verificação, dados básicos, conteúdo e mídia do perfil. Cobre as seções 1.1 (verificação e dados) e 1.2 (conteúdo e mídia) da planilha-gabarito.
---

# Google Meu Negócio — Perfil e conteúdo

A base da presença local. Perfil não verificado, NAP divergente ou categoria genérica derrubam o ranqueamento antes de qualquer conteúdo ajudar.

## O que verificar (cruze com a planilha-gabarito)

### 1.1 Verificação e dados básicos
1. **Perfil verificado e reivindicado** — sem verificação, o resto fica limitado. (Crítico)
2. **NAP consistente** — Nome, Endereço e Telefone idênticos ao site e aos diretórios. Benchmark: 100% idêntico. Divergência mínima já confunde o algoritmo. (Crítico)
3. **Categoria principal correta + secundárias** — a principal deve ser a mais específica do negócio; secundárias pertinentes.
4. **Horário de funcionamento** — dias regulares atualizados + horários especiais (feriados) configurados.
5. **Área de atendimento** — coerente com o modelo (atende no local vs vai até o cliente).

### 1.2 Conteúdo e mídia
6. **Fotos** — capa, logo, fachada, ambiente, equipe, produtos; atualizadas com regularidade.
7. **Vídeos** — ao menos 1 vídeo curto do negócio (validar).
8. **Produtos/serviços** cadastrados com descrição e preço.
9. **Descrição da empresa** — completa (até 750 caracteres), com termos de busca reais, sem keyword stuffing.
10. **Atributos** — acessibilidade, formas de pagamento, comodidades; só os verdadeiros e aplicáveis.

## Como auditar
- Cruze o NAP do perfil com o NAP do site do cliente (obtido na skill `gmn-coletar`) — campo a campo.
- Avalie a categoria comparando com o que concorrentes bem posicionados usam.
- Leia a descrição como cliente (explica o que faz?) e como SEO (tem os termos de busca?).

## Copy — chame a skill `copy-auditar`

Além de 1.1 e 1.2, esta skill cobre a seção **1.6 Copy do perfil e das respostas** — a primeira linha da descrição (o que aparece antes do "ver mais") e a copy dos posts.

A `copy-auditar` é transversal: julga a copy como copywriter estrategista (nível de consciência, promessa, mecanismo, prova, objeção, CTA, coerência de funil), não como revisor de texto. Traga de lá o achado no formato de três partes — o que está escrito, por que não funciona, o que colocar no lugar — e registre nos itens de copy desta frente.

## Saída
Status de cada item das seções 1.1 e 1.2 + observações específicas (qual campo diverge, qual ação), para a skill `gmn-preencher`.
