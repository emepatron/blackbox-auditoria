---
name: campanhas-criativos
description: Audita a saúde criativa da CONTA na frente de Campanhas — volume de variações por conjunto, formatos por posicionamento, presença de UGC, legendas e alinhamento anúncio-destino. Julga a operação criativa, não cada peça. Para auditar anúncio a anúncio (hook, copy, veredito Manter/Ajustar/Matar), a frente é Criativos.
---

# Campanhas — Auditar a saúde criativa da conta

O criativo é o maior alavancador de performance em mídia paga. Público bom com peça fraca não escala.

Esta skill cobre a seção de criativos da planilha de Campanhas — o julgamento **da operação**: existe variação suficiente? os formatos estão certos? há UGC em teste? Ela não desce ao anúncio individual.

> **Auditoria peça a peça é outra frente.** Se o pedido for "o que tem de errado nos anúncios", "analisa os criativos" ou "por que os anúncios não convertem", vá para a frente **Criativos** (`criativos-coletar` → `criativos-analisar` → `criativos-preencher`): ela baixa as peças, cruza com a verba e emite veredito por anúncio. Volte aqui só para o julgamento de conta.

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


## O que verificar (cruze com a planilha-gabarito)

1. **Volume de variações** por conjunto/grupo — pouca variação impede o algoritmo de aprender; excesso dilui e nenhuma peça sai da fase de aprendizagem. Faixa de trabalho: 3 a 5 ativas por conjunto.
2. **Formato por posicionamento** — 9:16 para Reels/Stories/TikTok, 1:1 ou 4:5 para Feed. Criativo esticado ou com texto cortado queima verba em posicionamento nativo.
3. **UGC / nativo em teste** — existe peça em linguagem orgânica competindo com a peça de marca? Em Meta e TikTok ela costuma vencer.
4. **Legendas em vídeo** — a maioria assiste sem som.
5. **Alinhamento anúncio → destino** — a promessa dos anúncios aparece na primeira dobra da página?
6. **Variação de texto e título** — volume suficiente, com benefício em vez de característica.
7. **Esteira de produção** — existe rotina de troca de criativo, ou a conta roda a mesma peça há meses? Frequência subindo com CTR caindo é fadiga criativa, não público errado.

## Como auditar

- Com acesso: veja os criativos ativos no gerenciador.
- Sem acesso: a Biblioteca de Anúncios do Meta mostra o que está no ar sem precisar de conta — a skill `criativos-coletar` faz essa coleta.
- Conte, não estime: peças ativas por conjunto, quantos formatos, quantas com legenda.

## Saída

Status de cada item de criativo da planilha de Campanhas + observações específicas, para a `campanhas-preencher`.

Quando o julgamento de conta apontar problema criativo relevante — e quase sempre aponta —, recomende abrir a frente **Criativos**. É lá que sai o número que abre a conversa com o cliente: quanto da verba está em peça que deveria sair do ar.
