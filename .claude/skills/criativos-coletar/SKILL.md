---
name: criativos-coletar
description: Baixa os criativos de anúncio do cliente para a auditoria peça a peça — imagem, vídeo e o texto do anúncio. No Meta usa a Biblioteca de Anúncios (pública, não precisa de acesso à conta). No Google, TikTok e LinkedIn usa o navegador do próprio usuário, já logado, em modo SOMENTE LEITURA. Use quando a frente de Criativos começar, ou quando alguém pedir "puxa os anúncios do cliente", "baixa os criativos", "quero ver os anúncios que estão rodando".
---

# Criativos — Coletar as peças

Sem a peça na mão não existe auditoria de criativo, existe palpite. Esta skill traz o material: o arquivo (imagem ou vídeo), o texto do anúncio e o destino do clique.

Ela **não julga nada**. Quem julga é a `criativos-analisar`.

## Escopo: a janela auditada — o corte é o gasto, não o status

**Regra fixa da blackbox, em qualquer rede:** entra na auditoria tudo que **consumiu verba dentro da
janela analisada** (ex.: últimos 30 ou 60 dias) — **ativo OU pausado**. O que não gastou nada na
janela fica fora: isso sim é histórico.

O status não filtra a coleta. Ele **rotula o achado**:
- **Ativo** → achado de ação: o que fazer agora.
- **Pausado dentro da janela** → achado de processo: quanto queimou antes de alguém pausar, e por que
  demorou. Pausar não devolve o dinheiro — R$ 500 gastos em termo errado seguem gastos, e esse achado
  desaparece se você filtrar por "só ativos". Caso real: termos de pesquisa ruins no Google Ads,
  desativados dentro da janela, tinham queimado ~R$ 500 antes — e caíram na auditoria porque a janela
  os pegou.

Armadilhas:
(a) **anúncio ativo dentro de campanha pausada não está rodando** — confira o status nos dois níveis
    e rotule pelo nível mais restritivo;
(b) **janela aberta infla o relatório** — sem período fechado, vira arqueologia. A janela é definida
    no dossiê e é idêntica em todas as fontes.

Histórico anterior à janela ("o que já foi testado") só em pedido explícito, em seção separada.


## Onde salvar

```
auditorias/<cliente>/criativos/
  <plataforma>/
    001-<slug-do-anuncio>.jpg | .mp4
    001-<slug-do-anuncio>.md      texto do anúncio, CTA, destino, origem
  inventario.csv                  índice de tudo que foi coletado
```

O `inventario.csv` tem: `id, plataforma, arquivo, nome_anuncio, campanha, formato, texto, cta, destino, origem_da_coleta, data`.
É ele que a `criativos-analisar` percorre e a `criativos-preencher` transforma em linha de planilha.

---

## Caminho 1 — Meta (Biblioteca de Anúncios) — padrão, sem acesso nenhum

Funciona só com o @ da página. É o caminho preferido: é público, é rápido e não toca na conta do cliente.

### 1. Descobrir o ID de biblioteca da página

A Biblioteca usa o **delegate_page ID**, não o ID de perfil. Trocar os dois é o erro nº 1 — retorna zero anúncios e parece que o cliente não anuncia.

Abra `https://www.facebook.com/<usuario-da-pagina>/` no navegador e rode:

```javascript
(() => {
  const html = document.documentElement.innerHTML;
  const d = html.match(/"delegate_page":\{[^}]*"id":"(\d+)"/);
  const p = html.match(/fb:\/\/profile\/(\d+)/);
  return d ? d[1] : (p ? p[1] : null);
})()
```

### 2. Abrir a Biblioteca filtrada

```
https://www.facebook.com/ads/library/?active_status=active&ad_type=all&country=BR&is_targeted_country=false&search_type=page&view_all_page_id=<ID>
```

