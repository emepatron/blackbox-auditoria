---
name: campanhas-coletar
description: Obtém os dados de campanhas de uma plataforma (Meta, Google, LinkedIn, TikTok) para a auditoria. Use quando o squad de Campanhas precisar dos dados de uma conta de anúncios e ainda não os tiver. Negocia o caminho — MCP, API ou export manual (CSV) — e salva o que receber em auditorias/<cliente>/dados/.
---

# Campanhas — Coletar dados

Garante que os dados da plataforma existem antes de auditar. Sem dado, não há auditoria — só achismo.

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


## Caminho de dados (tente nesta ordem, por plataforma)
1. **MCP conectado?** Pergunte se há um MCP da plataforma (Meta, Google) na sessão. Se sim, puxe direto (campanhas, conjuntos, anúncios, métricas do período).
2. **API/acesso?** Reportei, GA4, Google Ads API, GHL/Pulsefy. Se houver, peça a credencial via `.env` LOCAL (nunca no chat, nunca versionado) e puxe.
3. **Export manual (fallback universal):** instrua o passo a passo e receba o arquivo:
   - **Meta:** Gerenciador de Anúncios → escolha o período → Relatórios/Exportar → CSV ou XLSX. Peça as colunas: campanha, conjunto, anúncio, gasto, impressões, cliques, CTR, CPC, CPM, resultados/CPL, frequência, ROAS (se e-commerce).
   - **Google Ads:** Relatórios → baixar CSV (campanha, tipo, impressões, cliques, CTR, CPC, conversões, custo/conv, parcela de impressão). Termos de pesquisa em relatório à parte.
   - **LinkedIn:** Campaign Manager → Exportar (campanha, impressões, cliques, CTR, CPC/CPL, leads).
   - **TikTok:** Ads Manager → exportar (campanha, impressões, cliques, CTR, CPM, conversões, retenção de vídeo).

## Boas práticas
- Defina e registre o **período** analisado (ex.: últimos 30 dias) — comparar bases diferentes engana.
- **Exporte a janela inteira, com o status junto.** Não filtre pausados fora: o que gastou na janela entra. Na leitura, registre o status de cada linha e descarte só o que teve gasto zero.
- Salve cada arquivo em `auditorias/<cliente>/dados/` com nome claro (ex.: `meta-30d.csv`).
- Anote o que veio e o que faltou. Se faltar dado de um ponto, registre como lacuna — não invente.

## Saída
Dados disponíveis em `dados/` + uma nota curta (no dossiê) de o que foi obtido, por qual caminho, e quais lacunas restaram.
