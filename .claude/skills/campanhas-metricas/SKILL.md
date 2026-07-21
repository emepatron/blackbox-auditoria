---
name: campanhas-metricas
description: Lê e avalia as métricas das campanhas contra os benchmarks (CTR, CPC, CPM, CPL/CPA, frequência, ROAS, parcela de impressão). Use na auditoria de Campanhas para classificar o desempenho de cada plataforma — sempre comparando com o benchmark da planilha E com a meta real do cliente (ticket/CPA-alvo).
---

# Campanhas — Auditar métricas

Número solto não diz nada. Métrica só vira diagnóstico quando comparada ao benchmark e à meta do cliente.

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


## Antes de tudo: o CPA-alvo do cliente
Calcule o CPL/CPA-alvo a partir do **ticket médio** e da margem que o cliente aceita pagar por venda. É contra isso que o custo por resultado deve ser lido — não contra uma média genérica de mercado.

## O que avaliar (cruze com a planilha-gabarito)
- **CTR** — Meta link > 1% · Google Search > 2-3% · TikTok > 1% · LinkedIn > 0,4-0,5% (B2B).
- **CPL/CPA** — contra o CPA-alvo do cliente, não contra média de mercado.
- **CPC e CPM** — contra o histórico da conta e o nicho.
- **Frequência** — < 3 em prospecção (Meta/TikTok).
- **ROAS** — acima do break-even do cliente (e-commerce/venda direta).
- **Google:** parcela de impressão (perda por orçamento vs por ranking); Quality Score.
- **LinkedIn:** avaliar por qualidade (SQL/oportunidade), não por CPL bruto.

## Como auditar
- A partir do CSV/export (skill `campanhas-coletar`), calcule as métricas por campanha/conjunto/anúncio.
- Use código determinístico para os cálculos (não estime de cabeça).
- Compare cada uma com o benchmark e registre se está OK / Ajustar / Crítico.
- Conecte causa e efeito (ex.: CTR baixo + CPC alto + CPM alto → provável problema de público ou criativo).

## Saída
Tabela de métricas por plataforma com status e a hipótese de causa, para a skill `campanhas-preencher`.