- `active_status`: comece com `active`. Se o export mostrar gasto relevante em anúncio pausado **dentro da janela**, rode de novo com `all` para achar essas peças — elas entram na auditoria como achado de processo.
- `country`: `BR` para cliente nacional
- Role a página até parar de carregar peça nova, senão só vem o primeiro lote.

### 3. Extrair peças + texto

O texto do anúncio importa tanto quanto o arquivo — sem ele não dá para auditar copy. Extraia por card, ancorando no rótulo "Identificação da biblioteca" / "Library ID", que é o elemento estável da página:

```javascript
(() => {
  const cards = [...document.querySelectorAll('div')].filter(d => {
    const t = d.innerText || '';
    return /(Identificação da biblioteca|Library ID)[:\s]/.test(t) && d.children.length &&
           ![...d.querySelectorAll('div')].some(c => /(Identificação da biblioteca|Library ID)[:\s]/.test(c.innerText || ''));
  });
  return JSON.stringify(cards.map(c => ({
    id: ((c.innerText || '').match(/(?:Identificação da biblioteca|Library ID)[:\s]*(\d+)/) || [])[1] || null,
    texto: (c.innerText || '').replace(/\s+\n/g, '\n').trim(),
    imagens: [...c.querySelectorAll('img')].map(i => i.src).filter(s => s.includes('fbcdn.net') && s.includes('s600x600')),
    videos: [...c.querySelectorAll('video')].map(v => v.src || v.querySelector('source')?.src).filter(Boolean),
    posters: [...c.querySelectorAll('video[poster]')].map(v => v.poster).filter(Boolean),
    destinos: [...c.querySelectorAll('a')].map(a => a.href).filter(h => h && !h.includes('facebook.com')),
  })), null, 1);
})()
```

Se o retorno vier vazio, o DOM da Biblioteca mudou — **não invente dado**. Tire screenshot dos cards, registre a limitação e siga pelo caminho manual (peça prints ao cliente ou capture você mesmo). O seletor é frágil por natureza: a página é do Meta e muda sem aviso.

### 4. Baixar

```bash
curl -sL "<url>" -o "auditorias/<cliente>/criativos/meta/001-<slug>.jpg"
```

Vídeo do Meta vem em `.mp4` progressivo, baixa direto. Baixe **só** as peças que vão ser auditadas — extrair URL é grátis, baixar não.

### Limitação honesta deste caminho
A Biblioteca dá a **peça**, nunca a **métrica**. Você não sabe gasto, CTR nem CPA dali. A métrica vem do export CSV (ver "Cruzamento" abaixo). Sem o CSV, a auditoria sai qualitativa — e o relatório precisa dizer isso.

---

## Caminho 2 — Google, TikTok e LinkedIn (navegador logado)

Essas plataformas não têm biblioteca pública que sirva para auditoria. Aqui o caminho é o gerenciador do cliente, num navegador que **já esteja logado** — a sessão é do próprio usuário, e nenhuma senha passa pela IA.

**Qual navegador depende da IA que estiver rodando** — use o que estiver disponível, nesta ordem:

| IA | Ferramenta de navegador |
|---|---|
| Claude Code | extensão do Chrome (usa as sessões que a pessoa já tem abertas) |
| Codex | navegador via MCP (Playwright/Chrome DevTools), se estiver conectado |
| Antigravity | navegador integrado do próprio agente |
| Gemini CLI / qualquer outra | MCP de navegador, se houver |

**Não tem nenhuma?** Não é impeditivo: vá direto para o Caminho 3. O usuário abre o gerenciador, tira os prints das telas de anúncios e entrega — a auditoria acontece igual, só muda quem clica.

Nunca peça login nem senha para acessar a conta. Ou a sessão já está aberta no navegador da pessoa, ou a coleta é manual.

### ⚠️ Regra dura: SOMENTE LEITURA

O gerenciador de anúncios é **produção**. Um clique errado pausa campanha, zera orçamento ou publica alteração — e o prejuízo é do cliente.

