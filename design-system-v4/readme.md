# Design System V4 Aguiar & CO — Guia de Aplicação

## O que foi feito

Guia oficial e standalone do design system V4 em formato HTML interativo. Funciona como referência única para qualquer pessoa (interna ou externa) criar materiais com a identidade V4 — em PowerPoint, Google Slides, Canva, Figma ou HTML.

## Por que foi feito

O Emerson recebeu o PPT da Carol (cliente externo Dog in Box) e ajustou aplicando a ID visual V4. Em vez de virar um trabalho repetitivo a cada cliente externo, o melhor caminho é **entregar o sistema** — não o resultado.

Esse arquivo serve como "régua oficial" pra quem não é da V4 conseguir produzir materiais com a marca corretamente.

## O que foi entregue

- **`index.html`** — Guia interativo standalone (1 arquivo, ~50 KB). Inclui:
  - Hero com manifesto da marca
  - 5 princípios de design
  - Paleta completa (brand, texto, surfaces, semânticos) com **clique-pra-copiar** dos hex
  - Tipografia (Space Grotesk + Inter + JetBrains Mono) com hierarquia visual
  - Escala de espaçamento (8-80px) com equivalência em pt (PowerPoint)
  - **8 componentes ao vivo** (Top Nav, Hero, Section Header, KPI Card, Bullet Card, Alert, Tabela, Badge, Status Grid) — cada um com:
    - Preview renderizado
    - Spec PowerPoint/Slides (em pt)
    - Spec Canva/Figma (em px)
    - Spec HTML/CSS (código pronto)
  - Anti-padrões (faça vs não faça)
  - Guias passo a passo para 6 ferramentas: PowerPoint, Google Slides, Canva, Figma, HTML/CSS, Illustrator/Photoshop

- **`assets/v4-logo.jpg`** — Logo V4 oficial (mesmo asset do diagnóstico Acervo)

## Decisões tomadas

- **HTML standalone vs MD**: HTML porque permite preview visual real dos componentes e copy-to-clipboard das cores. MD seria texto puro, perderia o impacto pedagógico.
- **3 specs por componente**: O Emerson pediu pra servir tanto pra criar PPT, quanto imagem, quanto HTML — cada componente tem os 3 lado a lado pra remover ambiguidade.
- **Fontes do Google Fonts**: As 3 fontes (Space Grotesk, Inter, JetBrains Mono) são gratuitas e estão no Google Fonts e no Google Slides nativamente. Zero fricção pro time externo.
- **Preview ao vivo**: Em vez de mockups estáticos, cada componente é renderizado de fato em CSS — quem abrir o HTML vê exatamente como deve ficar.
- **Tokens canônicos**: Puxei os hex e nomes de variável direto do `ds-bundle.css` e `ds-theme-light.css` do Acervo Raízes (fonte canônica do DS V4).
- **Anti-padrões explícitos**: Listei os erros mais comuns pra evitar que o time externo "interprete livre" e descaracterize a marca.

## O que ficou pendente

- Nada bloqueante. Se quiser evoluir:
  - Adicionar componente de gráfico (bar, line, pie) com cores semânticas
  - Adicionar exemplos de capa/post pra Instagram (1080×1350)
  - Versão dark theme (caso o time externo precise para apresentações com fundo preto)
  - Hospedar em domínio público (ex: `design.v4company.com`) pra link único

## Como usar

### Abrir localmente
```bash
open "/Users/emersonserra/Meus Projetos/Sistemas/[OS] Brain AI V4/output/design-system-v4/index.html"
```

### Mandar pro time externo
**Opção 1 (mais simples)** — zipar a pasta inteira e enviar:
```bash
cd "/Users/emersonserra/Meus Projetos/Sistemas/[OS] Brain AI V4/output"
zip -r design-system-v4.zip design-system-v4/
```
Eles descompactam e abrem `index.html` em qualquer navegador.

**Opção 2 (link público)** — subir pra Vercel/Netlify/GitHub Pages:
```bash
cd "/Users/emersonserra/Meus Projetos/Sistemas/[OS] Brain AI V4/output/design-system-v4"
vercel --prod
```
Gera URL tipo `design-system-v4.vercel.app` que pode ser compartilhado por link.

**Opção 3 (PDF estático)** — abrir no Chrome, Cmd+P, "Salvar como PDF". Vira um PDF de ~10 páginas que pode ir por email.

## Para evoluir o guia

Editar direto o `index.html`. Os tokens estão no bloco `:root` do `<style>` no topo. Componentes seguem o padrão `<div class="component">` com header + preview + 3 spec-blocks.

Se mudanças no DS canônico acontecerem (no `ds-bundle.css` do Acervo ou em outro lugar oficial da V4), atualizar este guia também.
