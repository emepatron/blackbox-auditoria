---
name: seogeo-onpage
description: Use na auditoria de SEO e GEO para avaliar o on-page e a autoridade — title/meta únicos, headings (H1 único), intenção de busca, palavras-chave, links internos, alt em imagens, conteúdo, autoridade temática, E-E-A-T e dados estruturados/Schema. Cobre as seções 1.2 e 1.3 da planilha-gabarito.
---

# SEO e GEO — Auditar on-page e autoridade

Com o técnico de pé, esta camada decide se a página merece rankear: relevância, clareza e confiança.

## On-page (seção 1.2 — cruze com a planilha)
1. **Title e meta description (benchmark firme):** únicos por página, com a palavra-chave-alvo — **title < 60 caracteres · meta description < 155 caracteres**.
2. **Headings (benchmark firme):** **um único H1** por página, coerente com o tema; hierarquia H2/H3 lógica.
3. **Intenção de busca:** o formato e a profundidade do conteúdo batem com o que rankeia para a keyword (guia, página de produto, comparativo)?
4. **Palavras-chave, links internos e alt:** uso natural de keywords (title, headings, corpo), links internos com âncora descritiva, `alt` descritivo nas imagens.

## Conteúdo e autoridade (seção 1.3 — cruze com a planilha)
5. **Autoridade temática:** o site cobre os principais tópicos/subtópicos do nicho (clusters de conteúdo)?
6. **Frequência de conteúdo:** cadência de publicação/atualização; conteúdos-chave revisados.
7. **Backlinks:** qualidade > quantidade — domínios relevantes e confiáveis (GSC > Links ou ferramenta de SEO).
8. **E-E-A-T:** sinais de Experiência, Expertise, Autoridade e Confiança — autoria com credenciais, fontes, páginas de confiança.
9. **Dados estruturados / Schema.org:** JSON-LD válido e adequado ao tipo de página (Article, FAQ, LocalBusiness, Product). Valide no Rich Results Test.

## Como auditar
Trabalhe sobre o HTML público das páginas-chave: leia `<title>`, `<meta description>`, headings, `alt`, links internos e o JSON-LD. Para intenção e autoridade temática, compare com o que já rankeia no nicho. Não tendo como medir um ponto, registre como lacuna.

## Copy — chame a skill `copy-auditar`

Além de 1.2 e 1.3, esta skill cobre a seção **1.6 Copy de busca** — title e meta que ganham o clique, abertura que responde nas primeiras linhas (o que também torna o conteúdo citável por IA) e vocabulário do público em vez do interno.

A `copy-auditar` é transversal: julga a copy como copywriter estrategista (nível de consciência, promessa, mecanismo, prova, objeção, CTA, coerência de funil), não como revisor de texto. Traga de lá o achado no formato de três partes — o que está escrito, por que não funciona, o que colocar no lugar — e registre nos itens de copy desta frente.

## Saída
Status (OK / Ajustar / Crítico / N/A) de cada item, com o achado específico (qual página, qual ajuste), para a skill `seogeo-preencher`.