**Permitido:** navegar entre telas de listagem, abrir a pré-visualização do anúncio, aplicar filtro e ordenação de visualização, tirar screenshot, ler o DOM, baixar export.

**Proibido, sem exceção:** clicar em pausar, ativar, editar, duplicar, excluir, salvar, publicar, alterar orçamento ou lance, mexer em público. Não entre em tela de edição de anúncio nem em fluxo de criação — a leitura acontece nas telas de listagem e de pré-visualização.

Se alguma informação só existir dentro de uma tela de edição, **não entre**: registre como lacuna e peça o print ao cliente. Nenhum dado vale o risco de alterar a conta.

Antes de começar, avise em uma linha: *"Vou navegar no gerenciador de <plataforma> em modo somente leitura — não vou clicar em nada que altere a conta."*

Essa regra vale para qualquer ferramenta de navegador, em qualquer IA. Se a sua não permite navegar sem risco de clique acidental, use o Caminho 3.

### Onde ficam os criativos, por plataforma

| Plataforma | Caminho |
|---|---|
| Google Ads | Campanhas → Recursos → **Recursos** (imagens, vídeos, títulos e descrições, com a nota de desempenho: Melhor / Boa / Baixa). Para PMax: Grupos de recursos. |
| TikTok Ads | Ads Manager → Criativo → **Biblioteca de criativos**; e a aba Anúncios com a pré-visualização de cada peça. |
| LinkedIn | Campaign Manager → Contas → Campanha → **Anúncios**, com a pré-visualização. |

**Filtre por ativo antes de coletar qualquer coisa**, em todas as três: Google Ads tem o filtro de status na listagem (Ativado); TikTok e LinkedIn têm o mesmo na barra de filtros. Anúncio ativo dentro de campanha pausada **não** conta como ativo — confira os dois níveis.

Colete por peça: screenshot da pré-visualização, o texto (título, descrição, CTA), o destino do clique, e as métricas que a própria listagem já mostra.

Para vídeo, prefira o export do gerenciador ou peça o arquivo ao cliente. Se só houver a pré-visualização, capture screenshots dos momentos-chave (abertura, meio, fim) — a `criativos-analisar` trabalha com frames.

---

## Caminho 3 — Fallback universal

Sempre existe. Peça ao cliente ou ao gestor:
- os arquivos dos criativos ativos (pasta, Drive, WeTransfer);
- o export do gerenciador **no nível de anúncio** (é o que amarra peça e métrica);
- ou prints da tela de anúncios.

Auditoria com fallback manual é auditoria completa. O que não pode é inventar o que não veio.

---

## Cruzamento peça × verba

É aqui que a auditoria deixa de ser opinião. O export CSV que a frente de Campanhas já pede (`auditorias/<cliente>/dados/`) tem uma linha por anúncio com gasto, impressões, CTR e resultado. Case pelo **nome do anúncio**.

1. Leia o CSV no nível de anúncio (não de campanha) e **filtre por gasto > 0 dentro da janela** — ativo ou pausado. Registre o status de cada linha.
2. Normalize o nome dos dois lados (minúsculas, sem acento, sem espaço extra) antes de casar.
3. Ordene por gasto, calcule o % da verba de cada peça e o acumulado — sobre a verba total **da janela**.
4. **Defina o recorte:** audite de cima para baixo até cobrir ~80% do gasto ou bater 20 peças, o que vier primeiro. O resto entra como contagem agregada.
5. Registre a cobertura: quantas peças ativas existem, quantas foram auditadas, que % da verba isso representa.

O que não casar (peça sem métrica, métrica sem peça) vira lacuna registrada — não é para forçar correspondência no chute.

## Saída

- Arquivos em `auditorias/<cliente>/criativos/<plataforma>/`
- `inventario.csv` preenchido, ordenado por gasto
- Nota curta no dossiê: de onde veio cada coisa, período do CSV, o que faltou

Depois disso, chame a `criativos-analisar`.
