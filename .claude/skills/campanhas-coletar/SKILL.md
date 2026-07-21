---
name: campanhas-coletar
description: Obtém os dados de campanhas de uma plataforma (Meta, Google, LinkedIn, TikTok) para a auditoria. Use quando o squad de Campanhas precisar dos dados de uma conta de anúncios e ainda não os tiver. Negocia o caminho — MCP, API ou export manual (CSV) — e salva o que receber em auditorias/<cliente>/dados/.
---

# Campanhas — Coletar dados

Garante que os dados da plataforma existem antes de auditar. Sem dado, não há auditoria — só achismo.

## Escopo: só o que está ATIVO

**Regra fixa da blackbox, em qualquer rede (Meta, Google, TikTok, LinkedIn):** a auditoria analisa
**campanhas ativas e anúncios ativos**. Campanha pausada, conjunto encerrado, anúncio desativado e
histórico não entram na análise, não recebem status e não contam na verba analisada.

Por quê: a auditoria existe para mudar o que está acontecendo agora. Achado sobre o que já saiu do ar
não vira ação, infla o relatório e dilui o que importa.

Duas armadilhas: (a) **anúncio ativo dentro de campanha pausada não é ativo** — confira os dois níveis;
(b) exportar o período inteiro traz gasto de campanha encerrada, o que distorce todo percentual de
verba. Filtre por status antes de calcular qualquer coisa.

Leitura de histórico ("o que já foi testado") só em pedido explícito, em seção separada e rotulada —
nunca misturada aos achados.

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
- **Filtre por status ativo no próprio gerenciador antes de exportar.** Se o export vier com tudo, filtre na leitura e registre quantas linhas foram descartadas por estarem pausadas.
- Salve cada arquivo em `auditorias/<cliente>/dados/` com nome claro (ex.: `meta-30d.csv`).
- Anote o que veio e o que faltou. Se faltar dado de um ponto, registre como lacuna — não invente.

## Saída
Dados disponíveis em `dados/` + uma nota curta (no dossiê) de o que foi obtido, por qual caminho, e quais lacunas restaram.
